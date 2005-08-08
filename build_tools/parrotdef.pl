#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.

=head1 NAME

build_tools/parrotdef.pl - Create a DEF file from Parrot headers

=head1 SYNOPSIS

	% perl build_tools/parrotdef.pl

=head1 DESCRIPTION

This script creates a DEF file for use with the Microsoft Linker that
names all functions to export from parrot.exe that may be called from
dynamic PMCs. It looks at header files to build its list.

=cut

use strict;

# This is a list of symbols we'll export 
my @funcnames = qw(
	Parrot_new
	Parrot_init
	Parrot_setwarnings
	Parrot_readbc
	Parrot_loadbc
	Parrot_runcode
	Parrot_destroy
	Parrot_debug
	Parrot_disassemble
	Parrot_load_bytecode
	Parrot_load_lib
	pmc_new
	pmc_reuse
	pmc_new_noinit
	pmc_new_init
	constant_pmc_new_noinit
	constant_pmc_new
	constant_pmc_new_init
	pmc_register
	pmc_type
	dod_register_pmc
	dod_unregister_pmc
	Parrot_create_mro
	Parrot_new_vtable
	Parrot_clone_vtable
	Parrot_destroy_vtable
	Parrot_vtable_set_type
	Parrot_vtable_set_name
	Parrot_vtable_set_data
	internal_exception
	real_exception
	do_panic
	push_exception
	pop_exception
	throw_exception
	rethrow_exception
	handle_exception
	new_c_exception_handler
	push_new_c_exception_handler
	rethrow_c_exception
	do_exception
	new_internal_exception
	free_internal_exception
	Parrot_push_mark
	Parrot_pop_mark
	Parrot_push_action
	string_make
	string_concat
	string_append
	string_chopn
	string_compare
	string_equal
	string_bool
	string_increment
	string_length
	string_ord
	string_chr
	string_to_num
	string_to_int
	string_from_int
	string_from_num
	string_grow
	string_make_direct
	string_copy
	string_set
	string_init
	string_deinit
	string_capacity
	string_index
	string_from_cstring
	string_from_const_cstring
	const_string
	string_to_cstring
	string_cstring_free
	string_hash
	string_upcase
	string_downcase
	string_titlecase
	string_upcase_inplace
	string_downcase_inplace
	string_titlecase_inplace
	string_substr
	string_str_index
	Parrot_string_is_cclass
	Parrot_string_find_cclass
	Parrot_string_find_not_cclass
	Parrot_string_is_whitespace
	Parrot_string_is_digit
	Parrot_string_is_wordchar
	Parrot_string_is_punctuation
	Parrot_string_is_newline
	Parrot_string_find_whitespace
	Parrot_string_find_digit
	Parrot_string_find_wordchar
	Parrot_string_find_punctuation
	Parrot_string_find_newline
	Parrot_string_find_word_boundary
	Parrot_binary_charset_ptr
	list_pmc_new
	list_pmc_new_init
	list_mark
	list_visit
	list_length
	list_set_length
	list_push
	list_unshift
	list_insert
	list_delete
	list_get
	list_assign
	list_splice
	new_hash
	hash_destroy
	new_pmc_hash
	new_cstring_hash
	Parrot_new_INTVAL_hash
	hash_clone
	hash_size
	hash_destroy
	hash_get_bucket
	hash_get
	hash_exists
	hash_put
	hash_delete
	mark_hash
	hash_visit
	dump_hash
	hash_get_idx
	new_pmc_hash_x
	mmd_dispatch_v_pp
	mmd_dispatch_v_pi
	mmd_dispatch_v_pn
	mmd_dispatch_v_ps
	mmd_dispatch_p_ppp
	mmd_dispatch_p_pip
	mmd_dispatch_p_pnp
	mmd_dispatch_p_psp
	mmd_dispatch_i_pp
	mmd_add_by_class
	mmd_register
	mmd_register_sub
	mmd_add_function
	mmd_destroy
	mmd_vtfind
	Parrot_mmd_register_table
	Parrot_mmd_rebuild_table
	Parrot_MMD_search_default_func
	Parrot_run_maybe_mmd_meth
	Parrot_MMD_method_idx
	get_mmd_dispatch_type
	mem_sys_allocate
	mem_sys_allocate_zeroed
	mem_sys_free
	Parrot_char_is_alnum
	Parrot_char_is_alpha
	Parrot_char_is_ascii
	Parrot_char_is_blank
	Parrot_char_is_cntrl
	Parrot_char_is_digit
	Parrot_char_is_graph
	Parrot_char_is_lower
	Parrot_char_is_print
	Parrot_char_is_punct
	Parrot_char_is_space
	Parrot_char_is_UWhiteSpace
	Parrot_char_is_Whitespace
	Parrot_char_is_upper
	Parrot_char_is_JavaSpaceChar
	Parrot_char_is_xdigit
	key_new
	key_new_integer
	key_new_number
	key_new_string
	key_new_cstring
	key_new_pmc
	key_set_integer
	key_set_number
	key_set_string
	key_set_pmc
	key_type
	key_integer
	key_number
	key_string
	key_pmc
	key_next
	key_append
	key_mark
	new_register_frame
	save_context
	swap_context
	restore_context
	mark_context
	copy_regs
	mark_reg_stack
	invalidate_retc_context
	add_to_retc_cache
	mark_retc_cache
	Parrot_full_sub_name
	Parrot_Context_info
	Parrot_Context_infostr
	interpinfo
	interpinfo_p
	runops
	runops_int
	Parrot_runops_fromc
	Parrot_runops_fromc_args
	Parrot_runops_fromc_args_reti
	Parrot_runops_fromc_args_retf
	Parrot_runops_fromc_arglist
	Parrot_runops_fromc_arglist_reti
	Parrot_runops_fromc_arglist_retf
	Parrot_run_meth_fromc
	Parrot_run_meth_fromc_arglist
	Parrot_run_meth_fromc_arglist_reti
	Parrot_run_meth_fromc_arglist_retf
	Parrot_compreg
	scratchpad_new
	scratchpad_store
	scratchpad_find
	scratchpad_store_by_name
	scratchpad_store_by_index
	scratchpad_get_current
	lexicals_mark
      scratchpad_delete
	Parrot_register_HLL
	Parrot_register_HLL_type
	Parrot_get_HLL_id
	Parrot_get_HLL_type
	Parrot_get_ctx_HLL_type
	PIO_fprintf
	PIO_printf
	PIO_eprintf
	Parrot_sprintf_c
	Parrot_psprintf
	enter_nci_method
	Parrot_find_global
	pobject_lives
	stack_push
	Parrot_signbit
	new_ret_continuation_pmc
	Parrot_PMC_typenum
	Parrot_call_sub
	Parrot_get_global
	string_make_empty
	Parrot_PMC_get_intval
	Parrot_call_method
	string_replace
	Parrot_make_COW_reference
);
push @funcnames, "PMCNULL	DATA";
push @funcnames, "Parrot_base_vtables	DATA";

# Extract function names from PMC header files and the core ops file.
my $hfile;
foreach $hfile ((glob "classes/*.h"), "include/parrot/oplib/core_ops.h") {
	open FILE, "< $hfile" or die "Can't open $hfile: $!";
	while (<FILE>) {
		if (/^(?:extern\s+)?\w+\*?\s+\*?(\w+)\s*\([^)]+\)\s*;/) {
			my $func = $1;
			next if $func =~ /_class_init$/;
			push @funcnames, $func;
		}
	}
	close FILE;
}

# Remove dupes, if we have any.
my %seen;
@funcnames = grep { ! $seen{$_}++ } @funcnames;

# Emit a .def file.
open FILE, "> parrot.def";
print FILE "EXPORTS\n";
print FILE "\t$_\n" foreach @funcnames;
close FILE;

