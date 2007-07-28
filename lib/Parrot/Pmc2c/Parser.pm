# Copyright (C) 2004-2006, The Perl Foundation.
# $Id$
package Parrot::Pmc2c::Parser;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw( parse_pmc extract_balanced );
use Data::Dumper;
use Parrot::Pmc2c::PMC;
use Parrot::Pmc2c::Method;
use Parrot::Pmc2c::Emitter;
use Parrot::Pmc2c::UtilFunctions qw(count_newlines filename slurp);
use Text::Balanced 'extract_bracketed';

=head1 NAME

Parrot::Pmc2c::Parser - PMC Parser

=head1 SYNOPSIS

    use Parrot::Pmc2c::Parser;

=head1 DESCRIPTION

Parrot::Pmc2c::Paser parses a sudo C syntax into a perl hash that is then dumped.


=head2 C<parse_pmc()>

    $parsed_pmc_hash = parse_pmc($pmc2cMain, $filename);

B<Purpose:>  Parse PMC code and return a hash ref of pmc attributes.

B<Arguments:>  List of two arguments:

=over 4

=item *

The pmc2cMain object

=item *

Filename of the pmc to parse.

=back

B<Return Values:>  Reference to a Parrot::Pmc2c::PMC object

B<Comments:>  Called by C<dump_pmc()>.

=cut

