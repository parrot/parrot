# Copyright (C) 2010, Parrot Foundation.

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
    $P1.'stdout_handle'($P0)

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
#include "parrot/nci.h"
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
        $S0 = 'sig_to_fn_code'(sig)
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
    $S2 = 'sprintf'(<<'LOADER', $S0, $S0, $S1)
%s;
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
        unless i < n goto end_loop

        .local pmc sig
        sig = shift sigs

        .local string fn_name
        fn_name = 'sig_to_fn_name'(sig)

        .local pmc sb
        sb = new ['StringBuilder']
        push sb, "{ "

        $I0 = 0
        $I1 = elements sig

        array_loop:
            unless $I0 < $I1 goto end_array_loop
            $I2 = sig[$I0]
            $S1 = $I2
            push sb, $S1
            push sb, ", "
            inc $I0
            goto array_loop
        end_array_loop:

        push sb, "}"
        $S0 = sb

        $S0 = 'sprintf'(<<'TEMPLATE', $I1, $S0, fn_name)
    {
        const int n = %s;
        static const int sig[] = %s;
        PMC *sig_pmc = Parrot_pmc_new_init_int(interp, enum_class_FixedIntegerArray, n);
        int i;
        for (i = 0; i < n; i++)
            VTABLE_set_integer_keyed_int(interp, sig_pmc, i, sig[i]);
        temp_pmc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
        VTABLE_set_pointer(interp, temp_pmc, (void *)%s);
        VTABLE_set_pmc_keyed(interp, nci_funcs, sig_pmc, temp_pmc);
    }

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
CODA
.end

# }}}

# sig_to_* {{{

.sub 'sig_to_fn_code'
    .param pmc sig

    .local string fn_decl
    fn_decl = 'sig_to_fn_decl'(sig)

    .local string var_decls
    var_decls = 'sig_to_var_decls'(sig)

    .local string preamble
    preamble = 'sig_to_preamble'(sig)

    .local string call
    call = 'sig_to_call'(sig)

    .local string postamble
    postamble = 'sig_to_postamble'(sig)

    .local string fn_code
    fn_code = 'sprintf'("%s{\n%s%s%s%s}\n", fn_decl, var_decls, preamble, call, postamble)

    .return (fn_code)
.end

.sub 'sig_to_postamble'
    .param pmc sig

    .local string final_assign
    $I0 = sig[0]
    $P0 = 'map_from_sig_table'('ret_assign', $I0)
    final_assign = $P0[0]

    .local string extra_postamble
    $P0 = 'map_from_sig_table'('postamble_tmpl', sig :flat)
    $S0 = shift $P0
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
    .param pmc sig

    .local string return_assign
    $I0 = sig[0]
    $P0 = 'map_from_sig_table'('func_call_assign', $I0)
    return_assign = $P0[0]

    .local string ret_cast
    $P0 = 'map_from_sig_table'('as_return', $I0)
    ret_cast = $P0[0]
    if ret_cast == 'void' goto void_fn
        ret_cast = 'sprintf'('(%s)', ret_cast)
        goto end_ret_cast
    void_fn:
        ret_cast = ''
    end_ret_cast:

    .local string call_params
    $P0 = 'map_from_sig_table'('call_param_tmpl', sig :flat)
    $S0 = shift $P0
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
    .param pmc sig

    .local string pcc_sig
    $P0     = 'map_from_sig_table'('sig_char', sig :flat)
    $S0     = shift $P0
    pcc_sig = join "", $P0

    .local string fill_params
    $P0 = 'map_from_sig_table'('fill_params_tmpl', sig :flat)
    $S0 = shift $P0
    'fill_tmpls_ascending_ints'($P0)
    fill_params = join "", $P0

    .local string extra_preamble
    $P0 = 'map_from_sig_table'('preamble_tmpl', sig :flat)
    $S0 = shift $P0
    'fill_tmpls_ascending_ints'($P0)
    extra_preamble = join "", $P0

    .local string preamble
    preamble = 'sprintf'(<<'TEMPLATE', pcc_sig, fill_params, extra_preamble)
    Parrot_pcc_fill_params_from_c_args(interp, call_object, "%s"%s);
    %s
TEMPLATE

  return:
    .return (preamble)
.end

