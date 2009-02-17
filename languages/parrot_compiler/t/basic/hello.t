# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

use strict;
use lib 'parrot_compiler/lib';
use FindBin;
use lib "$FindBin::Bin/../../lib", "$FindBin::Bin/../../../../lib";

use Parrot::Test tests => 8;
use Test::More;

# Execute 'Hello World' in PASM and PIR  

my %code = ( PASM => << 'END_PASM', PIR => << 'END_PIR' );

    print "Hello, this is PASM.\n"
    end
END_PASM


.sub test :main
    print "Hello, this is PIR.\n"
.end
END_PIR

my %out = ( PASM => << 'END_PASM', PIR => << 'END_PIR' );
Hello, this is PASM.
END_PASM
Hello, this is PIR.
END_PIR

# PASM tests

$ENV{TEST_PROG_ARGS} = 'parrot.pbc';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot.pasm';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PASM';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PASM';
language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                    $ENV{TEST_PROG_ARGS} );

TODO:
{
  local $TODO = 'generating PASM from PIR is not supported';
  $ENV{TEST_PROG_ARGS} = 'parrot_compiler.pasm --language=PASM';
  language_output_is( 'ParrotCompiler', $code{PASM}, $out{PASM},
                      $ENV{TEST_PROG_ARGS} );
};

# PIR tests

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pbc --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

$ENV{TEST_PROG_ARGS} = 'parrot_compiler.pir --language=PIR';
language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                    $ENV{TEST_PROG_ARGS} );

TODO:
{
  local $TODO = 'generating PASM from PIR is not supported';
  $ENV{TEST_PROG_ARGS} = 'parrot_compiler.pasm --language=PIR';
  language_output_is( 'ParrotCompiler', $code{PIR}, $out{PIR},
                      $ENV{TEST_PROG_ARGS} );
};
