# Copyright (C) 2009, Parrot Foundation.

# interlangs.pir
# An example of language interoperability

# First build perl6, ecmascript and pipp
# Then do:
# ../../parrot -L /yourparrotdir/languages/rakudo \
#              -L /yourparrotdir/languages/ecmascript \
#              -L /yourparrotdir/languages/pipp \
#              interlangs.pir

#-----------------------------------------------------------------------

.sub main :main
    .local pmc perl6func, jsfunc, pippfunc

    say 'Loading languages and compiling...'
    # Compile functions
    perl6func = get_perl6_func()
    jsfunc = get_js_func()
    pippfunc = get_pipp_func()

    # Call js and pipp functions directly
    say "\nDirect calls\n"
    jsfunc('pir')
    pippfunc('pir')

    # Pass js and pipp functions to perl6 function
    say "\nCalls from perl6\n"
    $S1 = perl6func('pir', jsfunc)
    print 'Returned: '
    say $S1
    $S1 = perl6func('pir', pippfunc)
    print 'Returned: '
    say $S1

    say "\nBye!"
.end

#-----------------------------------------------------------------------

# Compile perl6 code that return a function,
# execute it, and return the result.

.sub get_perl6_func
    load_bytecode 'perl6.pbc'
    .local pmc compiler, code, function
    compiler = compreg 'Perl6'
    code = compiler.'compile'(<<'ENDCODE')
sub ($a, $b)
{
    $b('perl6->' ~ $a);
    'Hello from a perl6 sub, ' ~ $a;
};
ENDCODE
    function = code()
    .return(function)
.end

#-----------------------------------------------------------------------

# Compile ecmascript code that define a function,
# execute it and get the function from the
# js namespace.

.sub get_js_func
    load_bytecode 'js.pbc'
    .local pmc compiler, code, block, ns, function
    compiler = compreg 'JS'
    code = compiler.'compile'(<<'JSCODE')
function myecmascriptfunc(n)
{
    print ('Hello from ecmascript,', n);
}
JSCODE
    block = code()
    ns = get_root_global 'js'
    function = ns['myecmascriptfunc']
    .return(function)
.end

#-----------------------------------------------------------------------

# Compile php code that define a function,
# and get the function from the pipp
# namespace

.sub get_pipp_func
    load_bytecode 'pipp.pbc'
    .local pmc compiler, code, ns, function
    compiler = compreg 'Pipp'
    code = compiler.'compile'(<<'PIPPCODE')
<?php
function phpfunc($msg)
{
    echo "Hello from pipp, $msg\n";
}
?>
PIPPCODE
    ns = get_root_global 'pipp'
    function = ns['phpfunc']
    .return(function)
.end

#-----------------------------------------------------------------------
# That's all folks!

########################################################################
# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
