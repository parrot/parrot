# Copyright (C) 2004-2009, Parrot Foundation.

=head1 NAME

Parrot::Docs::File - Docs-Related File

=head1 SYNOPSIS

        use Parrot::Docs::File;
        my $file = Parrot::Docs::File->new('MANIFEST');

=head1 DESCRIPTION

This C<Parrot::IO::File> subclass adds a few documentation-related
methods to do with POD and file type.

It's used by the documentation tools in F<tools/docs>.

=head2 Class Methods

=over 4

=cut

package Parrot::Docs::File;

use strict;
use warnings;

use base qw( Parrot::IO::File );

use Pod::Simple::Checker;
use Parrot::Docs::POD2HTML;

# wrapped here to reset the error timestamp to speed up check_pod()
sub write {
    my $self                 = shift;
    $self->{POD_ERRORS_TIME} = 0;
    return $self->SUPER::write(@_);
}

my $UNDEFINED = 'Undefined';

# These are the Parrot file types excluding the ICU specifc ones.

my %type_for_suffix = (
    'BASIC'        => 'README file',
    'C'            => 'C code',
    'PL'           => 'Perl script',
    'SKIP'         => 'MANIFEST skip file',
    'TXT'          => 'Text file',
    'txt'          => 'Text file',
    'a'            => 'Library file',
    'bas'          => 'BACIC code',
    'bef'          => 'Befunge code',
    'bf'           => 'BF code',
    'bnf'          => 'Grammar file',
    'c'            => 'C code',
    'cs'           => 'C# code',
    'declarations' => 'Library declarations file',
    'def'          => 'Library definitions file',
    'dev'          => 'Development documentation',
    'dump'         => 'Dump file',
    'el'           => 'eMacs Lisp code',
    'exp'          => 'Perl 6 expected parse tree',
    'flag'         => 'Some kind of IMCC file',
    'generated'    => 'MANIFEST generated file',
    'h'            => 'C header',
    'hacking'      => 'README file',
    'il'           => 'MSIL assembler code',
    'imc'          => 'IMC code',
    'in'           => 'Configuration file',
    'jako'         => 'Jako code',
    'jit'          => 'JIT file',
    'l'            => 'Lex file',
    'num'          => 'Opcode numbering file',
    'o'            => 'Compiled file',
    'ook'          => 'Ook! code',
    'ops'          => 'Parrot opcode file',
    'p6'           => 'Perl 6 code',
    'pasm'         => 'Parrot assembly code',
    'pbc'          => 'Parrot bytecode',
    'pl'           => 'Perl script',
    'pm'           => 'Perl module',
    'pmc'          => 'PMC code',
    'pod'          => 'POD documentation',
    'prd'          => 'Parse::RecDescent grammar file',
    'ps'           => 'Postscript code',
    'py'           => 'Python code',
    'rb'           => 'Ruby code',
    's'            => 'Some kind of configuration file',
    'scheme'       => 'Scheme code',
    'sh'           => 'Shell script',
    'spec'         => 'RPM build specification',
    't'            => 'Test file',
    'tbl'          => 'Vtable file',
    'txt'          => 'Text file',
    'urm'          => 'URM code',
    'vim'          => 'Vim file',
    'xml'          => 'XML file',
    'xs'           => 'XS code',
    'y'            => 'Yacc file'
);

# These are the various types of files without suffix.

my %type_for_name = (
    'Artistic'             => 'Licence file',
    'BUGS'                 => 'Project info',
    'ChangeLog'            => 'Project info',
    'Changes'              => 'Project info',
    'CREDITS'              => 'Project info',
    'DEVELOPING'           => 'Project info',
    'harness'              => 'Perl test harness',
    'INSTALL'              => 'Installation documentation',
    'LICENSE'              => 'Licence file',
    'MAINTAINER'           => 'Maintainer info',
    'Makefile'             => 'Makefile',
    'MANIFEST'             => 'Manifest file',
    'PBC_COMPAT'           => 'Bytecode compatibility file',
    'PLATFORMS'            => 'Project info',
    'README'               => 'README file',
    'RELEASE_INSTRUCTIONS' => 'Project info',
    'RESPONSIBLE_PARTIES'  => 'Project info',
    'TODO'                 => 'TODO file',
    'VERSION'              => 'Project info',
);

=item C<type_for_suffix($suffix)>

This is a class method that converts a file suffix to a description of
the type of files which have this suffix.

=cut

sub type_for_suffix {
    my $self   = shift;
    my $suffix = shift;

    return $type_for_suffix{$suffix} if exists $type_for_suffix{$suffix};

    return $UNDEFINED;
}

=item C<type_for_name($name)>

This is a class method that converts a file name to a description of the
type of files which have this name.

=cut

sub type_for_name {
    my $self = shift;
    my $name = shift;

    return $type_for_name{$name} if exists $type_for_name{$name};

    return $UNDEFINED;
}

=back

=head2 Instance Methods

=over 4

=item C<type()>

This first tries to find a type for the file's suffix, failing that it
looks at the file's name. If it fails for both it returns 'Undefined'.

