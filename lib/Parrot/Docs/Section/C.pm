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
		$self->group('General', '',
			$self->item('', 'src/parrot.c'),
			$self->item('', 'include/parrot/parrot.h'),
			$self->item('', 'src/warnings.c', 'include/parrot/warnings.h'),
			$self->item('', 'src/longopt.c', 'include/parrot/longopt.h'),
		),
		$self->group('Interpreter', '',
			$self->item('', 'src/embed.c', 'include/parrot/embed.h'),
			$self->item('', 'src/global_setup.c', 
				'include/parrot/global_setup.h'),
			$self->item('', 'src/interpreter.c', 'include/parrot/interpreter.h', 
				'include/parrot/interp_guts.h'),
			$self->item('', 'src/exit.c', 'include/parrot/exit.h'),
		),
		$self->group('Registers and Stacks', '',
			$self->item('', 'src/register.c', 'include/parrot/register.h', 
				'include/parrot/regfuncs.h'),
			$self->item('', 'src/stacks.c', 'include/parrot/stacks.h'),
			$self->item('', 'include/parrot/enums.h'),
		),
		$self->group('Ops', '',
			$self->item('', 'src/runops_cores.c', 
				'include/parrot/runops_cores.h'),
			$self->item('', 'include/parrot/op.h'),
			$self->item('', 'include/parrot/oplib.h'),
		),
		$self->group('Bytecode', '',
			$self->item('', 'src/packfile.c', 'include/parrot/packfile.h',
				'src/packdump.c', 'src/packout.c', 'src/pdump.c', 
				'pf/pf_items.c'),
			$self->item('', 'src/byteorder.c'),
		),
		$self->group('Data Types', '',
			$self->item('', 'src/datatypes.c', 'include/parrot/datatypes.h'),
			$self->item('', 'src/hash.c', 'include/parrot/hash.h'),
			$self->item('', 'src/intlist.c', 'include/parrot/intlist.h'),
			$self->item('', 'src/list.c', 'include/parrot/list.h'),
		),
		$self->group('PMCs', '',
			$self->item('', 'src/pmc.c', 'include/parrot/pmc.h'),
			$self->item('', 'include/parrot/vtable.h'),
			$self->item('', 'src/key.c', 'include/parrot/key.h'),
			$self->item('', 'src/sub.c', 'include/parrot/sub.h'),
			$self->item('', 'src/method_util.c', 'include/parrot/method_util.h'),
			$self->item('', 'include/parrot/pobj.h'),
			$self->item('', 'include/parrot/perltypes.h'),
			$self->item('', 'src/pmc_freeze.c', 'include/parrot/pmc_freeze.h'),
		),
		$self->group('Objects', '',
			$self->item('', 'src/objects.c', 'include/parrot/objects.h'),
		),
		$self->group('Strings', '',
			$self->item('', 'src/chartype.c', 'include/parrot/chartype.h',
				'chartypes'),
			$self->item('', 'src/string.c', 'include/parrot/string.h',
				'include/parrot/string_funcs.h'),
			$self->item('', 'src/encoding.c', 'include/parrot/encoding.h',
				'encodings'),
			$self->item('', 'include/parrot/unicode.h'),
			$self->item('', 'src/misc.c', 'include/parrot/misc.h',
				'src/spf_render.c', 'src/spf_vtable.c', 'src/utils.c'),
		),
		$self->group('Multi-methods', '',
			$self->item('', 'src/mmd.c', 'include/parrot/mmd.h'),
		),
		$self->group('Extensions', '',
			$self->item('', 'src/extend.c', 'include/parrot/extend.h'),
		),
		$self->group('NCI', '',
			$self->item('', 'src/nci.c', 'include/parrot/nci.h'),
		),
		$self->group('JIT', '',
			$self->item('', 'src/jit.c', 'include/parrot/jit.h',
				'src/jit_debug.c', 'src/jit_debug_xcoff.c'),
		),
		$self->group('Exec', '',
			$self->item('', 'src/exec.c', 'include/parrot/exec.h',
				'src/exec_save.c', 'include/parrot/exec_save.h', 
				'src/exec_start.c'),
		),
		$self->group('IO', '',
			$self->item('', 'include/parrot/io.h', 'io'),
		),
		$self->group('Threads', '',
			$self->item('', 'src/thread.c', 'include/parrot/thread.h'),
			$self->item('', 'include/parrot/thr_pthread.h'),
			$self->item('', 'src/tsq.c', 'include/parrot/tsq.h'),
		),
		$self->group('Regular Expressions', '',
			$self->item('', 'src/rx.c', 'include/parrot/rx.h',
				'src/rxstacks.c', 'include/parrot/rxstacks.h'),
		),
		$self->group('Exceptions', '',
			$self->item('', 'src/exceptions.c', 'include/parrot/exceptions.h'),
			$self->item('', 'src/events.c', 'include/parrot/events.h'),
		),
		$self->group('Memory', '',
			$self->item('', 'src/memory.c', 'include/parrot/memory.h'),
			$self->item('', 'src/malloc.c'),
			$self->item('', 'src/malloc-trace.c'),
			$self->item('', 'src/resources.c', 'include/parrot/resources.h',
				'src/res_lea.c'),
			$self->item('', 'src/smallobject.c', 'include/parrot/smallobject.h'),
			$self->item('', 'src/headers.c', 'include/parrot/headers.h'),
		),
		$self->group('Garbage Collection', '',
			$self->item('', 'src/dod.c', 'include/parrot/dod.h'),
			$self->item('', 'src/cpu_dep.c'),
		),
		$self->group('Debugging', '',
			$self->item('', 'src/debug.c', 'include/parrot/debug.h',
				'src/pdb.c'),
			$self->item('', 'src/disassemble.c'),
			$self->item('', 'src/trace.c', 'include/parrot/trace.h'),
			$self->item('', 'src/test_main.c'),
		),
	);
}

=back

=cut

1;