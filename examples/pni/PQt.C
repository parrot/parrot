/*
 * Qt Native interface for Parrot - Sample for playing with the
 * extension design.
 *
 * compile with:  g++ -fPIC -I$QTDIR/include -L$QTDIR -c PQt.C
 *                gcc -shared -o libPQt.so PQt.o $QTDIR/lib/libqt.so
 *
 * Or something like that...
 */


#include <qapplication.h>
#include <qlabel.h>
extern "C" {
#include <stdio.h>
#include <dlfcn.h>

QApplication * pApp;


/*
 * QApplication bindings
 */
QApplication *QApplication_new(void) {
    int PQtargc = 0;
    char *PQtargv[2];
    PQtargv[0] = "";
    PQtargv[1] = NULL;
    pApp = new QApplication(PQtargc, PQtargv);
    return pApp;
}

void QApplication_exec(QApplication *app)
{
    app->exec();
}

void QApplication_setMainWidget(QApplication *app, QWidget *w)
{
    app->setMainWidget(w);
}


/*
 * QLabel bindings
 */

QLabel * QLabel_new(const char *txt)
{
    QLabel * pLabel = new QLabel(txt, 0);
    return pLabel;
}

void QLabel_show(QLabel *label)
{
    label->show();
}

void QLabel_resize(QLabel *label, int x, int y)
{
    label->resize(x, y);
}



}

