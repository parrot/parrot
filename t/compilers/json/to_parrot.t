# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 11;

=head1 NAME

t/compilers/json/to_parrot.t - test JSON to parrot conversions

=head1 SYNOPSIS

    % prove t/compilers/json/to_parrot.t

=head1 DESCRIPTION

Tests JSON->Parrot conversions.

=cut

json_dump_is(<<'JSON', <<'OUT', 'empty string');
""
JSON
"JSON" => ""
OUT

json_dump_is(<<'JSON', <<'OUT', 'string');
"json"
JSON
"JSON" => "json"
OUT

json_dump_is(<<'JSON', <<'OUT', 'integer');
1
JSON
"JSON" => 1
OUT

json_dump_is(<<'JSON', <<'OUT', 'float');
3.14
JSON
"JSON" => 3.14
OUT

json_dump_is(<<'JSON', <<'OUT', 'null');
null
JSON
"JSON" => null
OUT

json_dump_is(<<'JSON', <<'OUT', 'true');
true
JSON
"JSON" => 1
OUT

json_dump_is(<<'JSON', <<'OUT', 'false');
false
JSON
"JSON" => 0
OUT

json_dump_is(<<'JSON', <<'OUT', 'empty array', todo=>'parse error');
[]
JSON
"JSON" => ResizablePMCArray (size:0) [
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'simple array');
[1,2,3]
JSON
"JSON" => ResizablePMCArray (size:3) [
    1,
    2,
    3
]
OUT

json_dump_is(<<'JSON', <<'OUT', 'empty object');
{}
JSON
"JSON" => Hash {
}
OUT

json_dump_is(<<'JSON', <<'OUT', 'simple object');
{"one":1,"two":2,"three":3}
JSON
"JSON" => Hash {
    "one" => 1,
    "three" => 3,
    "two" => 2
}
OUT

# XXX Need many more tests, exercising all aspects of http://www.json.org/

sub json_dump_is {
    my ($code, $dumped, $reason, %args) = @_;

    chomp $code;
    $code =~ s{("|\\)}{\\$1}g;
    $code =~ s{\n}{\\n}g;

    return pir_output_is(<<"END_PIR", $dumped, $reason, %args);

.sub test :main
    load_bytecode 'compilers/json/JSON.pbc'
    load_bytecode 'library/dumper.pbc'

    .local pmc JSON, result
    JSON = compreg "JSON"
    result = JSON("$code")
    _dumper(result, "JSON")
.end
END_PIR

}
