#! perl
# $Id$
# Copyright (C) 2009, Parrot Foundation.

use strict;
use warnings;

chdir '../..';
`$^X -Ilib tools/dev/reconfigure.pl --step=gen::languages --languages=pheme`;
