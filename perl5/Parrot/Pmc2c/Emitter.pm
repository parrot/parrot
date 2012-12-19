# Copyright (C) 2004-2012, Parrot Foundation.
package Parrot::Pmc2c::Emitter;
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw(count_newlines spew);
use Parrot::Pmc2c::Pmc2cMain ();
use overload '""'   => \&stringify;
use overload 'bool' => \&boolify;

=head1 NAME

Parrot::Pmc2c::Emitter

=head1 SYNOPSIS

    use Parrot::Pmc2c::Emitter ();

=head1 DESCRIPTION

This package provides various methods for composing parts of files created by
parsing PMCs.  Its methods are called by several other packages under
F<lib/Parrot/Pmc2c/>, all of which are ultimately run during the many
instances of F<tools/build/pmc2c.pl> invoked during the F<make> build process.

=head1 PUBLIC METHODS

=head2 C<new()>

=over 4

=item * Purpose

Parrot::Pmc2c::Emitter constructor.

=item * Arguments

    Parrot::Pmc2c::Emitter->new( 'path/to/file' );

String holding relative path to file to be written.

=item * Return Value

Parrot::Pmc2c::Emitter object.

=item * Comment

The method's argument is, in practice, the return value of a method call.
Examples:

    # lib/Parrot/Pmc2c/PMC.pm
    my $c_emitter = Parrot::Pmc2c::Emitter->new( $self->filename(".c") );
    my $h_emitter = Parrot::Pmc2c::Emitter->new( $self->filename(".h", $self->is_dynamic) );

    # lib/Parrot/Pmc2c/PCCMETHOD.pm
    my $e = Parrot::Pmc2c::Emitter->new( $pmc->filename );

=back

=cut

sub new {
    my ( $class, $filename ) = @_;
    my $data = { filename => $filename, };
    return bless $data, $class;
}

=head2 C<text()>

=over 4

=item * Purpose

This, in effect, is a different type of constructor from C<new()>.  It takes
up to three arguments and returns an object with a more complex structure.

=item * Arguments

List of one to three strings:

=over 4

=item 1 body

=item 2 filename

=item 3 bline

=back

Examples:

    # lib/Parrot/Pmc2c/PMC.pm
    body => Parrot::Pmc2c::Emitter->text($body),

    # lib/Parrot/Pmc2c/Parser.pm
    $pmc->preamble( Parrot::Pmc2c::Emitter->text( $preamble, $filename, 1 ) );

    $pmc->postamble( Parrot::Pmc2c::Emitter->text( $post, $filename, $lineno ) );

    body => Parrot::Pmc2c::Emitter->text( $methodblock, $filename, $lineno ),

=item * Return Value

Parrot::Pmc2c::Emitter object, apparently suitable for using as value for a
C<body> key in a Parrot::Pmc2c::Method object.  B<MUST VERIFY>.

=item * Comment

Also currently (June 2012) used in F<lib/Parrot/Pmc2c/PMC/Null.pm>,
F<lib/Parrot/Pmc2c/PMC/Object.pm>, F<lib/Parrot/Pmc2c/PMC/RO.pm> and
F<lib/Parrot/Pmc2c/PMC/default.pm>.

=back

=cut

sub text {
    my ( $class, $body, $filename, $bline ) = @_;
    $filename ||= "";
    $bline    ||= -1;
    my %data = (
        data     => $body,
        filename => $filename,
        bline    => $bline,
        eline    => $bline + count_newlines($body),
    );
    return bless \%data, ref($class) || $class;
}

=head2 C<find()>

=over 4

=item * Purpose

Recursively returns strings captured from pattern matches.

=item * Arguments

Single argument:  compiled regular expression.

=item * Return Value

If a pattern is matched within a list of items, return the matching string.
Return the object itself it the match is against the C<data> element.  Return
a false value otherwise.

=item * Comment

Used in Parrot::Pmc2c::PCCMETHOD.  Example:

    $matched = $body->find($signature_re);

=back

=cut

sub find {
    my ( $self, $regex ) = @_;
    if ( $self->{items} ) {
        for my $x ( @{ $self->{items} } ) {
            my $matched = $x->find($regex);
            return $matched if $matched;
        }
    }
    else {
        return $self if ( $self->{data} =~ /$regex/ );
    }
    return 0;
}

=head2 C<subst()>

=over 4

=item * Purpose

Recursively perform substitutions.

=item * Arguments

List of two arguments:

=over 4

=item *

