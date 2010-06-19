# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

tools/dev/nci_thunk_gen.pir - Build up native call thunk routines

=head1 SYNOPSIS

    % ./parrot tools/dev/nci_thunk_gen.pir -o src/nci/extra_thunks.c <src/nci/extra_thunks.nci

=head1 DESCRIPTION

This script creates Native Call Interface files. It parses a file of function
signatures of the form:

 <return-type-specifier><ws><parameter-type-specifiers>[<ws>][#<comment>]
    ...
Empty lines and lines containing only whitespace or comment are ignored.
The types specifiers are documented in F<src/nci/extra_thunks.nci>.

=head1 SEE ALSO

F<src/nci/extra_thunks.nci>.
F<docs/pdds/pdd16_native_call.pod>.

=cut

.macro_const VERSION 0.01

.macro_const SIG_TABLE_GLOBAL_NAME  'signature_table'
.macro_const OPTS_GLOBAL_NAME       'options'

.sub 'main' :main
    .param pmc argv

    # initialize global variables
    'gen_sigtable'()
    'get_options'(argv)

    .local string targ
    targ = 'read_from_opts'('target')

    .local pmc sigs
    sigs = 'read_sigs'()

    $S0 = 'read_from_opts'('output')
    $P0 = new ['FileHandle']
    $P0.'open'($S0, 'w')
    $P1 = getinterp
    .include 'stdio.pasm'
    $P1.'stdhandle'(.PIO_STDOUT_FILENO, $P0)

    if targ == 'head'          goto get_targ
    if targ == 'thunks'        goto get_targ
    if targ == 'loader'        goto get_targ
    if targ == 'loader-dynext' goto get_dynext_loader
    if targ == 'coda'          goto get_targ
    if targ == 'all'           goto all
    if targ == 'all-dynext'    goto all_dynext
    if targ == 'names'         goto names
    if targ == 'signatures'    goto signatures

    # unknown target
    $S0 = 'sprintf'("Unknown target type '%s'", targ)
    die $S0

  all:
    $S0 = 'get_head'(sigs)
    say $S0
    $S0 = 'get_thunks'(sigs)
    say $S0
    $S0 = 'get_loader'(sigs)
    say $S0
    $S0 = 'get_coda'(sigs)
    say $S0
    exit 0

  all_dynext:
    $S0 = 'get_head'(sigs)
    say $S0
    $S0 = 'get_thunks'(sigs)
    say $S0
    $S0 = 'get_dynext_loader'(sigs)
    say $S0
    $S0 = 'get_coda'(sigs)
    say $S0
    exit 0

  get_dynext_loader:
    $S0 = 'get_dynext_loader'(sigs)
    say $S0
    exit 0

  get_targ:
    $S0 = concat 'get_', targ
    $P0 = get_global $S0
    $S1 = $P0(sigs)
    say $S1
    exit 0

  names:
    die "names not yet implemented"
  signatures:
    die "signatures not yet implemented"
.end

# getopt stuff {{{

.macro_const OUTPUT                 'output'
.macro_const THUNK_STORAGE_CLASS    'thunk-storage-class'
.macro_const THUNK_NAME_PROTO       'thunk-name-proto'
.macro_const LOADER_STORAGE_CLASS   'loader-storage-class'
.macro_const LOADER_NAME            'loader-name'
.macro_const CORE                   'core'
.macro_const NO_WARN_DUPS           'no-warn-dups'

.sub 'get_options'
    .param pmc argv

    load_bytecode 'Getopt/Obj.pbc'

    .local pmc getopt
    getopt = new ['Getopt';'Obj']
    push getopt, 'help|h'
    push getopt, 'version|v'
    push getopt, 'no-warn-dups|f'
    push getopt, 'core'
    push getopt, 'dynext'
    push getopt, 'output|o=s'
    push getopt, 'target=s'
    push getopt, 'thunk-storage-class=s'
    push getopt, 'thunk-name-proto=s'
    push getopt, 'loader-storage-class=s'
    push getopt, 'loader-name=s'

    .local string prog_name
    prog_name = shift argv

    .local pmc opt
    opt = getopt.'get_options'(argv)

    $I0 = opt['help']
    if $I0 goto print_help

    $I0 = opt['version']
    if $I0 goto print_version

    'fixup_opts'(opt)

    set_global .OPTS_GLOBAL_NAME, opt
    .return()

  print_help:
    'usage'(prog_name)
  print_version:
    'version'(prog_name)
.end

.sub 'usage'
    .param string prog_name
    print prog_name
    say ' - Parrot NCI thunk library creation utility'
    say <<'USAGE'

Creates a C file of routines suitable for use as Parrot NCI thunks.

Usage ./parrot nci_thunk_gen.pir [options] -o output_c_file.c <input_signature_list.nci

Options
    --help              print this message and exit
    --version           print the version number of this utility
    -f --no-warn-dups   don't complain about duplicated signatures. Default is to warn.
    --core              output a thunks file suitable for inclusion in Parrot core. Default is no.
    --dynext            use default values for loader-name, loader-storage-class, and target
                        suitable for use in a Parrot dynext library.
    -o --output <file>  specify output file to use.
    --target <target>   select what to output (valid options are 'head', 'thunks',
                        'loader', 'loader-dynext', 'coda', 'all', 'all-dynext', 'names', and
                        'signatures'). Default value is 'all'
    --thunk-storage-class <storage class>
                        set the storage class used for the thunks. Default value is 'static'.
    --thunk-name-proto <printf prototype>
                        set the prototype used for the thunk function names. Must be a printf
                        format with arity 1. Default value is 'pcf_%s'
    --loader-storage-class
                        set the storage class used for the loader function. Default value is none.
    --loader-name       set the name used for the loader function. Default value is
                        'Parrot_load_nci_thunks'.
USAGE
    exit 0
.end

.sub 'version'
    .param string prog_name
    print prog_name
    print ' version '
    say .VERSION
    exit 0
.end

.sub 'fixup_opts'
    .param pmc opts

    $I0 = defined opts['no-warn-dups']
    if $I0 goto end_no_warn_dups
        opts['no-warn-dups'] = ''
    end_no_warn_dups:

    $I0 = defined opts['core']
    if $I0 goto in_core
        opts['core'] = ''
        goto end_core
    in_core:
        opts['core'] = 'true'
    end_core:

    $I0 = defined opts['dynext']
    if $I0 goto is_dynext
        opts['dynext'] = ''
        goto end_dynext
    is_dynext:
        $I0 = defined opts['target']
        if $I0 goto end_dynext_target
            opts['target'] = 'all-dynext'
        end_dynext_target:

        $I0 = defined opts['loader-storage-class']
        if $I0 goto end_dynext_loader_storage_class
            opts['loader-storage-class'] = 'PARROT_DYNEXT_EXPORT'
        end_dynext_loader_storage_class:

        $I0 = defined opts['loader-name']
        if $I0 goto end_dynext_loader_name
            $S0 = opts['output']
            ($S0, $S1, $S0) = 'file_basename'($S0, '.c')
            $S0 = 'sprintf'('Parrot_lib_%s_init', $S1)
            opts['loader-name'] = $S0
        end_dynext_loader_name:
    end_dynext:

    $I0 = defined opts['target']
    if $I0 goto end_target
        opts['target'] = 'all'
    end_target:

    $I0 = defined opts['thunk-storage-class']
    if $I0 goto end_thunk_storage_class
        opts['thunk-storage-class'] = 'static'
    end_thunk_storage_class:

    $I0 = defined opts['thunk-name-proto']
    if $I0 goto end_thunk_name_proto
        opts['thunk-name-proto'] = 'pcf_%s'
    end_thunk_name_proto:

    $S0 = opts['thunk-name-proto']
    $I0 = 'printf_arity'($S0)
    if $I0 == 1 goto end_thunk_name_proto_printf_arity
        'sprintf'("Provided proto for 'thunk-name-proto' is of incorrect arity %i (expected 1)", $I0)
        die $S0
    end_thunk_name_proto_printf_arity:

    $I0 = defined opts['loader-storage-class']
    if $I0 goto end_loader_storage_class
        opts['loader-storage-class'] = ''
    end_loader_storage_class:

    $I0 = defined opts['loader-name']
    if $I0 goto end_loader_name
        opts['loader-name'] = 'Parrot_load_nci_thunks'
    end_loader_name:
.end

.sub 'read_from_opts'
    .param string key

    .local pmc opts
    opts = get_global .OPTS_GLOBAL_NAME

    $I0 = defined opts[key]
    unless $I0 goto not_present

    $S0 = opts[key]
    .return ($S0)

  not_present:
    $S0 = 'sprintf'("Parameter '%s' required but not provided", key)
    die $S0
.end

# }}}

# get_{head,thunks,loader,dynext_loader,coda} {{{

.sub 'get_head'
    .param pmc ignored :slurpy

    .local string in_core
    in_core = 'read_from_opts'(.CORE)

    .local string ext_defn
    ext_defn = ''
    if in_core goto end_ext_defn
        ext_defn = '#define PARROT_IN_EXTENSION'
    end_ext_defn:

    .local string c_file
    c_file = 'read_from_opts'(.OUTPUT)

    .local string str_file
    ($S0, str_file, $S0) = 'file_basename'(c_file, '.c')
    str_file = concat str_file, '.str'

    .local string head
    head = 'sprintf'(<<'HEAD', c_file, ext_defn, str_file)
/* ex: set ro ft=c:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically by tools/dev/nci_thunk_gen.pir
 *
 * Any changes made here will be lost!
 *
 */

/* %s
 *  Copyright (C) 2010, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Native Call Interface routines. The code needed to build a
 *     parrot to C call frame is in here
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

%s
#include "parrot/parrot.h"
#include "pmc/pmc_nci.h"


#ifdef PARROT_IN_EXTENSION
/* external libraries can't have strings statically compiled into parrot */
#  define CONST_STRING(i, s) Parrot_str_new_constant((i), (s))
#else
#  include "%s"
#endif

/* HEADERIZER HFILE: none */
/* HEADERIZER STOP */

/* All our static functions that call in various ways. Yes, terribly
   hackish, but that is just fine */

HEAD
    .return (head)
.end

.sub 'get_thunks'
    .param pmc sigs
    .local string code
    .local int i, n
    code = ''
    i = 0
    n = sigs
    loop:
        if i >= n goto end_loop

        .local pmc sig
        sig = sigs[i]
        $S0 = 'sig_to_fn_code'(sig :flat)
        code = concat code, $S0

        inc i
        goto loop
    end_loop:
    .return (code)
.end

.sub 'get_loader'
    .param pmc sigs

    $S0 = 'get_loader_decl'(sigs)
    $S1 = 'get_loader_body'(sigs)
    $S2 = 'sprintf'(<<'LOADER', $S0, $S1)
%s {
%s
}
LOADER
    .return ($S2)
.end

.sub 'get_loader_decl'
    .param pmc sigs
    $S0 = 'read_from_opts'(.LOADER_STORAGE_CLASS)
    $S1 = 'read_from_opts'(.LOADER_NAME)
    $S2 = 'sprintf'(<<'DECL', $S0, $S1)
%s void
%s(PARROT_INTERP)
DECL
    .return ($S2)
.end

.sub 'get_dynext_loader'
    .param pmc sigs

    $S0 = 'get_dynext_loader_decl'(sigs)
    $S1 = 'get_loader_body'(sigs)
    $S2 = 'sprintf'(<<'LOADER', $S0, $S1)
%s {
%s
}
LOADER
    .return ($S2)
.end

.sub 'get_dynext_loader_decl'
    .param pmc sigs

    $S0 = 'read_from_opts'(.LOADER_STORAGE_CLASS)
    $S1 = 'read_from_opts'(.LOADER_NAME)
    $S2 = 'sprintf'(<<'DECL', $S0, $S1)
%s void
%s(PARROT_INTERP, SHIM(PMC *lib))
DECL
    .return ($S2)
.end

.sub 'get_loader_body'
    .param pmc sigs
    .local string code
    code = 'sprintf'(<<'HEADER', $S0, $S1)
    PMC * const iglobals = interp->iglobals;
    PMC *nci_funcs;
    PMC *temp_pmc;

    PARROT_ASSERT(!(PMC_IS_NULL(iglobals)));

    nci_funcs = VTABLE_get_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FUNCS);
    PARROT_ASSERT(!(PMC_IS_NULL(nci_funcs)));

