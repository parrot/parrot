# Copyright (C) 2004, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Docs::Section::Languages - Languages documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::Languages;

=head1 DESCRIPTION

A documentation section describing Parrot's client languages.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::Languages;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::Languages::ISA = qw(Parrot::Docs::Section);

=item C<new()>

Returns a new section.

=cut

sub new
{
    my $self = shift;
        
    return $self->SUPER::new(
        'Language Implementations', 'languages.html', '',
        $self->new_item('', 'languages/LANGUAGES.STATUS.pod'),
        $self->new_item('', 'languages/t/harness'),
        $self->new_section('amber', 'amber.html', '', 'languages/amber'),
        $self->new_section('APL', 'apl.html', '', 'languages/APL'),
        $self->new_section('BASIC', 'basic.html', '', 'languages/BASIC'),
        $self->new_section('bc', 'bc.html', '', 'languages/bc'),
        $self->new_section('Befunge', 'befunge.html', '', 'languages/befunge'),
        $self->new_section('BF', 'bf.html', '', 'languages/bf'),
        $self->new_section('Cola', 'cola.html', '', 'languages/cola'),
        $self->new_section('Commun Lisp', 'lisp.html', '', 'languages/lisp'),
        $self->new_section('.Net', 'dotnet.html', '', 'languages/dotnet'),
        $self->new_section('HQ9plus', 'hq9plus.html', '', 'languages/HQ9plus'),
        $self->new_section('Jako', 'jako.html', '', 'languages/jako'),
        $self->new_section('lazy-k', 'lazy-k.html', '', 'languages/lazy-k'),
        $self->new_section('Lua', 'lua.html', '', 'languages/lua'),
        $self->new_section('M4', 'm4.html', '', 'languages/m4'),
        $self->new_section('Ook!', 'ook.html', '', 'languages/ook'),
        $self->new_section('Parakeet', 'parakeet.html', '', 'languages/parakeet'),
        $self->new_section('Perl6', 'perl6.html', '', 'languages/perl6'),
        $self->new_section('pheme', 'pheme.html', '', 'languages/pheme'),
        $self->new_section('Pugs', 'pugs.html', '', 'languages/pugs'),
        $self->new_section('Punie', 'punie.html', '', 'languages/punie'),
        $self->new_section('Python', 'python.html', '', 'languages/python'),
        $self->new_section('Regex', 'regex.html', '', 'languages/regex'),
        $self->new_section('Scheme', 'scheme.html', '', 'languages/scheme'),
        $self->new_section('TCL', 'tcl.html', '', 'languages/tcl'),
        $self->new_section('unlambda', 'unlambda.html', '', 'languages/unlambda'),
        $self->new_section('URM', 'urm.html', '', 'languages/urm'),
        $self->new_section('Zcode', 'zcode.html', '', 'languages/Zcode'),
    );
}

=back

=cut

1;
