#! perl -w
################################################################################
# TODO: Resolve copyright. See ADDITIONAL section at end of file.
# $Id$
################################################################################

=head1 NAME

build_tools/pbc2c.pl - Parrot byte code compiler

=head1 SYNOPSIS

    perl build_tools/pbc2c foo.pbc > foo.c

=head1 DESCRIPTION

Parse the Parrot PackFile listed on the command line, or from standard
input if no file is named, and turn it into a C implementation file.

=cut

################################################################################

use strict;

use lib 'lib';
use Parrot::Types;
use Parrot::PackFile;
use Parrot::PackFile::ConstTable;
use Parrot::OpsFile;
use Parrot::OpTrans::Compiled;
use Parrot::OpLib::core;
use Parrot::Config;
use Parrot::Key;

my $trans = Parrot::OpTrans::Compiled->new;

use Data::Dumper;
$Data::Dumper::Useqq  = 1;
$Data::Dumper::Terse  = 1;
$Data::Dumper::Indent = 0;

my $ops = new Parrot::OpsFile (split(' ', $PConfig{ops}));


#
# dump_const_table()
#

sub dump_const_table {
    my ($pf) = @_;

    my $count = $pf->const_table->const_count;

    if ($count < 1) {
	warn "Disassembling without opcode table fingerprint!";
	return;
    }

=for COMMENT
    die "Cannot compile (differing opcode table)!"
        if $pf->const_table->constant(0)->data ne $opcode_fingerprint;

=cut

    print "# Constants: $count entries\n";
    print "# ID  Flags    Encoding Type     Size     Data\n";

    my $constant_num = 0;

    foreach ($pf->const_table->constants) {
        printf("%04x: %08x %08x %08x %08x %s\n",
	    $constant_num, $_->flags, $_->encoding, $_->type,
            $_->size, $_->data);

	$constant_num++;
    }
}


#
# compile_byte_code()
#

my @args = ();