HEADER

    .local int i, n
    i = 0
    n = sigs
    loop:
        if i >= n goto end_loop

        .local pmc sig
        sig = shift sigs

        .local string fn_name
        fn_name = 'sig_to_fn_name'(sig :flat)

        .local string key
        key = join '', sig

        $S0 = 'sprintf'(<<'TEMPLATE', fn_name, key)
    temp_pmc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
    VTABLE_set_pointer(interp, temp_pmc, (void *)%s);
    VTABLE_set_pmc_keyed_str(interp, nci_funcs, CONST_STRING(interp, "%s"), temp_pmc);

TEMPLATE
        code = concat code, $S0

        inc i
        goto loop
    end_loop:

    .return (code)
.end

.sub 'get_coda'
    .param pmc ignored :slurpy
    .return (<<'CODA')

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
CODA
.end

# }}}

# sig_to_* {{{

.sub 'sig_to_fn_code'
    .param pmc args :slurpy

    .local string fn_decl
    fn_decl = 'sig_to_fn_decl'(args :flat)

    .local string var_decls
    var_decls = 'sig_to_var_decls'(args :flat)

    .local string preamble
    preamble = 'sig_to_preamble'(args :flat)

    .local string call
    call = 'sig_to_call'(args :flat)

    .local string postamble
    postamble = 'sig_to_postamble'(args :flat)

    .local string fn_code
    fn_code = 'sprintf'("%s{\n%s%s%s%s}\n", fn_decl, var_decls, preamble, call, postamble)

    .return (fn_code)
