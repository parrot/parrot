# Copyright (C) 2004-2009, Parrot Foundation.
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
use warnings;

use base qw( Parrot::Docs::Section );

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'Language Implementations',
        'languages.html',
        '',
        $self->new_item( '', 'languages/t/harness' ),
        $self->new_section( 'abc',         'abc.html',        '', 'languages/abc' ),
        $self->new_section( 'BASIC',       'basic.html',      '', 'languages/BASIC' ),
        $self->new_section( 'BF',          'bf.html',         '', 'languages/bf' ),
        $self->new_section( 'C99',         'c99.html',        '', 'languages/c99' ),
        $self->new_section( 'Cardinal',    'cardinal.html',   '', 'languages/cardinal' ),
        $self->new_section( 'ChitChat',    'chitchat.html',   '', 'languages/chitchat' ),
        $self->new_section( 'Cola',        'cola.html',       '', 'languages/cola' ),
        $self->new_section( 'Common Lisp', 'lisp.html',       '', 'languages/lisp' ),
        $self->new_section( '.Net',        'dotnet.html',     '', 'languages/dotnet' ),
        $self->new_section( 'ecmascript',  'ecmascript.html', '', 'languages/ecmascript' ),
        $self->new_section( 'forth',       'forth.html',      '', 'languages/forth' ),
        $self->new_section( 'Jako',        'jako.html',       '', 'languages/jako' ),
        $self->new_section( 'lolcode',     'lolcode.html',    '', 'languages/lolcode' ),
        $self->new_section( 'Ook!',        'ook.html',        '', 'languages/ook' ),
        $self->new_section( 'pheme',       'pheme.html',      '', 'languages/pheme' ),
        $self->new_section( 'PIR',         'pir.html',        '', 'languages/PIR' ),
        $self->new_section( 'POD',         'pod.html',        '', 'languages/pod' ),
        $self->new_section( 'Pynie',       'pynie.html',      '', 'languages/pynie' ),
        $self->new_section( 'Regex',       'regex.html',      '', 'languages/regex' ),
        $self->new_section( 'Scheme',      'scheme.html',     '', 'languages/scheme' ),
        $self->new_section( 'Squaak',      'squaak.html',     '', 'languages/squaak' ),
        $self->new_section( 'URM',         'urm.html',        '', 'languages/urm' ),
    );
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