sub parse_pmc {
    my ( $pmc2cMain, $filename ) = @_;
    #slurp file contents
    $filename = $pmc2cMain->find_file( filename($filename, '.pmc'), 1 );
    my $code = slurp($filename);

    my ($preamble, $pmcname, $flags, $parents, $pmcbody, $post, $chewed_lines)
        = parse_top_level( $code );

    my $pmc = Parrot::Pmc2c::PMC->create($pmcname);
    $pmc->preamble( Parrot::Pmc2c::Emitter->text($preamble, $filename, 1));
    $pmc->name($pmcname);
    $pmc->set_filename($filename);
    $pmc->set_flags($flags);
    $pmc->set_parents($parents);

    my $lineno = count_newlines($preamble) + $chewed_lines + 1; #the +1 puts us on the current line
    my $class_init;

    my $signature_re = qr{
        ^
        (?:
          [;\n\s]*            #blank spaces and spurious semicolons
          (?:/\*.*?\*/)?      #C comments
        )*

        ((?:PCC)?METHOD\s+)?  #method flag

        (\w+\**)              #return type
        \s+
        (\w+)                 #method name
        \s*
        \( ([^\(]*) \)        #parameters
        \s*
        ((?::(\w+)\s*)*)      #method attrs
        \s*
    }sx;

    while ( $pmcbody =~ s/($signature_re)// ) {
        $lineno += count_newlines($1);
        my ( $marker, $return_type, $methodname, $parameters, $attrs)
            = ( $2, $3, $4, $5, parse_method_attrs($6));
        ( my $methodblock, $pmcbody ) = extract_balanced($pmcbody);
        $methodblock = strip_outer_brackets($methodblock);
        $methodblock =~ s/^[ ]{4}//mg; #remove pmclass 4 space indent
        $methodblock =~ s/\n\s+$/\n/g; #trim trailing whitespace from lastline


        my $method = Parrot::Pmc2c::Method->new( {
            name        => $methodname,
            parent_name => $pmc->name,
            body        => Parrot::Pmc2c::Emitter->text($methodblock, $filename, $lineno),
            return_type => $return_type,
            parameters  => $parameters,
            type        => Parrot::Pmc2c::Method::VTABLE,
            attrs       => $attrs,
        });

        #PCCMETHOD needs FixedIntegerArray header
        if ( $marker and $marker =~ /PCCMETHOD/ ) {
            Parrot::Pmc2c::PCCMETHOD::rewrite_pccmethod($method, $pmc);
            $pmc->set_flag('need_fia_header');
        }

        #PCCINVOKE needs FixedIntegerArray header
        $pmc->set_flag('need_fia_header') if ( $methodblock =~ /PCCINVOKE/ );

        # the class_init method is added last after all other methods
        if ( $methodname eq 'class_init' ) {
            $class_init = $method;
        }
        else {
            # Name-mangle NCI methods to avoid conflict with vtable methods.
            if ($marker) {
                $method->type(Parrot::Pmc2c::Method::NON_VTABLE);
                $method->name("nci_$methodname");
                $method->symbol($methodname);
            }

            parse_mmds($method, $filename, $lineno) if $methodblock =~ /\bMMD_(\w+):/;
            $pmc->add_method($method);
       }
       $lineno += count_newlines($methodblock);
    }

    $pmc->postamble(Parrot::Pmc2c::Emitter->text($post, $filename, $lineno));
    #ensure class_init is the last method in the method list
    $pmc->add_method($class_init) if $class_init;
    $pmc->vtable($pmc2cMain->read_dump("vtable.pmc"));
    $pmc->pre_method_gen();

    return $pmc;
}

sub parse_mmds {
    my ( $method, $filename, $lineno) = @_;
    my $mmd_methods = [];
    my $body_text = $method->body;
    my $default_body = $body_text;
    my $default_body_lineno = $lineno;
    # now split into MMD if necessary:
    while ( $body_text =~ s/(\bMMD_(\w+):\s*)// ) {
        $lineno += count_newlines($1);
        my $right_type = $2;
        $method->add_mmd_rights($right_type);
        ( my $mmd_part, $body_text ) = extract_bracketed_body_text( $body_text, '{' );
        die "Empty MMD body near '$body_text'" if ( !$mmd_part );
        my $mmd_part_lines = count_newlines($mmd_part);
        $mmd_part =~ s/\n\s*$/\n/s;  #remove whitespace at end of last line
        if ( $right_type eq 'DEFAULT' ) {
            $default_body = $mmd_part;
            $default_body_lineno = $lineno;
        }
        else {
            my $mmd_method = Parrot::Pmc2c::Method->new( {
                name        => $method->name . "_$right_type",
                parent_name => $method->parent_name,
                body        => Parrot::Pmc2c::Emitter->text($mmd_part, $filename, $lineno),
                return_type => $method->return_type,
                parameters  => $method->parameters,
                type        => Parrot::Pmc2c::Method::VTABLE,
                attrs       => $method->attrs,
                right       => $right_type,
            });
            push @{ $mmd_methods }, $mmd_method;
        }

        $lineno += $mmd_part_lines;
    }
    $method->mmds($mmd_methods);
    $method->body(Parrot::Pmc2c::Emitter->
        text($default_body, $filename, $default_body_lineno));
}

sub strip_outer_brackets {
    my ( $method_body ) = @_;
    die "First character in $method_body is not a {" unless substr($method_body, 0, 1) eq '{';
    die "Last character in $method_body is not a }" unless substr($method_body, -1, 1) eq '}';
    return substr $method_body, 1, -1;
}

sub extract_bracketed_body_text {
    my ( $body_text, $bracketed ) = @_;
    my ( $extracted, $remaining ) = extract_bracketed( $body_text, $bracketed );
    return ( strip_outer_brackets( $extracted ), $remaining );

}


=head2 C<parse_flags()>

    ($pre, $pmcname, $flags_ref)   = parse_flags(\$code);

B<Purpose:>  Extract a pmc signature from the code ref.

B<Argument:>  PMC file contents slurped by C<parse_pmc()>.

B<Return Values:>  List of three elements:

=over 4

=item *

the code found before the pmc signature;

=item *

the name of the pmc

=item *

a hash ref containing the flags associated with the pmc (such as
C<extends> and C<does>).

=item *

the body of the pmc

=item *

the code found after the pmc body

=item *

number of newlines in the pmc signatuer that need to be addde to the
running total of lines in the file

=back

B<Comments:>  Called internally by C<parse_pmc()>.

=cut

sub parse_top_level {
    my $code = shift;

    my $top_level_re = qr{
        ^                 #beginning of line
        (.*?)             #preamble
        ^
        (
            \s*
            pmclass       #pmclass keyword
            \s+           #whitespace
            ([\w]*)       #pmc name
            ([\s+\w+]*)   #pmc attributes
            \s*           #whitespace
        )
        \{                #pmc body beginning marker
    }smx;
    $code =~ s[$top_level_re][{]smx or die "No pmclass found\n";
    my ( $preamble, $pmc_signature, $pmcname, $attributes ) = ( $1, $2, $3, $4 );

    my $chewed_lines = count_newlines($pmc_signature);
    my ( $flags, $parents ) = parse_flags($attributes, $pmcname);
    my ( $body, $postamble ) = extract_balanced($code);
    $body = strip_outer_brackets($body); # trim out the { }
    return ($preamble, $pmcname, $flags, $parents, $body, $postamble, $chewed_lines);
}

our %has_value = map { $_ => 1 } qw(group hll);
our %has_values = map { $_ => 1 } qw(does extends maps lib);

sub parse_flags {
    my ( $data, $pmcname ) = @_;
    my ( $flags, @parents );
    my @words = ($data =~ /(\w+)/g);
    while ( scalar @words ) {
        my $name = shift @words;
        if ( $has_value{$name} || $has_values{$name} ) {
            my $value = shift @words or die "Parser error: no value for '$name'";
            if ($name eq 'extends') {
                push @parents, $value;
            }
            elsif ( $has_values{$name} ) {
                $flags->{$name}{$value} = 1;
            }
            else {
                $flags->{$name} = $value;
            }
        }
        else {
            $flags->{$name} = 1;
        }
    }

    # setup some defaults
    if ( $pmcname ne 'default' ) {
        push @parents, 'default' unless scalar @parents;
        $flags->{does}{scalar}  = 1 unless $flags->{does};
    }
    return ( $flags, \@parents );
}


=head2 C<extract_balanced()>

    ($pmcbody, $post) = extract_balanced($code);

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
    my $code = shift;
    my $unbalanced = 0;

    die "Unexpected whitespace, expecting" if $code =~ /^\s+/;
    die "bad block open: ", substr( $code, 0, 10 ), "..." unless $code =~ /^\{/;

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


    while (/ (\{) | (\}) /gx) {
        if ($1) {
            $unbalanced++;
        }
        else {    # $2
            $unbalanced--;
            return ( substr($code, 0, pos, "" ), $code ) if not $unbalanced;
        }
    }
    die "Badly balanced" if $unbalanced;
    return;
}

=head2 C<parse_method_attrs()>

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
