#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

build_tools/jit2h.pl - JIT to C

=head1 SYNOPSIS

    % perl build_tools/jit2h.pl <cpu-architecture-name> jit_cpu.c

=head1 DESCRIPTION

This script creates F<jit_cpu.c>. It parses the JIT file for the
specified CPU architecture type (F<jit/cpu-architecture-name/core.jit>).

=cut


use strict;
use lib 'lib';
use Parrot::OpLib::core;
use Parrot::Op;
use Parrot::OpTrans::C;

my $trans = Parrot::OpTrans::C->new;

my %type_to_arg = (
    INT_CONST => 'ic',
    NUM_CONST => 'nc',
    STRING_CONST => 'sc',
    STR_CONST => 'sc',
    INT_REG => 'i',
    NUM_REG => 'n',
    PMC_REG => 'p',
    STRING_REG => 's',
    STR_REG => 's',
);

my $core_numops = scalar(@$Parrot::OpLib::core::ops);
my @core_opfunc = map { $_->func_name($trans) } @$Parrot::OpLib::core::ops;
my %opcodes;

for(@$Parrot::OpLib::core::ops) {
    my $name = $_->{NAME} . '_' .join '_',@{$_->{ARGS}}[1..$#{$_->{ARGS}}];
    $opcodes{$name} = $_->{CODE};
}

my $cpuarch = shift @ARGV;
my $genfile = shift @ARGV;

my ($i,$j,$k,$n);

my ($function, $body, $line, $extern, $header);

my ($asm, $precompiled);

my %core_ops;
my %templates;

my @jit_funcs;
my $func_end;
my $normal_op;
my $cpcf_op;
my $restart_op;
my %argmaps;
my $jit_cpu;

if ($genfile =~ /jit_cpu.c/) {
    $jit_cpu = 1;
    push @jit_funcs, "Parrot_jit_fn_info_t op_jit[$core_numops] = {\n";
    $func_end = "_jit";
    $normal_op = "Parrot_jit_normal_op";
    $cpcf_op = "Parrot_jit_cpcf_op";
    $restart_op = "Parrot_jit_restart_op";
    %argmaps = %Parrot::OpTrans::C::arg_maps;
}
else {
    $jit_cpu = ($cpuarch eq 'i386') ? 0 : 1;
    push @jit_funcs, "Parrot_jit_fn_info_t op_exec[$core_numops] = {\n";
    $func_end = "_exec";
    $normal_op = "Parrot_exec_normal_op";
    $cpcf_op = "Parrot_exec_cpcf_op";
    $restart_op = "Parrot_exec_restart_op";
    %argmaps = (
        'op' => "cur_opcode[%ld]",

        'i'  => "IREG(%ld)",
        'n'  => "NREG(%ld)",
        'p'  => "PREG(%ld)",
        's'  => "SREG(%ld)",
        'k'  => "PREG(%ld)",
        'ki' => "IREG(%ld)",

        'ic' => "cur_opcode[%ld]",
        'nc' => "CONST(%ld)",
        'pc' => "%ld /* ERROR: Don't know how to handle PMC constants yet! */",
        'sc' => "CONST(%ld)",
        'kc' => "CONST(%ld)",
        'kic' => "cur_opcode[%ld]"
    );
}

sub readjit($) {
    my $file = shift;

    my %ops;
    my $template;

    open (IN,$file) or die "Can't open file $file: $!";
    while ($line = <IN>) {
        if ($line =~ m/^#define/) {
            $line =~ s/PREV_OP\s(..?)\s(\w+)/(jit_info->prev_op) && (*jit_info->prev_op $1 $opcodes{$2})/g;
            $header .= $line;
            next;
        }
	    # ignore comment and empty lines
        next if (($line =~ m/^;/) || ($line =~ m/^\s*$/));
        if (!defined($function) && !defined($template)) {
            if ($line =~ m/TEMPLATE\s+(\w+)\s*{/) { #}
                $template = $1;
                $asm = "";
                next;
            }
            else {
                $line =~ m/(extern\s*)?(\w+)\s*{/; #}
                $extern = (defined($1))? 1 : 0;
                $function = $2;
                $asm = "";
                next;
            }
        }
        if ($line =~ m/^}/) { #{
            # 1. check templates
            while (my($t, $body) = each(%templates)) {
                if ($asm =~ /$t\s+/) {
                    my $tbody = $body;
                    while ($asm =~ s/\b(s(.).+?\2.*?\2)(?:\s+)?//) {
                        eval "\$tbody =~ ${1}g";
                        if ($@) {
                            die "error in template subst: $@\n";
                        }
                    }
                    $asm = $tbody;
                    # reset iterator for next run
                    keys(%templates);
                    last;
                }
            }

            # end of template definition?
            if (defined($template)) {
                $templates{$template} = $asm;
                $template = undef;
                next;
            }
            # no, end of function

            # then do other substitutions
            $asm =~ s/([\&\*])([a-zA-Z_]+)\[(\d+)\]/make_subs($1,$2,$3)/ge;
            $asm =~ s/NEW_FIXUP/Parrot_jit_newfixup(jit_info)/g;
            $asm =~ s/CUR_FIXUP/jit_info->arena.fixups/g;
            $asm =~ s/NATIVECODE/jit_info->native_ptr/g;
            $asm =~ s/CUR_OPCODE/jit_info->cur_op/g;
            $asm =~ s/cur_opcode/jit_info->cur_op/g;
            $asm =~ s/MAP\[(\d)\]/MAP($1)/g;
	    # XXX set extern if the code calls a function
	    $extern = 1 if $asm =~ /call_func/;
            unless ($jit_cpu) {
                # no address of
                $asm =~ s/&([INSP])REG/$1REG/g;
                $asm =~ s/&CONST/CONST/g;
                # Use the macro
                $asm =~ s/call_func\(\s*jit_info\s*,\s*\(void\*\)\s*(.*)\)/CALL("$1")/g;
                # The ->u.(string|float) is unnecessary.
                $asm =~ s/\)->u\.(\w+)/)/g;
                $asm =~ s/CONST\((\d)\)\s*([><=!]=?)\s*CONST\((\d)\)/RCONST($1)->u.number $2 RCONST($3)->u.number/ if ($asm =~ /CONST.*CONST/);
                $asm =~ s/(emitm_pushl_m[^\n]*CONST[^\n]*)/$1\\\n\tParrot_exec_add_text_rellocation(jit_info->objfile, NULL, RTYPE_DATA, "const_table", 0);/g;
                $asm =~ s/jit_emit_end/exec_emit_end/;
            }
            if (($cpuarch eq 'ppc') && ($genfile ne "src/jit_cpu.c")) {
                $asm =~ s/jit_emit_mov_ri_i\(jit_info->native_ptr, ISR([12]), &CONST\((\d)\)\);/load_nc(jit_info->native_ptr, ISR$1, ECONST($2));/g;
            }

            $asm =~ s/PUSH_MAPPED_REG\((\d)\)/Parrot_jit_push_registers(jit_info,$1)/g;
            $ops{$function} = [ $asm , $extern ];
            $function = undef;
        }
        unless ($jit_cpu) {
            $line =~ s/emitm_pushl_i/emitm_pushl_m/ if ($line =~ /string/);
        }
        $asm .= $line;
    }
    return %ops;
}

