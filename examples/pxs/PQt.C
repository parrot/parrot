/*
 * Qt Native interface for Parrot - Sample for playing with the
 * extension design.
 *
 * compile with:  g++ -fPIC -I$QTDIR/include -L$QTDIR -I./include -c pqt.C -lqt
 *                gcc -shared -o libpqt.so pqt.o $QTDIR/lib/libqt.so
 *
 * Or something like that... 
 */


#include <qapplication.h>
#include <qlabel.h>
extern "C" {
#include "parrot/pxs.h"
#include <stdio.h>
#include <dlfcn.h>

QApplication * pApp;


/*
 * QApplication bindings
 */
PXSCALL(QApplication_new) {
    PMC * p;
    int PQtargc;
    char *PQtargv[2];
    PQtargv[0] = "";
    PQtargv[1] = NULL;
    pApp = new QApplication(PQtargc, PQtargv);
    p = PXS_pointer(interp, pApp);
    PXS_retp(interp, p);
}

PXSCALL(QApplication_exec) {
    ((QApplication *)object)->exec();
}

PXSCALL(QApplication_setMainWidget) {
    PMC * w = PXS_shiftp(interp);
    ((QApplication *)object)->setMainWidget((QWidget *)w->data);
}


/*
 * QLabel bindings
 */

PXSCALL(QLabel_new) {
    char * arg1 = PXS_shiftcs(interp);
    QLabel * pLabel = new QLabel(arg1, 0);
    PMC * p = PXS_pointer(interp, pLabel);
    PXS_retp(interp, p);
}

PXSCALL(QLabel_show) {
    ((QLabel *)object)->show();
}

PXSCALL(QLabel_resize) {
    int x = PXS_shifti(interp);
    int y = PXS_shifti(interp);
    ((QLabel *)object)->resize(x, y);
}



}