.end

.sub 'sig_to_postamble'
    .param string ret
    .param string params

    .local string final_assign
    $P0 = 'map_from_sig_table'(ret, 'ret_assign')
    final_assign = $P0[0]

    .local string extra_postamble
    $P0 = 'map_from_sig_table'(params, 'postamble_tmpl')
    'fill_tmpls_ascending_ints'($P0)
    extra_postamble = join "\n", $P0

    .local string postamble
    postamble = 'sprintf'(<<'TEMPLATE', final_assign, extra_postamble)
    %s
    %s
TEMPLATE
    .return (postamble)
.end

.sub 'sig_to_call'
    .param string ret
    .param string params

    .local string return_assign
    $P0 = 'map_from_sig_table'(ret, 'func_call_assign')
    return_assign = $P0[0]

    .local string ret_cast
    $P0 = 'map_from_sig_table'(ret, 'as_return')
    ret_cast = $P0[0]
    if ret_cast == 'void' goto void_fn
        ret_cast = 'sprintf'('(%s)', ret_cast)
        goto end_ret_cast
    void_fn:
        ret_cast = ''
    end_ret_cast:

    .local string call_params
    $P0 = 'map_from_sig_table'(params, 'call_param_tmpl')
    'fill_tmpls_ascending_ints'($P0)
    call_params = join ', ', $P0

    .local string call
    call = 'sprintf'(<<'TEMPLATE', return_assign, ret_cast, call_params)
    GETATTR_NCI_orig_func(interp, nci, orig_func);
    fn_pointer = (func_t)D2FPTR(orig_func);
    %s %s(*fn_pointer)(%s);
