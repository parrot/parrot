# Copyright (C) 2004-2006, The Perl Foundation.
# $Id: Pmc2cMain.pm 18352 2007-04-28 19:47:02Z jkeenan $
package Parrot::Pmc2c::Parser;
use strict;
use warnings;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw( parse_pmc );
use Parrot::Pmc2c::UtilFunctions qw(count_newlines);

#use Data::Dumper;
#use Parrot::Vtable;
#use Parrot::Pmc2c::Library;
#use Parrot::Pmc2c::UtilFunctions qw(count_newlines);
#use Parrot::Pmc2c::PCCMETHOD;
#use Cwd qw(cwd realpath);
#use File::Basename;
#use Carp;

=head3 C<parse_pmc()>

    ($classname, $attributesref)  = parse_pmc($contents, $opt);

B<Purpose:>  Parse PMC code and return the class name and a hash ref of
attributes.

B<Arguments:>  List of two arguments:

=over 4

=item *

Code reference holding results of parsing PMC code found in file provided
as argument to C<find_and_parse_pmc()>.

=item *

The hash reference which is the value of the C<opt> key provided to constructor.

=back

B<Return Values:>  List of two elements:

=over 4

=item *

String holding a classname.

=item *

Reference to a hash of the class's attributes.  Keys:

    pre
    flags
    methods
    post
    class
    has_method

=back

B<Comments:>  Called internally by C<find_and_parse_pmc()>.

=cut