Compiled regular expression.

=item *

Reference to a subroutine which performs a substitution on the string
matched by the first argument's pattern.

=back

=item * Return Value

True value.

=item * Comment

Used in Parrot::Pmc2c::Method.  Some of these substitutions can be quite
simple:

    $body->subst( qr{\bSELF\b},   sub { '_self' } );

Others are more complex:

    # Rewrite STATICSELF.other_method(args...)
    $body->subst(
        qr{
      \bSTATICSELF\b    # Macro STATICSELF
      \.(\w+)           # other_method
      \(\s*(.*?)\)      # capture argument list
      }x,
        sub {
            "Parrot_${pmcname}"
                . ( $pmc->is_vtable_method($1) ? "" : "_nci" ) . "_$1("
                . full_arguments($2) . ")";
        }
    );

=back

=cut

sub subst {
    my ( $self, $regex, $replacement ) = @_;
    if ( $self->{items} ) {
        for my $x ( @{ $self->{items} } ) {
            $x->subst( $regex, $replacement );
        }
    }
    else {
        while ( $self->{data} =~ m/$regex/ ) {
            my $result = $replacement->();
            $self->{data} =~ s/$regex/$result/x;
        }
    }
    return 1;
}

=head2 C<replace()>

=over 4

=item * Purpose

=item * Arguments

List of two arguments:

=over 4

=item *

Compiled regular expression.

=item *

Another Parrot::Pmc2c::Emitter object.

=back

=item * Return Value

True value upon success.

=item * Comment

Used in C<Parrot::Pmc2c::PCCMETHOD::rewrite_RETURNs()>.  Example:

    $matched->replace( $match, $e );

=back

=cut

sub replace {
    my ( $self, $regex, $replacement ) = @_;
    my $m = $self->{data} =~ /((.*)\Q$regex\E)(.*)/s;
    my ( $all, $pre, $post ) = ( $1, $2, $3 );
    $self->emit( $pre, $self->filename, $self->{bline} );
    $self->add_fragment($replacement);
    $self->emit( $post, $self->filename, $self->{bline} + count_newlines($all) );

    for my $x (qw( data bline eline )) {
        delete $self->{$x};
    }
    return 1;
}

sub stringify {
    my ($self) = @_;
    my $out = "";

    if ( $self->{items} ) {
        for my $x ( @{ $self->{items} } ) {
            $out .= $x->stringify;
        }
    }
    else {
        $out .= $self->{data};
    }
    return $out;
}

sub boolify {
    my ($self) = @_;
    return $self;
}

sub annotate {
    my ($self) = @_;
    $self->{output}       = "";
    $self->{current_file} = $self->filename;
    $self->{current_line} = 1;

    $self->annotate_worker($self);

    my $output = $self->{output};

    for my $x (qw( output current_line current_file )) {
        delete $self->{$x};
    }

    return $output;
}

sub annotate_worker {
    my ( $self, $it ) = @_;

    if ( $it->{items} ) {
        for my $x ( @{ $it->{items} } ) {
            $self->annotate_worker($x);
        }
    }
    else {
        my $data;
        my $filename = $it->{filename} || $self->filename;
        my $line = $it->{bline};

        #no need to emit unnecessary #line directive
        if ( $line == -1 and $self->filename eq $self->{current_file} ) {
            $data = $it->{data};
        }
        else {
            $line = $self->{current_line} if $line == -1;
            if (!$Parrot::Pmc2c::Pmc2cMain::OPTIONS->{nolines}) {
                ( my $filename_escaped = $filename ) =~ s|\\|/|g;
                $data .= "/* LINE $line \"$filename_escaped\" */\n";
            }
            $data .= $it->{data};
        }
        $self->{output} .= $data;
        $self->{current_file} = $filename;
        $self->{current_line} += count_newlines($data);
    }
}

sub emit {
    my ( $self, $item, $file, $line ) = @_;
    unless ( ref($item) eq 'Parrot::Pmc2c::Emitter' ) {
        $file ||= $self->filename;
        $line ||= -1;
        $item = $self->text( $item, $file, $line );
    }
    $self->add_fragment($item);
}

sub add_fragment {
    my ( $self, $item ) = @_;
    push @{ $self->{items} }, $item;
}

sub filename {
    my ( $self, $value ) = @_;
    $self->{filename} = $value if $value;
    return $self->{filename};
}

sub write_to_file {
    my ($self) = @_;
    spew( $self->filename, $self->annotate );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

