# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use Test::More tests => 11;

BEGIN {
  use_ok( 'Tokenizer' );
  use_ok( 'Parser' );
  use_ok( 'Generator' );
}
require_ok( 'Tokenizer');
require_ok( 'Parser');
require_ok( 'Generator');

my $tokenizer = Tokenizer->new();
my $parser    = Parser->new();
my $generator = Generator->new();

my $tokenized;
my $parsed;
my $generated;

$tokenized = $tokenizer->tokenize('$a = 5');
$parsed    = $parser->parse($tokenized);
$generated = $generator->generate($parsed);
is_deeply(
  $generated,
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'set', 'P0', '5' ],
    [ '', 'end' ],
  ],
  '$a = 5');

$tokenized = $tokenizer->tokenize('$a = "foo"');
$parsed    = $parser->parse($tokenized);
$generated = $generator->generate($parsed);
is_deeply(
  $generated,
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'set', 'P0', q("foo") ],
    [ '', 'end' ],
  ],
  '$a = "foo"');

$tokenized = $tokenizer->tokenize('$a = 5 + 3');
$parsed    = $parser->parse($tokenized);
$generated = $generator->generate($parsed);
is_deeply(
  $generated,
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'new', 'P1', 'PerlInt', '# $__TEMP0000' ],
    [ '', 'add', 'P1', '5', '3' ],
    [ '', 'clone', 'P0', 'P1' ],
    [ '', 'end' ],
  ],
  '$a = 5 + 3');

$tokenized = $tokenizer->tokenize('$a = $b + 5');
$parsed    = $parser->parse($tokenized);
$generated = $generator->generate($parsed);
is_deeply(
  $generated,
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'new', 'P1', 'PerlInt', '# $__TEMP0000' ],
    [ '', 'new', 'P2', 'PerlInt', '# $b' ],
    [ '', 'add', 'P1', 'P2', '5' ],
    [ '', 'clone', 'P0', 'P1' ],
    [ '', 'end' ],
  ],
  '$a = $b + 5');

$tokenized = $tokenizer->tokenize('$a = $b - 7 + 5');
$parsed    = $parser->parse($tokenized);
$generated = $generator->generate($parsed);
is_deeply(
  $generated,
  [ [ '', 'new', 'P0', 'PerlInt', '# $a' ],
    [ '', 'new', 'P1', 'PerlInt', '# $__TEMP0000' ],
    [ '', 'new', 'P2', 'PerlInt', '# $b' ],
    [ '', 'new', 'P3', 'PerlInt', '# $__TEMP0001' ],
    [ '', 'add', 'P3', '7', '5' ],
    [ '', 'sub', 'P1', 'P2', 'P3' ],
    [ '', 'clone', 'P0', 'P1' ],
    [ '', 'end' ],
  ],
  '$a = $b - 7 + 5');
