# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pni/QtHelloWorld.pasm - Qt Example

=head1 SYNOPSIS

    % ./parrot examples/pni/QtHelloWorld.pasm

=head1 DESCRIPTION

Sample "Hello World" with Qt, via Parrot Native Call API (nci). See
F<docs/pdds/pdd03_calling_conventions.pod>.

Qt is a multiplatform C++ GUI application framework
(Lhttp://doc.trolltech.com/3.1/aboutqt.html>). You'll need to build
F<libPQt.so> and install it in F<runtime/parrot/dynext> for this to
work, see F<examples/pni/PQt.C> for more information.

Note that this will either need JIT for building the NCI-functions on
the fly. If this is not available try adding missing signatures to
F<src/call_list.txt> and rebuilding Parrot.

=cut

# load the shared lib
    loadlib P1, "libPQt"
    print "Loaded\n"

# get and invoke the QApplication_new function
    dlfunc P0, P1, "QApplication_new", "pv"
    invoke
    set P2, P5	# remember pApp

# get and invoke QLabel_new
    set S5, "Hello, world!"
    dlfunc P0, P1, "QLabel_new", "pt"
    # if you need more labels, save P0 = QLabel_new() function
    invoke
    set P6, P5	# save pLabel

# size the QLabel
    set I5, 30	# y
    set I6, 120	# x
    dlfunc P0, P1, "QLabel_resize", "vpii"
    invoke

# register the label
    dlfunc P0, P1, "QApplication_setMainWidget", "vpp"
    set P5, P6	# pLabel
    set P6, P2	# pApp
    invoke
    # P5  = label
    dlfunc P0, P1, "QLabel_show", "vp"
    invoke

# and go
    dlfunc P0, P1,"QApplication_exec", "vp"
    set P5, P2	# app
    invoke
    end

=head1 SEE ALSO

F<examples/pni/PQt.C>, F<docs/pdds/pdd03_calling_conventions.pod>.

=cut
