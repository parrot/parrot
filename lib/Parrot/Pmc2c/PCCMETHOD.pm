# Copyright (C) 2004-2007, The Perl Foundation.
# $Id$

package Parrot::Pmc2c::PCCMETHOD;
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

Parrot::Pmc2c::PCCMETHOD - Parses and preps PMC PCCMETHOD called from F<Parrot:Pmc2c::Pmc2cMain>

=head1 SYNOPSIS

    use Parrot::Pmc2c::PCCMETHOD;

=head1 DESCRIPTION

Parrot::Pmc2c::PCCMETHOD - Parses and preps PMC PCCMETHOD called from F<Parrot:Pmc2c::Pmc2cMain>

=cut

=head1 FUNCTIONS

=head2 Publicly Available Methods

=head3 C<rewrite_pccmethod($self, $method, $body)>

B<Purpose:>  Parse and Build PMC PCCMETHODS.

B<Arguments:>

=over 4

=item * C<self>

=item * C<method>

Current Method Object

=item * C<body>

Current Method Body

=back

=head3 C<rewrite_pccinvoke($self, $method, $body)>

B<Purpose:>  Parse and Build a PCCINVOKE Call.

B<Arguments:>

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
use constant PARROT_ARG_INTVAL    => 0x000;
use constant PARROT_ARG_STRING    => 0x001;
use constant PARROT_ARG_PMC       => 0x002;
use constant PARROT_ARG_FLOATVAL  => 0x003;
use constant PARROT_ARG_TYPE_MASK => 0x00f;

#/* argument meaning and conversion bits */
use constant PARROT_ARG_CONSTANT => 0x010;

#/* bits a user has to define */
use constant PARROT_ARG_FLATTEN      => 0x020;                 # /* .flatten_arg */
use constant PARROT_ARG_SLURPY_ARRAY => PARROT_ARG_FLATTEN;    # /* i.e. foldup  */

use constant PARROT_ARG_OPTIONAL => 0x080;
use constant PARROT_ARG_OPT_FLAG => 0x100;                     # /* prev optional was set */
use constant PARROT_ARG_NAME     => 0x200;                     # /* this String is an arg name */

=head3
    regtype to argtype conversion hash
=cut

our $reg_type_info = {

    # s is string, ss is short string, at is arg type
    +(REGNO_INT) => { s => "INTVAL",   ss => "INT", at => PARROT_ARG_INTVAL, },
    +(REGNO_NUM) => { s => "FLOATVAL", ss => "NUM", at => PARROT_ARG_FLOATVAL, },
    +(REGNO_STR) => { s => "STRING*",  ss => "STR", at => PARROT_ARG_STRING, },
    +(REGNO_PMC) => { s => "PMC*",     ss => "PMC", at => PARROT_ARG_PMC, },
};

# Declare the subroutines
sub trim($);
sub ltrim($);
sub rtrim($);

# Perl trim function to remove whitespace from the start and end of the string
sub trim($) {
    my $string = shift;
    $string =~ s/^\s+//;
    $string =~ s/\s+$//;
    return $string;
}

# Left trim function to remove leading whitespace
sub ltrim($) {
    my $string = shift;
    $string =~ s/^\s+//;
    return $string;
}

# Right trim function to remove trailing whitespace
sub rtrim($) {
    my $string = shift;
    $string =~ s/\s+$//;
    return $string;
}

=head3 C<parse_adverb_attributes>

  builds and returs an adverb hash from an adverb string such as
  ":optional :optflag :slurpy"
  {
    optional  =>1,
    optflag   =>1,
    slurpy    =>1,
  }

=cut

sub parse_adverb_attributes {
    my $adverb_string = shift;
    my %result;
    if ( defined $adverb_string ) {
        ++$result{$1} while $adverb_string =~ /:(\S+)/g;
    }
    return \%result;
}

sub convert_type_string_to_reg_type {
    ($_) = @_;
    return REGNO_INT if /INTVAL|int/i;
    return REGNO_NUM if /FLOATVAL|double/i;
    return REGNO_STR if /STRING/i;
    return REGNO_PMC if /PMC/i;
    croak "$_ not recognized as INTVAL, FLOATVAL, STRING, or PMC";
}

sub gen_arg_flags {
    my ($param) = @_;

    return PARROT_ARG_INTVAL | PARROT_ARG_OPT_FLAG if exists $param->{attrs}->{opt_flag};

    my $flag = $reg_type_info->{ $param->{type} }->{at};
    $flag |= PARROT_ARG_CONSTANT     if exists $param->{attrs}->{constant};
    $flag |= PARROT_ARG_OPTIONAL     if exists $param->{attrs}->{optional};
    $flag |= PARROT_ARG_FLATTEN      if exists $param->{attrs}->{flatten};
    $flag |= PARROT_ARG_SLURPY_ARRAY if exists $param->{attrs}->{slurpy};
    $flag |= PARROT_ARG_NAME         if exists $param->{attrs}->{name};
    $flag |= PARROT_ARG_NAME         if exists $param->{attrs}->{named};
    return $flag;
}