.sub 'sig_to_var_decls'
    .param pmc sig

    .local string ret_csig
    $I0 = sig[0]
    $P0 = 'map_from_sig_table'('as_return', $I0)
    ret_csig = $P0[0]

    .local string params_csig
    $P0 = 'map_from_sig_table'('as_proto', sig :flat)
    $S0 = shift $P0
    params_csig = join ', ', $P0
    if params_csig goto end_default_params_csig_to_void
        params_csig = 'void'
    end_default_params_csig_to_void:

    .local string ret_tdecl
    ret_tdecl = ""
    $P0 = 'map_from_sig_table'('return_type', $I0)
    $S0 = $P0[0]
    unless $S0 goto end_ret_type
    if $S0 == 'void' goto end_ret_type
        $S0 = 'sprintf'("%s return_data;\n", $S0)
        ret_tdecl = concat ret_tdecl, $S0
    end_ret_type:
    $P0 = 'map_from_sig_table'('final_dest', $I0)
    $S0 = $P0[0]
    unless $S0 goto end_final_dest
        $S0 = concat $S0, "\n"
        ret_tdecl = concat ret_tdecl, $S0
    end_final_dest:

    .local string params_tdecl
    $P0 = 'map_from_sig_table'('temp_tmpl', sig :flat)
    $S0 = shift $P0
    'fill_tmpls_ascending_ints'($P0)
    $P0 = 'grep_for_true'($P0)
    params_tdecl = join ";\n    ", $P0

    .local string var_decls
    var_decls = 'sprintf'(<<'TEMPLATE', ret_csig, params_csig, ret_tdecl, params_tdecl)
    typedef %s(* func_t)(%s);
    func_t fn_pointer;
    void *orig_func;
    PMC * const ctx         = CURRENT_CONTEXT(interp);
    PMC * const call_object = Parrot_pcc_get_signature(interp, ctx);
    PMC *       ret_object  = PMCNULL;
    %s
    %s;
    UNUSED(ret_object);
    UNUSED(return_data); /* Potentially unused, at least */
TEMPLATE

    .return (var_decls)
.end

.sub 'sig_to_fn_decl'
    .param pmc sig
    .local string storage_class, fn_name, fn_decl
    storage_class = 'read_from_opts'(.THUNK_STORAGE_CLASS)
    fn_name = 'sig_to_fn_name'(sig)
    fn_decl = 'sprintf'(<<'TEMPLATE', storage_class, fn_name)
%s void
%s(PARROT_INTERP, PMC *nci, SHIM(PMC *self))
TEMPLATE
    .return (fn_decl)
.end

.sub 'sig_to_fn_name'
    .param pmc sig

    $P0 = 'map_from_sig_table'('cname', sig :flat)
    $S0 = join '_', $P0
    $S1 = 'read_from_opts'(.THUNK_NAME_PROTO)
    $S2 = 'sprintf'($S1, $S0)

    .return ($S2)
.end

.sub 'map_from_sig_table'
    .param string field_name
    .param pmc    sig :slurpy

    .local pmc sig_table
    sig_table = get_global .SIG_TABLE_GLOBAL_NAME

    .local int i, n
    i = 0
    n = elements sig

    .local pmc result
    result = new ['ResizableStringArray'], n

    loop:
        unless i < n goto end_loop
        $S0 = sig[i]
        $S1 = sig_table[$S0; field_name]
        result[i] = $S1
        inc i
        goto loop
    end_loop:

    .return (result)
.end

# }}}

# read_sigs {{{

.include 'hash_key_type.pasm'

.sub 'read_sigs'
    .local pmc stdin, seen, sigs
    $P0 = getinterp
    stdin = $P0.'stdin_handle'()
    seen  = new ['Hash']
    seen.'set_key_type'(.Hash_key_type_PMC)
    sigs  = new ['ResizablePMCArray']

    .local int no_warn_dups
    no_warn_dups = 'read_from_opts'(.NO_WARN_DUPS)

    .local int lineno
    lineno = 0
    read_loop:
        unless stdin goto end_read_loop

        .local pmc sig
        sig = 'read_one_sig'(stdin)
        inc lineno

        # filter out empty sigs (and empty lines)
        if_null sig, read_loop

        # de-dup sigs
        $I0 = seen[sig]
        unless $I0 goto unseen
            if no_warn_dups goto end_dup_warn
                $S0 = get_repr sig
                $S0 = 'sprintf'(<<'ERROR', $S0, lineno, $I0)
Ignored signature '%s' on line %d (previously seen on line %d)
ERROR
                'warn'($S0)
            end_dup_warn:
            goto read_loop
        unseen:
        seen[sig] = lineno

        push sigs, sig

        goto read_loop
    end_read_loop:

    .return (sigs)
