# Copyright (C) 2004-2011, Parrot Foundation.

package Parrot::Pmc2c::PCCMETHOD;
use strict;
use warnings;
use Carp qw(longmess croak);
use Parrot::Pmc2c::PCCMETHOD_BITS;
use Parrot::Pmc2c::UtilFunctions qw( trim );

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

=head3
    regtype to argtype conversion hash
=cut

our $reg_type_info = {

    # s is string, ss is short string, at is arg type
    +(REGNO_INT) => { s   => "INTVAL",
                      ss  => "INT",
                      pcc => 'I',
                      at  => PARROT_ARG_INTVAL},
    +(REGNO_NUM) => { s   => "FLOATVAL",
                      ss  => "NUM",
                      pcc => "N",
                      at  => PARROT_ARG_FLOATVAL, },
    +(REGNO_STR) => { s => "STRING*",
                      ss => "STR",
                      pcc => "S",
                      at => PARROT_ARG_STRING, },
    +(REGNO_PMC) => { s => "PMC*",
                      ss => "PMC",
                      pcc => "P",
                      at => PARROT_ARG_PMC, },
};

=head3 C<parse_adverb_attributes>

  builds and returs an adverb hash from an adverb string such as
  ":optional :opt_flag :slurpy"
  {
    optional  =>1,
    opt_flag  =>1,
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

sub gen_arg_pcc_sig {
    my ($param) = @_;

    return 'Ip'
        if exists $param->{attrs}{opt_flag};

    my $sig = $reg_type_info->{ $param->{type} }->{pcc};
    $sig   .= 'c' if  exists $param->{attrs}{constant};
    $sig   .= 'f' if  exists $param->{attrs}{flatten};
    $sig   .= 'i' if  exists $param->{attrs}{invocant};
    $sig   .= 'l' if  exists $param->{attrs}{lookahead};
    $sig   .= 'n' if (exists $param->{attrs}{name} ||
                      exists $param->{attrs}{named});
    $sig   .= 'o' if  exists $param->{attrs}{optional};
    $sig   .= 'p' if  exists $param->{attrs}{opt_flag};
    $sig   .= 's' if  exists $param->{attrs}{slurpy};

    return $sig;
}

=head3 C<rewrite_RETURNs($method, $pmc)>

Rewrites the method body performing the various macro substitutions for RETURNs.

=cut

sub rewrite_RETURNs {
    my ( $self, $pmc ) = @_;
    my $method_name    = $self->name;
    my $body           = $self->body;
    my $wb             = $self->attrs->{manual_wb}
                         ? ''
                         : 'PARROT_GC_WRITE_BARRIER(interp, _self);';

    my $signature_re   = qr/
      (RETURN       #method name
      \s*              #optional whitespace
      \( ([^\(]*) \)   #returns ( stuff ... )
      ;?)              #optional semicolon
    /sx;

    croak "return not allowed in pccmethods, use RETURN instead $body"
        if $body and $body =~ m/\breturn\b.*?;\z/s;

    while ($body) {
        my $matched;

        if ($body) {
            $matched = $body->find($signature_re);
            last unless $matched;
        }

        $matched =~ /$signature_re/;
        my ( $match, $returns ) = ( $1, $2 );

        my $e = Parrot::Pmc2c::Emitter->new( $pmc->filename );

        if ($returns eq 'void') {
            $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    {
    /*BEGIN RETURN $returns */
    $wb
    return;
    /*END RETURN $returns */
    }
END
            $matched->replace( $match, $e );
            next;
        }

        my $goto_string = "goto ${method_name}_returns;";
        my ( $returns_signature, $returns_varargs ) =
            process_pccmethod_args( parse_p_args_string($returns), 'return' );

        if ($returns_signature) {
        $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    {
    /*BEGIN RETURN $returns */
END
        $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    _ret_object = Parrot_pcc_build_call_from_c_args(interp, _call_object,
        "$returns_signature", $returns_varargs);
    UNUSED(_ret_object);
    $wb
    return;
    /*END RETURN $returns */
    }
END
        }
        else { # if ($returns_signature)
            $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    {
    /*BEGIN RETURN $returns */
    $wb
    return;
    }
    /*END RETURN $returns */
END
        }

        $matched->replace( $match, $e );
    }

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

    my $args           = [ [], [], [], [] ]; # actual INT, FLOAT, STRING, PMC
    my $signature    = "";
    my @vararg_list = ();
    my $varargs    = "";
    my $declarations    = "";

    for my $arg (@$linear_args) {
        my ( $named, $named_name ) = is_named($arg);
        my $type = $arg->{type};
        my $name = $arg->{name};
        if ($named) {
            my $tis  = $reg_type_info->{+(REGNO_STR)}{s};     #reg_type_info string
            my $dummy_name = "_param_name_str_". $named_name;
            $dummy_name =~ s/"//g;
            my $argn = {
                type => +(REGNO_STR),
                name => $named_name,
            };
            $arg->{named_arg}  = $argn;
            $arg->{named_name} = $named_name;

            push @{ $args->[ +(REGNO_STR) ] }, $argn;
            $signature .= 'Sn';
            $declarations .= "$tis $dummy_name = CONST_STRING_GEN(interp, $named_name);\n";
            push @vararg_list, "&$dummy_name";
        }

        push @{ $args->[ $type ] }, $arg;
        $signature .= gen_arg_pcc_sig($arg);
        if ( $arg_type eq 'arg' ) {
            my $tis  = $reg_type_info->{$type}{"s"};     #reg_type_info string
            $declarations .= "$tis $name;\n" unless $arg->{already_declared};
            push @vararg_list, "&$name"
        }
        elsif ( $arg_type eq 'return' ) {
            my $typenamestr = $reg_type_info->{$type}{s};
            push @vararg_list, "($typenamestr)$name";
        }
    }

    $varargs = join ", ", @vararg_list;
    return ( $signature, $varargs, $declarations );
}

=head3 C<rewrite_pccmethod()>

    rewrite_pccmethod($method, $pmc);

=cut

sub rewrite_pccmethod {
    my ( $self, $pmc ) = @_;

    my $e      = Parrot::Pmc2c::Emitter->new( $pmc->filename );
    my $e_post = Parrot::Pmc2c::Emitter->new( $pmc->filename );

    # parse pccmethod parameters, then unshift the PMC arg for the invocant
    my $linear_args = parse_p_args_string( $self->parameters );
    unshift @$linear_args,
        {
            type             => convert_type_string_to_reg_type('PMC'),
            name             => '_self',
            attrs            => parse_adverb_attributes(':invocant'),
            already_declared => 1,
        };

 # The invocant is already passed in the C signature, why pass it again?

    my ( $params_signature, $params_varargs, $params_declarations ) =
        process_pccmethod_args( $linear_args, 'arg' );

    my $wb             = $self->attrs->{manual_wb}
                         ? ''
                         : 'PARROT_GC_WRITE_BARRIER(interp, _self);';

    rewrite_RETURNs( $self, $pmc );
    rewrite_pccinvoke( $self, $pmc );

    $e->emit( <<"END", __FILE__, __LINE__ + 1 );
    PMC * const _ctx         = CURRENT_CONTEXT(interp);
    PMC * const _call_object = Parrot_pcc_get_signature(interp, _ctx);
    PMC * _ret_object;

    { /* BEGIN PARMS SCOPE */
END
    $e->emit(<<"END");
$params_declarations
END
    if ($params_signature) {
        $e->emit( <<"END", __FILE__, __LINE__ + 1 );
        Parrot_pcc_fill_params_from_c_args(interp, _call_object, "$params_signature",
            $params_varargs);
END
    }
    $e->emit( <<'END', __FILE__, __LINE__ + 1 );
    { /* BEGIN PMETHOD BODY */
END

    $e_post->emit( <<"END", __FILE__, __LINE__ + 1 );

    } /* END PMETHOD BODY */

    $wb

    } /* END PARAMS SCOPE */
    return;
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
      \b               # exclude Parrot_pcc_invoke_method_from_c_args when lacking optional capture
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
        $e->emit(qq|Parrot_pcc_invoke_method_from_c_args($fixed_params, "$signature", $vars);\n|);

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
        opt_flag   => 'p',
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

sub mangle_name {
    my ( $self, $pmc ) = @_;
    $self->symbol( $self->name );
    $self->name( $self->type eq Parrot::Pmc2c::Method::MULTI()   ?
                    (join '_', 'multi', $self->name, @{ $self->{MULTI_sig} }) :
                    "nci_@{[$self->name]}" );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
