# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$

package Parrot::Pmc2c::PMETHODs;
use strict;
use warnings;
use Data::Dumper;
use Carp qw(longmess croak);

=pod
$SIG{__WARN__} = sub {
    print longmess;
};
=cut

=head1 NAME

Parrot::Pmc2c::Utils::PMETHODs - Parses and preps PMC PMETHODS 
  called from F<Parrot:Pmc2c::Utils>

=head1 SYNOPSIS

    use Parrot::Pmc2c::PMETHODs;

=head1 DESCRIPTION

Parrot::Pmc2c::PMETHODs - Parses and preps PMC PMETHODS called from F<Parrot:Pmc2c::Utils>

=cut

=head1 FUNCTIONS

=head2 Publicly Available Methods

=head3 C<rewrite_pmethod($self, $method, $body)>

B<Purpose:>  Parse and Build PMC PMETHODS.

B<Arguments:>  Reference to a hash holding 3 required keys:

=over 4

=item * C<self>

=item * C<method>

Current Method Object

=item * C<body>

Current Method Body

=back

=cut


use constant REGNO_INT => 0;
use constant REGNO_NUM => 1;
use constant REGNO_STR => 2;
use constant REGNO_PMC => 3;

  #/* 4 low bits are argument types */
use constant  PARROT_ARG_INTVAL           => 0x000;
use constant  PARROT_ARG_STRING           => 0x001;
use constant  PARROT_ARG_PMC              => 0x002;
use constant  PARROT_ARG_FLOATVAL         => 0x003;
use constant  PARROT_ARG_TYPE_MASK        => 0x00f;
  #/* argument meaning and conversion bits */
use constant  PARROT_ARG_CONSTANT         => 0x010;
  #/* bits a user has to define */
use constant  PARROT_ARG_FLATTEN          => 0x020; #      /* .flatten_arg */
use constant  PARROT_ARG_SLURPY_ARRAY     => PARROT_ARG_FLATTEN; # /* i.e. foldup  */
  #/* unused - 0x040 */

use constant  PARROT_ARG_OPTIONAL         => 0x080;
use constant  PARROT_ARG_OPT_FLAG         => 0x100; #/* prev optional was set */
use constant  PARROT_ARG_NAME             => 0x200; #/* this String is an arg name */

our $arg_type_flags = {
  +(REGNO_INT) => PARROT_ARG_INTVAL,
  +(REGNO_NUM) => PARROT_ARG_FLOATVAL,
  +(REGNO_STR) => PARROT_ARG_STRING,
  +(REGNO_PMC) => PARROT_ARG_PMC
};


# Declare the subroutines
sub trim($);
sub ltrim($);
sub rtrim($);

# Perl trim function to remove whitespace from the start and end of the string
sub trim($)
{
  my $string = shift;
  $string =~ s/^\s+//;
  $string =~ s/\s+$//;
  return $string;
}
# Left trim function to remove leading whitespace
sub ltrim($)
{
  my $string = shift;
  $string =~ s/^\s+//;
  return $string;
}
# Right trim function to remove trailing whitespace
sub rtrim($)
{
  my $string = shift;
  $string =~ s/\s+$//;
  return $string;
}

sub parse_arg_attrs {
  my $flags = shift;
  my %result;
  if ( defined $flags ) {
    ++$result{$1} while $flags =~ /:(\S+)/g;
  }
  return \%result;
}

sub get_arg_type {
    ($_) = @_;
    if (/INTVAL|int/i) {
      return REGNO_INT;
    }
    elsif (/FLOATVAL|double/i) {
      return REGNO_NUM;
    }
    elsif (/STRING/i) {
      return REGNO_STR;
    }
    elsif (/PMC/i) {
      return REGNO_PMC;
    }
    croak "$_ not recognized as INTVAL, FLOATVAL, STRING, or PMC";
}


sub gen_arg_flags {
  my ($param) = @_;
  my $flag = $arg_type_flags->{$param->{type}};
  my $is_constant = 0;
  my $is_optional = 0;
  $is_constant = PARROT_ARG_CONSTANT if exists $param->{attrs}->{constant};
  $is_optional = PARROT_ARG_OPTIONAL if exists $param->{attrs}->{optional};
  $flag |= $is_constant | $is_optional;
  $flag |= PARROT_ARG_FLATTEN if exists $param->{attrs}->{flatten};
  $flag |= PARROT_ARG_SLURPY_ARRAY if exists $param->{attrs}->{slurpy};
  $flag |= PARROT_ARG_NAME if exists $param->{attrs}->{name};
  $flag |= PARROT_ARG_NAME if exists $param->{attrs}->{named};
  if (exists $param->{attrs}->{opt_flag}) {
    return PARROT_ARG_INTVAL | PARROT_ARG_OPT_FLAG;
  }

  return $flag;
}