TEMPLATE
    .return (call)
.end

.sub 'sig_to_preamble'
    .param string ret
    .param string params

    unless params goto return

    .local string sig
    $P0 = 'map_from_sig_table'(params, 'sig_char')
    sig = join "", $P0

    .local string fill_params
    $P0 = 'map_from_sig_table'(params, 'fill_params_tmpl')
    'fill_tmpls_ascending_ints'($P0)
    fill_params = join "", $P0

    .local string extra_preamble
    $P0 = 'map_from_sig_table'(params, 'preamble_tmpl')
    'fill_tmpls_ascending_ints'($P0)
    extra_preamble = join "", $P0

    .local string preamble
    preamble = 'sprintf'(<<'TEMPLATE', sig, fill_params, extra_preamble)
    Parrot_pcc_fill_params_from_c_args(interp, call_object, "%s"%s);
    %s
TEMPLATE

  return:
    .return (preamble)
.end

.sub 'sig_to_var_decls'
    .param string ret
    .param string params

    .local string ret_csig
    $P0 = 'map_from_sig_table'(ret, 'as_return')
    ret_csig = $P0[0]

    .local string params_csig
    $P0 = 'map_from_sig_table'(params, 'as_proto')
    params_csig = join ', ', $P0
    if params_csig goto end_default_params_csig_to_void
        params_csig = 'void'
    end_default_params_csig_to_void:

    .local string ret_tdecl
    ret_tdecl = ""
    $P0 = 'map_from_sig_table'(ret, 'return_type')
    $S0 = $P0[0]
    unless $S0 goto end_ret_type
    if $S0 == 'void' goto end_ret_type
        $S0 = 'sprintf'("%s return_data;\n", $S0)
        ret_tdecl = concat ret_tdecl, $S0
    end_ret_type:
    $P0 = 'map_from_sig_table'(ret, 'final_dest')
    $S0 = $P0[0]
    unless $S0 goto end_final_dest
        $S0 = concat $S0, "\n"
        ret_tdecl = concat ret_tdecl, $S0
    end_final_dest:

    .local string params_tdecl
    $P0 = 'map_from_sig_table'(params, 'temp_tmpl')
    'fill_tmpls_ascending_ints'($P0)
    $P0 = 'grep_for_true'($P0)
    params_tdecl = join ";\n    ", $P0

    .local string var_decls
    var_decls = 'sprintf'(<<'TEMPLATE', ret_csig, params_csig, ret_tdecl, params_tdecl)
    typedef %s(* func_t)(%s);
    func_t fn_pointer;
    void *orig_func;
    PMC *       ctx         = CURRENT_CONTEXT(interp);
    PMC * const call_object = Parrot_pcc_get_signature(interp, ctx);
    PMC *       ret_object  = PMCNULL;
    %s
    %s;
    UNUSED(return_data); /* Potentially unused, at least */
