#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config qw(%PConfig);
use Parrot::Distribution;
use Parrot::Headerizer;

=head1 NAME

t/codingstd/c_function_docs.t - checks for missing function documentation

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_function_docs.t

    # test specific files
    % perl t/codingstd/c_function_docs.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have documentation for each function
declared.

=cut

my $DIST = Parrot::Distribution->new;
my $headerizer = Parrot::Headerizer->new;

# can't handle .ops or .pmc files yet
my @files = grep {/\.(c|h)$/ } @ARGV ? @ARGV :
    map {s/^$PConfig{build_dir}$PConfig{slash}//; $_} map {$_->path} $DIST->get_c_language_files();

plan tests => scalar @files;

my %todos;
while (<DATA>) {
    next if /^#/;
    next if /^\s*$/;
    chomp;
    $todos{$_} = 1;
}

foreach my $path (@files) {

    my $buf = $DIST->slurp($path);
    my @missing_docs;

    my @function_decls = $headerizer->extract_function_declarations($buf);

    for my $function_decl (@function_decls) {

        # strip out any PARROT_* prefixes
        $function_decl =~ s/^\s*PARROT_[A-Z_]*\b\s+//gm;

        # strip out any ARG* modifiers
        $function_decl =~ s/ARG(?:IN|IN_NULLOK|OUT|OUT_NULLOK|MOD|MOD_NULLOK|FREE)\((.*?)\)/$1/g;

        # strip out the SHIM modifier
        $function_decl =~ s/SHIM\((.*?)\)/$1/g;

        # strip out the NULL modifiers
        $function_decl =~ s/(?:NULLOK|NOTNULL)\((.*?)\)/$1/g;

        # SHIM_INTERP is still a PARROT_INTERP
        $function_decl =~ s/SHIM_INTERP/PARROT_INTERP/g;

        my $escaped_decl = $function_decl;

        # escape [, ], (, ), and *
        $escaped_decl =~ s/\[/\\[/g;
        $escaped_decl =~ s/\]/\\]/g;
        $escaped_decl =~ s/\(/\\(/g;
        $escaped_decl =~ s/\)/\\)/g;
        $escaped_decl =~ s/\*/\\*/g;

        # don't worry if the function declaration has embedded newlines in
        # it and the documented function doesn't.
        $escaped_decl =~ s/\s+/\\s+/g;

        my $decl_rx = qr/^=item C<$escaped_decl>(.*?)^=cut/sm;

        my $missing = '';
        if ( $buf =~ m/$decl_rx/) {
            my $docs = $1;
            $docs =~ s/\s//g;
            if ($docs eq '') {
                $missing = 'boilerplate only';
            }
            # else:  docs!
        }
        else {
            $missing = 'missing'; 
        }
        if ($missing) {
            push @missing_docs, "$path ($missing)\n$function_decl\n";
        }
    }

    TODO: {
        local $TODO = 'Missing function docs' if $todos{$path};

    ok ( ! @missing_docs, $path)
        or diag( scalar @missing_docs
            . " function(s) lacking documentation:\n"
            . join ("\n", @missing_docs, "\n"));
    }
}

__DATA__

compilers/imcc/debug.c
compilers/imcc/imc.c
compilers/imcc/instructions.c
compilers/imcc/main.c
compilers/imcc/optimizer.c
compilers/imcc/parser_util.c
compilers/imcc/pbc.c
compilers/imcc/pcc.c
compilers/imcc/reg_alloc.c
compilers/imcc/sets.c
compilers/imcc/symreg.c
compilers/pirc/src/bcgen.c
compilers/pirc/src/pircapi.c
compilers/pirc/src/pircompiler.c
compilers/pirc/src/piremit.c
compilers/pirc/src/pirerr.c
compilers/pirc/src/pirmacro.c
compilers/pirc/src/pirop.c
compilers/pirc/src/pirpcc.c
compilers/pirc/src/pirregalloc.c
compilers/pirc/src/pirsymbol.c

config/gen/platform/ansi/dl.c
config/gen/platform/ansi/exec.c
config/gen/platform/ansi/time.c
config/gen/platform/darwin/dl.c
config/gen/platform/darwin/memalign.c
config/gen/platform/generic/dl.c
config/gen/platform/generic/env.c
config/gen/platform/generic/exec.c
config/gen/platform/generic/math.c
config/gen/platform/generic/memalign.c
config/gen/platform/generic/memexec.c
config/gen/platform/generic/stat.c
config/gen/platform/generic/time.c
config/gen/platform/netbsd/math.c
config/gen/platform/openbsd/math.c
config/gen/platform/openbsd/memexec.c
config/gen/platform/solaris/math.c
config/gen/platform/solaris/time.c
config/gen/platform/win32/env.c

examples/c/nanoparrot.c
examples/c/test_main.c
examples/compilers/japhc.c
examples/embed/lorito.c

include/parrot/atomic/gcc_pcc.h

src/atomic/gcc_x86.c

src/call/ops.c
src/call/pcc.c

src/gc/generational_ms.c

src/io/io_string.c
src/io/socket_api.c
src/io/socket_unix.c
src/io/socket_win32.c

src/jit/hppa/jit_emit.h
src/jit/amd64/jit_defs.c
src/jit/arm/exec_dep.c
src/jit/i386/exec_dep.c
src/jit/ppc/exec_dep.c
src/jit/ia64/jit_emit.h
src/jit/mips/jit_emit.h
src/jit/ppc/jit_emit.h
src/jit/skeleton/jit_emit.h
src/jit/sun4/jit_emit.h
src/jit/alpha/jit_emit.h
src/jit/arm/jit_emit.h

src/string/charset/ascii.c
src/string/charset/binary.c
src/string/charset/iso-8859-1.c
src/string/charset/unicode.c

src/byteorder.c
src/datatypes.c
src/debug.c
src/dynext.c
src/embed.c
src/events.c
src/exceptions.c
src/exec.c
src/exit.c
src/extend.c
src/global.c
src/global_setup.c
src/hash.c
src/inter_cb.c
src/inter_create.c
src/inter_misc.c
src/interpreter.c
src/key.c
src/library.c
src/list.c
src/longopt.c
src/malloc-trace.c
src/misc.c
src/multidispatch.c
src/nci_test.c
src/oo.c
src/packdump.c
src/packfile.c
src/packfile/pf_items.c
src/packout.c
src/parrot_debugger.c
src/pbc_disassemble.c
src/pbc_dump.c
src/pbc_merge.c
src/pic.c
src/pic_jit.c
src/pmc.c
src/pmc_freeze.c
src/runops_cores.c
src/spf_render.c
src/spf_vtable.c
src/stacks.c
src/sub.c
src/thread.c
src/trace.c
src/tsq.c
src/utils.c


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
