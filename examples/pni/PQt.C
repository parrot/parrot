/*

# Copyright (C) 2001-2003 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/pni/PQt.C - Qt/Parrot Library

=head1 SYNOPSIS

Compile with:

    g++ -fPIC -I$QTDIR/include -L$QTDIR -c PQt.C

    gcc -shared -o libPQt.so PQt.o $QTDIR/lib/libqt.so

Or something like that...

=head1 DESCRIPTION

Qt Native interface for Parrot. See F<examples/pni/QtHelloWorld.pasm>
for more information.

=cut

*/

#include <qapplication.h>
#include <qlabel.h>
extern "C" {
#include <stdio.h>
#include <dlfcn.h>

QApplication * pApp;

/*

=head2 QApplication bindings

=over 4

=item C<QApplication *QApplication_new(void)>

=cut

*/
QApplication *QApplication_new(void) {
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

void QApplication_exec(QApplication *app)
{
    app->exec();
}

/*

=item C<void QApplication_setMainWidget(QApplication *app, QWidget *w)>

=cut

*/

void QApplication_setMainWidget(QApplication *app, QWidget *w)
{
    app->setMainWidget(w);
}

/*

=back

=head2 QLabel bindings

=over 4

=item C<QLabel * QLabel_new(const char *txt)>

=cut

*/

QLabel * QLabel_new(const char *txt)
{
    QLabel * pLabel = new QLabel(txt, 0);
    return pLabel;
}

/*

=item C<void QLabel_show(QLabel *label)>

=cut

*/

void QLabel_show(QLabel *label)
{
    label->show();
}

/*

=item C<void QLabel_resize(QLabel *label, int x, int y)>

=cut

*/

void QLabel_resize(QLabel *label, int x, int y)
{
    label->resize(x, y);
}

}

/*

=back

=head1 SEE ALSO

F<examples/pni/QtHelloWorld.pasm>,
F<docs/pdds/pdd03_calling_conventions.pod>.

=cut

*/