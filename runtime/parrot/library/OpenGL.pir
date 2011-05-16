# Copyright (C) 2008-2009, Parrot Foundation.

=head1 NAME

OpenGL - Parrot extension for OpenGL bindings

=head1 SYNOPSIS

This covers only the basic OpenGL and GLUT initialization.
For more, look in F<examples/opengl/>, starting with
F<examples/opengl/triangle.pir>.

 # Include OpenGL constants
 .include 'opengl_defines.pasm'

 .sub main :main
    .param pmc argv

    # Load OpenGL library and a helper library for calling glutInit
    load_bytecode 'OpenGL.pbc'
    load_bytecode 'NCI/Utils.pbc'

    # Import all OpenGL/GLU/GLUT functions
    .local pmc import_gl
    import_gl = get_global ['OpenGL'], '_export_all_functions'
    import_gl()

    # Initialize GLUT
    .local pmc call_toolkit_init
    call_toolkit_init = get_global ['NCI';'Utils'], 'call_toolkit_init'

    .const 'Sub' glutInit = 'glutInit'
    argv = call_toolkit_init(glutInit, argv)

    # Set display mode, create GLUT window, save window handle
    .local int mode
    mode = .GLUT_DOUBLE | .GLUT_RGBA
    glutInitDisplayMode(mode)

    .local pmc window
    window = new 'Integer'
    window = glutCreateWindow('My Window Title')
    set_global 'glut_window', window

    # Set up GLUT callbacks
    .const 'Sub' draw     = 'draw'
    .const 'Sub' idle     = 'idle'
    .const 'Sub' keyboard = 'keyboard'
    glutDisplayFunc (draw)
    glutIdleFunc    (idle)
    glutKeyboardFunc(keyboard)

    # Enter the GLUT main loop
    glutMainLoop()
 .end

=head1 DESCRIPTION

This library is a straightforward Parrot NCI wrapper for OpenGL, GLU, and
GLUT.  It is still a work in progress; work will generally start with the
oldest, most widely supported functions and progress to the most recently
standardized calls.  Generally you will find programming GLUT in PIR to be
similar to GLUT in C -- for heavy drawing code, it is sometimes difficult
to tell the difference except for the leading period on PIR constant names
and lack of trailing semicolons on each line.

The following sections describe features of Parrot's OpenGL bindings that
are not part of the core C binding, or where they differ non-trivially.

=head2 Initialization

The initialization routines are mostly for internal use only.  They
include:

=over 4

=cut


.namespace ['OpenGL']

=item _opengl_init()

At module load time, calls the other initialization routines in the proper
order.

=cut

.sub _opengl_init :load
    load_bytecode 'OpenGL_funcs.pbc'
    _load_opengl_libs()
    _wrap_opengl_entry_points()
    _load_nci_thunks()
    _export_opengl_functions()
.end


=item _load_opengl_libs()

Opens all relevant OpenGL system libraries.  For portability, tries each of
the known different filenames for each library in turn before giving up.

=cut

.sub _load_opengl_libs
    .local pmc libgl, libglu, libglut, libglutcb
    .local pmc libnci_test
    .local pmc libnames

    libnames = new 'ResizableStringArray'
    # The following line brought to you by proprietary driver packages
    # that don't update the libGL.so symlink properly, causing FAIL
    push libnames, 'libGL.so.1'
    push libnames, 'libGL'
    push libnames, 'opengl32'
    push libnames, '/System/Library/Frameworks/OpenGL.framework/OpenGL'
    libgl = _load_lib_with_fallbacks('GL', libnames)
    set_global '_libgl', libgl

    libnames = new 'ResizableStringArray'
    push libnames, 'libGLU'
    push libnames, 'glu32'
    push libnames, '/System/Library/Frameworks/OpenGL.framework/OpenGL'
    libglu = _load_lib_with_fallbacks('GLU', libnames)
    set_global '_libglu', libglu

    libnames = new 'ResizableStringArray'
    push libnames, 'libglut'
    push libnames, 'glut32'
    push libnames, '/System/Library/Frameworks/GLUT.framework/GLUT'
    libglut = _load_lib_with_fallbacks('GLUT', libnames)
    set_global '_libglut', libglut

    libnames = new 'ResizableStringArray'
    push libnames, 'libglutcb'
    libglutcb = _load_lib_with_fallbacks('GLUTCB', libnames)
    set_global '_libglutcb', libglutcb
