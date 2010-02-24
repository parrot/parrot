#!perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib ('./lib', '../../lib');
use Parrot::Test::NCIGENAST;

plan tests => 5;

parse_success(<<'CODE', 'typedef.c');
typedef int (*sqlite3_callbackkk)(void*,int,char*, char*);
CODE

parse_success(<<'CODE', 'typedef.c');
int sqlite3_callbackk(void*,int,char*, char*);
CODE

parse_success(<<'CODE', 'typedef.c');
typedef int (*sqlite3_callback)(void*,int,char**, char**);
CODE

parse_success(<<'CODE', 'typedef.c');
typedef struct sqlite3 sqlite3;
CODE

parse_success(<<'CODE', 'typedefstartstar.c');
typedef struct sqlite3 sqlite3;
int sqlite3_open( const char *filename, sqlite3 **ppDb);
CODE


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
