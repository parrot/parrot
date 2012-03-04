# Copyright (C) 2008, Parrot Foundation.
# vkon

=head1 TITLE

TclLibrary.pir - NCI interface to Tcl language (http://www.tcl.tk)

=head1 DESCRIPTION

This module implements Tcl/Tk interface for Parrot.

=head1 TODO

=over 2

=item Tcl_GetStringFromObj - check its declaration and usage

  func = dlfunc libtcl, "Tcl_GetStringFromObj", "tpp" # should be "tp3"

=back

=cut

.include "hllmacros.pir"
.include "datatypes.pasm"

.namespace ['TclLibrary']


# derived from tcl.h:
.const int TCL_OK       = 0
.const int TCL_ERROR    = 1
.const int TCL_RETURN   = 2
.const int TCL_BREAK    = 3
.const int TCL_CONTINUE = 4

# DEBUG
.const int debug_objresult = 1

#
.sub eval :method
    .param string str

    .local string res, error
    .local pmc f_evalex, f_getobjresult, f_getstringresult, f_resetresult
    f_resetresult = get_global '_tcl_resetresult'
    f_evalex = get_global '_tcl_evalex'
    f_getobjresult = get_global '_tcl_getobjresult'
    f_getstringresult = get_global '_tcl_getstringresult'

    .local pmc interp
    interp = getattribute self,'interp'

    f_resetresult(interp)

    .local int rc
    rc = f_evalex(interp,str,-1,0) # interp, string, length or -1, flags
    # check if the result is TCL_OK(=0)
    if rc==TCL_OK goto eval_ok
    res = f_getstringresult(interp,0)
    error = "error during Tcl_EvalEx: " . res
    die error

eval_ok:
    # get the result (list result, etc - TBD)
    .IfElse(debug_objresult==1,{
	.local pmc obj
	obj = f_getobjresult(interp,0)
        .local pmc tcl_obj_decl
        tcl_obj_decl = get_global '_tcl_obj_decl' # retrieve tcl_obj structure
        assign obj, tcl_obj_decl                  # ... and use it
	res = _pmc_from_tclobj(interp,obj)
    },{
	res = f_getstringresult(interp,0)
    })
    .return(res)
.end

# Constructor for the interpreter object.
# optional parameter - path to the tcl shared library.
.sub init :method :vtable
    .param string libname :optional
    .param int has_libname :opt_flag

    # get interpreter, store it globally
    .local pmc interp, f_createinterp, f_tclinit
    .local pmc libtcl
    libtcl = get_global '_libtcl'
    # if _libtcl not defined yet, then we're starting first time, so need
    # to call _tcl_load_lib

    unless_null libtcl, libtcl_loaded

    if has_libname goto with_libname
    '_tcl_load_lib'()
    goto with_libname_e
with_libname:
    '_tcl_load_lib'(libname)
with_libname_e:
    libtcl = get_global '_libtcl'

libtcl_loaded:
    f_createinterp = dlfunc libtcl, "Tcl_CreateInterp", "p"
    interp = f_createinterp()

    unless_null interp, ok_interp
    die "NO interp\n"

  ok_interp:
    setattribute self,'interp', interp
    f_tclinit = dlfunc libtcl, "Tcl_Init", "vp"
    f_tclinit(interp)
.end

=over 4

=item _init

Performs the initialization of Tcl bridge, namely instantiates TclLibrary class

=cut

.sub _init :tag('load') :tag('init')
    .local pmc tclclass
    tclclass = newclass ['TclLibrary']
    addattribute tclclass, 'interp'

.end

=item _init_tclobj

 - creates a helper for Tcl_Obj struct
    # do the tcl.h adaptations

=cut

.sub _init_tclobj

    # "declare" a helper for Tcl_Obj structure
    # here is the definition of the Tcl_Obj struct
    # typedef struct Tcl_Obj {
    #     int refCount; // When 0 the object will be freed.
    #     char *bytes;  // points to the first byte of the obj string representation...
    #     int length;	// number of bytes at *bytes, not incl.the term.null.
    #     Tcl_ObjType *typePtr; // obj type. if NULL - no int.rep.
    #     union {		     /* The internal representation: */
    #         long longValue;	     /*   - an long integer value */
    #         double doubleValue;    /*   - a double-precision floating value */
    #         VOID *otherValuePtr;   /*   - another, type-specific value */
    #         Tcl_WideInt wideValue; /*   - a long long value */
    #         struct {		/*   - internal rep as two pointers */
    #             VOID *ptr1;
    #             VOID *ptr2;
    #         } twoPtrValue;
    #         struct {		/*   - internal rep as a wide int, tightly
    #                                  *     packed fields */
    #             VOID *ptr;		/* Pointer to digits */
    #             unsigned long value;/* Alloc, used, and signum packed into a
    #                                  * single word */
    #         } ptrAndLongRep;
    #     } internalRep;
    # } Tcl_Obj;

    .local pmc tcl_obj_struct, tcl_obj_decl
    tcl_obj_decl = new 'ResizablePMCArray'
    push tcl_obj_decl, .DATATYPE_INT
    push tcl_obj_decl, 0
    push tcl_obj_decl, 0
    push tcl_obj_decl, .DATATYPE_CSTR
    push tcl_obj_decl, 0
    push tcl_obj_decl, 0
    push tcl_obj_decl, .DATATYPE_INT
    push tcl_obj_decl, 0
    push tcl_obj_decl, 0
    push tcl_obj_decl, .DATATYPE_INT
    push tcl_obj_decl, 0
    push tcl_obj_decl, 0
    # following items are for union, let it be 2 longs, which eventually
    # could be transformed to the required type
    push tcl_obj_decl, .DATATYPE_LONG
    push tcl_obj_decl, 2
    push tcl_obj_decl, 0

    # union TBD
    tcl_obj_struct = new 'UnManagedStruct', tcl_obj_decl
    set_global '_tcl_obj_decl', tcl_obj_decl # XXXXXXXXX <----------
.end

# find proper shared library and use it.
.sub _tcl_load_lib
    .param string libname :optional
    .param int has_libname :opt_flag

    # load shared library
    .local pmc libnames
    libnames = new 'ResizableStringArray'
    unless has_libname goto standard_names
    push libnames, libname
    say libname
    goto standard_names_e
standard_names:
    push libnames, 'tcl85'
    push libnames, 'tcl84'
    push libnames, 'libtcl8.5'
    push libnames, 'libtcl8.4'
    push libnames, 'libtcl8.5.so'
    push libnames, 'libtcl8.4.so'
standard_names_e:

    .local pmc libtcl
    libtcl = _load_lib_with_fallbacks('tcl', libnames)
    set_global '_libtcl', libtcl


    # initialize Tcl library
    .local pmc func_findexec
    func_findexec = dlfunc libtcl, "Tcl_FindExecutable", "vp"
    func_findexec(0)

    # few more functions, store them globally
    .local pmc func
    # need: Tcl_ResetResult, Tcl_EvalEx, Tcl_GetStringResult, etc
    func = dlfunc libtcl, "Tcl_ResetResult", "vp"
    set_global '_tcl_resetresult', func
    func = dlfunc libtcl, "Tcl_EvalEx", "iptii"
    set_global '_tcl_evalex', func
    func = dlfunc libtcl, "Tcl_GetStringFromObj", "tpp" # should be "tp3"
    set_global '_tcl_getstringfromobj', func
    func = dlfunc libtcl, "Tcl_GetStringResult", "tp"
    set_global '_tcl_getstringresult', func
    func = dlfunc libtcl, "Tcl_ListObjGetElements", "vippp"  # should be "vip3p"
    set_global '_tcl_listobjgetelements', func
    func = dlfunc libtcl, "Tcl_GetObjResult", "pp"
    set_global '_tcl_getobjresult', func
    func = dlfunc libtcl, "Tcl_GetObjType", "it"
    set_global '_tcl_getobjtype', func

    '_init_tclobj'()

.end

#
#static SV *
#SvFromTclObj(pTHX_ Tcl_Obj *objPtr)
=item pmc _pmc_from_tclobj(pmc interp, pmc tclobj)

This is a (static) function that will convert Tcl object to pmc

=cut

.sub _pmc_from_tclobj
    .param pmc interp
    .param pmc tclobj

    # check what type this tcl obj is
    say "enter pmc_from_tclobj"

    # check what tclobj actually is (null, integer, list, etc)

    # --->  these lines will be factored out into some init stage! ....
    .local int tclBooleanTypePtr
    .local int tclByteArrayTypePtr
    .local int tclDoubleTypePtr
    .local int tclIntTypePtr
    .local int tclListTypePtr
    .local int tclStringTypePtr
    .local int tclWideIntTypePtr

    .local pmc f_getobjtype
    f_getobjtype = get_global '_tcl_getobjtype'

    tclBooleanTypePtr   = f_getobjtype("boolean")
    tclByteArrayTypePtr = f_getobjtype("bytearray")
    tclDoubleTypePtr    = f_getobjtype("double")
    tclIntTypePtr       = f_getobjtype("int")
    tclListTypePtr      = f_getobjtype("list")
    tclStringTypePtr    = f_getobjtype("string")
    tclWideIntTypePtr   = f_getobjtype("wideInt")
    # ..... <---- (see above)

    #.local pmc tcl_obj_struct
    #tcl_obj_struct = get_global '_tcl_obj_struct'

    if tclobj!=0 goto not_null
    # null
    say "NULL???"
    goto EOJ

not_null:
    .local int obj_type

    obj_type = tclobj[3]

    if obj_type==0 goto EOJ # if obj_type is null, there's no internal rep

    if obj_type!=tclBooleanTypePtr goto m00
    say "implement tclBooleanTypePtr!"
    goto EOJ
m00:
    if obj_type!=tclByteArrayTypePtr goto m01
    say "implement tclByteArrayTypePtr"
    goto EOJ
m01:
    if obj_type!=tclDoubleTypePtr goto m02
    #sv = newSViv(objPtr->internalRep.doubleValue);
    say "implement tclDoubleTypePtr"
    goto EOJ
m02:
    if obj_type!=tclIntTypePtr goto m03
    #sv = newSViv(objPtr->internalRep.longValue);
    .local int ires
    ires = tclobj[4]
    say ires
    .return(ires)
m03:
    if obj_type!=tclListTypePtr goto m04

    .local int objc
    .local pmc objv # pointer which will hold array of tcl_obj's

    # Tcl_ListObjGetElements(NULL, objPtr, &objc, &objv);
    # if (objc) { .... }
    .local pmc f_listobjgetelements
    f_listobjgetelements = get_global '_tcl_listobjgetelements'
    #f_listobjgetelements.(0, tclobj, objc, objv)

    say "implement tclListTypePtr"
    goto EOJ
m04:
    if obj_type!=tclStringTypePtr goto m05
    say "implement tclStringTypePtr"
    goto EOJ
m05:
    print "implement TCL obj_type "
    say obj_type

EOJ:

    .local string str
    .local pmc f_getstr
    f_getstr = get_global '_tcl_getstringfromobj'
    str = f_getstr(tclobj, 0)

    .return(str)
.end

.sub MainLoop :method
    say "MainLoop"
    # TO BE FIXED
    self.'eval'(<<'EOS')
while {[winfo exists .]} {
    update
}
EOS
#    .local pmc libtcl, f_mainloop
#    libtcl = get_global '_libtcl'
#    f_mainloop = dlfunc libtcl, "Tk_MainLoop", "v"
#    f_mainloop()
    say "MainLoop-e!"
.end

=item _load_lib_with_fallbacks(string friendly_name, pmc fallback_list)

This function is more generally useful than just for this module -- it
implements the search for a particular library that may appear under any
of several different filenames.  The C<fallback_list> should be a simple
array of strings, each naming one of the possible filenames, I<without>
the trailing shared library extension (e.g. C<.dll> or C<.so>).  The
C<friendly_name> is only used to fill in the error message in case no
match can be found on the system.

BORROWED from OpenGL.pir - keep an eye on it (e.g. if it will be organized
elsewhere - reuse it from there)

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
    print "tcl lib is "
    say libname
    .return (library)

  failed:
    .local string message
    message  = 'Could not find a suitable '
    message .= friendly_name
    message .= ' shared library!'
    die message
.end

=back


=head1 SEE ALSO

http://www.tcl.tk

=head1 AUTHORS

TBD

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