TEMPLATE

    .return (var_decls)
.end

.sub 'sig_to_fn_decl'
    .param pmc sig :slurpy
    .local string storage_class, fn_name, fn_decl
    storage_class = 'read_from_opts'(.THUNK_STORAGE_CLASS)
    fn_name = 'sig_to_fn_name'(sig :flat)
    fn_decl = 'sprintf'(<<'TEMPLATE', storage_class, fn_name)
%s void
%s(PARROT_INTERP, PMC *nci, SHIM(PMC *self))
TEMPLATE
    .return (fn_decl)
.end

.sub 'sig_to_fn_name'
    .param string ret
    .param string params

    .local string fix_params
    $P0 = 'map_from_sig_table'(params, 'cname')
    fix_params = join '', $P0


    $S0 = 'sprintf'('%s_%s', ret, fix_params)
    $S1 = 'read_from_opts'(.THUNK_NAME_PROTO)
    $S2 = 'sprintf'($S1, $S0)
    .return ($S2)
.end

.sub 'map_from_sig_table'
    .param string sig
    .param string field_name

    .local pmc sig_table
    sig_table = get_global .SIG_TABLE_GLOBAL_NAME

    $P0 = split '', sig

    .local pmc result
    result = new ['ResizableStringArray']
    $I0 = $P0
    result = $I0

    $I0 = $P0
    $I1 = 0
    loop:
        if $I1 >= $I0 goto end_loop
        $S0 = $P0[$I1]
        $S1 = sig_table[$S0; field_name]
        result[$I1] = $S1
        inc $I1
        goto loop
    end_loop:

    .return (result)
.end

# }}}

# read_sigs {{{

.sub 'read_sigs'
    .local pmc stdin, seen, sigs
    $P0 = getinterp
    .include 'stdio.pasm'
    stdin = $P0.'stdhandle'(.PIO_STDIN_FILENO)
    seen  = new ['Hash']
    sigs  = new ['ResizablePMCArray']

    .local int no_warn_dups
    no_warn_dups = 'read_from_opts'(.NO_WARN_DUPS)

    .local int lineno
    lineno = 0
    read_loop:
        unless stdin goto end_read_loop

        .local string ret_sig, param_sig, full_sig
        (ret_sig, param_sig) = 'read_one_sig'(stdin)
        inc lineno
        full_sig = concat ret_sig, param_sig

        # filter out empty sigs (and empty lines)
        unless full_sig goto read_loop

        # de-dup sigs
        $I0 = seen[full_sig]
        unless $I0 goto unseen
            if no_warn_dups goto end_dup_warn
                $S0 = 'sprintf'(<<'ERROR', full_sig, lineno, $I0)
