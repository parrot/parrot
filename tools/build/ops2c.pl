#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

tools/build/ops2c.pl - Parser for .ops files

=head1 SYNOPSIS

    % perl tools/build/ops2c.pl trans [--help] [--no-lines] [--dynamic]
                                      [--core | input.ops [input2.ops ...]]
       trans := C | CGoto | CGP | CSwitch | CPrederef

For example:

    % perl tools/build/ops2c.pl C --core

    % perl tools/build/ops2c.pl C --dynamic myops.ops

=head1 DESCRIPTION

This script uses a supplied transform to create a pair of C header and
implementation files from the operation definitions found in one or more
F<*.ops> files.

=head2 Transforms

The first command-line argument is the last package name component of a
subclass of C<Parrot::OpTrans>. These subclasses all have full names of
the form C<Parrot::OpTrans::*>. An instance of the class is created and
later consulted for various bits of information needed to generate the C
code. Each creates a different type of run loop.

=over

=item C<C>

Create the function-based (slow or fast core) run loop.

=item C<CGoto>

Create the C<goto> run loop.

=item C<CGP>

Create the C<goto> and predereferenced run loop.

=item C<CSwitch>

Create the C<switch>ed and predereferenced run loop.

=item C<CPrederef>

Create the predereferenced run loop.

=back

=head2 Options

=over 4

=item C<--help>

Print synopsis.

=item C<--dynamic>

Indicate that the opcode library is dynamic.

=item C<--core>

Build the Parrot core opcode library.

=item C<--no-lines>

Do not generate C<#line> directives in the generated C code.

=back

=head1 SEE ALSO

=over 4

=item F<tools/build/ops2pm.pl>

=item C<Parrot::OpsFile>

=item C<Parrot::Op>

=item C<Parrot::OpTrans>

=item C<Parrot::OpTrans::C>

=item C<Parrot::OpTrans::CGoto>

=item C<Parrot::OpTrans::Compiled>

=item C<Parrot::OpTrans::CGP>

=item C<Parrot::OpTrans::CSwitch>

=item C<Parrot::OpTrans::CPrederef>

=back

=cut

use warnings;
use strict;
use lib 'lib';

use Pod::Usage;
use Getopt::Long qw(:config permute);

use Parrot::OpsFile;
use Parrot::OpLib::core;
use Parrot::Config;

my %arg_dir_mapping = (
    ''   => 'PARROT_ARGDIR_IGNORED',
    'i'  => 'PARROT_ARGDIR_IN',
    'o'  => 'PARROT_ARGDIR_OUT',
    'io' => 'PARROT_ARGDIR_INOUT'
);

#
# Look at the command line options
#
sub Usage {
    pod2usage(-exitval => 1, -verbose => 0, -output => \*STDERR);
}

my ( $nolines_flag, $help_flag, $dynamic_flag, $core_flag );
GetOptions(
    "no-lines"      => \$nolines_flag,
    "help"          => \$help_flag,
    "dynamic|d"     => \$dynamic_flag,
    "core"          => \$core_flag,
) || Usage();

Usage() if $help_flag;
Usage() unless @ARGV;

my $class_name = shift @ARGV;
my %is_allowed = map { $_ => 1 } qw(C CGoto CGP CSwitch CPrederef);
Usage() unless $is_allowed{$class_name};
my $trans_class = "Parrot::OpTrans::" . $class_name;

eval "require $trans_class";

my $trans = $trans_class->new();

# Not used
my $prefix  = $trans->prefix();
my $suffix  = $trans->suffix();
# Used as ${defines}
my $defines = $trans->defines();
my $opsarraytype = $trans->opsarraytype();
my $core_type = $trans->core_type();

my $file = $core_flag ? 'core.ops' : shift @ARGV;

my $base = $file;
$base =~ s/\.ops$//;

my $incdir  = "include/parrot/oplib";
my $include = "parrot/oplib/${base}_ops${suffix}.h";
my $header  = "include/$include";
# SOURCE is closed and reread, which confuses make -j
# create a temp file and rename it
my $source  = "src/ops/${base}_ops${suffix}.c.temp";

if ($base =~ m!^src/dynoplibs/! || $dynamic_flag) {
    $source  =~ s!src/ops/!!;
    $header = "${base}_ops${suffix}.h";
    $base =~ s!^.*[/\\]!!;
    $include = "${base}_ops${suffix}.h";
    $dynamic_flag = 1;
}

my $sym_export = $dynamic_flag ? 'PARROT_DYNEXT_EXPORT' : 'PARROT_API';

my %hashed_ops;

#
# Read the input files:
#

