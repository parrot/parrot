# Copyright (C) 2004-2006, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Parrot - Root documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::Parrot;

    Parrot::Docs::Section::Parrot->new->write_html;

=head1 DESCRIPTION

This is the top-level section for the HTML documentation for Parrot.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Parrot;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

use Parrot::Distribution;

use Parrot::Docs::Section::Developer;
use Parrot::Docs::Section::Examples;
use Parrot::Docs::Section::PMCs;
#use Parrot::Docs::Section::C;
use Parrot::Docs::Section::Ops;
#use Parrot::Docs::Section::IMCC;
#use Parrot::Docs::Section::Perl;
#use Parrot::Docs::Section::Libs;
use Parrot::Docs::Section::Tools;
use Parrot::Docs::Section::Compilers;
#use Parrot::Docs::Section::Languages;
#use Parrot::Docs::Section::Config;
#use Parrot::Docs::Section::Tests;
use Parrot::Docs::Section::PDDs;

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'Home', 'index.html',
        'This documentation is a snapshot from the Parrot source.',
        $self->new_group(
            'Introduction',
            '',
            $self->new_item( 'Introduction to Parrot', 'docs/intro.pod'),
            $self->new_item( 'Getting Started', 'docs/book/ch02_getting_started.pod'),
            $self->new_item( 'Navigating the Docs', 'docs/parrot.pod'),
            $self->new_item( 'Roles & Responsibilities', 'docs/project/roles_responsibilities.pod'),
            $self->new_item( 'Release History', 'docs/parrothist.pod'),
            $self->new_item( 'Donors', 'DONORS.pod'),
            $self->new_item( 'Glossary', 'docs/glossary.pod'),
        ),
        $self->new_group(
            'Working with Parrot',
            '',
            $self->new_item( 'Running Parrot', 'docs/running.pod'),
            $self->new_item( 'Testing Parrot', 'docs/tests.pod'),
            Parrot::Docs::Section::Examples->new,
            $self->new_item( 'Developer FAQ', 'docs/gettingstarted.pod'),
            $self->new_item( 'Submitting Bug Reports & Patches', 'docs/submissions.pod' ),
        ),
        $self->new_group(
            'Implementing Languages on Parrot',
            '',
            $self->new_item( 'Compiler Tools', 'docs/book/ch09_pct.pod'),
            $self->new_item( 'Compiler FAQ', 'docs/compiler_faq.pod'),
        ),
        $self->new_group(
            'Design, Internals & Development',
            '',
            $self->new_item( 'Overview', 'docs/overview.pod'),
            Parrot::Docs::Section::PDDs->new,
            Parrot::Docs::Section::PMCs->new,
            Parrot::Docs::Section::Ops->new,
            Parrot::Docs::Section::Developer->new,
            Parrot::Docs::Section::Tools->new,
            $self->new_item( 'Syntax Highlighting for Vim & Emacs', 'editor/README.pod'),
        ),

#        Parrot::Docs::Section::C->new,
#        Parrot::Docs::Section::IMCC->new,
#        Parrot::Docs::Section::Perl->new,
#        Parrot::Docs::Section::Libs->new,
#        Parrot::Docs::Section::Tests->new,
#        Parrot::Docs::Section::Config->new,
    );
}

=back

=head2 Instance Methods

=over 4

=item C<write_docs($silent, $delete)>

Writes the HTML documentation.

If C<$silent> is true then progress is not reported.

If C<$delete> is true then the contents of C<$target> will be deleted
before any HTML is written. This argument is intended to be used only
once by the root section, it is not passed to subsections.

=cut

sub write_docs {
    my $self    = shift;
    my $silent  = shift || 0;
    my $delete  = shift || 0;
    my $version = shift || '';
    my $dist    = Parrot::Distribution->new;

    $dist->delete_html_docs if $delete;

    $self->{VERSION} = $version;
    $self->write_html( $dist, $dist->html_docs_directory, $silent );

    return;
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::Docs::Section::Info>

=item C<Parrot::Docs::Section::Docs>

=item C<Parrot::Docs::Section::Examples>

=item C<Parrot::Docs::Section::PMCs>

=item C<Parrot::Docs::Section::C>

=item C<Parrot::Docs::Section::Ops>

=item C<Parrot::Docs::Section::IMCC>

=item C<Parrot::Docs::Section::Perl>

=item C<Parrot::Docs::Section::Libs>

=item C<Parrot::Docs::Section::Tools>

=item C<Parrot::Docs::Section::Compilers>

=item C<Parrot::Docs::Section::Languages>

=item C<Parrot::Docs::Section::Config>

=item C<Parrot::Docs::Section::Tests>

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
