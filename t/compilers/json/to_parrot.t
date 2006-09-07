# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 4;

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

# XXX Need many more tests, exercising all aspects of http://www.json.org/

sub json_dump_is {
    my ($code, $dumped, $reason) = @_;

    chomp $code;
    $code =~ s{("|\\)}{\\$1}g;
    $code =~ s{\n}{\\n}g;

    return pir_output_is(<<"END_PIR", $dumped, $reason);

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
