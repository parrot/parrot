#!/usr/bin/perl -w

use strict;

use FindBin;
use lib "$FindBin::Bin/lib";

use Make; # XXX NO EXPORTS DAMNIT

$Make::AppVersion = "0.0.6";

my $INC = 'include/parrot';

my @CFLAGS = qw(
  -fno-strict-aliasing -I/usr/local/include
  -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
  -Wall -Wstrict-prototypes -Wmissing-prototypes -Winline -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Waggregate-return -Winline -W -Wno-unused -Wsign-compare
  -I./include  -DHAVE_COMPUTED_GOTO
);

my @LDFLAGS = qw( -L/usr/local/lib );
my @C_LIBS = qw( -lnsl -ldl -lm -lcrypt -lutil );

Make::c_flags(@CFLAGS);
Make::c_libs(@C_LIBS);

#------------------------------------------------------------------------------

my @GEN_HEADERS = map { "$INC/$_.h" } qw(
  vtable oplib/core_ops oplib/core_ops_prederef
);

my @GENERAL_H_FILES = map { "$INC/$_.h" } qw(
  config exceptions io op
  register string events interpreter
  memory parrot stacks packfile
  global_setup vtable oplib/core_ops
  oplib/core_ops_prederef runops_cores trace
  pmc key hash resources platform oplib/core_ops_cg
  interp_guts rx rxstacks
  embed warnings misc debug
);

my @H_FILES = @GENERAL_H_FILES;

#------------------------------------------------------------------------------
#
# Lists of object files
#

#
# Implicitly compiled objects
#
my @INTERP_O_FILES = Object( input => [qw(
  sub runops_cores trace byteorder
)]);

#
# This is probably the wrong way to go...
#
my @object_files;

for(qw(
  interpreter core_ops core_ops_cg core_ops_prederef
)) {
  push @object_files, CC(
    input=>"$_.c",
    output=>Object(input=>$_),
    dependsOn => [
      "$_.c",
      @GENERAL_H_FILES,
    ],
  );
}

for(qw(
  global_setup pmc hash jit key
  resources platform debug string exceptions
  chartype chartypes/usascii chartypes/unicode
  encoding encodings/singlebyte encodings/utf8 encodings/utf16 encodings/utf32
  io/io io/io_buf io/io_unix io/io_win32 io/io_stdio
  memory packfile packout parrot register rx rxstacks stacks embed
)) {
  push @object_files, CC(
    input=>"$_.c",
    output=>Object(input=>$_),
    dependsOn => [
      "$_.c",
      @H_FILES,
    ],
  );
}

for(qw(
  warnings misc
)) {
  push @object_files, CC(
    input=>"$_.c",
    output=>Object(input=>$_),
    dependsOn => [
      "$_.c",
      @H_FILES,
    ],
  );
}

#
# XXX Not listed in the objects, I think.
#
my $jit_cpu_object = CC(
#  input => 'jit_cpu.c',
#  output => Object(input=>'jit_cpu'),
  input => 'jit.c',
  output => Object(input=>'jit'),
  dependsOn => [
    @GENERAL_H_FILES,
    "$INC/jit_emit.h",
  ],
);

@INTERP_O_FILES=(@INTERP_O_FILES,@object_files,$jit_cpu_object);

my @IO_O_FILES = Object( input => [qw(
  io/io io/io_buf io/io_unix io/io_win32 io/io_stdio
)]);

my @CLASS_O_FILES = map { Object(input=>"classes/$_") } qw(
  array coroutine default intqueue pointer sub
  perlarray perlhash perlint perlnum perlstring perlundef
);

my @ENCODING_O_FILES = Object( input => [qw(
  encodings/singlebyte encodings/utf8 encodings/utf16 encodings/utf32
)]);

my @CHARTYPE_O_FILES = Object( input => [qw(
  chartypes/unicode chartypes/usascii
)]);

my @O_FILES = (
  @INTERP_O_FILES,
#  @IO_O_FILES,
  @CLASS_O_FILES,
#  @ENCODING_O_FILES,
#  @CHARTYPE_O_FILES
);

#------------------------------------------------------------------------------

my $test_main_obj = CC(
  input => 'test_main.c',
  output => Object(input=>'test_main'),
  dependsOn => [
    'test_main.c',
    @GENERAL_H_FILES,
  ],
);

Target(
  input => '_default',
  output => Executable(input=>'parrot'),
  dependsOn => Link(
    input => [
      @O_FILES,
      Object(input=>'test_main'),
#      $test_main_obj, # XXX Should be able to insert an object here...
    ],
    output => Executable(input=>'parrot'),
    dependsOn => [
      $test_main_obj, # Object(input=>'test_main'),
      @GEN_HEADERS,
      @O_FILES,
      'lib/Parrot/OpLib/core.pm',
      'lib/Parrot/OpLib/PMC.pm',
    ],
  ),
);

#------------------------------------------------------------------------------

Build($ARGV[0]); # XXX Just build the damn target, already.
exit;