.end


=item _load_lib_with_fallbacks(string friendly_name, pmc fallback_list)

This function is more generally useful than just for this module -- it
implements the search for a particular library that may appear under any
of several different filenames.  The C<fallback_list> should be a simple
array of strings, each naming one of the possible filenames, I<without>
the trailing shared library extension (e.g. C<.dll> or C<.so>).  The
C<friendly_name> is only used to fill in the error message in case no
match can be found on the system.

=cut

.sub _load_lib_with_fallbacks
    .param string friendly_name
    .param pmc    fallback_list

    .local pmc    list_iter
    list_iter = iter fallback_list

    .local string libname
    .local pmc    library
  iter_loop:
    unless list_iter goto failed
    libname = shift list_iter
    library = loadlib libname
    unless library goto iter_loop

  loaded:
    .return (library)

  failed:
    .local string message
    message  = 'Could not find a suitable '
    message .= friendly_name
    message .= ' shared library!'
    die message
.end


=item _wrap_opengl_entry_points()

Create NCI wrappers for all GL, GLU, and GLUT functions

=cut

.sub _wrap_opengl_entry_points
    .local pmc namespace
    namespace = get_namespace

    .local pmc libgl, libglu, libglut, libglutcb
    libgl     = get_global '_libgl'
    libglu    = get_global '_libglu'
    libglut   = get_global '_libglut'
    libglutcb = get_global '_libglutcb'

    .local pmc gl_funcs, glu_funcs, glut_funcs, glutcb_funcs
    gl_funcs     = _gl_func_list()
    glu_funcs    = _glu_func_list()
    glut_funcs   = _glut_func_list()
    glutcb_funcs = _glutcb_func_list()

    _wrap_nci_list(namespace, libgl,     gl_funcs,     0)
    _wrap_nci_list(namespace, libglu,    glu_funcs,    0)
    _wrap_nci_list(namespace, libglut,   glut_funcs,   0)
    _wrap_nci_list(namespace, libglutcb, glutcb_funcs, 1)
.end


=item _wrap_nci_list(pmc namespace, pmc library, pmc nci_list, int first_arg_interp)

Create NCI wrappers for every C<library> entry point in C<nci_list>,
and store the results in C<namespace> .  The list should consist of
alternating function names and Parrot NCI signatures.

=cut

.sub _wrap_nci_list
    .param pmc namespace
    .param pmc library
    .param pmc nci_list
    .param int first_arg_interp

    .local pmc namespace_key
    namespace_key = namespace.'get_name'()

    .local pmc list_iter
    list_iter = iter nci_list

    .local string func_name, signature, cstrings
    .local pmc    function
  list_loop:
    unless list_iter goto done
    func_name = shift list_iter
    signature = shift list_iter
    cstrings  = shift list_iter
    $P0       = '_parse_signature'(signature)
    function  = dlfunc library, func_name, $P0
    function  = '_wrap_cstrings'(function, cstrings)
    unless first_arg_interp goto done_interp_wrap
        .const 'Sub' $P0 = '_call_with_interp'
        $P0 = clone $P0
        $P0(function)
        function = $P0
    done_interp_wrap:
    set_root_global namespace_key, func_name, function
    goto list_loop

  done:
.end

.sub _call_with_interp :anon
    .param pmc func
    $P0 = getinterp
    .yield ()
  call:
    .param pmc args :slurpy
    func($P0, args :flat)
    .yield ()
    goto call
.end

.sub _parse_signature :anon
    .param string sig

    .local pmc get_datatype_enum
    $P0 = null
    get_datatype_enum = dlfunc $P0, 'Parrot_dt_get_datatype_enum', 'IpS'

    .local int i, n
    .local pmc sig_ary, retv
    sig_ary = split ',', sig
    n = elements sig_ary
    retv = new ['FixedIntegerArray'], n

    i = 0
    loop:
        unless i < n goto end_loop
        $S0 = sig_ary[i]
        $P0 = getinterp
        $I0 = get_datatype_enum($P0, $S0)
        retv[i] = $I0
        inc i
        goto loop
    end_loop:

    .return (retv)
.end

.sub '_wrap_cstrings' :anon
    .param pmc    func
    .param string cstrings
    $P0 = split ',', cstrings
    load_bytecode 'NCI/Utils.pbc'
    $P1 = get_root_global ['parrot';'NCI';'Utils'], 'call_with_cstring'
    func = $P1(func, $P0 :flat)
    .return (func)
