#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

=head1 NAME

t/pragmas.t - WMLScript Pragmas

=head1 SYNOPSIS

    % perl -I../lib -IWMLScript/t WMLScript/t/pragmas.t

=head1 DESCRIPTION

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 5;
use Test::More;

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'hello');
extern function hello()
{
    Console.println("Hello World!");
}

extern function main()
{
    hello();
}
CODE
Hello World!
OUT

language_output_is( 'WMLScript', <<'CODE', <<'OUT', 'use url');
use url OtherScript "languages/WMLScript/t/pragmas_1.wmlsc";

extern function main()
{
    OtherScript#hello();
}
CODE
Hello World!
OUT

language_output_like( 'WMLScript', <<'CODE', <<'OUT', 'unable to load');
use url OtherScript "languages/WMLScript/t/pragmas_x.wmlsc";

extern function main()
{
    OtherScript#hello();
}
CODE
/unable to load/
OUT

language_output_like( 'WMLScript', <<'CODE', <<'OUT', 'verification failed');
use url OtherScript "languages/WMLScript/t/pragmas_1.out";

extern function main()
{
    OtherScript#hello();
}
CODE
/verification failed/
OUT

language_output_like( 'WMLScript', <<'CODE', <<'OUT', 'external function not found');
use url OtherScript "languages/WMLScript/t/pragmas_1.wmlsc";

extern function main()
{
    OtherScript#hello2();
}
CODE
/external function '\w+' not found/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