.end

.sub 'read_one_sig'
    .param pmc fh

    load_bytecode 'String/Utils.pbc'
    .local pmc chomp
    chomp = get_global ['String';'Utils'], 'chomp'

    # init pcre
    load_bytecode 'pcre.pbc'
    $P0 = get_global ['PCRE'], 'init'
    $P0()

    .local pmc pcre_comp, pcre_match, pcre_dollar
    pcre_comp   = get_global ['PCRE'], 'compile'
    pcre_match  = get_global ['PCRE'], 'match'
    pcre_dollar = get_global ['PCRE'], 'dollar'

    .local pmc empty_line_regex, old_style_sig_line_regex, new_style_sig_line_regex
    .local pmc old_style_sig_item_regex, new_style_sig_item_regex
    .local string pcre_errstr, pcre_errint

    .const int pcre_extended = 0x00000008

    $S0 = "^ [[:space:]]* (?: [#] .* )? $"
    (empty_line_regex, pcre_errstr, pcre_errint) = pcre_comp($S0, pcre_extended)
    if pcre_errint goto pcre_comp_err

    $S0 = "^ [[:space:]]* ( (?: [INSPcsilfdpv] [[:space:]]* )+ ) (?: [#] .* )? $"
    (old_style_sig_line_regex, pcre_errstr, pcre_errint) = pcre_comp($S0, pcre_extended)
    if pcre_errint goto pcre_comp_err

    $S0 = ".*? ([INSPcsilfdpv])"
    (old_style_sig_item_regex, pcre_errstr, pcre_errint) = pcre_comp($S0, pcre_extended)
    if pcre_errint goto pcre_comp_err

    $S0 = <<'REGEX'
