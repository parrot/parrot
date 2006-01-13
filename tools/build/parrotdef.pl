#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.

=head1 NAME

tools/build/parrotdef.pl - Create a DEF file from Parrot headers

=head1 SYNOPSIS

	% perl tools/build/parrotdef.pl

=head1 DESCRIPTION

This script creates a DEF file for use with the Microsoft Linker that
names all functions to export from parrot.exe that may be called from
dynamic PMCs. It looks at header files to build its list.

=cut

use strict;

# This is a list of symbols we'll export 
my @funcnames = qw(
	line
	imc_cleanup
	imc_compile_all_units
	imc_compile_all_units_for_ast
	IMCC_ast_compile
	emit_open
	IMCC_push_parser_state
	PackFile_new
	IMCC_info
	Parrot_set_run_core
	Parrot_exit
	IMCC_fatal
	IMCC_ast_init
	imcc_init
	Parrot_get_runtime_prefix
	longopt_get
	Parrot_config_revision
	Parrot_revision
	Parrot_set_config_hash_internal
	yyin
	yydebug
	yylex
	yyparse
);
push @funcnames, "PMCNULL	DATA";
push @funcnames, "Parrot_base_vtables	DATA";

# Emit a .def file.
open FILE, "> parrot.def";
print FILE "EXPORTS\n";
print FILE "\t$_\n" foreach @funcnames;
close FILE;

