# Copyright (C) 2004-2008, The Perl Foundation.
# $Id$

package Parrot::Pmc2c::PCCMETHOD;
use strict;
use warnings;
use Carp qw(longmess croak);

=head1 NAME

Parrot::Pmc2c::PCCMETHOD - Parses and preps PMC PCCMETHOD called from F<Parrot:Pmc2c::Pmc2cMain>

=head1 SYNOPSIS

    use Parrot::Pmc2c::PCCMETHOD;

=head1 DESCRIPTION

Parrot::Pmc2c::PCCMETHOD - Parses and preps PMC PCCMETHOD called from F<Parrot:Pmc2c::Pmc2cMain>

=cut

=head1 FUNCTIONS

=head2 Publicly Available Methods

=head3 C<rewrite_pccmethod($method, $pmc)>

B<Purpose:>  Parse and Build PMC PCCMETHODS.

B<Arguments:>

=over 4

=item * C<self>

=item * C<method>

Current Method Object

=item * C<body>

Current Method Body

=back

=head3 C<rewrite_pccinvoke($method, $pmc)>

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

# refactor to a simple module import, RT#42286
BEGIN {
    my $bits   = 'Parrot/Pmc2c/PCCMETHOD_BITS.pl';
    my %consts = do $bits;
    unless (%consts) {
        die $@ if $@;
        die "$bits: $!";
    }
    require constant;
    while ( my ( $k, $v ) = each %consts ) {
        constant->import( $k, $v );
    }
}

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

# Perl trim function to remove whitespace from the start and end of the string
sub trim {
    my $string = shift;
    $string    =~ s/^\s+//;
    $string    =~ s/\s+$//;
    return $string;
}

# Left trim function to remove leading whitespace
sub ltrim {
    my $string = shift;
    $string    =~ s/^\s+//;
    return $string;
}

# Right trim function to remove trailing whitespace
sub rtrim {
    my $string = shift;
    $string    =~ s/\s+$//;
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
    local ($_) = @_;
    return REGNO_INT if /INTVAL|int/i;
    return REGNO_NUM if /FLOATVAL|double/i;
    return REGNO_STR if /STRING/i;
    return REGNO_PMC if /PMC/i;
    croak "$_ not recognized as INTVAL, FLOATVAL, STRING, or PMC";
}

sub gen_arg_flags {
    my ($param) = @_;

    return PARROT_ARG_INTVAL | PARROT_ARG_OPT_FLAG
        if exists $param->{attrs}{opt_flag};

    my $flag = $reg_type_info->{ $param->{type} }->{at};
    $flag   |= PARROT_ARG_CONSTANT     if exists $param->{attrs}{constant};
    $flag   |= PARROT_ARG_OPTIONAL     if exists $param->{attrs}{optional};
    $flag   |= PARROT_ARG_FLATTEN      if exists $param->{attrs}{flatten};
    $flag   |= PARROT_ARG_SLURPY_ARRAY if exists $param->{attrs}{slurpy};
    $flag   |= PARROT_ARG_NAME         if exists $param->{attrs}{name};
    $flag   |= PARROT_ARG_NAME         if exists $param->{attrs}{named};

    return $flag;
}

sub gen_arg_accessor {
    my ( $arg, $arg_type ) = @_;
    my ( $name, $reg_type, $index ) = @{$arg}{qw( name type index )};

    my $tis  = $reg_type_info->{$reg_type}{s};     #reg_type_info string
    my $tiss = $reg_type_info->{$reg_type}{ss};    #reg_type_info short string

    if ( 'arg' eq $arg_type ) {
        return "    $tis $name = CTX_REG_$tiss(_ctx, $index);\n";
    }
    elsif ( 'result' eq $arg_type ) {
        return "    $name = CTX_REG_$tiss(_ctx, $index);\n";
    }
    elsif ( 'name' eq $arg_type ) {
        return "    CTX_REG_$tiss(_ctx, $index) = CONST_STRING_GEN(interp, $name);\n";
    }
    else {  #$arg_type eq 'param' or $arg_type eq 'return'
        return "    CTX_REG_$tiss(_ctx, $index) = $name;\n";
    }
}

=head3 C<rewrite_RETURNs($method, $pmc)>

Rewrites the method body performing the various macro substitutions for RETURNs.

=cut