.end

=back

=head2 Thunk Loading

These routines ensure that all NCI thunks necessary for calling OpenGL functions are
available to Parrot.

=cut

.sub _load_nci_thunks
    # load the nci thunks
    .local pmc ns, loader
    ns = get_namespace
    loader = ns['Parrot_glut_nci_loader']
    loader()

    # delete loader the function, it isn't for public consumption
    $P0 = new ['Undef']
    set_global 'Parrot_glut_nci_loader', $P0
.end

=head2 Symbol Export

These routines allow OpenGL symbols to exported to other namespaces to more
directly replicate the normal OpenGL coding style.  Most calling programs
will want to use at least one of these, probably immediately after loading
this library.

=over 4

=item _export_opengl_functions()

Marks all OpenGL/GLU/GLUT functions as exported (to the default export tags,
currently ALL and DEFAULT).  Unmangles callback names, so that the importing
namespaces see the standard names instead of the mangled versions.  Called
at :load time by _opengl_init().

=cut

.sub _export_opengl_functions
    .local pmc     gl_namespace
    gl_namespace = get_namespace

    .local pmc     gl_ns_iterator, export_list, export_renames
    .local string  symbol, prefix
    gl_ns_iterator = iter gl_namespace
    export_list    = new 'ResizableStringArray'
    export_renames = new 'Hash'

    # Prepare list of symbols and hash of renames for export
  symbol_loop:
    unless gl_ns_iterator goto symbol_loop_end
    symbol = shift gl_ns_iterator

    # For now, only handle symbols starting with 'gl'
    prefix = substr symbol, 0, 2
    unless prefix == 'gl' goto symbol_loop

    # Special-case callbacks
    prefix = substr symbol, 0, 6
    if prefix == 'glutcb' goto rename_callbacks

    # Add all other matching symbols to export list
    push export_list, symbol
    goto symbol_loop

    # Rename all 'glutcb*' symbols to 'glut*'
  rename_callbacks:
    .local string renamed
    renamed = replace symbol, 4, 2, ''
    export_renames[symbol] = renamed
    goto symbol_loop
  symbol_loop_end:

    # Mark all symbols and renames for export
    .local pmc parrot
    load_language 'parrot'
    parrot = compreg 'parrot'
    parrot.'export'(export_list)
    parrot.'export'(export_renames)
.end

=item _export_all_functions(pmc to_namespace :optional)

Export all OpenGL/GLU/GLUT functions to the target C<namespace>.  Unmangles
callback names, so that the receiving namespace sees the standard names
instead of the mangled versions.  If C<to_namespace> is missing, then the
caller's namespace is assumed.

=cut

.sub _export_all_functions
    .param pmc to_namespace :optional
    .param int has_to_ns    :opt_flag

    if has_to_ns goto get_gl_ns
    .local pmc     interp
    interp       = getinterp
    to_namespace = interp['namespace'; 1]

  get_gl_ns:
    .local pmc     gl_namespace
    gl_namespace = get_namespace

    .local pmc     gl_ns_iterator, export_list, export_renames
    .local string  symbol, prefix
    gl_ns_iterator = iter gl_namespace
    export_list    = new 'ResizableStringArray'
    export_renames = new 'Hash'

    # Prepare list of symbols and hash of renames for export
  symbol_loop:
    unless gl_ns_iterator goto symbol_loop_end
    symbol = shift gl_ns_iterator

    # For now, only handle symbols starting with 'gl'
    prefix = substr symbol, 0, 2
    unless prefix == 'gl' goto symbol_loop

    # Special-case callbacks
    prefix = substr symbol, 0, 6
    if prefix == 'glutcb' goto rename_callbacks

    # Add all other matching symbols to export list
    push export_list, symbol
    goto symbol_loop

    # Rename all 'glutcb*' symbols to 'glut*'
  rename_callbacks:
    .local string renamed
    renamed = replace symbol, 4, 2, ''
    export_renames[symbol] = renamed
    goto symbol_loop
  symbol_loop_end:

    # Export all symbols and renames to the requested namespace
    gl_namespace.'export_to'(to_namespace, export_list)
    gl_namespace.'export_to'(to_namespace, export_renames)
.end


=back

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