use Parrot::Vtable;
my $vtable;
my $vjit = 0;
sub vtable_num($) {
    my $meth = shift;
    unless ($vtable) {
	$vtable = parse_vtable();
    }
    my $i = 0;
    $vjit++;
    for my $entry (@{$vtable}) {
	next if  $entry->[4] =~ /MMD_/;  # TODO all
	return $i if ($entry->[1] eq $meth);
	$i++;
    }
    die("vtable not found for $meth\n");
}

my $jit_emit_n = ($genfile =~ /jit_cpu.c/) ? 2 : 1;

open JITCPU, ">$genfile" or die;

print JITCPU<<END_C;
/*
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from 'jit/$cpuarch/core.jit'
 * by $0.
 *
 * Any changes made here will be lost!
 *
 */

#include<parrot/parrot.h>
#if HAVE_COMPUTED_GOTO
#  include<parrot/oplib/core_ops_cgp.h>
#endif
#include"parrot/exec.h"
#include"parrot/jit.h"
#define JIT_EMIT $jit_emit_n

/* Disable "truncation from 'const int' to 'char'" warning. */
#if defined (_MSC_VER)
#pragma warning(disable: 4305)
#endif

/*
 *define default jit_funcs, if architecture doesn't have these optimizations
 */
#define Parrot_jit_vtable1_op Parrot_jit_normal_op
#define Parrot_jit_vtable1r_op Parrot_jit_normal_op
/*
 * the numbers corresspond to the registers
 */
