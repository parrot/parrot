# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Docs::Section::C - C source code docmentation section

=head1 SYNOPSIS

	use Parrot::Docs::Section::C;
	
	my $section = Parrot::Docs::Section::C->new;

=head1 DESCRIPTION

A documentation section describing all the C source code in Parrot.

=head2 Methods

=over

=cut

package Parrot::Docs::Section::C;

use strict;

use Parrot::Docs::Section;
@Parrot::Docs::Section::C::ISA = qw(Parrot::Docs::Section);

use Parrot::Distribution;

=item C<header_item($text, @names)>

Returns a C header files documentation item.

=cut

sub c_header_item
{
	my $self = shift;
	
	return $self->c_item(shift, 'headers' => [@_]);
}

=item C<c_source_item($text, @names)>

Returns a C source files documentation item.

=cut

sub c_source_item
{
	my $self = shift;

	return $self->c_item(shift, 'sources' => [@_]);
}

=item C<c_pair_item($text, $name)>

Returns a new C source and header file documentation item.

=cut

sub c_pair_item
{
	my $self = shift;
	
	return $self->c_item(shift, 'pairs' => [@_]);
}

=item C<c_item($text, %contents)>

Returns a new C source and/or header files documentation item. Recognized keys
for C<%contents> are C<pairs>, C<sources>, C<headers> and C<contents>.

=cut

