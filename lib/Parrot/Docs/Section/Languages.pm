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
		$self->new_item('', 'languages/LANGUAGES.STATUS'),
		$self->new_section('Perl6', 'perl6.html', '', 'languages/perl6'),
		$self->new_section('Jako', 'jako.html', '', 'languages/jako'),
		$self->new_section('M4', 'm4.html', '', 'languages/m4'),
		$self->new_section('BASIC', 'basic.html', '',
			$self->new_section('BASIC Interpreter', 'basic_interpreter.html', 
				'', 'languages/BASIC/interpreter'),
			$self->new_section('BASIC Compiler', 'basic_compiler.html', 
				'', 'languages/BASIC/compiler'),
		),
		$self->new_section('Regex', 'regex.html', '', 'languages/regex'),
		$self->new_section('Cola', 'cola.html', '', 'languages/cola'),
		$self->new_section('TCL', 'tcl.html', '', 'languages/tcl'),
		$self->new_section('Scheme', 'scheme.html', '', 'languages/scheme'),
		$self->new_section('URM', 'urm.html', '', 'languages/urm'),
		$self->new_section('Ruby', 'ruby.html', '', 'languages/ruby'),
		$self->new_section('Language Conversion', 'conversion.html', '', 
			'languages/converter.pl', 'languages/conversion'),
		$self->new_section('miniperl', 'miniperl.html', '', 'languages/miniperl'),
		$self->new_section('Befunge', 'befunge.html', '', 'languages/befunge'),
		$self->new_section('Forth', 'forth.html', '', 'languages/forth'),
		$self->new_section('BF', 'bf.html', '', 'languages/bf'),
		$self->new_section('Ook!', 'ook.html', '', 'languages/ook'),
		$self->new_section('Python', 'python.html', '', 'languages/python'),
		$self->new_section('PASM', 'pasm.html', '', 'languages/parrot_compiler'),
	);
}

=back

=cut

1;