Ignored signature '%s' on line %d (previously seen on line %d)
ERROR
                $P0 = getinterp
                .include 'stdio.pasm'
                $P1 = $P0.'stdhandle'(.PIO_STDERR_FILENO)
                $P1.'print'($S0)
            end_dup_warn:
            goto read_loop
        unseen:
        seen[full_sig] = lineno

        .local pmc sig
        sig = new ['ResizableStringArray']
        sig = 2
        sig[0] = ret_sig
        sig[1] = param_sig
        push sigs, sig

        goto read_loop
    end_read_loop:

    .return (sigs)
.end

.sub 'read_one_sig'
    .param pmc fh

    .local string line
    line = fh.'readline'()

    # handle comments
    $I0 = index line, '#'
    if $I0 < 0 goto end_comment
        line = substr line, 0, $I0
    end_comment:

    # convert whitespace into spaces
    .const 'Sub' $P0 = 'alternate_whitespaces'
    $P1 = iter $P0
    outer_whitespace_loop:
        unless $P1 goto end_outer_whitespace_loop
        $S0 = shift $P1

        inner_whitespace_loop:
            $I0 = index line, $S0
            if $I0 < 0 goto end_inner_whitespace_loop
            line = replace line, $I0, 1, ' '
            goto inner_whitespace_loop
        end_inner_whitespace_loop:

        goto outer_whitespace_loop
    end_outer_whitespace_loop:

    # turn multiple spaces into a single space
    multispace_loop:
        $I0 = index line, '  '
        if $I0 < 0 goto end_multispace_loop
        $S0  = substr line, $I0, 2
        line = replace line, $I0, 2, ' '
        goto multispace_loop
    end_multispace_loop:

    # remove leading whitespace
    $S0 = substr line, 0, 1
    unless $S0 == ' ' goto end_leading
        $S0  = substr line, 0, 1
        line = replace line, 0, 1, ' '
    end_leading:

    # handle empty (or whitespace only) lines
    if line == '' goto ret
    if line == ' ' goto ret

    # remove trailing whitespace
    $S0 = substr line, -1, 1
    unless $S0 == ' ' goto end_trailing
        $S0  = substr line, -1, 1
        line = replace line, -1, 1, ''
    end_trailing:

    # read the signature
    .local string ret_sig, param_sig
    $P0 = split ' ', line
    ret_sig   = $P0[0]
    param_sig = $P0[1]

  ret:
    .return (ret_sig, param_sig)
.end

#}}}

# gen_sigtable {{{

