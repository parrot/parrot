#!perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 1;


=head1 NAME

t/library/yaml_parser_syck.t - testing library/YAML/Parser/Syck.pir

=head1 SYNOPSIS

    % prove t/library/yaml_parser_syck.t

=head1 DESCRIPTION

Try to parse a YAML document.

=cut


TODO: {

  local $TODO = 'Not properly implemented yet';

  pir_output_is( << 'CODE', << 'OUT', "basic parsing" );

.include "library/YAML/Parser/Syck.pir"
.include "library/dumper.pir"
.sub test :main

  .local pmc loaded 
  ( loaded ) = load( "---\n- key1: val1\n  key2: val2\n- elem1\n- elem12\n- elem123\n- elem1234\n- elem12345\n- elem123456\n- elem1234567\n- elem12345678\n" )
  _dumper( "loaded", loaded )

  end
.end
CODE
val1

val1
key1

val1
key1
val2

val1
key1
val2
key2

val1
key1
val2
key2

val1
key1
val2
key2
elem1

val1
key1
val2
key2
elem1
elem12

val1
key1
val2
key2
elem1
elem12
elem123

val1
key1
val2
key2
elem1
elem12
elem123
elem1234

val1
key1
val2
key2
elem1
elem12
elem123
elem1234
elem12345

val1
key1
val2
key2
elem1
elem12
elem123
elem1234
elem12345
elem123456

val1
key1
val2
key2
elem1
elem12
elem123
elem1234
elem12345
elem123456
elem1234567

val1
key1
val2
key2
elem1
elem12
elem123
elem1234
elem12345
elem123456
elem1234567
elem12345678

val1
key1
val2
key2
elem1
elem12
elem123
elem1234
elem12345
elem123456
elem1234567
elem12345678

"loaded" => "val1\nkey1\nval2\nkey2\nelem1\nelem12\nelem123\nelem1234\nelem12345\nelem123456\nelem1234567\nelem12345678\n" with-properties: Hash {
    "_interpreter" => PMC 'ParrotInterpreter' { ... },
    "_signature" => "Up",
    "_sub" => sub { ... },
    "_synchronous" => 1
}
OUT
};


=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=head1 SEE ALSO

F<runtime/parrot/library/YAML/Parser/Syck.pir>

=cut