my $ops;
if ($core_flag) {
    $ops = Parrot::OpsFile->new( [ "src/ops/$file" ], $nolines_flag );
    $ops->{OPS} = $Parrot::OpLib::core::ops;
    $ops->{PREAMBLE} = $Parrot::OpLib::core::preamble;
}
else {
    my %opsfiles;
    my @opsfiles;

    foreach my $opsfile ($file, @ARGV) {
        if ($opsfiles{$opsfile}) {
            print STDERR "$0: Ops file '$opsfile' mentioned more than once!\n";
            next;
        }

        $opsfiles{$opsfile} = 1;
        push @opsfiles, $opsfile;

        die "$0: Could not read ops file '$opsfile'!\n" unless -r $opsfile;
    }

    $ops = Parrot::OpsFile->new( \@opsfiles, $nolines_flag );

    my $cur_code = 0;
    for(@{$ops->{OPS}}) {
        $_->{CODE}=$cur_code++;
    }
}


my $version       = $ops->version;
my $major_version = $ops->major_version;
my $minor_version = $ops->minor_version;
my $patch_version = $ops->patch_version;
my $num_ops     = scalar $ops->ops;
my $num_entries = $num_ops + 1; # For trailing NULL


#
# Open the output files:
#

if (!$dynamic_flag && ! -d $incdir) {
    mkdir($incdir, 0755) or die "ops2c.pl: Could not mkdir $incdir $!!\n";
}

open HEADER, '>', $header
    or die "ops2c.pl: Cannot open header file '$header' for writing: $!!\n";

open SOURCE, '>', $source
    or die "ops2c.pl: Cannot open source file '$source' for writing: $!!\n";


#
# Print the preamble for the HEADER and SOURCE files:
#

my $preamble = <<END_C;
/* ex: set ro:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$file' (and possibly other
 * .ops files). by $0.
 *
 * Any changes made here will be lost!
 *
 */

END_C

my $mmp_v = "${major_version}_${minor_version}_${patch_version}";
my $init_func = "Parrot_DynOp_${base}${suffix}_$mmp_v";

print HEADER $preamble;
if ($dynamic_flag) {
    print HEADER "#define PARROT_IN_EXTENSION\n";
}
print HEADER <<END_C;
#include "parrot/parrot.h"
#include "parrot/oplib.h"

$sym_export extern op_lib_t *$init_func(long init);

END_C
my $cg_func = $trans->core_prefix . $base;


if ($trans->can("run_core_func_decl")) {
    my $run_core_func = $trans->run_core_func_decl($base);
    print HEADER "$run_core_func;\n";
}
my $bs = "${base}${suffix}_";

print SOURCE $preamble;
print SOURCE <<END_C;
#include "$include"

${defines}
static op_lib_t ${bs}op_lib;

END_C

my $text = $ops->preamble($trans);
$text =~ s/\bops_addr\b/${bs}ops_addr/g;
print SOURCE $text;


if ($trans->can("ops_addr_decl")) {
    print SOURCE $trans->ops_addr_decl($bs);
}
if ($trans->can("run_core_func_decl")) {
    print SOURCE $trans->run_core_func_decl($base);
    print SOURCE "\n{\n";
    print SOURCE $trans->run_core_func_start;
}

#
# Iterate over the ops, appending HEADER and SOURCE fragments:
#

my @op_funcs;
my @op_func_table;
my @cg_jump_table;
my $index = 0;
my ($prev_src, $prev_index);

$prev_src = '';
foreach my $op ($ops->ops) {
    my $func_name  = $op->func_name($trans);
    my $arg_types  = "$opsarraytype *, Interp *";
    my $prototype  = "$sym_export $opsarraytype * $func_name ($arg_types)";
    my $args       = "$opsarraytype *cur_opcode, Interp * interpreter";
    my $definition;
    my $comment    = '';
    my $one_op     = "";

    if ($suffix =~ /cg/) {
        $definition = "PC_$index:";
        $comment    = "/* ". $op->full_name() ." */";
    } elsif ($suffix =~ /switch/) {
        $definition = "case $index:";
        $comment    = "/* ". $op->full_name() ." */";
    }
    else {
        $definition = "$prototype;\n$opsarraytype *\n$func_name ($args)";
    }

    my $src = $op->source($trans);
    $src    =~ s/\bop_lib\b/${bs}op_lib/g;
    $src    =~ s/\bops_addr\b/${bs}ops_addr/g;

    if ($suffix =~ /cg/) {
        if ($prev_src eq $src) {
            push @cg_jump_table, "        &&PC_$prev_index,\n";
        }
        else {
            push @cg_jump_table, "        &&PC_$index,\n";
        }
    }
    elsif ($suffix eq '') {
        push @op_func_table, sprintf("  %-50s /* %6ld */\n",
            "$func_name,", $index);
    }
    if ($prev_src eq $src) {
        push @op_funcs, "$comment\n";
    }
    else {
        $one_op .= "$definition $comment {\n$src}\n\n";
        push @op_funcs, $one_op;
        $prev_src = $src if ($suffix eq '_cgp' || $suffix eq '_switch');
        $prev_index = $index;
    }
    $index++;
}