.sub 'gen_sigtable'
    .const string json_table = <<'JSON'
{
    "p": { "as_proto":   "void *",
           "final_dest": "PMC * final_destination = PMCNULL;",
           "temp_tmpl": "PMC *t_%i",
           "sig_char":   "P",
           "call_param_tmpl": "PMC_IS_NULL((PMC*)t_%i) ? (void *)NULL : VTABLE_get_pointer(interp, t_%i)",
           "ret_assign": "if (return_data != NULL) {
                             final_destination = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
                             VTABLE_set_pointer(interp, final_destination, return_data);
                          }
                          ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, \"P\", final_destination);" },
    "i": { "as_proto": "int", "sig_char": "I",
           "return_type": "INTVAL" },
    "l": { "as_proto": "long",   "sig_char": "I", "return_type": "INTVAL" },
    "c": { "as_proto": "char",   "sig_char": "I", "return_type": "INTVAL" },
    "s": { "as_proto": "short",  "sig_char": "I", "return_type": "INTVAL" },
    "f": { "as_proto": "float",  "sig_char": "N", "return_type": "FLOATVAL" },
    "d": { "as_proto": "double", "sig_char": "N", "return_type": "FLOATVAL" },
    "t": { "as_proto": "char *",
           "final_dest": "STRING *final_destination;",
           "ret_assign": "final_destination = Parrot_str_new(interp, return_data, 0);
           ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, \"S\", final_destination);",
           "sig_char": "S",
           "temp_tmpl": "char *t_%i; STRING *ts_%i",
           "fill_params_tmpl": ", &ts_%i",
           "preamble_tmpl": "t_%i = STRING_IS_NULL(ts_%i) ? (char *)NULL : Parrot_str_to_cstring(interp, ts_%i);",
           "postamble_tmpl": "if (t_%i) Parrot_str_free_cstring(t_%i);" },
    "v": { "as_proto": "void",
           "return_type": "void *",
           "sig_char": "v",
           "ret_assign": "",
           "func_call_assign": "" },
    "P": { "as_proto": "PMC *", "sig_char": "P" },
    "O": { "as_proto": "PMC *", "returns": "", "sig_char": "Pi" },
    "J": { "as_proto": "PARROT_INTERP",
           "returns": "",
           "fill_params_tmpl": "",
           "call_param_tmpl": "interp",
           "temp_tmpl": "",
           "sig_char": "" },
    "S": { "as_proto": "STRING *", "sig_char": "S" },
    "I": { "as_proto": "INTVAL", "sig_char": "I" },
    "N": { "as_proto": "FLOATVAL", "sig_char": "N" },
    "b": { "as_proto": "void *",
           "as_return": "",
           "sig_char": "S",
           "temp_tmpl":"STRING *t_%i",
           "call_param_tmpl": "Buffer_bufstart(t_%i)" },
    "B": { "as_proto": "char **",
           "as_return": "",
           "sig_char": "S",
           "fill_params_tmpl": ", &ts_%i",
           "temp_tmpl": "char *t_%i; STRING *ts_%i",
           "preamble_tmpl": "t_%i = STRING_IS_NULL(ts_%i) ? (char *) NULL : Parrot_str_to_cstring(interp, ts_%i);",
           "call_param_tmpl": "&t_%i",
           "postamble_tmpl": "if (t_%i) Parrot_str_free_cstring(t_%i);" },
    "2": { "as_proto": "short *",
           "sig_char": "P",
           "return_type": "short",
           "ret_assign": "ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, \"I\", return_data);",
           "temp_tmpl": "PMC *t_%i; short i_%i",
           "preamble_tmpl": "i_%i = VTABLE_get_integer(interp, t_%i);",
           "call_param_tmpl": "&i_%i",
           "postamble_tmpl": "VTABLE_set_integer_native(interp, t_%i, i_%i);" },
    "3": { "as_proto": "int *",
           "sig_char": "P",
           "return_type": "int",
           "ret_assign": "ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, \"I\", return_data);",
           "temp_tmpl": "PMC *t_%i; int i_%i",
           "preamble_tmpl": "i_%i = VTABLE_get_integer(interp, t_%i);",
           "call_param_tmpl": "&i_%i",
           "postamble_tmpl": "VTABLE_set_integer_native(interp, t_%i, i_%i);" },
    "4": { "as_proto": "long *",
           "sig_char": "P",
           "return_type": "long",
           "ret_assign": "ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, \"I\", return_data);",
           "temp_tmpl": "PMC *t_%i; long i_%i",
           "preamble_tmpl": "i_%i = VTABLE_get_integer(interp, t_%i);",
           "call_param_tmpl": "&i_%i",
           "postamble_tmpl": "VTABLE_set_integer_native(interp, t_%i, i_%i);" },
    "L": { "as_proto": "long *", "as_return": "" },
    "T": { "as_proto": "char **", "as_return": "" },
    "V": { "as_proto": "void **",
           "as_return": "",
           "sig_char": "P",
           "temp_tmpl": "PMC *t_%i; void *v_%i",
           "preamble_tmpl": "v_%i = VTABLE_get_pointer(interp, t_%i);",
           "call_param_tmpl": "&v_%i",
           "postamble_tmpl": "VTABLE_set_pointer(interp, t_%i, v_%i);" },
    "@": { "as_proto": "PMC *", "as_return": "", "cname": "xAT_", "sig_char": "Ps" }
}
JSON

    # decode table
    .local pmc compiler
    load_language 'data_json'
    compiler = compreg 'data_json'

    .local pmc table
    $P0 = compiler.'compile'(json_table)
    table = $P0()

    # fixup table
    .local pmc table_iter
    table_iter = iter table
  iter_loop:
    unless table_iter goto iter_end

    .local string k
    .local pmc v
    k = shift table_iter
    v = table[k]

    $I0 = exists v['cname']
    if $I0 goto has_cname
        v['cname'] = k
    has_cname:

    $I0 = exists v['as_return']
    if $I0 goto has_as_return
        $S0 = v['as_proto']
        v['as_return'] = $S0
    has_as_return:

    $I0 = exists v['return_type']
    if $I0 goto has_return_type
        $S0 = v['as_proto']
        v['return_type'] = $S0
    has_return_type:

    $I0 = exists v['ret_assign']
    $I1 = exists v['sig_char']
    $I1 = !$I1
    $I0 = $I0 || $I1 # not (not exists v[ret_assign] and exists v[sig_char])
    if $I0 goto has_ret_assign
        $S0 = 'ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, "'
        $S1 = v['sig_char']
        $S0 = concat $S0, $S1
        $S0 = concat $S0, '", return_data);'
        v['ret_assign'] = $S0
    has_ret_assign:

    $I0 = exists v['func_call_assign']
    if $I0 goto has_func_call_assign
        v['func_call_assign'] = 'return_data = '
    has_func_call_assign:

    $I0 = exists v['temp_tmpl']
    if $I0 goto has_temp_tmpl
        $S0 = v['return_type']
        $S0 = concat $S0, " t_%i"
        v['temp_tmpl'] = $S0
    has_temp_tmpl:

    $I0 = exists v['fill_params_tmpl']
    if $I0 goto has_fill_params_tmpl
        v['fill_params_tmpl'] = ', &t_%i'
    has_fill_params_tmpl:

    $I0 = exists v['call_param_tmpl']
    if $I0 goto has_call_param_tmpl
        v['call_param_tmpl'] = 't_%i'
    has_call_param_tmpl:

    goto iter_loop
  iter_end:

    set_global .SIG_TABLE_GLOBAL_NAME, table