^ [[:space:]]* ( [[:word:]]+  [[:space:]]* [(] [[:space:]]*
    (?:
                             [[:word:]]+ [&]? [[:space:]]*
        (?: [,] [[:space:]]* [[:word:]]+ [&]? [[:space:]]* )*
    )?
[)] ) [[:space:]]* (?: [#] .* )? $
REGEX
    (new_style_sig_line_regex, pcre_errstr, pcre_errint) = pcre_comp($S0, pcre_extended)
    if pcre_errint goto pcre_comp_err

    $S0 = ".*? ([[:word:]]+ [&]?)"
    (new_style_sig_item_regex, pcre_errstr, pcre_errint) = pcre_comp($S0, pcre_extended)
    if pcre_errint goto pcre_comp_err

    goto match_line

  pcre_comp_err:
    $S0 = 'sprintf'("Error in PCRE compilation: `%Ss' (%d)", pcre_errstr, pcre_errint)
    die $S0

  match_line:
    .local string line
    line = fh.'readline'()
    line = chomp(line)

    .local int ok
    .local pmc match

    (ok, match) = pcre_match(empty_line_regex, line, 0, 0)
    if ok > 0 goto return

    (ok, match) = pcre_match(old_style_sig_line_regex, line, 0, 0)
    if ok > 0 goto old_style_sig

    (ok, match) = pcre_match(new_style_sig_line_regex, line, 0, 0)
    if ok > 0 goto new_style_sig

    say ok

    $S0 = 'sprintf'("Invalid signature line: `%Ss'", line)
    die $S0

  old_style_sig:
    $S0 = pcre_dollar( line, ok, match, 1 )
    $P0 = 'comb'($S0, old_style_sig_item_regex)
    $S0 = join '', $P0
    $P1 = null
    $P1 = dlfunc $P1, "Parrot_nci_parse_signature", "PpS"
    $P0 = getinterp
    $P3 = $P1($P0, $S0)
    goto return

  new_style_sig:
    $S0 = pcre_dollar( line, ok, match, 1 )
    $P0 = 'comb'($S0, new_style_sig_item_regex)
    $P1 = null
    $P1 = dlfunc $P1, "Parrot_dt_get_datatype_enum", "IpS"
    $P2 = getinterp
    $I0 = 0
    $I1 = elements $P0
    $P3 = new ['FixedIntegerArray'], $I1
    get_type_enum_loop:
        unless $I0 < $I1 goto end_get_type_enum_loop
        $S0 = $P0[$I0]
        $I2 = $P1($P2, $S0)
        $P3[$I0] = $I2
        inc $I0
        goto get_type_enum_loop
    end_get_type_enum_loop:
    goto return

  return:
    .yield ($P3)
    goto match_line
.end
    
#}}}

# gen_sigtable {{{

.include 'datatypes.pasm'

.sub 'gen_sigtable'
    .local pmc table
    table = new ['Hash']
    table.'set_key_type'(.Hash_key_type_int)

    $P1 = 'from_json'(<<'JSON')
{ "as_proto":   "void *",
  "final_dest": "PMC * final_destination = PMCNULL;",
  "temp_tmpl": "PMC *t_%i",
  "sig_char":   "P",
  "call_param_tmpl": "PMC_IS_NULL((PMC*)t_%i) ? (void *)NULL : VTABLE_get_pointer(interp, t_%i)",
  "ret_assign":
      "if (return_data != NULL) {
          final_destination = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
          VTABLE_set_pointer(interp, final_destination, return_data);
       }
       ret_object = Parrot_pcc_build_call_from_c_args(interp, call_object, \"P\", final_destination);" }
JSON
    table[.DATATYPE_PTR]  = $P1

    $P1 = 'from_json'('{ "as_proto": "int", "sig_char": "I", "return_type": "INTVAL" }')
    table[.DATATYPE_INT]  = $P1

    $P1 = 'from_json'('{ "as_proto": "long", "sig_char": "I", "return_type": "INTVAL" }')
    table[.DATATYPE_LONG] = $P1

    $P1 = 'from_json'('{ "as_proto": "char", "sig_char": "I", "return_type": "INTVAL" }')
    table[.DATATYPE_CHAR] = $P1

    $P1 = 'from_json'('{ "as_proto": "short", "sig_char": "I", "return_type": "INTVAL" }')
    table[.DATATYPE_SHORT] = $P1

    $P1 = 'from_json'('{ "as_proto": "float", "sig_char": "N", "return_type": "FLOATVAL" }')
    table[.DATATYPE_FLOAT] = $P1

    $P1 = 'from_json'('{ "as_proto": "double", "sig_char": "N", "return_type": "FLOATVAL" }')
    table[.DATATYPE_DOUBLE] = $P1

    $P1 = 'from_json'(<<'JSON')
{ "as_proto": "void",
  "return_type": "void *",
  "sig_char": "v",
  "ret_assign": "",
  "func_call_assign": "" }
JSON
    table[.DATATYPE_VOID] = $P1

    $P1 = 'from_json'('{ "as_proto": "PMC *", "sig_char": "P" }')
    table[.DATATYPE_PMC] = $P1

    $P1 = 'from_json'('{ "as_proto": "STRING *", "sig_char": "S" }')
    table[.DATATYPE_STRING] = $P1

    $P1 = 'from_json'('{ "as_proto": "INTVAL", "sig_char": "I" }')
    table[.DATATYPE_INTVAL] = $P1

    $P1 = 'from_json'('{ "as_proto": "FLOATVAL", "sig_char": "N" }')
    table[.DATATYPE_FLOATVAL] = $P1

    # fixup table
    .local pmc table_iter
    table_iter = iter table
  iter_loop:
    unless table_iter goto iter_end

    .local int k
    .local pmc v
    $S0 = shift table_iter
    k   = $S0
    v   = table[k]

    $P0 = null
    $P0 = dlfunc $P0, "Parrot_dt_get_datatype_name", "SpI"
    $P1 = getinterp
    $S0 = $P0($P1, k)
    v['cname'] = $S0

    $S0 = v['as_proto']
    v['as_return'] = $S0

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

.sub 'from_json'
    .param string json_str

    .local pmc compiler
    load_language 'data_json'
    compiler = compreg 'data_json'

    $P0 = compiler.'compile'(json_str)
    .tailcall $P0()
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

.sub 'comb'
    .param string s
    .param pmc    pat

    .local pmc pcre_match, pcre_dollar
    pcre_match  = get_global ['PCRE'], 'match'
    pcre_dollar = get_global ['PCRE'], 'dollar'

    .local pmc items
    items = new ['ResizableStringArray']

    .local int i
    i = 0

  match_loop:
    .local int ok
    .local pmc match
    (ok, match) = pcre_match( pat, s, i, 0 )
    unless ok > 0 goto return
    $S0 = pcre_dollar( s, ok, match, 1)
    push items, $S0
    $S0 = pcre_dollar( s, ok, match, 0)
    $I0 = bytelength $S0
    i += $I0
    goto match_loop

  return:
    .return (items)
.end

.sub 'warn'
    .param string msg
    $P0 = getinterp
    $P1 = $P0.'stderr_handle'()
    $P1.'print'(msg)
.end

# }}}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

