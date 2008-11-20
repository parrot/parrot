/* $Id$ */
/* Wrappers around the SQLite interface to avoid the use of out-arguments */

#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <sqlite3.h>
sqlite3_stmt* sqlite3s_prepare(sqlite3* db, char* sql);
sqlite3* sqlite3s_open(char* filename);

/* void pmc_check(PMC* pmc) { printf("PMC %p data pointer %p\n", pmc, pmc->data); } */

sqlite3* sqlite3s_open(char* filename) {
    sqlite3* db;
    int ret;
    ret = sqlite3_open(filename, &db);
    if (ret != SQLITE_OK)
        return NULL;
    /* printf("Returning DB %p\n", db); */
    return db;
}

sqlite3_stmt* sqlite3s_prepare(sqlite3* db, char* sql) {
    sqlite3_stmt* in;
    int ret;
    int length;
    length = strlen(sql);
    if (!db) return NULL;
    ret = sqlite3_prepare_v2(db, sql, length, &in, NULL);
    if (ret != SQLITE_OK)
        return NULL;
    /* printf("Returning SP %p\n", in); */
    return in;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
