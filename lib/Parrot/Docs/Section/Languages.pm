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
		# $self->item('', 'languages/LANGUAGES.STATUS'),
		$self->section('Perl6', 'perl6.html', '',
			$self->item('', 'languages/perl6'),
		),
		$self->section('Jako', 'jako.html', '',
			$self->item('', 'languages/jako'),
		),
		$self->section('M4', 'languages/m4.html', '',
			$self->item('', 'languages/m4'),
		),
		$self->section('BASIC', 'basic.html', '',
			$self->section('BASIC Interpreter', 'basic_interpreter.html', '',
				$self->item('', 'languages/BASIC/interpreter'),
			),
			$self->section('BASIC Compiler', 'basic_compiler.html', '',
				$self->item('', 'languages/BASIC/compiler'),
			),
		),
		$self->section('Regex', 'regex.html', '',
			$self->item('', 'languages/regex'),
		),
		$self->section('TCL', 'tcl.html', '',
			$self->item('', 'languages/tcl'),
		),
		$self->section('Cola', 'cola.html', '',
			$self->item('', 'languages/cola'),
		),
		$self->section('Scheme', 'scheme.html', '',
			$self->item('', 'languages/scheme'),
		),
		$self->section('URM', 'urm.html', '',
			$self->item('', 'languages/urm'),
		),
		$self->section('Ruby', 'ruby.html', '',
			$self->item('', 'languages/ruby'),
		),
		$self->section('miniperl', 'miniperl.html', '',
			$self->item('', 'languages/miniperl'),
		),
		$self->section('Befunge', 'befunge.html', '',
			$self->item('', 'languages/befunge'),
		),
		$self->section('BF', 'bf.html', '',
			$self->item('', 'languages/bf'),
		),
		$self->section('Ook!', 'ook.html', '',
			$self->item('', 'languages/ook'),
		),
		$self->section('PLOT', 'plot.html', '',
			$self->item('', 'languages/plot'),
		),
		$self->section('Python', 'python.html', '',
			$self->item('', 'languages/python'),
		),
		$self->section('Forth', 'forth.html', '',
			$self->item('', 'languages/forth'),
		),
		$self->section('PASM', 'pasm.html', '',
			$self->item('', 'languages/parrot_compiler'),
		),
	);
}

=back

=cut

1;
