#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/pasm.t - Test examples in F<examples/pasm>

=head1 SYNOPSIS

	% perl -Ilib t/examples/pasm.t

        % perl t/harness t/examples/pasm.t

=head1 DESCRIPTION

Test the examples in F<examples/pasm>.

=head1 TODO

Check on remaining examples in 'examples/assembly'.

=head1 SEE ALSO

F<t/examples/pir.t>

=cut

use strict;
use Parrot::Test tests => 6;
use Test::More;

# Set up expected output for examples
my %expected = (

    'fact.pasm'        =>  << 'END_EXPECTED',
fact of 0 is: 1
fact of 1 is: 1
fact of 2 is: 2
fact of 3 is: 6
fact of 4 is: 24
fact of 5 is: 120
fact of 6 is: 720
END_EXPECTED

    'hello.pasm'        =>  << 'END_EXPECTED',
Hello World
END_EXPECTED

    'lexical.pasm'      =>  << 'END_EXPECTED',
Storing 'a' in top lexical pad
The lexical 'a' has in the current scope the value 1.

Storing 'c' in bottom lexical pad
The lexical 'a' has in the current scope the value 1.
The lexical 'b' has in the current scope the value 3.

Overwriting 'c' in bottom lexical pad
The lexical 'a' has in the current scope the value 2.
The lexical 'b' has in the current scope the value 3.

Adding another stack level at bottom
The lexical 'a' has in the current scope the value 2.
The lexical 'b' has in the current scope the value 3.

Override lexicals
The lexical 'a' has in the current scope the value 5.
The lexical 'b' has in the current scope the value 4.
The lexical 'a' has in scope 1 the value 5.
The lexical 'b' has in scope 1 the value 4.
The lexical 'a' has in scope 0 the value 2.
The lexical 'b' has in scope 0 the value 3.

Getting rid of bottom stack
The lexical 'a' has in the current scope the value 2.
The lexical 'b' has in the current scope the value 3.
END_EXPECTED

    'stack.pasm'        =>  << 'END_EXPECTED',
87654321098765432100123456789012345678998765432109876543210
END_EXPECTED

    'trace.pasm'        =>  << 'END_EXPECTED',
Howdy!
     4 print "There!\n"
There!
     6 trace 0
Partner!
END_EXPECTED

    'xml_parser.pasm'        =>  << 'END_EXPECTED',
Start xml version=1.0
Start top
Start inner foo=bar narf=poit
Start junk
Data Hello
Close junk
Start empty
Close empty
Close inner
Close top
END_EXPECTED

                          );

# Do the testing
my %test_func = ( pasm => \&pasm_output_is,
                  pir  => \&pir_output_is,
                  imc  => \&pir_output_is );

while ( my ( $example, $expected ) = each %expected ) {
    my $code_fn   = "examples/pasm/$example";
    my $code = Parrot::Test::slurp_file($code_fn);

    my ( $extension ) = $example =~ m{ [.]                  # introducing extension
                                       ( pasm | pir | imc ) # match and capture the extension
                                       \z                   # at end of string
                                     }ixms or Usage();
    if ( defined $extension ) { 
      $test_func{$extension}->($code, $expected, $code_fn);
    }
    else {
      ok( defined $extension, "no extension recognized for $code_fn" );
    }
}
