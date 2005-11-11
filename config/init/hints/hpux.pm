# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

my $libs = Configure::Data->get('libs');
if ( $libs !~ /-lpthread/ ) {
    $libs .= ' -lpthread';
}

Configure::Data->set(
    libs => $libs,
);
