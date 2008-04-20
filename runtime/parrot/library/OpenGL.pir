=head1 NAME

OpenGL - Parrot extension for OpenGL bindings

=head1 SYNOPSIS

TBD

=head1 DESCRIPTION

This library is a straightforward Parrot NCI wrapper for OpenGL, GLU, and
GLUT.  It is still a work in progress; work will generally start with the
oldest, most widely supported functions and progress to the most recently
standardized calls.

=head2 Initialization

The initialization routines are mostly for internal use only.  They
include:

=over 4

=cut


.namespace ['OpenGL']

.include 'datatypes.pasm'
.include 'iterator.pasm'


=item _opengl_init()

At module load time, calls the other initialization routines in the proper
order.

=cut

.sub _opengl_init :load
    _load_opengl_libs()
    _wrap_all_opengl_entry_points()
.end


=item _load_opengl_libs()

Opens all relevent OpenGL system libraries.  For portability, tries each of
the known different filenames for each library in turn before giving up.

=cut

.sub _load_opengl_libs
    .local pmc libgl, libglu, libglut, libglutcb
    .local pmc libnci_test
    .local pmc libnames

    libnames = new 'ResizableStringArray'
    push libnames, 'libGL'
    push libnames, '/System/Library/Frameworks/OpenGL.framework/OpenGL'
    libgl = load_lib_with_fallbacks('GL', libnames)
    set_global 'libgl', libgl

    libnames = new 'ResizableStringArray'
    push libnames, 'libGLU'
    push libnames, '/System/Library/Frameworks/OpenGL.framework/OpenGL'
    libglu = load_lib_with_fallbacks('GLU', libnames)
    set_global 'libglu', libglu

    libnames = new 'ResizableStringArray'
    push libnames, 'libglut'
    push libnames, '/System/Library/Frameworks/GLUT.framework/GLUT'
    libglut = load_lib_with_fallbacks('GLUT', libnames)
    set_global 'libglut', libglut

    libnames = new 'ResizableStringArray'
    push libnames, 'libglutcb'
    libglutcb = load_lib_with_fallbacks('GLUTCB', libnames)
    set_global 'libglutcb', libglutcb
.end


=item load_lib_with_fallbacks(string friendly_name, pmc fallback_list)

This function is more generally useful than just for this module -- it
implements the search for a particular libary that may appear under any
of several different filenames.  The C<fallback_list> should be a simple
array of strings, each naming one of the possible filenames, I<without>
the trailing shared library extension (e.g. C<.dll> or C<.so>).  The
C<friendly_name> is only used to fill in the error message in case no
match can be found on the system.

=cut

.sub load_lib_with_fallbacks
    .param string friendly_name
    .param pmc    fallback_list

    .local pmc    list_iter
    list_iter = new 'Iterator', fallback_list
    list_iter = .ITERATE_FROM_START

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

    .local pmc    exception
    exception = new 'Exception'
    exception['_message'] = message
    throw exception
.end


=item _wrap_all_opengl_entry_points()

Create NCI wrappers for all GL, GLU, and GLUT functions

=cut

.sub _wrap_all_opengl_entry_points
    .local pmc namespace
    namespace = get_namespace

    .local pmc libgl, libglu, libglut, libglutcb
    libgl     = get_global 'libgl'
    libglu    = get_global 'libglu'
    libglut   = get_global 'libglut'
    libglutcb = get_global 'libglutcb'

    .local pmc gl_funcs, glu_funcs, glut_funcs, glutcb_funcs
    gl_funcs     = gl_func_list()
    glu_funcs    = glu_func_list()
    glut_funcs   = glut_func_list()
    glutcb_funcs = glutcb_func_list()

    wrap_nci_list(namespace, libgl,     gl_funcs)
    wrap_nci_list(namespace, libglu,    glu_funcs)
    wrap_nci_list(namespace, libglut,   glut_funcs)
    wrap_nci_list(namespace, libglutcb, glutcb_funcs)
.end

.sub gl_func_list
    .local pmc gl_funcs
    gl_funcs = new 'ResizableStringArray'
    push gl_funcs, 'glBegin'
    push gl_funcs, 'vi'
    push gl_funcs, 'glClear'
    push gl_funcs, 'vi'
    push gl_funcs, 'glColor3f'
    push gl_funcs, 'vfff'
    push gl_funcs, 'glEnd'
    push gl_funcs, 'v'
    push gl_funcs, 'glFlush'
    push gl_funcs, 'v'
    push gl_funcs, 'glVertex3f'
    push gl_funcs, 'vfff'
    push gl_funcs, 'glRotatef'
    push gl_funcs, 'vffff'

    .return (gl_funcs)
.end

.sub glu_func_list
    .local pmc glu_funcs
    glu_funcs = new 'ResizableStringArray'

    .return (glu_funcs)
.end

.sub glut_func_list
    .local pmc glut_funcs
    glut_funcs = new 'ResizableStringArray'
    push glut_funcs, 'glutInit'
    push glut_funcs, 'v3p'
    push glut_funcs, 'glutInitDisplayMode'
    push glut_funcs, 'vi'
    push glut_funcs, 'glutCreateWindow'
    push glut_funcs, 'it'
    push glut_funcs, 'glutDestroyWindow'
    push glut_funcs, 'vi'
    push glut_funcs, 'glutMainLoop'
    push glut_funcs, 'v'
    push glut_funcs, 'glutPostRedisplay'
    push glut_funcs, 'v'
    push glut_funcs, 'glutSwapBuffers'
    push glut_funcs, 'v'

    .return (glut_funcs)
.end

.sub glutcb_func_list
    .local pmc glutcb_funcs
    glutcb_funcs = new 'ResizableStringArray'
    push glutcb_funcs, 'glutcbCloseFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbDisplayFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbIdleFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbMenuDestroyFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbOverlayDisplayFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbWMCloseFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbEntryFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbMenuStateFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbVisibilityFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbWindowStatusFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbButtonBoxFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbDialsFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbMotionFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbPassiveMotionFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbReshapeFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbSpaceballButtonFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbTabletMotionFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbKeyboardFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbKeyboardUpFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbMenuStatusFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbSpaceballMotionFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbSpaceballRotateFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbSpecialFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbSpecialUpFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbMouseFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbMouseWheelFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbTabletButtonFunc'
    push glutcb_funcs, 'vPP'
    push glutcb_funcs, 'glutcbTimerFunc'
    push glutcb_funcs, 'vPPii'
    push glutcb_funcs, 'glutcbJoystickFunc'
    push glutcb_funcs, 'vPPi'

    .return (glutcb_funcs)
.end


=item wrap_nci_list(pmc namespace, pmc library, pmc nci_list)

Create NCI wrappers for every C<library> entry point in C<nci_list>,
and store the results in C<namespace> .  The list should consist of
alternating function names and Parrot NCI signatures.

=cut

.sub wrap_nci_list
    .param pmc namespace
    .param pmc library
    .param pmc nci_list

    .local pmc namespace_key
    namespace_key = namespace.get_name()

    .local pmc list_iter
    list_iter = new 'Iterator', nci_list
    list_iter = .ITERATE_FROM_START

    .local string func_name, signature
    .local pmc    function
  list_loop:
    unless list_iter goto done
    func_name = shift list_iter
    signature = shift list_iter
    function  = dlfunc library, func_name, signature
    set_root_global namespace_key, func_name, function
    goto list_loop

  done:
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
