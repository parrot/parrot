# Sample "Hello World" with Qt, via Parrot Native API (PXS)
# You'll need to build libPQt.so for this to work, see
# pqt.C for more info.
#
loadlib P0, "libpqt.so"
print "Loaded\n"
callnative P1, P0, "QApplication_new"
restore P2
save "Hello, world!"
callnative P1, P0, "QLabel_new"
restore P3
#P3 is now a QLabel
save 30
save 120
callnative P1, P0, P3, "QLabel_resize"
save P3
callnative P1, P0, P2, "QApplication_setMainWidget"
callnative P1, P0, P3, "QLabel_show"
callnative P1, P0, P2, "QApplication_exec"
end
