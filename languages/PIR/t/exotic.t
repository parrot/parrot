#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4;
use Test::More;



language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '' );
.sub main

    x = y[x,y;x,y]

.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '' );

.sub main
    x.hello()
    x.'hello'()
.end

CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '' );
.sub main


.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, '' );
.sub main


.end
CODE