sub gen_arg_accessor {
  my ($name, $type_number, $index, $arg_type) = @_;
  my $type;
  if ($type_number == REGNO_INT) {
    $type = { s => "INTVAL", l => "INT" };
  }
  elsif ($type_number == REGNO_NUM) {
    $type = { s => "FLOATVAL", l => "NUM" };
  }
  elsif ($type_number == REGNO_STR) {
    $type = { s => "STRING*", l => "STR" };
  }
  elsif ($type_number == REGNO_PMC) {
    $type = { s => "PMC*", l => "PMC" };
  }
  else {
    croak "$_ not recognized as INTVAL, FLOATVAL, STRING, or PMC";
  }

  if ($arg_type eq 'param' or $arg_type eq 'result') {
    return "    $type->{s} $name = CTX_REG_$type->{l}(ctx, $index);\n";
  }
  elsif ($arg_type eq 'name') {
    return "    CTX_REG_$type->{l}(ctx, $index) = string_from_const_cstring(interp, $name, 0);\n";
  }
  else { #$arg_type eq 'arg' or $arg_type eq 'return'
    return "    CTX_REG_$type->{l}(ctx, $index) = $name;\n";
  }
}

=head3 C<rewrite_pmethod($class, $method, $body)>

Rewrites the method body performing the various macro substitutions for
pmethod bodies (see F<tools/build/pmc2c.pl>).

=cut