if ($suffix =~ /cg/) {
    print SOURCE @cg_jump_table;
    print SOURCE <<END_C;
        NULL
    };
END_C
    print SOURCE $trans->run_core_after_addr_table($bs);
}

if ($suffix =~ /cgp/) {
    print SOURCE <<END_C;
#ifdef __GNUC__
# ifdef I386
    else if (cur_opcode == (void **) 1)
    asm ("jmp *4(%ebp)");  /* jump to ret addr, used by JIT */
# endif
#endif
    _reg_base = (char*)interpreter->ctx.bp.regs_i;
    goto **cur_opcode;

END_C
} elsif ($suffix =~ /cg/) {
    print SOURCE <<END_C;
goto *${bs}ops_addr[*cur_opcode];

END_C
}



print SOURCE <<END_C;
/*
** Op Function Definitions:
*/

END_C

#
# Finish the SOURCE file's array initializer:
#
my $CORE_SPLIT = 300;
for (my $i = 0; $i < @op_funcs; $i++) {
    if ($i && $i % $CORE_SPLIT == 0 && $trans->can("run_core_split")) {
        print SOURCE $trans->run_core_split($base);
    }
    print SOURCE $op_funcs[$i];
}

if ($trans->can("run_core_finish")) {
    print SOURCE $trans->run_core_finish($base);
}


#
# reset #line in the SOURCE file.
#