#define Parrot_jit_vtable_111_op Parrot_jit_normal_op
#define Parrot_jit_vtable_112_op Parrot_jit_normal_op
#define Parrot_jit_vtable_221_op Parrot_jit_normal_op
#define Parrot_jit_vtable_1121_op Parrot_jit_normal_op
#define Parrot_jit_vtable_1123_op Parrot_jit_normal_op
#define Parrot_jit_vtable_2231_op Parrot_jit_normal_op
#define Parrot_jit_vtable_1r223_op Parrot_jit_normal_op
#define Parrot_jit_vtable_1r332_op Parrot_jit_normal_op

#define Parrot_jit_vtable_ifp_op Parrot_jit_cpcf_op
#define Parrot_jit_vtable_unlessp_op Parrot_jit_cpcf_op
#define Parrot_jit_vtable_newp_ic_op Parrot_jit_normal_op

#define Parrot_jit_restart_op Parrot_jit_cpcf_op

#include"parrot/jit_emit.h"

#undef CONST
#ifndef MAP
# define MAP(i) jit_info->optimizer->map_branch[jit_info->op_i + (i)]
#endif

extern char **Parrot_exec_rel_addr;
extern int Parrot_exec_rel_count;

#define ROFFS_INT(x) REG_OFFS_INT(jit_info->cur_op[x])
#define ROFFS_NUM(x) REG_OFFS_NUM(jit_info->cur_op[x])
#define ROFFS_STR(x) REG_OFFS_STR(jit_info->cur_op[x])
#define ROFFS_PMC(x) REG_OFFS_PMC(jit_info->cur_op[x])
#
END_C

if ($jit_cpu) {
    print JITCPU<<END_C;
#define IREG(i) REG_INT(jit_info->cur_op[i])
#define NREG(i) REG_NUM(jit_info->cur_op[i])
#define PREG(i) REG_PMC(jit_info->cur_op[i])
#define SREG(i) REG_STR(jit_info->cur_op[i])
#define CONST(i) interpreter->code->const_table->constants[jit_info->cur_op[i]]
END_C
}
else {
    print JITCPU<<END_C;
#define CONST(i) (int *)(jit_info->cur_op[i] * sizeof(struct PackFile_Constant) + offsetof(struct PackFile_Constant, u))
#define RCONST(i) interpreter->code->const_table->constants[jit_info->cur_op[i]]
#define CALL(f) Parrot_exec_add_text_rellocation_func(jit_info->objfile, jit_info->native_ptr, f); \\
    emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);

END_C
}
if (($cpuarch eq 'ppc') && ($genfile ne "src/jit_cpu.c")) {
    print JITCPU "#define ECONST(i) (int *)(jit_info->cur_op[i] * sizeof(struct PackFile_Constant) + 8)\n";
}


%core_ops = readjit("jit/$cpuarch/core.jit");

print JITCPU $header if ($header);

my $njit = scalar keys(%core_ops);

my $jit_fn_retn = "void";
my $jit_fn_params = "(Parrot_jit_info_t *jit_info, Interp * interpreter)";

