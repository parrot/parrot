#!/usr/bin/env perl

# $Id$

# A workaround for run-tests.php

exec './parrot', 'languages/plumhead/plumhead.pbc', @ARGV;