close(SOURCE);
open(SOURCE, '<', $source) || die "Error re-reading $source: $!\n";
my $line = 0; while (<SOURCE>) { $line++; } $line+=2;
close(SOURCE);
open(SOURCE, '>>', $source) || die "Error appending to $source: $!\n";
unless ($nolines_flag) {
    my $source_escaped = $source;
    $source_escaped =~ s|\.temp||;
    $source_escaped =~ s|(\\)|$1$1|g; # escape backslashes
    print SOURCE qq{#line $line "$source_escaped"\n};
}


#
# write op_func_func
#

my ($op_info, $op_func, $getop);
$op_info = $op_func = 'NULL';
$getop = '( int (*)(const char *, int) )NULL';

if ($suffix eq '') {
    $op_func = "${bs}op_func_table";
    print SOURCE <<END_C;

INTVAL ${bs}numops${suffix} = $num_ops;

/*
** Op Function Table:
*/

static op_func${suffix}_t ${op_func}\[$num_entries] = {
END_C

    print SOURCE @op_func_table;

    print SOURCE <<END_C;
  (op_func${suffix}_t)0  /* NULL function pointer */
};


END_C
}

my (%names, $tot);
if ($suffix eq '') {
    $op_info = "${bs}op_info_table";
#
# Op Info Table:
#
    print SOURCE <<END_C;

/*
** Op Info Table:
*/

static op_info_t $op_info\[$num_entries] = {
END_C

    $index = 0;

    foreach my $op ($ops->ops) {
        my $type       = sprintf("PARROT_%s_OP", uc $op->type);
        my $name       = $op->name;
        $names{$name} = 1;
        my $full_name  = $op->full_name;
        my $func_name  = $op->func_name($trans);
        my $body       = $op->body;
        my $jump       = $op->jump || 0;
        my $arg_count  = $op->size;

    ## 0 inserted if arrays are empty to prevent msvc compiler errors
        my $arg_types  = "{ " . join(", ", scalar $op->arg_types
            ? map { sprintf("PARROT_ARG_%s", uc $_) } $op->arg_types
            : 0
        ) . " }";
        my $arg_dirs   = "{ " . join(", ", scalar $op->arg_dirs
            ? map { $arg_dir_mapping{$_} } $op->arg_dirs
            : 0
        ) . " }";
        my $labels     = "{ " . join(", ",  scalar $op->labels
            ? $op->labels
            : 0
        ) . " }";
        my $flags      = 0;

        print SOURCE <<END_C;
  { /* $index */
    /* type $type, */
    "$name",
    "$full_name",
    "$func_name",
    /* "",  body */
    $jump,
    $arg_count,
    $arg_types,
    $arg_dirs,
    $labels,
    $flags
  },
END_C

        $index++;
    }
    print SOURCE <<END_C;
};

END_C
}

if ($suffix eq '' && !$dynamic_flag) {
    $getop = 'get_op';
    my $hash_size = 3041;
    $tot = $index + scalar keys(%names);
    if ($hash_size < $tot * 1.2) {
        print STDERR
            "please increase hash_size ($hash_size) in tools/build/ops2c.pl " .
            "to a prime number > ", $tot *1.2, "\n";
    }
    print SOURCE <<END_C;

/*
** Op lookup function:
*/

#define NUM_OPS $num_ops

#define OP_HASH_SIZE $hash_size

/* we could calculate a prime somewhat bigger than
 * n of fullnames + n of names
 * for now this should be ok
 *
 * look up an op_code: at first call to op_code() a hash
 * of short and full opcode names is created
 * hash functions are from imcc, thanks to Melvin.
 */


typedef struct hop {
    op_info_t * info;
    struct hop *next;
} HOP;
static HOP **hop;

static void hop_init(void);
static size_t hash_str(const char * str);
static void store_op(op_info_t *info, int full);

/* XXX on changing interpreters, this should be called,
   through a hook */

static void hop_deinit(void);

/*
 * find a short or full opcode
 * usage:
 *
 * interp->op_lib->op_code("set", 0)
 * interp->op_lib->op_code("set_i_i", 1)
 *
 * returns >= 0 (found idx into info_table), -1 if not
 */

static int get_op(const char * name, int full);

static size_t hash_str(const char * str) {
    size_t key = 0;
    const char * s;
    for(s=str; *s; s++)
        key = key * 65599 + *s;
    return key;
}

static void store_op(op_info_t *info, int full) {
    HOP * const p = mem_sys_allocate(sizeof(HOP));
    const size_t hidx =
        hash_str(full ? info->full_name : info->name) % OP_HASH_SIZE;
    p->info = info;
    p->next = hop[hidx];
    hop[hidx] = p;
}
static int get_op(const char * name, int full) {
    HOP * p;
    const size_t hidx = hash_str(name) % OP_HASH_SIZE;
    if (!hop) {
        hop = mem_sys_allocate_zeroed(OP_HASH_SIZE * sizeof(HOP*));
        hop_init();
    }
    for (p = hop[hidx]; p; p = p->next) {
        if(!strcmp(name, full ? p->info->full_name : p->info->name))
            return p->info - ${bs}op_lib.op_info_table;
    }
    return -1;
}
static void hop_init() {
    size_t i;
    op_info_t * info = ${bs}op_lib.op_info_table;
    /* store full names */
    for (i = 0; i < ${bs}op_lib.op_count; i++)
        store_op(info + i, 1);
    /* plus one short name */
    for (i = 0; i < ${bs}op_lib.op_count; i++)
        if (get_op(info[i].name, 0) == -1)
            store_op(info + i, 0);
}
static void hop_deinit(void)
{
    HOP *p, *next;
    if (hop) {
        size_t i;
        for (i = 0; i < OP_HASH_SIZE; i++)
            for (p = hop[i]; p; ) {
                next = p->next;
                free(p);
                p = next;
        }
        free(hop);
    }
    hop = 0;
}

END_C

}
else {
    print SOURCE <<END_C;
static void hop_deinit(void) {}
END_C
}

print SOURCE <<END_C;

/*
** op lib descriptor:
*/

static op_lib_t ${bs}op_lib = {
  "$base",		/* name */
  "$suffix",		/* suffix */
  $core_type,	        /* core_type = PARROT_XX_CORE */
  0,			/* flags */
  $major_version,	/* major_version */
  $minor_version,	/* minor_version */
  $patch_version,	/* patch_version */
  $num_ops,		/* op_count */
  $op_info,		/* op_info_table */
  $op_func,		/* op_func_table */
  $getop		/* op_code() */
};

END_C

# generate initfunc
my $init1_code = "";
if ($trans->can("init_func_init1")) {
    $init1_code = $trans->init_func_init1($base);
}

my $init_set_dispatch = "";
if ($trans->can("init_set_dispatch")) {
    $init_set_dispatch = $trans->init_set_dispatch($bs);
}

print SOURCE <<END_C;
op_lib_t *
$init_func(long init) {
    /* initialize and return op_lib ptr */
    if (init == 1) {
$init1_code
    return &${bs}op_lib;
    }
    /* set op_lib to the passed ptr (in init) */
    else if (init) {
$init_set_dispatch
    }
    /* deinit - free resources */
    else {
    hop_deinit();
    }
    return NULL;
}

END_C

if ($dynamic_flag) {
    my $load_func = "Parrot_lib_${base}_ops${suffix}_load";
    print SOURCE <<END_C;
/*
 * dynamic lib load function - called once
 */

$sym_export PMC*
$load_func(Parrot_Interp interpreter)
{
    PMC *lib = pmc_new(interpreter, enum_class_ParrotLibrary);
    PMC_struct_val(lib) = (void *) $init_func;
    dynop_register(interpreter, lib);
    return lib;
}
END_C

}

close SOURCE;
my $final = $source;
$final =~ s/\.temp//;
rename $source, $final;

exit 0;

# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
