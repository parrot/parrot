# Copyright (C) 2004-2010, Parrot Foundation.
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
use Parrot::Docs::Section::PMCs;
use Parrot::Docs::Section::Ops;
use Parrot::Docs::Section::Tools;
use Parrot::Docs::Section::Compilers;
use Parrot::Docs::Section::PDDs;
use Parrot::Docs::Section::PCT_Tutorial;

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
            $self->new_item( 'Getting Started', 'docs/book/pct/ch02_getting_started.pod'),
            $self->new_item( 'Navigating the Docs', 'docs/parrot.pod'),
            $self->new_item( 'Roles & Responsibilities', 'docs/project/roles_responsibilities.pod'),
            $self->new_item( 'Release History', 'docs/parrothist.pod'),
            $self->new_item( 'Donors', 'DONORS.pod'),
            $self->new_item( 'Glossary', 'docs/glossary.pod'),
            $self->new_item( 'Support Policy', 'docs/project/support_policy.pod'),
        ),
        $self->new_group(
            'Working with Parrot',
            '',
            $self->new_item( 'Running Parrot', 'docs/running.pod'),
            $self->new_item( 'Testing Parrot', 'docs/tests.pod'),
            $self->new_item( 'Developer FAQ', 'docs/gettingstarted.pod'),
            $self->new_item( 'Submitting Bug Reports & Patches', 'docs/submissions.pod' ),
        ),
        $self->new_group(
            'Implementing Languages on Parrot',
            '',
            $self->new_item( 'Parrot Compiler Tools', 'docs/book/pct/ch03_compiler_tools.pod'),
            Parrot::Docs::Section::PCT_Tutorial->new,
            $self->new_item( 'Parrot Grammar Engine', 'docs/book/pct/ch04_pge.pod'),
            $self->new_item( 'Not Quite Perl', 'docs/book/pct/ch05_nqp.pod'),
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

        $self->new_group(
            'PIR Book',
            '',
            $self->new_item( 'Chapter 1 Introduction', 'docs/book/pir/ch01_introduction.pod'),
            $self->new_item( 'Chapter 2 Getting Started', 'docs/book/pir/ch02_getting_started.pod'),
            $self->new_item( 'Chapter 3 Basic Syntax', 'docs/book/pir/ch03_basic_syntax.pod'),
            $self->new_item( 'Chapter 4 Variables', 'docs/book/pir/ch04_variables.pod'),
            $self->new_item( 'Chapter 5 Control Structures', 'docs/book/pir/ch05_control_structures.pod'),
            $self->new_item( 'Chapter 6 Subroutines', 'docs/book/pir/ch06_subroutines.pod'),
            $self->new_item( 'Chapter 7 Objects', 'docs/book/pir/ch07_objects.pod'),
            $self->new_item( 'Chapter 8 IO', 'docs/book/pir/ch08_io.pod'),
            $self->new_item( 'Chapter 9 Exceptions', 'docs/book/pir/ch09_exceptions.pod'),
        ),

        $self->new_group(
            'PCT Book',
            '',
            $self->new_item( 'Chapter 1 Introduction', 'docs/book/pct/ch01_introduction.pod'),
            $self->new_item( 'Chapter 2 Getting Started', 'docs/book/pct/ch02_getting_started.pod'),
            $self->new_item( 'Chapter 3 Compiler Tools', 'docs/book/pct/ch03_compiler_tools.pod'),
            $self->new_item( 'Chapter 4 Grammar Engine', 'docs/book/pct/ch04_pge.pod'),
            $self->new_item( 'Chapter 5 Grammar Actions', 'docs/book/pct/ch05_nqp.pod'),
        ),
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

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
