# Sample "Hello World" with Qt, via Parrot Native Call API (nci)
# s. docs/pdds/pdd03_calling_conventions.pod
#
# You'll need to build libPQt.so for this to work, see
# PQt.C for more info.
# Please note: this will either need JIT/i386 for building the
#              nci-functions on the fly, or adding missing
#              signatures to call_list.txt and rebuilding parrot/imcc
#
# make
# cd examples/pni
# export LD_LIBRARY_PATH=.
# ../../parrot QtHelloWorld.pasm


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