=cut

sub type {
    my $self = shift;
    my $type = $self->type_for_suffix( $self->suffix );

    return $type unless $type eq $UNDEFINED;

    $type = $self->type_for_name( $self->name );

    return $type unless $type eq $UNDEFINED;

    return 'Executable' if $self->is_executable;

    return $UNDEFINED;
}

=item C<is_of_type($type)>

Returns whether the file is of the specified type.

=cut

sub is_of_type {
    my $self = shift;
    my $type = shift;

    return 0 unless defined $type;

    return $self->type eq $type;
}

=item C<check_pod()>

Runs C<Pod::Simple::Checker> on the contents of the file. Executable
files, and F<*.dump> files are assumed not to contain POD and therefore
not checked.

Note that the results are cached and the POD will only be rechecked
if the file has been modified since it was checked.

=cut

sub check_pod {
    my $self = shift;

    return
        if ( $self->is_executable and $self->name ne 'parrotbug' )
        or $self->suffix eq 'dump';

    if ( !exists $self->{POD_ERRORS_TIME}
        or $self->modified_since( $self->{POD_ERRORS_TIME} ) )
    {
        my $checker = Pod::Simple::Checker->new;

        $self->{POD_ERRORS_TIME} = time;
        $self->{POD_ERRORS}      = '';
        $checker->output_string( \$self->{POD_ERRORS} );
        $checker->parse_file( $self->path );
        $self->{POD_ERRORS_COUNT} = $checker->errors_seen;
        $self->{CONTAINS_POD}     = $checker->content_seen;
    }
}

=item C<contains_pod()>

Tells you whether there is any POD formatted documentation in the file.
Executable files are assumed not to contain POD.

=cut

sub contains_pod {
    my $self = shift;

    $self->check_pod;

    return $self->{CONTAINS_POD};
}

=item C<num_pod_errors()>

Tells you the number of POD errors in the file.

=cut

sub num_pod_errors {
    my $self = shift;

    $self->check_pod;

    return $self->{POD_ERRORS_COUNT} || 0;
}

=item C<pod_errors($options)>

Gives you a description of any POD errors in the file.

=cut

sub pod_errors {
    my $self = shift;

    $self->check_pod;

    return $self->{POD_ERRORS};
}

=item C<is_docs_link()>

Returns whether the file is suitable for inclusion in a documentation link.

If a file contains plain text rather than POD it may be directly linked to.

=cut

sub is_docs_link {
    my $self = shift;

    # TT #1241 - This needs more thought. I'm trying to work out which files
    # it's sensible to link directly to. Suffixes other than txt are a
    # problem (for me at least) because the browser thinks it should
    # download the file.

    if ( $self->has_suffix ) {
        return 0 if $self->suffix !~ m/[Tt][Xx][Tt]/o;
    }
    else {
        return 1 if $self->name =~ m/^[[:upper:]]+$/o;
    }

    return $self->type =~ /Licence|info|docu|Text|TODO|status|MANIFEST|README/;
}

=item C<title()>

Returns the title of the file.

=cut

sub title {
    my $self = shift;

    return $self->name unless $self->contains_pod;

    my $text = $self->read;

    return ''
        unless $text =~ /^=head1\s+([^\n\r]+)\s*[\n\r]+/smo;

    return $1
        if ($1 ne 'NAME' and $1 ne 'TITLE');

    return ''
        unless $text =~ /^=head1\s+(?:NAME|TITLE)\s*[\n\r]+([^\n\r]+)/smo;

    $text = $1;

    # Tidy it up a bit.
    $text =~ s/^\s+//o;
    $text =~ s/\s+$//o;
    $text =~ s/\s*-$//o;

    # There was not text, just another POD command (=head2 probably).
    return '' if $text =~ /^=\w/o;

    return $text unless $text =~ /-/o;

    # There has to be some space each side of the dash.
    my ( $path, $desc ) = split /\s+--?\s+/, $text, 2;

    return $desc;
}

=item C<short_description()>

Returns a short description of the file extracted from the C<NAME> section
of the POD documentation, if it exists. If an C<ABSTRACT> is found then
that is preferred.

=cut

sub short_description {
    my $self = shift;

    return '' unless $self->contains_pod;

    my @lines = $self->read;
    my $firstline = shift @lines;
    return $self->title unless $firstline =~ /^=head1\s+ABSTRACT/;

    my $all_text = join "\n" => @lines;
    $all_text =~ s/^\s+//;
    my @paragraphs = split /\n{2,}/, $all_text;
    my $desc;
    # For a short description, we take only the first paragraph of any
    # ABSTRACT.
    ($desc = $paragraphs[0]) =~ s/\n/ /g;
    $desc =~ s/\s+/ /sg;
    # We eliminate certain POD formatting characters.
    $desc =~ s/[CFL]<([^>]+)>/$1/sg;
    return $desc;
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::Docs::Directory>

=item C<Parrot::Docs::POD2HTML>

=item C<Pod::Simple::Checker>

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