sub gen_arg_accessor {
    my ( $arg, $arg_type ) = @_;
    my ( $name, $reg_type, $index ) = ( $arg->{name}, $arg->{type}, $arg->{index} );
    my $tis  = $reg_type_info->{$reg_type}->{s};     #reg_type_info string
    my $tiss = $reg_type_info->{$reg_type}->{ss};    #reg_type_info short string

    if ( 'arg' eq $arg_type ) {
        return "    $tis $name = CTX_REG_$tiss(ctx, $index);\n";
    }
    elsif ( 'result' eq $arg_type ) {
        return "    $name = CTX_REG_$tiss(ctx, $index);\n";
    }
    elsif ( 'name' eq $arg_type ) {
        return "    CTX_REG_$tiss(ctx, $index) = string_from_const_cstring(interp, $name, 0);\n";
    }
    else {                                           #$arg_type eq 'param' or $arg_type eq 'return'
        return "    CTX_REG_$tiss(ctx, $index) = $name;\n";
    }
}

=head3 C<rewrite_PCCRETURNs($method, $body)>

Rewrites the method body performing the various macro substitutions for PCCRETURNs.

=cut

sub rewrite_PCCRETURNs {
    my ( $self, $body ) = @_;
    my $method_name  = $self->{meth};
    my $regs_used    = [];
    my $signature_re = qr{
      (PCCRETURN         #method name
      \s*              #optional whitespace
      \( ([^\(]*) \)   #returns ( stuff ... )
      ;?)              #optional semicolon
    }sx;

    if ( $body and $body =~ m/\breturn\b/ ) {
        croak "return not allowed in pccmethods, use PCCRETURN instead";
    }

    while ( $$body and $$body =~ m/$signature_re/ ) {
        my ( $match, $returns ) = ( $1, $2 );
        my $goto_string = "goto ${method_name}_returns;";
        my ( $returns_n_regs_used, $returns_indexes, $returns_flags, $returns_accessors ) =
            process_pccmethod_args( parse_p_args_string($returns), 'return' );

        push @$regs_used, $returns_n_regs_used;
        my $file        = '"' . __FILE__ . '"';
        my $lineno1     = __LINE__ + 2;
        my $lineno2     = __LINE__ + 7;
        my $replacement = <<END;
{
#line $lineno1 $file
    /*BEGIN PCCRETURN $returns */
    /*BEGIN GENERATED ACCESSORS */
$returns_accessors
#line $lineno2 $file
    /*END GENERATED ACCESSORS */
    {
        opcode_t temp_return_indexes[] = { $returns_indexes };
        return_indexes = temp_return_indexes;
    }
    return_sig = Parrot_FixedIntegerArray_new_from_string(interp, _type,
        string_from_const_cstring(interp, $returns_flags, 0), 0);
    $goto_string
    /*END PCCRETURN $returns */
}
END
        $$body =~ s/\Q$1\E/$replacement/;
    }

    return $regs_used;
}

sub parse_p_args_string {
    my ($parameters) = @_;
    my $linear_args = [];
    for my $x ( split /,/, $parameters ) {
        my ( $type, $name, $rest ) = split / /, trim($x), 3;
        $name =~ /[\**]?(\"?[\w_]+\"?)/;
        my $arg = {
            type  => convert_type_string_to_reg_type($type),
            name  => $1,
            attrs => parse_adverb_attributes($rest)
        };
        push @$linear_args, $arg;
    }
    $linear_args;
}

sub is_named {
    my ($arg) = @_;
    while ( my ( $k, $v ) = each( %{ $arg->{attrs} } ) ) {
        return ( 1, $1 ) if ( $k =~ /named\[(.*)\]/ );
    }
    return ( 0, '' );
}

sub process_pccmethod_args {
    my ( $linear_args, $arg_type ) = @_;
    my $n_regs_used_a = [ 0, 0, 0, 0 ];    # INT, FLOAT, STRING, PMC
    my $args           = [ [], [], [], [] ];    # actual INT, FLOAT, STRING, PMC arg stuctures
    my $args_indexes_a = [];                    # arg index into the interpreter context
    my $args_flags_a   = [];                    # arg flags
    my $args_accessors = "";
    my $named_names    = "";

    for my $arg (@$linear_args) {
        my ( $named, $named_name ) = is_named($arg);
        if ($named) {
            my $argn = {
                type => +(REGNO_STR),
                name => $named_name,
            };
            $arg->{named_arg}  = $argn;
            $arg->{named_name} = $named_name;

            push @{ $args->[ +(REGNO_STR) ] }, $argn;
            $argn->{index} = $n_regs_used_a->[ +(REGNO_STR) ]++;
            push @$args_indexes_a, $argn->{index};
            push @$args_flags_a,   PARROT_ARG_STRING | PARROT_ARG_NAME;
            $named_names .= gen_arg_accessor( $argn, 'name' );
        }

        push @{ $args->[ $arg->{type} ] }, $arg;
        $arg->{index} = $n_regs_used_a->[ $arg->{type} ]++;
        push @$args_indexes_a, $arg->{index};
        push @$args_flags_a,   gen_arg_flags($arg);
        $args_accessors .= gen_arg_accessor( $arg, $arg_type );
    }

    my $n_regs_used  = join( ", ",        @$n_regs_used_a );
    my $args_indexes = join( ", ",        @$args_indexes_a );
    my $args_flags   = '"(' . join( ", ", @$args_flags_a ) . ')"';
    return ( $n_regs_used_a, $args_indexes, $args_flags, $args_accessors, $named_names );
}

sub find_max_regs {
    my ($n_regs) = @_;
    my $n_regs_used = [ 0, 0, 0, 0 ];
    for my $x (@$n_regs) {
        for my $i ( 0 .. 3 ) {
            $n_regs_used->[$i] = $n_regs_used->[$i] > $x->[$i] ? $n_regs_used->[$i] : $x->[$i];
        }
    }
    return join( ", ", @$n_regs_used );
}

=head3 C<rewrite_pccmethod()>

    rewrite_pccmethod($method_hash);

=cut

sub rewrite_pccmethod {
    my ($self) = @_;
    croak "return method of PCCMETHOD must be void, not $self->{type}" if $self->{type} ne 'void';

    # parse pccmethod parameters, then unshift the a PMC arg for the invocant
    my $linear_args = parse_p_args_string( $self->{parameters} );
    unshift @$linear_args,
        {
        type  => convert_type_string_to_reg_type('PMC'),
        name  => 'pmc',
        attrs => parse_adverb_attributes(':object')
        };

    my ( $params_n_regs_used, $params_indexes, $params_flags, $params_accessors, $named_names ) =
        process_pccmethod_args( $linear_args, 'arg' );

    my $n_regs = rewrite_PCCRETURNs( $self, \$self->{body} );
    rewrite_pccinvoke( $self->{meth}, \$self->{body} );
    unshift @$n_regs, $params_n_regs_used;
    my $n_regs_used = find_max_regs($n_regs);

    my $file     = '"' . __FILE__ . '"';
    my $lineno   = __LINE__ + 5;
    my $PRE_STUB = <<END;
{
#line $lineno $file
    INTVAL   n_regs_used[]   = { $n_regs_used };
    opcode_t param_indexes[] = { $params_indexes };
    opcode_t *return_indexes;
    opcode_t *current_args;
    PMC* _type      = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC* param_sig  = Parrot_FixedIntegerArray_new_from_string(interp, _type,
        string_from_const_cstring(interp, $params_flags, 0), 0);

    PMC* return_sig              = PMCNULL;

    parrot_context_t *caller_ctx = CONTEXT(interp->ctx);
    PMC* ret_cont                = new_ret_continuation_pmc(interp, NULL);
    parrot_context_t *ctx        = Parrot_push_context(interp, n_regs_used);
    PMC* ccont                   = caller_ctx->current_cont;

    ctx->current_cont            = ret_cont;
    PMC_cont(ret_cont)->from_ctx = ctx;

    current_args                 = interp->current_args;
    interp->current_args         = NULL;

$named_names

    interp->params_signature     = param_sig;
    parrot_pass_args(interp, caller_ctx, ctx, current_args, param_indexes,
        PARROT_PASS_PARAMS);

    if (PObj_get_FLAGS(ccont) & SUB_FLAG_TAILCALL) {
        PObj_get_FLAGS(ccont) &= ~SUB_FLAG_TAILCALL;
        --ctx->recursion_depth;
        ctx->caller_ctx      = caller_ctx->caller_ctx;
        Parrot_free_context(interp, caller_ctx, 0);
        interp->current_args = NULL;
    }
    /* BEGIN PARMS SCOPE */
    {
$params_accessors

    /* BEGIN PMETHOD BODY */
END

    my $method_returns = $self->{meth} . "_returns:";
    $lineno = __LINE__ + 4;
    my $POST_STUB = <<END;

#line $lineno $file
    goto no_return;
    /* END PMETHOD BODY */

$method_returns

    /* if (PMC_cont(ccont)->address) { */
    {
        /* parrot_context_t * const caller_ctx = PMC_cont(ccont)->to_ctx; */
        if (! caller_ctx) {
            /* there is no point calling real_exception here, because
               PDB_backtrace can't deal with a missing to_ctx either. */
            internal_exception(1, "No caller_ctx for continuation \%p.", ccont);
        }

        interp->returns_signature = return_sig;
        parrot_pass_args(interp, ctx, caller_ctx, return_indexes,
            caller_ctx->current_results, PARROT_PASS_RESULTS);
    }

    /* END PARAMS SCOPE */
    }
    no_return:
    PObj_live_CLEAR(_type);
    PObj_live_CLEAR(param_sig);
    PObj_live_CLEAR(return_sig);
    Parrot_pop_context(interp);
END
    ( $self->{parameters}, $self->{pre_block}, $self->{post_block} ) =
        ( "", $PRE_STUB, $POST_STUB );
    return;
}

sub isquoted {
    1;
}

sub rewrite_pccinvoke {
    my ( $method, $body ) = @_;
    my $signature_re = qr{
      (
      (
      \( ([^\(]*) \)   #results
      \s*              #optional whitespace
      =                #results equals PCCINVOKE invocation
      )?               #results are optional
      \s*              #optional whitespace
      PCCINVOKE        #method name
      \s*              #optional whitespace
      \( ([^\(]*) \)   #parameters
      ;?               #optional semicolon
      )
    }sx;

    while ( $$body and $$body =~ m/$signature_re/ ) {
        my ( $match, $result_clause, $results, $parameters ) = ( $1, $2, $3, $4 );

        #optional results portion of pccinvoke statement
        my ( $result_n_regs_used, $result_indexes, $result_flags, $result_accessors ) =
            ( defined $results )
            ? process_pccmethod_args( parse_p_args_string($results), 'result' )
            : ( [ 0, 0, 0, 0 ], "0", "\"\"", "" );

        #parameters portion of pccinvoke statement
        my ( $interp, $invocant, $method_name, $arguments ) =
            map { $_ = trim($_) } split( /,/, $parameters, 4 );
        $arguments = "PMC* $invocant" . ( $arguments ? ", $arguments" : "" );
        my ( $args_n_regs_used, $arg_indexes, $arg_flags, $arg_accessors, $named_names ) =
            process_pccmethod_args( parse_p_args_string($arguments), 'param' );

        my $n_regs_used = find_max_regs( [ $result_n_regs_used, $args_n_regs_used ] );

        $method_name = "string_from_const_cstring(interp, (const char *) $method_name, 0)"
            if isquoted($method_name);

        my $file   = '"' . __FILE__ . '"';
        my $lineno = __LINE__ + 8;

        my $replacement .= <<END;

    /*BEGIN PCCINVOKE $invocant */
#line $lineno $file
    {
      INTVAL   n_regs_used[]    = { $n_regs_used };
      opcode_t arg_indexes[]    = { $arg_indexes };
      opcode_t result_indexes[] = { $result_indexes };
      PMC* _type                = pmc_new(interp, enum_class_FixedIntegerArray);

      PMC* args_sig         = Parrot_FixedIntegerArray_new_from_string(interp,
            _type, string_from_const_cstring(interp, $arg_flags, 0), 0);
      PMC* results_sig      = Parrot_FixedIntegerArray_new_from_string(interp,
            _type, string_from_const_cstring(interp, $result_flags, 0), 0);
      PMC* ret_cont         = new_ret_continuation_pmc(interp, NULL);

      parrot_context_t *ctx = Parrot_push_context(interp, n_regs_used);
      PMC* pccinvoke_meth;

      opcode_t* save_current_args = interp->current_args;
      PMC* save_args_signature    = interp->args_signature;
      PMC* save_current_object    = interp->current_object;

      interp->current_args        = arg_indexes;
      interp->args_signature      = args_sig;
      ctx->current_results        = result_indexes;
      ctx->results_signature      = results_sig;

$named_names

$arg_accessors

      interp->current_object       = $invocant;
      interp->current_cont         = NEED_CONTINUATION;
      ctx->current_cont            = ret_cont;
      PMC_cont(ret_cont)->from_ctx = ctx;

      pccinvoke_meth = VTABLE_find_method(interp, $invocant, $method_name);
      if (PMC_IS_NULL(pccinvoke_meth))
          real_exception(interp, NULL, METH_NOT_FOUND,
            "Method '%Ss' not found", $method_name);
      else
          VTABLE_invoke(interp, pccinvoke_meth, NULL);

$result_accessors

      PObj_live_CLEAR(_type);
      PObj_live_CLEAR(args_sig);
      PObj_live_CLEAR(results_sig);
      Parrot_pop_context(interp);

      interp->current_args   = save_current_args;
      interp->args_signature = save_args_signature;
      interp->current_object = save_current_object;
    }
    /*END PCCINVOKE $method_name */
END

        $$body =~ s/\Q$match\E/$replacement/;
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
