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

=item C<new()>

Returns a new section.

=cut

sub new
{
	my $self = shift;
	
	return $self->SUPER::new(
		'C', 'c.html', '',
		$self->new_group('General', '',
			$self->new_item('', 'src/parrot.c'),
			$self->new_item('', 'include/parrot/parrot.h'),
			$self->new_item('', 'src/warnings.c', 'include/parrot/warnings.h'),
			$self->new_item('', 'src/longopt.c', 'include/parrot/longopt.h'),
		),
		$self->new_group('Interpreter', '',
			$self->new_item('', 'src/embed.c', 'include/parrot/embed.h'),
			$self->new_item('', 'src/global_setup.c', 
				'include/parrot/global_setup.h'),
			$self->new_item('', 'src/interpreter.c', 'include/parrot/interpreter.h', 
				'include/parrot/interp_guts.h'),
			$self->new_item('', 'src/exit.c', 'include/parrot/exit.h'),
		),
		$self->new_group('Registers and Stacks', '',
			$self->new_item('', 'src/register.c', 'include/parrot/register.h', 
				'include/parrot/regfuncs.h'),
			$self->new_item('', 'src/stacks.c', 'include/parrot/stacks.h'),
			$self->new_item('', 'include/parrot/enums.h'),
		),
		$self->new_group('Ops', '',
			$self->new_item('', 'src/runops_cores.c', 
				'include/parrot/runops_cores.h'),
			$self->new_item('', 'include/parrot/op.h'),
			$self->new_item('', 'include/parrot/oplib.h'),
		),
		$self->new_group('Bytecode', '',
			$self->new_item('', 'src/packfile.c', 'include/parrot/packfile.h',
				'src/packdump.c', 'src/packout.c', 'src/pdump.c', 
				'pf/pf_items.c'),
			$self->new_item('', 'src/byteorder.c'),
		),
		$self->new_group('Data Types', '',
			$self->new_item('', 'src/datatypes.c', 'include/parrot/datatypes.h'),
			$self->new_item('', 'src/hash.c', 'include/parrot/hash.h'),
			$self->new_item('', 'src/intlist.c', 'include/parrot/intlist.h'),
			$self->new_item('', 'src/list.c', 'include/parrot/list.h'),
		),
		$self->new_group('PMCs', '',
			$self->new_item('', 'src/pmc.c', 'include/parrot/pmc.h'),
			$self->new_item('', 'include/parrot/vtable.h'),
			$self->new_item('', 'src/key.c', 'include/parrot/key.h'),
			$self->new_item('', 'src/sub.c', 'include/parrot/sub.h'),
			$self->new_item('', 'src/method_util.c', 'include/parrot/method_util.h'),
			$self->new_item('', 'include/parrot/pobj.h'),
			$self->new_item('', 'include/parrot/perltypes.h'),
			$self->new_item('', 'src/pmc_freeze.c', 'include/parrot/pmc_freeze.h'),
		),
		$self->new_group('Objects', '',
			$self->new_item('', 'src/objects.c', 'include/parrot/objects.h'),
		),
		$self->new_group('Strings', '',
			$self->new_item('', 'src/chartype.c', 'include/parrot/chartype.h',
				'chartypes'),
			$self->new_item('', 'src/string.c', 'include/parrot/string.h',
				'include/parrot/string_funcs.h'),
			$self->new_item('', 'src/encoding.c', 'include/parrot/encoding.h',
				'encodings'),
			$self->new_item('', 'include/parrot/unicode.h'),
			$self->new_item('', 'src/misc.c', 'include/parrot/misc.h',
				'src/spf_render.c', 'src/spf_vtable.c', 'src/utils.c'),
		),
		$self->new_group('Multi-methods', '',
			$self->new_item('', 'src/mmd.c', 'include/parrot/mmd.h'),
		),
		$self->new_group('Extensions', '',
			$self->new_item('', 'src/extend.c', 'include/parrot/extend.h'),
		),
		$self->new_group('NCI', '',
			$self->new_item('', 'src/nci.c', 'include/parrot/nci.h'),
		),
		$self->new_group('JIT', '',
			$self->new_item('', 'src/jit.c', 'include/parrot/jit.h',
				'src/jit_debug.c', 'src/jit_debug_xcoff.c'),
		),
		$self->new_group('Exec', '',
			$self->new_item('', 'src/exec.c', 'include/parrot/exec.h',
				'src/exec_save.c', 'include/parrot/exec_save.h', 
				'src/exec_start.c'),
		),
		$self->new_group('IO', '',
			$self->new_item('', 'include/parrot/io.h', 'io'),
		),
		$self->new_group('Threads', '',
			$self->new_item('', 'src/thread.c', 'include/parrot/thread.h'),
			$self->new_item('', 'include/parrot/thr_pthread.h'),
			$self->new_item('', 'src/tsq.c', 'include/parrot/tsq.h'),
		),
		$self->new_group('Regular Expressions', '',
			$self->new_item('', 'src/rx.c', 'include/parrot/rx.h',
				'src/rxstacks.c', 'include/parrot/rxstacks.h'),
		),
		$self->new_group('Exceptions', '',
			$self->new_item('', 'src/exceptions.c', 'include/parrot/exceptions.h'),
			$self->new_item('', 'src/events.c', 'include/parrot/events.h'),
		),
		$self->new_group('Memory', '',
			$self->new_item('', 'src/memory.c', 'include/parrot/memory.h'),
			$self->new_item('', 'src/malloc.c'),
			$self->new_item('', 'src/malloc-trace.c'),
			$self->new_item('', 'src/resources.c', 'include/parrot/resources.h',
				'src/res_lea.c'),
			$self->new_item('', 'src/smallobject.c', 'include/parrot/smallobject.h'),
			$self->new_item('', 'src/headers.c', 'include/parrot/headers.h'),
		),
		$self->new_group('Garbage Collection', '',
			$self->new_item('', 'src/dod.c', 'include/parrot/dod.h'),
			$self->new_item('', 'src/cpu_dep.c'),
		),
		$self->new_group('Debugging', '',
			$self->new_item('', 'src/debug.c', 'include/parrot/debug.h',
				'src/pdb.c'),
			$self->new_item('', 'src/disassemble.c'),
			$self->new_item('', 'src/trace.c', 'include/parrot/trace.h'),
			$self->new_item('', 'src/test_main.c'),
		),
	);
}

=back

=cut

1;