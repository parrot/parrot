#! perl -w

use Parrot::Test tests => 2;
use Test::More;
use Parrot::Config;
$ENV{"PARROT_TMP"} = "riding a ponie";
output_like(<<'CODE', <<OUT, "getenv");
    new P0, .Env
    set S0, P0["PARROT_TMP"]
    print S0
    end
CODE
/riding a ponie/i
OUT

output_like(<<'CODE', <<OUT, "setenv/getenv");
    new P0, .Env
    set P0["PARROT_TMP"], "hello polly"
    set S0, P0["PARROT_TMP"]
    print S0
    end
CODE
/hello polly/i
OUT

