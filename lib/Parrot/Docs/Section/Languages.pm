# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::Languages - Languages docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::Languages;
	
	my $section = Parrot::Docs::Section::Languages->new;

=head1 DESCRIPTION

A documentation section describing Parrot's client languages.

=head2 Methods

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
		$self->item('', 'languages/LANGUAGES.STATUS'),
		$self->section('Perl6', 'perl6.html', '', 'languages/perl6'),
		$self->section('Jako', 'jako.html', '', 'languages/jako'),
		$self->section('M4', 'm4.html', '', 'languages/m4'),
		$self->section('BASIC', 'basic.html', '',
			$self->section('BASIC Interpreter', 'basic_interpreter.html', 
				'', 'languages/BASIC/interpreter'),
			$self->section('BASIC Compiler', 'basic_compiler.html', 
				'', 'languages/BASIC/compiler'),
		),
		$self->section('Regex', 'regex.html', '', 'languages/regex'),
		$self->section('TCL', 'tcl.html', '', 'languages/tcl'),
		$self->section('Cola', 'cola.html', '', 'languages/cola'),
		$self->section('Scheme', 'scheme.html', '', 'languages/scheme'),
		$self->section('URM', 'urm.html', '', 'languages/urm'),
		$self->section('Ruby', 'ruby.html', '', 'languages/ruby'),
		$self->section('miniperl', 'miniperl.html', '', 'languages/miniperl'),
		$self->section('Befunge', 'befunge.html', '', 'languages/befunge'),
		$self->section('BF', 'bf.html', '', 'languages/bf'),
		$self->section('Ook!', 'ook.html', '', 'languages/ook'),
		$self->section('PLOT', 'plot.html', '', 'languages/plot'),
		$self->section('Python', 'python.html', '', 'languages/python'),
		$self->section('Forth', 'forth.html', '', 'languages/forth'),
		$self->section('PASM', 'pasm.html', '', 'languages/parrot_compiler'),
	);
}

=back

=cut

1;
