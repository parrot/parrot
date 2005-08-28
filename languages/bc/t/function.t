# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

bc/t/function.t - tests for Parrot bc

=head1 DESCRIPTION

Very basic checks.

=cut

use strict;
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Test::More;
use Parrot::Test tests => 8;

language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "block without newlines" );
1; { 2 }
quit
END_CODE
1
2
END_EXPECTED

language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "block with newlines" );
1 
{ 
  2 
}
3
quit
END_CODE
1
2
3
END_EXPECTED


language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "block with two statements" );
1 
{ 
  2 
  3
}
4
quit
END_CODE
1
2
3
4
END_EXPECTED

language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "block with newlines" );
1
{
  2
  3 + 4 
  { 5 * 8
  }
  
}
quit
END_CODE
1
2
7
40
END_EXPECTED

language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "definition of a function" );
1
define e(x) {
  5
}
2
quit
END_CODE
1
2
END_EXPECTED

language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "no parameters" );
1
define e() {
  6
}
2
quit
END_CODE
1
2
END_EXPECTED

language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "with auto parameters" );
1
define e(x,y) {
  auto a,b
  7
}
2
quit
END_CODE
1
2
END_EXPECTED

TODO:
{
  local $TODO = 'not implemented';

  language_output_is( 'bc', << 'END_CODE', << 'END_EXPECTED', "constant function" );
define e(x){
               return( 5 )
       }
e(1)
e(-1)
e(-2)
quit
END_CODE
5
5
5
END_EXPECTED
} 