for ($i = 0; $i < $core_numops; $i++) {
    $body = $core_ops{$core_opfunc[$i]}[0];
    $extern = $core_ops{$core_opfunc[$i]}[1];

    my $jit_func;
    my $op = $Parrot::OpLib::core::ops->[$i];

    $precompiled = 0;
    if (!defined $body) {
        $precompiled = 1;
        $extern = 1;
        my $opbody = $op->body;
	# retranslate VTABLE_macro to the expanded form
	$opbody =~ s/
	    \bVTABLE_(\w+)
	    \s*\(
	    interpreter,\s*
	    {{\@(\d)}}/
	    {{\@$2}}->vtable->$1(interpreter, {{\@$2}}/x;

        if ($op->full_name eq 'new_p_ic') {
            $jit_func = "Parrot_jit_vtable_newp_ic_op";
            $opbody =~ /vtable->(\w+)/;
            $extern = 2;  # fake number
            #print "$jit_func $extern\n";
        }
        # jitable vtable funcs:
        # *) $1->vtable->{vtable}(interp, $1)
        elsif ($opbody =~ /
        ^(?:.*\.ops")\s+
        {{\@1}}->vtable->
        (\w+)
        \(interpreter,
        \s*
        {{\@1}}
        \);
        \s+{{\+=\d}}/xm) {
            $jit_func = "Parrot_jit_vtable1_op";
            $extern = vtable_num($1);
            #print $op->full_name .": $jit_func $extern\n";
        }
        # *) $1 = $2->vtable->{vtable}(interp, $2)
        elsif ($opbody =~ /
        ^(?:.*\.ops")\s+
        {{\@1}}\s*=\s*
        {{\@2}}->vtable->
        (\w+)
        \(interpreter,
        \s*
        {{\@2}}
        \);
        \s+{{\+=\d}}/xm) {
            $jit_func = "Parrot_jit_vtable1r_op";
            $extern = vtable_num($1);
            #print $op->full_name .": $jit_func $extern\n";
        }
        # *) $X->vtable->{vtable}(interp, $Y, $Z)
        elsif ($opbody =~ /
        ^(?:.*\.ops")\s+
        {{\@(\d)}}->vtable->
        (\w+)
        \(interpreter,
        \s*
        {{\@(\d)}},\s*{{\@(\d)}}
        \);
        \s+{{\+=\d}}/xm) {
            $jit_func = "Parrot_jit_vtable_$1$3$4_op";
            $extern = vtable_num($2);
            #print $op->full_name .": $jit_func $extern\n";
        }
        # *) $R = $X->vtable->{vtable}(interp, $Y, $Z)
        elsif ($opbody =~ /
        ^(?:.*\.ops")\s+
        {{\@(\d)}}\s*=\s*
        {{\@(\d)}}->vtable->
        (\w+)
        \(interpreter,
        \s*
        {{\@(\d)}},\s*{{\@(\d)}}
        \);
        \s+{{\+=\d}}/xm) {
            $jit_func = "Parrot_jit_vtable_$1r$2$4$5_op";
            $extern = vtable_num($3);
            #print $op->full_name .": $jit_func $extern\n";
        }
        # *) $X->vtable->{vtable}(interp, $Y, $Z, $A)
        elsif ($opbody =~ /
        ^(?:.*\.ops")\s+
        {{\@(\d)}}->vtable->
        (\w+)
        \(interpreter,
        \s*
        {{\@(\d)}},\s*{{\@(\d)}},\s*{{\@(\d)}}
        \);
        \s+{{\+=\d}}/xm) {
            $jit_func = "Parrot_jit_vtable_$1$3$4$5_op";
            $extern = vtable_num($2);
            #print $op->full_name .": $jit_func $extern\n";
        }
        # some specials
        elsif ($op->full_name eq 'if_p_ic') {
            $jit_func = "Parrot_jit_vtable_ifp_op";
            $opbody =~ /vtable->(\w+)/;
            $extern = vtable_num($1);
            #print "$jit_func $extern\n";
        }
        elsif ($op->full_name eq 'unless_p_ic') {
            $jit_func = "Parrot_jit_vtable_unlessp_op";
            $opbody =~ /vtable->(\w+)/;
            $extern = vtable_num($1);
            #print "$jit_func $extern\n";
        }

        elsif ($op->jump =~ /JUMP_RESTART/ ) {
            $jit_func = $restart_op;
        }
        elsif ($op->jump) {
            $jit_func = $cpcf_op;
        } else {
            $jit_func = $normal_op;
        }
    }
    else
    {
        $jit_func = "$core_opfunc[$i]$func_end";
    }

    unless($precompiled){
    print JITCPU "\nstatic $jit_fn_retn\n" .$core_opfunc[$i] . $func_end .
	$jit_fn_params . "\n{\n" .
	$body . "}\n";
    }
    push @jit_funcs, "{ $jit_func, $extern }, \t" .
	    "/* op $i: $core_opfunc[$i] */\n";
}

print JITCPU @jit_funcs, "};\n";

if ($genfile =~ /jit_cpu.c/) {
    print JITCPU <<EOC;
    extern int jit_op_count(void);
    int jit_op_count() { return $core_numops; }
EOC
}

print("jit2h: $njit (+ $vjit vtable) of $core_numops ops are JITed.\n");
sub make_subs {
    my ($ptr, $type, $index) = @_;
    return(($ptr eq '&' ? '&' : '') . sprintf($argmaps{$type_to_arg{$type}}, $index));
}