.end

# }}}

# utility fn's {{{

.sub 'sprintf'
    .param string tmpl
    .param pmc args :slurpy
    $S0 = sprintf tmpl, args
    .return ($S0)
.end

.sub 'fill_tmpls_ascending_ints'
    .param pmc tmpls
    .local int idx, n

    idx = 0
    n = tmpls
    loop:
        if idx >= n goto end_loop
        $S0 = tmpls[idx]
        $I0 = 'printf_arity'($S0)
        $P0 = 'xtimes'(idx, $I0)
        $S1 = sprintf $S0, $P0
        tmpls[idx] = $S1
        inc idx
        goto loop
    end_loop:
.end

.sub 'printf_arity'
    .param string tmpl

    .local int count, idx
    idx = 0
    count = 0

    loop:
        idx = index tmpl, '%', idx
        if idx < 0 goto end_loop

        # check against '%%' escapes
        $I0 = idx + 1
        $S0 = substr tmpl, $I0, 1
        unless $S0 == '%' goto is_valid_placeholder
            idx = idx + 2 # skip both '%'s
            goto loop
        is_valid_placeholder:

        inc idx
        inc count
        goto loop
    end_loop:

    .return (count)
.end

.sub 'xtimes'
    .param pmc what
    .param int times

    .local pmc retv
    retv = new ['ResizablePMCArray']
    retv = times

    $I0 = 0
    loop:
        if $I0 >= times goto end_loop
        retv[$I0] = what
        inc $I0
        goto loop
    end_loop:

    .return (retv)
.end

.sub 'grep_for_true'
    .param pmc input
    .local pmc output
    .local int i, n
    output = new ['ResizableStringArray']
    i = 0
    n = input
    loop:
        if i >= n goto end_loop
        $S0 = input[i]
        unless $S0 goto end_cond
            push output, $S0
        end_cond:
        inc i
        goto loop
    end_loop:

    .return (output)
.end

.sub 'file_basename'
    .param string full_path
    .param pmc extns :slurpy

    .local string dir, file, extn

    # replace native file separator with '/'
    $S0 = 'native_file_separator'()
    $P0 = split $S0, full_path
    file = join "/", $P0

    $P0 = split '/', file
    file = pop $P0
    dir = join '/', $P0

    extn_loop:
        unless extns goto end_extn_loop
        $S0 = shift extns
        $I0 = length $S0
        $I1 = -$I0
        $S1 = substr file, $I1, $I0
        unless $S1 == $S0 goto extn_loop
        extn = $S1
        file = replace file, $I1, $I0, ''
    end_extn_loop:

    .return (dir, file, extn)
.end

.sub 'native_file_separator'
    load_bytecode 'config.pbc'
    $P0 = '_config'()
    $S0 = $P0['slash']
    .return ($S0)
.end

.sub 'alternate_whitespaces' :anon :immediate
    $P0 = new ['ResizableStringArray']
    push $P0, "\t"
    push $P0, "\n"
    push $P0, "\r"
    .return ($P0)
.end

# }}}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

