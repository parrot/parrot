# Copyright (C) 2009-2013, Parrot Foundation.

=head1 NAME

examples/nci/QtHelloWorld.pir - Qt Example

=head1 SYNOPSIS

    % ./parrot examples/nci/QtHelloWorld.pir

=head1 DESCRIPTION

Sample "Hello World" with Qt, via Parrot Native Call Interface (NCI). See
F<docs/pdds/pdd03_calling_conventions.pod>.

Qt - A cross-platform application and UI framework
(L<http://www.qtsoftware.com/about/news/lgpl-license-option-added-to-qt>).
You'll need to build F<libPQt.so> or F<PQt.dll> and install it in
F<runtime/parrot/dynext> for this to work, see F<examples/nci/PQt.cpp>
for more information.

Note that this will either need JIT for building the NCI-functions on
the fly. If this is not available try adding missing signatures to
F<src/nci/extra_thunks.nci>, running F<tools/dev/mk_nci_thunks.pl>, and
rebuilding Parrot.

=cut

.sub main

    .local pmc libpqt
    loadlib libpqt, "libPQt"
    if libpqt goto loaded

  failed:
    .local string message
    message  = 'Install PQt.dll or libPQt.so into runtime/parrot/dynext'
    die message

  loaded:
    print "Loaded\n"

    load_bytecode 'NCI/Utils.pbc'
    .local pmc dlfancy
    dlfancy = get_hll_global ['NCI';'Utils'], 'dlfancy'

    .local pmc QApplication_new, pApp
    QApplication_new = dlfunc libpqt, "QApplication_new", "pv"
    pApp = QApplication_new()

    .local pmc QLabel_new, pLabel
    .local string caption
    caption = "Hello, world!"
    QLabel_new = dlfancy(libpqt, "QLabel_new", "pt")
    pLabel = QLabel_new(caption)

    .local pmc QLabel_resize
    QLabel_resize = dlfunc libpqt, "QLabel_resize", "vpii"
    QLabel_resize(pLabel, 120, 30)

    .local pmc QLabel_show
    QLabel_show = dlfunc libpqt, "QLabel_show", "vp"
    QLabel_show(pLabel)

    .local pmc QApplication_exec
    QApplication_exec = dlfunc libpqt, "QApplication_exec", "vp"
    QApplication_exec(pApp)

.end

=head1 SEE ALSO

F<examples/nci/PQt.cpp>, F<docs/pdds/pdd03_calling_conventions.pod>,
F<docs/pdds/draft/pdd16_native_call.pod>.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