sub parse_pmc {
    my ( $code, $opt ) = @_;

    my ( $pre, $classname, $flags_ref ) = parse_flags( \$code );
    my ( $classblock, $post ) = extract_balanced($code);

    my $lineno = 1 + count_newlines($pre);
    $classblock = substr( $classblock, 1, -1 );    # trim out the { }

    my ( @methods, %meth_hash, $class_init );
    my $signature_re = qr{
    ^
    (?:                 #blank spaces and comments and spurious semicolons
      [;\n\s]*
      (?:/\*.*?\*/)?    # C-like comments
    )*

    ((?:PCC)?METHOD\s+)?        #method flag

    (\w+\**)            #type
      \s+
        (\w+)           #method name
      \s*
        \( ([^\(]*) \)  #parameters
    \s*
    ((?::(\w+)\s*)*)    #method attrs
    }sx;

    while ( $classblock =~ s/($signature_re)// ) {
        $lineno += count_newlines($1);
        my ( $flag, $type, $methodname, $parameters ) = ( $2, $3, $4, $5 );
        my $attrs = parse_method_attrs($6);
        my ( $methodblock, $remainder_part ) = extract_balanced($classblock);

        my $method_hash = {
            meth       => $methodname,
            body       => $methodblock,
            line       => $lineno,
            type       => $type,
            parameters => $parameters,
            loc        => "vtable",
            attrs      => $attrs,
        };

        if ( $flag and $flag =~ /PCCMETHOD/ ) {
            Parrot::Pmc2c::PCCMETHOD::rewrite_pccmethod($method_hash);
            $flags_ref->{need_fia_header} = 1;
        }

        if ( $methodblock =~ /PCCINVOKE/ ) {
            $flags_ref->{need_fia_header} = 1;
        }

        if ( $methodname eq 'class_init' ) {
            $class_init = $method_hash;
        }
        else {

            # Name-mangle NCI methods to avoid conflict with vtable methods.
            if ($flag) {
                $method_hash->{loc}    = "nci";
                $method_hash->{meth}   = "nci_$methodname";
                $method_hash->{symbol} = $methodname;
            }

            # name => method idx mapping
            $meth_hash{ $method_hash->{meth} } = scalar @methods;

            $method_hash->{mmds} = [ ( $methodblock =~ /MMD_(\w+):/g ) ];
            push @methods, $method_hash;
        }

        $classblock = $remainder_part;
        $lineno += count_newlines($methodblock);
    }

    if ($class_init) {
        $meth_hash{'class_init'} = scalar @methods;
        push @methods, $class_init;
    }
    return
        {
        pre        => $pre,
        flags      => $flags_ref,
        methods    => \@methods,
        post       => $post,
        class      => $classname,
        has_method => \%meth_hash,
        };
}

=head3 C<parse_flags()>

    ($pre, $classname, $flags_ref)   = parse_flags(\$code);

B<Purpose:>  Extract a class signature from the code ref.

B<Argument:>  De-reference the code ref which was the first argument
provided to C<parse_pmc()>.

B<Return Values:>  List of three elements:

=over 4

=item *

the code found before the class signature;

=item *

the name of the class; and

=item *

a hash ref containing the flags associated with the class (such as
C<extends> and C<does>).

=back

B<Comments:>  Called internally by C<parse_pmc()>.

=cut

sub parse_flags {
    my $c = shift;

    $$c =~ s/^(.*?^\s*)pmclass ([\w]*)//ms;
    my ( $pre, $classname ) = ( $1, $2 );

    # flags that have values passed with them
    my %has_value = map { $_ => 1 } qw(does extends group lib hll maps);

    my ( %flags, $parent_nr );

    # look through the pmc declaration header for flags such as noinit
    while ( $$c =~ s/^\s*(\w+)//s ) {
        my $flag = $1;
        if ( $has_value{$flag} ) {
            $$c =~ s/^\s+(\w+)//s
                or die "Parser error: no value for '$flag'";

            $flags{$flag}{$1} = $flag eq 'extends' ? ++$parent_nr : 1;
        }
        else {
            $flags{$flag} = 1;
        }
    }

    # setup some defaults
    if ( $classname ne 'default' ) {
        $flags{extends}{default} = 1 unless $flags{extends};
        $flags{does}{scalar}     = 1 unless $flags{does};
    }

    return $pre, $classname, \%flags;
}

=head3 C<extract_balanced()>

    ($classblock, $post) = extract_balanced($code);

B<Purpose:>  Remove a balanced C<{}> construct from the beginning of C<$code>.
Return it and the remaining code.

B<Argument:>  The code ref which was the first argument provided to
C<parse_pmc()>.

B<Return Values:>  List of two elements:

=over 4

=item *

String beginning with C<{> and ending with C<}>.  In between is found C code
where the comments hold strings of Perl comments written in POD.

=item *

String holding the balance of the code.  Same style as first element, but
without the braces.

=back

B<Comments:>  Called twice within C<parse_pmc()>.  Will die with error message
C<Badly balanced> if not balanced.

=cut

sub extract_balanced {
    my $code    = shift;
    my $balance = 0;

    $code =~ s/^\s+//;

    # create a copy and remove strings and comments so that
    # unbalanced {} can be used in them in PMCs, being careful to
    # preserve string length.
    local $_ = $code;
    s[
        ( ' (?: \\. | [^'] )* '     # remove ' strings
        | " (?: \\. | [^"] )* "     # remove " strings
        | /\* .*? \*/ )             # remove C comments
    ]
    [ "-" x length $1 ]sexg;

    /^\{/ or die "bad block open: ", substr( $code, 0, 10 ), "...";

    while (/ (\{) | (\}) /gx) {
        if ($1) {
            $balance++;
        }
        else {    # $2
            $balance--;
            return substr( $code, 0, pos, "" ), $code
                if not $balance;
        }
    }
    die "Badly balanced" if $balance;
    return;
}

=head3 C<parse_method_attrs()>

    $attrs = parse_method_attrs($method_attributes);

B<Purpose:>  Parse a list of method attributes and return a hash ref of them.

B<Arguments:>  String captured from regular expression.

B<Return Values:>  Reference to hash of attribute values.

B<Comments:>  Called within C<parse_pmc()>.

=cut

sub parse_method_attrs {
    my $flags = shift;
    my %result;
    ++$result{$1} while $flags =~ /:(\w+)/g;
    return \%result;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
