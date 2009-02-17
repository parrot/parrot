#! perl
# $Id$
# Copyright (C) 2008 Parrot Foundation

use strict;
use warnings;

chdir '../..';
`$^X -Ilib tools/dev/reconfigure.pl --step=gen::languages --languages=APL`;
