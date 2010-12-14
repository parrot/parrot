/*

# Copyright (C) 2001-2003, Parrot Foundation.

=head1 NAME

examples/nci/PQt.cpp - Qt/Parrot Library

=head1 SYNOPSIS

Compile with:

*NIX:

    $ g++ -fPIC -I$QTDIR/include -I$QTDIR/include/QtGui -L$QTDIR -c PQt.cpp

    $ gcc -shared -o libPQt.so PQt.o $QTDIR/lib/libQtCore4.so $QTDIR/lib/libQtGui4.so

Windows:

    > "%VS90COMNTOOLS%\vsvars32.bat"

    > set INCLUDE=%QTDIR%\include;%QTDIR%\include\QtGui;%INCLUDE%
    
    > set LIB=%QTDIR%\lib;%LIB%

    > cl /LD PQt.cpp QtGui4.lib QtCore4.lib

Or something like that...

=head1 DESCRIPTION

Qt Native interface for Parrot. See F<examples/nci/QtHelloWorld.pir>
for more information.

=cut

*/

#ifdef _WIN32
  #define PQT_API __declspec(dllexport)
#else
  #define PQT_API 
#endif

#include <QtGui>
extern "C" {

PQT_API QApplication * pApp;

/*

=head2 QApplication bindings

=over 4

=item C<QApplication *QApplication_new(void)>

=cut

*/
PQT_API QApplication *QApplication_new(void) {
    int PQtargc = 0;
    char *PQtargv[2];
    PQtargv[0] = "";
    PQtargv[1] = NULL;
    pApp = new QApplication(PQtargc, PQtargv);
    return pApp;
}

/*

=item C<void QApplication_exec(QApplication *app)>

=cut

*/

PQT_API void QApplication_exec(QApplication *app)
{
    app->exec();
}

/*

=back

=head2 QLabel bindings

=over 4

=item C<QLabel * QLabel_new(const char *txt)>

=cut

*/

PQT_API QLabel * QLabel_new(const char *txt)
{
    QLabel * pLabel = new QLabel(txt, 0);
    return pLabel;
}

/*

=item C<void QLabel_show(QLabel *label)>

=cut

*/

PQT_API void QLabel_show(QLabel *label)
{
    label->show();
}

/*

=item C<void QLabel_resize(QLabel *label, int x, int y)>

=cut

*/

PQT_API void QLabel_resize(QLabel *label, int x, int y)
{
    label->resize(x, y);
}

}

/*

=back

=head1 SEE ALSO

F<examples/nci/QtHelloWorld.pir>,
F<docs/pdds/pdd03_calling_conventions.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
