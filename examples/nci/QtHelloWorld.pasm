# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$

=head1 NAME

examples/nci/QtHelloWorld.pasm - Qt Example

=head1 SYNOPSIS

    % ./parrot examples/nci/QtHelloWorld.pasm

=head1 DESCRIPTION

Sample "Hello World" with Qt, via Parrot Native Call Interface (NCI). See
F<docs/pdds/pdd03_calling_conventions.pod>.

Qt - A cross-platform application and UI framework
(L<http://www.qtsoftware.com/about/news/lgpl-license-option-added-to-qt>). You'll need to build
F<libPQt.so> or F<PQt.dll> and install it in F<runtime/parrot/dynext> for this to
work, see F<examples/nci/PQt.C> for more information.

Note that this will either need JIT for building the NCI-functions on
the fly. If this is not available try adding missing signatures to
F<src/nci/extra_thunks.nci>, running F<tools/dev/mk_nci_thunks.pl>, and
rebuilding Parrot.

=cut

# load the shared lib
    loadlib P1, "libPQt"
    print "Loaded\n"

# get and invoke the QApplication_new function
    dlfunc P0, P1, "QApplication_new", "pv"
    invokecc P0
    set P2, P5  # remember pApp

# get and invoke QLabel_new
    dlfunc P0, P1, "QLabel_new", "pt"
    # if you need more labels, save P0 = QLabel_new() function
    set_args "0", "Hello, world!"
    get_results "0", P5
    invokecc P0
    set P6, P5  # save pLabel

# size the QLabel
    dlfunc P0, P1, "QLabel_resize", "vpii"
    set_args "0,0,0", P6, 120, 30
    invokecc P0

    dlfunc P0, P1, "QLabel_show", "vp"
    invokecc P0

# and go
    dlfunc P0, P1,"QApplication_exec", "vp"
    set_args "0", P2
    invokecc P0
    end

=head1 SEE ALSO

F<examples/nci/PQt.C>, F<docs/pdds/pdd03_calling_conventions.pod>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