sub compile_byte_code {
    my ($pf, $file_name) = @_;
    my ($byte_code);
    my $pc;
    my $new_pc = 0;
    my $offset=0;
    my $op_code;
    my $op;
    my %leaders;
    my @pc_list;
    my @blocks;
    my %opcodes;

    print <<END_C;
#include "parrot/parrot.h"
#include "parrot/string.h"
END_C

    print $trans->defines;
    print $ops->preamble($trans);

    my $length = length($pf->byte_code);

    # First instruction in bytecode must be the leader of a block
    $leaders{$new_pc} = 1;

    # This loop tries to identify instructions that may be the target
    # of control flow changing opcodes including the possible targets of ret
    # opcodes
    while ($offset + sizeof('op') <= $length) {
	my ($src, $is_branch);

        $pc       = $new_pc;
	$op_code  = unpack "x$offset l", $pf->byte_code;
        $op       = $ops->op($op_code) || die "Can't find an op for opcode $op_code\n";
	$offset  += sizeof('op');
	push @pc_list, $pc;
	$opcodes{$pc}->{op} = $op;
        $new_pc   = $pc + $op->size;

        @args = ();

        foreach (1 .. scalar($op->arg_types) - 1) {
            die "$0: Premature end of bytecode in argument.\n"
                if ($offset + sizeof('op')) > $length;
            my $arg = unpack "x$offset l", $pf->byte_code;
            $offset += sizeof('op');
            push @args, $arg;
        }
	push @{$opcodes{$pc}->{args}}, @args;

        $src = $op->full_body();

	# The regexes here correspond to the rewriting rules for the various
	# forms of goto recognized by Parrot/OpsFile.pm and Parrot/Op.pm

	# absolute address goto
	while($src =~ /{{=(.*?)}}/g){
	    my $offset = $1;
	    $is_branch = 1;
	}
	# relative branch
	while($src =~ /{{(\-|\+)=(.*?)}}/g){
	    my $dir = $1;
	    my $forward_off = $2;

	    # Substitute constant branch values
	    if($forward_off =~ /\@(\d+)/){
		$forward_off = $args[$1 - 1]
		    if $op->arg_type($1) eq 'ic';
	    }

	    if($forward_off =~ /^-?\d+$/){
		$forward_off = -$forward_off if $dir eq '-';

		if($forward_off != $op->size){
		    $leaders{$forward_off + $pc} = 1;
		    $is_branch = 1;
		}
	    }
	    else {
		$is_branch = 1;
	    }
	}

	$leaders{$new_pc} = 1 if $is_branch;
    }

    my $enternative;

FINDENTERN:
    foreach my $cur_op (@$Parrot::OpLib::core::ops) {
	if($cur_op->full_name eq 'enternative'){
	    $enternative = pack_op($cur_op->code);
	    last FINDENTERN;
	}
    }
    die "Could not locate enternative op!\n" unless defined $enternative;

    # Copy original bytecode to edit it
    $byte_code = $pf->byte_code;

    # First block
    push @blocks, [shift @pc_list ];

    # change instructions at block leaders to enternative calls
    substr($byte_code, 0, sizeof('op')) = $enternative;

    while (@pc_list) {
	my $instr_pc = shift @pc_list;
	# block leader found, start new block
	if(exists $leaders{$instr_pc}) {
	    #substr($byte_code, $instr_pc, sizeof('op')) = $enternative;
	    push @blocks, [$instr_pc ];
	}
	else {
	    push @{$blocks[-1]}, $instr_pc;
	}
    }

    print<<END_C;
static opcode_t* run_compiled(struct Parrot_Interp *interpreter, opcode_t *cur_opcode, opcode_t *start_code);

#include "parrot/embed.h"

static char program_code[] = {
END_C

    $pf->byte_code($byte_code);

    # this is now packed PBC
    $byte_code = $pf->pack();

    $offset = 0;
    while($offset < length($byte_code)){
	print join(',', unpack("c*", substr($byte_code, $offset, 20)));
	print ",\n";
	$offset += 20;
    }
    print "};";

    print <<'END_C';

int
main(int argc, char **argv) {
    int dummy_var;
    struct Parrot_Interp *     interpreter;
    struct PackFile *          pf;
    INTVAL i;
    PMC *userargv;

    interpreter = Parrot_new();
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter, (void*) &dummy_var);

    run_native = run_compiled;
    /* TODO make also a shared variant of PackFile_new */
    pf          = PackFile_new(0);

    if( !PackFile_unpack(interpreter, pf, (opcode_t *)program_code,
			    sizeof(program_code)) ) {
	printf( "Can't unpack.\n" );
	return 1;
    }
    Parrot_loadbc(interpreter, pf);

    /* setup P0, stolen from embed.c */
    userargv = pmc_new(interpreter, enum_class_PerlArray);
    /* immediately anchor pmc to root set */
    interpreter->pmc_reg.registers[0] = userargv;

    for (i = 0; i < argc; i++) {
        /* Run through argv, adding everything to @ARGS. */
        STRING *arg = string_make(interpreter, argv[i], strlen(argv[i]),
                                  0, PObj_external_FLAG, 0);

        if (Interp_flags_TEST(interpreter, PARROT_DEBUG_FLAG)) {
            fprintf(stderr, "\t" INTVAL_FMT ": %s\n", i, argv[i]);
        }

        userargv->vtable->push_string(interpreter, userargv, arg);
    }

    runops(interpreter, 0);
/*
    run_compiled(interpreter, (opcode_t *)program_code, (opcode_t *)program_code);
    */
    exit(0);
}

static opcode_t* run_compiled(struct Parrot_Interp *interpreter, opcode_t *cur_opcode, opcode_t *start_code){

switch_label:
    switch(cur_opcode - start_code) {

END_C


    foreach my $cur_blk (@blocks) {
	printf "case %d: PC_%d: {\n", $cur_blk->[0], $cur_blk->[0];

	foreach $pc (@{$cur_blk}) {
	    $op = $opcodes{$pc}->{op};
	    $trans->pc($pc);
	    $trans->args(@{$opcodes{$pc}->{args}});
	    my $source = $op->source($trans);

	    $new_pc = $pc + $op->size;
	    $source =~ s/^\s*goto PC_$new_pc;\s*$//mg if defined($new_pc);
	    $source =~ s/\n/\n    /mg;
	    $source =~ s/#line.*\n//mg;
	    $source =~ s/CUR_OPCODE/(start_code + $pc)/mg;

	    printf("\n    /* %s */\n    {\n%s}\n", $op->full_name, $source);
	}

	print "}\n\n";
    }
    print <<END_C;
    break;

default:
    return cur_opcode;
}
    return(0);
}
END_C

    return 0;
}


#
# compile_file()
#

sub compile_file {
    my ($file_name) = @_;

    my $pf = Parrot::PackFile->new;
    $pf->unpack_file($file_name)
      or die "Unable to unpack file $file_name: $!";

#    dump_const_table($pf);
    compile_byte_code($pf, $file_name);

    undef $pf;

    return;
}

#
# MAIN PROGRAM:
#

@ARGV = qw(-) unless @ARGV;

foreach (@ARGV) {
    compile_file($_)
}

exit 0;

__END__

=begin ADDITIONAL

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

Copyright (C) 2001-2002 The Parrot Team. All rights reserved.
This program is free software. It is subject to the same license
as the Parrot interpreter.

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter.

=end ADDITIONAL