sub c_item
{
	my $self = shift;
	my $text = shift;
	my %contents = @_;
	my @contents = ();
	my $dist = Parrot::Distribution->new;
	
	if ( exists $contents{'pairs'} )
	{
		foreach my $name (@{$contents{'pairs'}})
		{
			push @contents,
				$dist->relative_path($dist->c_source_file_with_name($name)), 
				$dist->relative_path($dist->c_header_file_with_name($name));
		}
	}
	
	if ( exists $contents{'sources'} )
	{
		foreach my $name (@{$contents{'sources'}})
		{
			push @contents,
				$dist->relative_path($dist->c_source_file_with_name($name));
		}
	}
	
	if ( exists $contents{'headers'} )
	{
		foreach my $name (@{$contents{'headers'}})
		{
			push @contents,
				$dist->relative_path($dist->c_header_file_with_name($name));
		}
	}
	
	if ( exists $contents{'contents'} )
	{
		push @contents, @{$contents{'contents'}};
	}
	
	return $self->new_item($text, grep {defined} @contents);
}

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'C', 'c.html', '',
		$self->new_group(
			'General', 
			'',
			$self->c_source_item('This file is unused.', 'parrot'),
			$self->c_header_item('', 'parrot'),
			$self->c_pair_item('', 'warnings'),
			$self->c_pair_item('', 'longopt'),
		),
		$self->new_group(
			'Interpreter', 
			'',
			$self->c_pair_item('', 'embed'),
			$self->c_pair_item('', 'global_setup'),
			$self->c_item(
				'', 
				'pairs' => ['interpreter'], 
				'headers' => ['interp_guts']
			),
			$self->c_pair_item('', 'exit'),
		),
		$self->new_group(
			'Registers and Stacks', 
			'',
			$self->c_item(
				'', 
				'pairs' => ['register'], 
				'headers' => ['regfuncs']
			),
			$self->c_pair_item('', 'stacks'),
			$self->c_header_item('', 'enums'),
		),
		$self->new_group(
			'Ops', 
			'',
			$self->c_pair_item('', 'runops_cores'),
			$self->c_header_item('', 'op'),
			$self->c_header_item('', 'oplib'),
		),
		$self->new_group(
			'Bytecode', 
			'',
			$self->c_item(
				'Parrot Packfile API and utilities.', 
				'pairs' => ['packfile'],
				'sources' => ['packdump', 'packout', 'pdump', 'pf_items']
			),
			$self->c_source_item('', 'byteorder'),
		),
		$self->new_group(
			'Data Types',
			'',
			$self->c_pair_item('', 'datatypes'),
			$self->c_pair_item('', 'hash'),
			$self->c_pair_item('', 'intlist'),
			$self->c_pair_item('', 'list'),
		),
		$self->new_group(
			'PMCs', 
			'',
			$self->c_pair_item('', 'pmc'),
			$self->c_header_item('', 'vtable'),
			$self->c_pair_item('', 'key'),
			$self->c_pair_item('', 'sub'),
			$self->c_pair_item('', 'method_util'),
			$self->c_header_item('', 'pobj'),
			$self->c_header_item('', 'perltypes'),
			$self->c_pair_item('', 'pmc_freeze'),
		),
		$self->new_group(
			'Objects', 
			'',
			$self->c_pair_item('', 'objects'),
		),
		$self->new_group(
			'Strings', 
			'',
			$self->c_item(
				'String character types', 
				'pairs' => ['chartype'],
				'contents' => ['chartypes']
			),
			$self->c_item(
				'', 
				'pairs' => ['string'],
				'headers' => ['string_funcs']
			),
			$self->c_item(
				'String encodings', 
				'pairs' => ['encoding'],
				'contents' => ['encodings']
			),
			$self->c_header_item('', 'unicode'),
			$self->c_item(
				'Miscellaneous, <code>sprintf</code> and utility functions.', 
				'pairs' => ['misc'],
				'sources' => ['spf_render', 'spf_vtable', 'utils']
			),
		),
		$self->new_group(
			'Multi-methods', 
			'',
			$self->c_pair_item('', 'mmd'),
		),
		$self->new_group(
			'Extensions', 
			'',
			$self->c_pair_item('', 'extend'),
		),
		$self->new_group(
			'NCI', 
			'',
			$self->c_pair_item('', 'nci'),
		),
		$self->new_group(
			'JIT', 
			'',
			$self->c_item(
				'Parrot\'s JIT subsystem, with support for stabs files.', 
				'pairs' => ['jit'],
				'sources' => ['jit_debug', 'jit_debug_xcoff']
			),
		),
		$self->new_group(
			'Exec', 
			'',
			$self->c_item(
				'Parrot\'s native executable subsystem.', 
				'pairs' => ['exec', 'exec_save'],
				'sources' => ['exec_start']
			),
		),
		$self->new_group(
			'IO', 
			'',
			$self->c_item(
				'Parrot\'s layer-based I/O subsystem.', 
				'headers' => ['io'], 
				'contents' => ['io']
			),
		),
		$self->new_group(
			'Threads',
			'',
			$self->c_pair_item('', 'thread'),
			$self->c_header_item('', 'thr_pthread'),
			$self->c_pair_item('', 'tsq'),
		),
		$self->new_group(
			'Regular Expressions', 
			'',
			$self->c_pair_item('Regular expression support.', 'rx', 'rxstacks'),
		),
		$self->new_group(
			'Exceptions',
			'',
			$self->c_pair_item('', 'exceptions'),
			$self->c_pair_item('', 'events'),
		),
		$self->new_group(
			'Memory', 
			'',
			$self->c_pair_item('', 'memory'),
			$self->c_source_item('', 'malloc'),
			$self->c_source_item('', 'malloc-trace'),
			$self->c_item(
				'', 
				'pairs' => ['resources'], 
				'sources' => ['res_lea']
			),
			$self->c_pair_item('', 'smallobject'),
			$self->c_pair_item('', 'headers'),
		),
		$self->new_group(
			'Garbage Collection', 
			'',
			$self->c_pair_item('', 'dod'),
			$self->c_source_item('', 'cpu_dep'),
		),
		$self->new_group(
			'Debugging', 
			'',
			$self->c_item(
				'', 
				'pairs' => ['debug'], 
				'sources' => ['pdb']
			),
			$self->c_source_item('', 'disassemble'),
			$self->c_pair_item('', 'trace'),
			$self->c_source_item('', 'test_main'),
		),
	);
}

=back

=cut

1;