sub rewrite_pmethod_returns {
  my ( $method, $body) = @_;
  my $signature_re = qr{
  (preturn         #method name
  \s*              #optional whitespace
  \( ([^\(]*) \)   #parameters
  ;?)
  }sx;

  my $regs_used = [];
  if($_ and m/\breturn\b/) {
    croak "return not allowed in pmethods, use preturn instead";
  }

  while ($$body and $$body =~ m/$signature_re/) {
    my $goto_string = "goto $method"."_returns;";
    my ($returns_n_regs_used, $returns_indexes, $returns_flags, $returns_accessors)
        = parse_pmethod_args_normal($2, 'return');
    push @$regs_used, $returns_n_regs_used;
    my $file = '"' . __FILE__ . '"';
    my $lineno = __LINE__ + 6;
    my $replacement = <<END;

    /*BEGIN PRETURN $2 */
$returns_accessors
#line $lineno $file
    {
        int temp_return_indexes[] = { $returns_indexes };
        return_indexes = (opcode_t *) temp_return_indexes;
    }
    return_sig = Parrot_FixedIntegerArray_new_from_string(interp, _type,
        string_from_const_cstring(interp, $returns_flags, 0), PObj_constant_FLAG);
    $goto_string
    /*END PRETURN $2 */
END
    $$body =~ s/\Q$1\E/$replacement/;
  }

  return $regs_used;
}

sub parse_pmethod_args_normal {
  my $linear_args = parse_pmethod_args($_[0]);
  process_pmethod_args( $linear_args, $_[1] );
}

sub parse_pmethod_args_add_obj {
  my $linear_args = parse_pmethod_args($_[0]);
  my $arg = {
    type => get_arg_type('PMC'),
    name => 'pmc',
    attrs => parse_arg_attrs(':object')
  };
  unshift @$linear_args, $arg;
  process_pmethod_args( $linear_args, $_[1] );
}

sub parse_pmethod_invoke {
  my @results = split(/,/, $_[0], 4);
  for my $x (@results){
    $x = trim($x);
  }

  if ( $#results >= 3)
  {
    my $rest = pop @results;
    push @results, process_pmethod_args( parse_pmethod_args($rest), $_[1] );
  }
  else
  {
    push @results, ( [0, 0, 0, 0], "0", "\"\"", "", "");
  }

  shift @results;
  @results;
}

sub parse_pmethod_invoke_results {
  if ( defined $_[0])
  {
    my $linear_args = parse_pmethod_args($_[0]);
    process_pmethod_args( $linear_args, $_[1] );
  }
  else
  {
    return ( [0, 0, 0, 0], "0", "\"\"", "");
  }
}

sub parse_pmethod_args {
  my ($parameters) = @_;
  my $linear_args = [];
  for my $x (split /,/, $parameters) {
    my ($type, $name, $rest) = split / /, trim($x), 3;
    $name =~ /[\**]?(\"?[\w_]+\"?)/;
    my $arg = {
      type => get_arg_type($type),
      name => $1,
      attrs => parse_arg_attrs($rest)
    };
    push @$linear_args, $arg;
  }
  $linear_args;
}

sub is_named {
  my ($arg) = @_;
  while (my ($k, $v) = each(%{ $arg->{attrs} })) {
    if ($k =~ /named\[(.*)\]/)
    {
      return (1, $1);
    }
  }
  return (0, '');
}

sub process_pmethod_args {
  my ($linear_args, $arg_type) = @_;
  my $n_regs_used_a = [ 0, 0, 0, 0 ];
  my $args = [ [], [], [], [] ];
  my $args_indexes_a = [];
  my $args_flags_a = [];
  my $args_accessors = "";
  my $named_names = "";

  for my $arg (@$linear_args)
  {
    my ($named, $named_name) = is_named($arg);
    if($named)
    {
      my $argn = {
        type => +(REGNO_STR),
        name => $named_name,
      };
      $arg->{named_arg} = $argn;
      $arg->{named_name} = $named_name;

      push @{ $args->[+(REGNO_STR)] }, $argn;
      $argn->{index} = $n_regs_used_a->[+(REGNO_STR)]++;
      push @$args_indexes_a, $argn->{index};
      push @$args_flags_a, PARROT_ARG_STRING | PARROT_ARG_NAME;
      $named_names .= gen_arg_accessor($argn->{name}, $argn->{type}, $argn->{index}, 'name');
    }

    push @{ $args->[$arg->{type}] }, $arg;
    $arg->{index} = $n_regs_used_a->[$arg->{type}]++;
    push @$args_indexes_a, $arg->{index};
    push @$args_flags_a, gen_arg_flags($arg);
    $args_accessors .= gen_arg_accessor($arg->{name}, $arg->{type}, $arg->{index}, $arg_type);
  }

  my $n_regs_used = join(", ", @$n_regs_used_a);
  my $args_indexes = join(", ", @$args_indexes_a);
  my $args_flags = '"(' . join(", ", @$args_flags_a) . ')"';
  return ($n_regs_used_a, $args_indexes, $args_flags, $args_accessors, $named_names);
}

sub find_max_regs {
  my ($n_regs) = @_;
  my $n_regs_used_a = [ 0, 0, 0, 0 ];
  for my $x ( @$n_regs ) {
    for my $i (0..3) {
      $n_regs_used_a->[$i] = $n_regs_used_a->[$i] > $x->[$i] ? $n_regs_used_a->[$i] : $x->[$i];
    }
  }
  return join(", ", @$n_regs_used_a);
}

=head3 C<rewrite_pmethod()>
    
    rewrite_pmethod($method_hash);

=cut


sub rewrite_pmethod {
    my ($self) = @_;
    croak "return method of PMETHOD must be void, not $self->{type}" if $self->{type} ne 'void';
    my $parameters = $self->{parameters};
    my ($params_n_regs_used, $params_indexes, $params_flags, $params_accessors, $named_names)
        = parse_pmethod_args_add_obj($parameters, 'param');
    my $n_regs = rewrite_pmethod_returns($self->{meth}, \$self->{body});
    my $n_regs2 = rewrite_pminvoke($self->{meth}, \$self->{body});
    unshift @$n_regs, $params_n_regs_used;
    my $n_regs_used = find_max_regs($n_regs);

    my $file = '"' . __FILE__ . '"';
    my $lineno = __LINE__ + 4;
    my $PRE_STUB = <<END;
{
#line $lineno $file
    INTVAL n_regs_used[] = { $n_regs_used };
    opcode_t param_indexes[] = { $params_indexes };
    opcode_t *return_indexes;
    opcode_t *current_args;
    PMC* _type = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC* param_sig = Parrot_FixedIntegerArray_new_from_string(interp, _type,
        string_from_const_cstring(interp, $params_flags, 0), PObj_constant_FLAG);
    PMC* return_sig = PMCNULL;
    parrot_context_t *caller_ctx = CONTEXT(interp->ctx);
    parrot_context_t *ctx = Parrot_push_context(interp, n_regs_used);
    PMC *ccont = caller_ctx->current_cont;

    current_args = interp->current_args;
    interp->current_args = NULL;

$named_names

    interp->params_signature = param_sig;
    parrot_pass_args(interp, caller_ctx, ctx, current_args, param_indexes, PARROT_PASS_PARAMS);

    if (PObj_get_FLAGS(ccont) & SUB_FLAG_TAILCALL) {
        PObj_get_FLAGS(ccont) &= ~SUB_FLAG_TAILCALL;
        --ctx->recursion_depth;
        ctx->caller_ctx = caller_ctx->caller_ctx;
        Parrot_free_context(interp, caller_ctx, 0);
        interp->current_args = NULL;
    }
    /* BEGIN PARMS SCOPE */
    {
$params_accessors

    /* BEGIN PMEHTOD BODY */
END

    my $method_returns = $self->{meth} . "_returns:";
    $lineno = __LINE__ + 4;
    my $POST_STUB = <<END;

#line $lineno $file
    goto no_return;
    /* END PMEHTOD BODY */
    $method_returns

    //if (PMC_cont(ccont)->address) {
    {
        //parrot_context_t * const caller_ctx = PMC_cont(ccont)->to_ctx;
        if (! caller_ctx) {
            /* there is no point calling real_exception here, because
               PDB_backtrace can't deal with a missing to_ctx either. */
            internal_exception(1, "No caller_ctx for continuation \%p.", ccont);
        }

        interp->returns_signature = return_sig;
        parrot_pass_args(interp, ctx, caller_ctx, return_indexes, caller_ctx->current_results, PARROT_PASS_RESULTS);
    }


    /* END PARAMS SCOPE */
    }
    no_return:
    PObj_live_CLEAR(_type);
    PObj_live_CLEAR(param_sig);
    PObj_live_CLEAR(return_sig);
    Parrot_pop_context(interp);
END
    ($self->{parameters}, $self->{pre_block}, $self->{post_block}) = ("", $PRE_STUB, $POST_STUB);
    return;
}

sub isquoted {
 1;
}

sub rewrite_pminvoke {
  my ( $method, $body) = @_;
  my $signature_re = qr{
  ((
  \( ([^\(]*) \)   #result spec
  \s*              #optional whitespace
  = 
  )?
  \s*              #optional whitespace
  PMINVOKE          #method name
  \s*              #optional whitespace
  \( ([^\(]*) \)   #parameters
  ;?)
  }sx;
  
  my $regs_used = [];

  while ($$body and $$body =~ m/$signature_re/) {
    #print Dumper($1, $2, $3, $4);
    my ($result_n_regs_used, $result_indexes, $result_flags, $result_accessors)
        = parse_pmethod_invoke_results($3, 'result');
    push @$regs_used, $result_n_regs_used;
    my ($pmc, $name, $args_n_regs_used, $arg_indexes, $arg_flags, $arg_accessors, $named_names) 
        = parse_pmethod_invoke($4, 'arg');

    push @$regs_used, $args_n_regs_used;
    my $n_regs_used = find_max_regs($regs_used);

    my $replacement = "";

    if (isquoted($name)) {
        $name = "string_from_const_cstring(interp, $name, 0)";
    }
    
    my $file = '"' . __FILE__ . '"';
    my $lineno = __LINE__ + 7;
    
    if (defined $n_regs_used) {
    $replacement .= <<END;

    /*BEGIN PMINVOKE $name */
#line $lineno $file
    {
      INTVAL n_regs_used[] = { $n_regs_used };
      opcode_t arg_indexes[] = { $arg_indexes };
      opcode_t result_indexes[] = { $result_indexes };
      PMC* _type = pmc_new(interp, enum_class_FixedIntegerArray);
      PMC* args_sig = Parrot_FixedIntegerArray_new_from_string(interp, _type,
          string_from_const_cstring(interp, $arg_flags, 0), PObj_constant_FLAG);
      PMC* results_sig = Parrot_FixedIntegerArray_new_from_string(interp, _type,
          string_from_const_cstring(interp, $result_flags, 0), PObj_constant_FLAG);
      parrot_context_t *ctx = Parrot_push_context(interp, n_regs_used);

      interp->current_args = arg_indexes;
      interp->args_signature = args_sig;
      ctx->current_results = result_indexes;
      ctx->results_signature = results_sig;

$named_names

$arg_accessors
END
    }
    
    $replacement .= <<END;

      VTABLE_invoke(interp, $pmc, $name);

$result_accessors

END
    if (defined $n_regs_used) {
    $replacement .= <<END;

    PObj_live_CLEAR(_type);
    PObj_live_CLEAR(args_sig);
    PObj_live_CLEAR(results_sig);
    Parrot_pop_context(interp);
    }
    /*END PMINVOKE $name */
END
    }

    $$body =~ s/\Q$1\E/$replacement/;
  }
}

1;