sub rewrite_RETURNs {
    my ( $self, $pmc ) = @_;
    my $method_name    = $self->name;
    my $body           = $self->body;
    my $regs_used      = [];
    my $qty_returns    = 0;

    my $signature_re   = qr{
      (RETURN       #method name
      \s*              #optional whitespace
      \( ([^\(]*) \)   #returns ( stuff ... )
      ;?)              #optional semicolon
    }sx;

    croak "return not allowed in pccmethods, use RETURN instead $body"
        if $body and $body =~ m/\breturn\b.*?;\z/s;

    while ($body) {
        my $matched;

        if ($body) {
            $matched = $body->find($signature_re);
            last unless $matched;
        }

        $qty_returns++;
        $matched =~ /$signature_re/;
        my ( $match, $returns ) = ( $1, $2 );

        my $e = Parrot::Pmc2c::Emitter->new( $pmc->filename );

        if ($returns eq 'void') {
            $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    /*BEGIN RETURN $returns */
    goto no_return;
    /*END RETURN $returns */
END
            $matched->replace( $match, $e );
            next;
        }

        my $goto_string = "goto ${method_name}_returns;";
        my ( $returns_n_regs_used, $returns_indexes, $returns_flags, $returns_accessors ) =
            process_pccmethod_args( parse_p_args_string($returns), 'return' );
        $returns_indexes = "0" unless $returns_indexes;

        push @$regs_used, $returns_n_regs_used;

        $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    {
    /*BEGIN RETURN $returns */
    /*BEGIN GENERATED ACCESSORS */
END
        $e->emit(<<"END");
$returns_accessors
END

    my $returns_sig  = make_arg_pmc($returns_flags, '_return_sig');

        $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    /*END GENERATED ACCESSORS */
    {
        opcode_t _temp_return_indexes[] = { $returns_indexes };
        _return_indexes                 = _temp_return_indexes;
    }

    _return_sig = pmc_new(interp, enum_class_FixedIntegerArray);
$returns_sig
    $goto_string
    /*END RETURN $returns */
    }
END
        $matched->replace( $match, $e );
    }

    return $regs_used, $qty_returns;
}

sub parse_p_args_string {
    my ($parameters) = @_;
    my $linear_args  = [];

    for my $x ( split /,/, $parameters ) {

        #change 'PMC * foo' to 'PMC *foo'
        $x =~ s/\*\s+/\*/ if ($x =~ /\s\*+\s/);

        #change 'PMC* foo' to 'PMC *foo'
        $x =~ s/(\*+)\s+/ $1/ if ($x =~ /^\w+\*/);

        my ( $type, $name, $rest ) = split /\s+/, trim($x), 3;

        die "invalid PCC arg '$x': did you forget to specify a type?\n"
            unless defined $name;

        if ($name =~ /\**([a-zA-Z_]\w*)/) {
            $name = $1;
        }

        my $arg = {
            type  => convert_type_string_to_reg_type($type),
            name  => $name,
            attrs => parse_adverb_attributes($rest)
        };

        push @$linear_args, $arg;
    }

    $linear_args;
}

sub is_named {
    my ($arg) = @_;

    while ( my ( $k, $v ) = each( %{ $arg->{attrs} } ) ) {
        return ( 1, $1 ) if $k =~ /named\((.*)\)/;
    }

    return ( 0, '' );
}

sub process_pccmethod_args {
    my ( $linear_args, $arg_type ) = @_;

    my $n_regs_used_a  = [ 0, 0, 0, 0 ];     # INT, FLOAT, STRING, PMC counts
    my $args           = [ [], [], [], [] ]; # actual INT, FLOAT, STRING, PMC
    my $args_indexes_a = [];                 # arg index into interp context
    my $args_flags_a   = [];                 # arg flags
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
    return ( $n_regs_used_a, $args_indexes, $args_flags_a, $args_accessors, $named_names );
}

sub find_max_regs {
    my ($n_regs)    = @_;
    my $n_regs_used = [ 0, 0, 0, 0 ];

    for my $x (@$n_regs) {
        for my $i ( 0 .. 3 ) {
            $n_regs_used->[$i] = $n_regs_used->[$i] > $x->[$i]
                ? $n_regs_used->[$i] : $x->[$i];
        }
    }

    return join( ", ", @$n_regs_used );
}

=head3 C<rewrite_pccmethod()>

    rewrite_pccmethod($method, $pmc);

=cut

sub rewrite_pccmethod {
    my ( $self, $pmc ) = @_;

    my $e      = Parrot::Pmc2c::Emitter->new( $pmc->filename );
    my $e_post = Parrot::Pmc2c::Emitter->new( $pmc->filename );

    # parse pccmethod parameters, then unshift the a PMC arg for the invocant
    my $linear_args = parse_p_args_string( $self->parameters );
    unshift @$linear_args,
        {
        type  => convert_type_string_to_reg_type('PMC'),
        name  => 'pmc',
        attrs => parse_adverb_attributes(':object')
        };

    my ( $params_n_regs_used, $params_indexes, $params_flags, $params_accessors, $named_names ) =
        process_pccmethod_args( $linear_args, 'arg' );

    my ( $n_regs, $qty_returns ) = rewrite_RETURNs( $self, $pmc );
    rewrite_pccinvoke( $self, $pmc );
    unshift @$n_regs, $params_n_regs_used;
    my $n_regs_used = find_max_regs($n_regs);

    my $set_params  = make_arg_pmc($params_flags, '_param_sig');

    $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    const INTVAL _n_regs_used[]   = { $n_regs_used };
    opcode_t _param_indexes[]     = { $params_indexes };
    opcode_t *_return_indexes;
    opcode_t *_current_args;
    PMC      * const _param_sig   = pmc_new(interp, enum_class_FixedIntegerArray);
    PMC      *_return_sig         = PMCNULL;

    Parrot_Context *_caller_ctx   = CONTEXT(interp);
    PMC * const _ret_cont         = new_ret_continuation_pmc(interp, NULL);
    Parrot_Context *_ctx          = Parrot_push_context(interp, _n_regs_used);
    PMC *_ccont                   = PMCNULL;

$set_params
    UNUSED(_return_indexes);

    if (_caller_ctx) {
        _ccont = _caller_ctx->current_cont;
    }
    else {
        /* there is no point calling Parrot_ex_throw_from_c_args here, because
           PDB_backtrace can't deal with a missing to_ctx either. */
        exit_fatal(1, "No caller_ctx for continuation \%p.", _ccont);
    }

    _ctx->current_cont            = _ret_cont;
    PMC_cont(_ret_cont)->from_ctx = _ctx;

    _current_args                 = interp->current_args;
    interp->current_args         = NULL;

END
    $e->emit(<<"END");
$named_names
END
    $e->emit( <<"END", __FILE__, __LINE__ + 1 );

    interp->params_signature     = _param_sig;
    parrot_pass_args(interp, _caller_ctx, _ctx, _current_args, _param_indexes,
        PARROT_PASS_PARAMS);

    if (PObj_get_FLAGS(_ccont) & SUB_FLAG_TAILCALL) {
        PObj_get_FLAGS(_ccont) &= ~SUB_FLAG_TAILCALL;
        --_ctx->recursion_depth;
        _ctx->caller_ctx      = _caller_ctx->caller_ctx;
        Parrot_free_context(interp, _caller_ctx, 1);
        interp->current_args = NULL;
    }
    /* BEGIN PARMS SCOPE */
    {
END
    $e->emit(<<"END");
$params_accessors
END
    $e->emit( <<"END", __FILE__, __LINE__ + 1 );

    /* BEGIN PMETHOD BODY */
    {
END

    my $method_returns = $self->name . "_returns:";
    $e_post->emit( <<"END", __FILE__, __LINE__ + 1 );

    }
    goto no_return;
    /* END PMETHOD BODY */

END
    if ($qty_returns) {
        $e_post->emit( <<"END", __FILE__, __LINE__ + 1 );
$method_returns

    if (! _caller_ctx) {
        /* there is no point calling Parrot_ex_throw_from_c_args here, because
           PDB_backtrace can't deal with a missing to_ctx either. */
        exit_fatal(1, "No caller_ctx for continuation \%p.", _ccont);
    }

    interp->returns_signature = _return_sig;
    parrot_pass_args(interp, _ctx, _caller_ctx, _return_indexes,
        _caller_ctx->current_results, PARROT_PASS_RESULTS);
END
    }
    $e_post->emit( <<"END", __FILE__, __LINE__ + 1 );

    /* END PARAMS SCOPE */
    }
    no_return:
    PObj_live_CLEAR(_param_sig);
    PObj_live_CLEAR(_return_sig);
    Parrot_pop_context(interp);
END
    $self->return_type('void');
    $self->parameters('');
    my $e_body = Parrot::Pmc2c::Emitter->new( $pmc->filename );
    $e_body->emit($e);
    $e_body->emit( $self->body );
    $e_body->emit($e_post);
    $self->body($e_body);
    $self->{PCCMETHOD} = 1;

    return 1;
}

sub isquoted {
    1;
}

sub rewrite_pccinvoke {
    my ( $method, $pmc ) = @_;
    my $body             = $method->body;

    my $signature_re     = qr{
      (
      (
      \( ([^\(]*) \)   # results
      \s*              # optional whitespace
      =                # results equals PCCINVOKE invocation
      \s*              # optional whitespace
      )?               # results are optional
      \b               # exclude Parrot_PCCINVOKE when lacking optional capture
      PCCINVOKE        # method name
      \s*              # optional whitespace
      \( ([^\(]*) \)   # parameters
      ;?               # optional semicolon
      )
    }sx;

    while ($body) {
        my $matched;

        if ($body) {
            $matched = $body->find($signature_re);
            last unless $matched;
        }

        $matched =~ /$signature_re/;
        my ( $match, $result_clause, $results, $parameters ) = ( $1, $2, $3, $4 );

        my ($out_vars, $out_types)
            = process_pccmethod_results( $results );

        my ($fixed_params, $in_types, $in_vars)
            = process_pccmethod_parameters( $parameters );

        my $signature = $in_types . '->' . $out_types;

        # I know this is ugly....
        my $vars      = '';
        if ($in_vars) {
            $vars .= $in_vars;
            $vars .= ', ' if $out_vars;
        }
        $vars .= $out_vars;

        my $e = Parrot::Pmc2c::Emitter->new( $pmc->filename );
        $e->emit(qq|Parrot_PCCINVOKE($fixed_params, "$signature", $vars);\n|);

        $matched->replace( $match, $e );
    }

    return 1;
}

sub process_pccmethod_results {
    my $results = shift;

    return ('', '') unless $results;

    my @params  = split /,\s*/, $results;

    my (@out_vars, @out_types);

    for my $param (@params) {
        my ($type, @names) = process_parameter($param);
        push @out_types, $type;
        push @out_vars, map { "&$_" } @names;
    }

    my $out_types = join '',   @out_types;
    my $out_vars  = join ', ', @out_vars;

    return ($out_vars, $out_types);
}

sub process_pccmethod_parameters {
    my $parameters                       = shift;
    my ($interp, $pmc, $method, @params) = split /,\s*/, $parameters;

    $method = 'CONST_STRING_GEN(interp, ' . $method . ')';

    my $fixed_params = join ', ', $interp, $pmc, $method;

    my (@in_types, @in_vars);

    for my $param (@params) {
        # @var is an array because named parameters are two variables
        my ($type, @var) = process_parameter($param);
        push @in_types, $type;
        push @in_vars, @var;
    }

    my $in_types = join '',   @in_types;
    my $in_vars  = join ', ', @in_vars;

    return ($fixed_params, $in_types, $in_vars);
}

sub process_parameter {
    my $param    = shift;

    my $param_re = qr{
        (STRING\s\*|INTVAL|FLOATVAL|PMC\s\*) # type
        \s*                                  # optional whitespace
        (\w+)                                # name
        \s*                                  # optional whitespace
        (.*)?                                # adverbs
    }sx;

    my ($type, $name, $adverbs) = $param =~ /$param_re/;

    # the first letter of the type is the type in the signature
    $type = substr $type, 0, 1;

    my $adverb_re = qr{
        :        # leading colon
        (\w+)    # name
        (?:      # optional argument
            \("
            (\w+)
            "\)
        )
        \s*
    }sx;

    my %allowed_adverbs = (
        named      => 'n',
        flatten    => 'f',
        slurpy     => 's',
        optional   => 'o',
        positional => 'p',
    );

    my @arg_names = ($name);

    while (my ($name, $argument) = $adverbs =~ /$adverb_re/g) {
        next unless my $type_mod = $allowed_adverbs{$name};

        $type .= $type_mod;

        next unless $type eq 'named';
        push @arg_names, qq|CONST_STRING_GEN(interp, "$argument")|;
    }

    return ($type, @arg_names);
}

sub make_arg_pmc {
    my ($args, $name) = @_;

    return '' unless @$args;

    my $code = "    VTABLE_set_integer_native(interp, $name, " . @$args
             . ");\n";

    for my $i ( 0 .. $#{$args} ) {
        $code .= "    VTABLE_set_integer_keyed_int(interp, $name, "
              .  "$i, $args->[$i]);\n";
    }

    return $code;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
