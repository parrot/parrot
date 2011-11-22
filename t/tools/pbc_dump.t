#! perl
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/tools/pbc_dump.t - test the Parrot Bytecode (PBC) Dumper

=head1 SYNOPSIS

    % prove t/tools/pbc_dump.t

=head1 DESCRIPTION

Tests the C<pbc_dump> tool by providing it with a number of source
files, and running through it with various commands.

We never actually check the I<full> output of pbc_dump.  We simply check
several smaller components to avoid a test file that is far too unwieldy.


=head1 REQUIREMENTS

This test script requires you to build pbc_dump, by typing
"make parrot_utils" (using a suitable make tool for your platform).
If this requirement has not been met, all tests will be skipped.

=cut

use strict;
use warnings;
use lib qw(lib);

use Test::More;
use Parrot::Config;
use Parrot::Test;
use File::Spec;

use Parrot::Test::Util 'create_tempfile';

my ($path, $exefile);
my $PARROT = ".$PConfig{slash}parrot$PConfig{exe}";

BEGIN {
    $path = File::Spec->catfile( ".", "pbc_dump" );
    $exefile = $path . $PConfig{exe};
    unless ( -f $exefile ) {
        plan skip_all => "pbc_dump hasn't been built. Run make parrot_utils";
        exit(0);
    }
    plan tests => 25;
}

dump_output_like( <<PIR, "pir", [qr/CONSTANT_t/, qr/BYTECODE_t/], 'pbc_dump basic sanity');
.sub main :main
    \$I0 = 42
.end
PIR

dump_output_like( <<PIR, "pir", qr/HEADER\s*=>\s*\[.*wordsize.*byteorder.*floattype.*parrot-version.*bytecode-version.*UUID.*\]/ms, 'pbc_dump HEADER sanity');
.sub main :main
    \$I0 = 42
.end
PIR

dump_output_like( <<PIR, "pir", qr/DIRECTORY\s*=>\s*\[.*offs.*op_count.*itype.*id.*size.*segments/ms, 'pbc_dump DIRECTORY sanity');
.sub main :main
    \$I0 = 42
.end
PIR

dump_output_like( <<PIR, "pir", qr/BYTECODE_t.*=>.*\[.*offs.*op_count.*itype.*id.*size.*mappings/ms, 'pbc_dump BYTECODE sanity');
.sub main :main
    \$I0 = 42
.end
PIR

for my $enc ( qw(binary iso-8859-1 utf8 utf16 ucs2 ucs4) ) {
    dump_output_like( <<PIR, "pir", qr/ENCODING.*=>.*$enc/ms, "pbc_dump $enc encoding");
.sub main :main
    \$S0 = $enc:"abc"
.end
PIR
}

my $longcode = ".sub main :main\n";
for (0 ... 10000) {
    $longcode .= "\$I0 = \$I0 + 1234\n";
}
$longcode .= ".end";

dump_output_like( $longcode, "pir",  qr/BYTECODE.*_DB.*=>/,
    "large pir program doesn't mess up pbc_dump");

open my $INC1, '>', "inc_a.pir";
print $INC1 <<'EOF';
.sub does :vtable
    .param string provides
.end
EOF
close $INC1;

open my $INC2, '>', "inc_b.pir";
print $INC2 <<'EOF';
.namespace [ 'TclConst' ]
.sub class_init :anon :load
    $P0 = get_class 'String'
.end
EOF
close $INC2;

open my $INC3, '>', "inc_c.pir";
print $INC3 <<'EOF';
.namespace [ 'TclDict' ]
.sub class_init :anon :load :main
    say "wut"
.end
EOF
close $INC3;

#test known-good hard-coded values.  These values come from looking at
#pbc_dump's #output and sanity checking with the locations of the various subs.
dump_output_like( <<PIR, "pir", qr/BYTECODE.*_DB.*OFFSET => 0,.*OFFSET => 7.*OFFSET => 13/ms, 'debug segments contain accurate offsets');
.include 'inc_a.pir'
.include 'inc_b.pir'
.include 'inc_c.pir'
PIR

unlink('inc_a.pir');
unlink('inc_b.pir');
unlink('inc_c.pir');

my $annotated_pir = <<'PIR';
.sub 'main' :main
  .annotate 'line', 1
  .annotate 'hello', 'world'
  .local int i
  i = 123
  .annotate 'hello', 'dragon'
  .annotate 'line', 441
  dec i
  .annotate 'goodbye', 'cactus'
.end
PIR

dump_output_like($annotated_pir, "pir", qr/_ANN/s, 'dump output contains annotations segments');
dump_output_like($annotated_pir, "pir", qr/NAME => line.*NAME => hello.*NAME => goodbye/s, 'annotation names are present');
dump_output_like($annotated_pir, "pir", qr/dragon/s, 'annotation values are present');


## Test pbc_dump tool
# Test help
my $helpregex = <<OUTPUT;
/pbc_dump - dump or convert parrot bytecode/
OUTPUT

dump_raw_output_like( "--help", $helpregex, "pbc_dump help message --help");
# Run it without params should also trigger the help
dump_raw_output_like( "", $helpregex, "pbc_dump help message (not enough params)");


# Create sample files
my ($pir_i, $pir_file) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
my (undef,  $pbc_file) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );
my (undef,  $pbcpack_file) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );

print $pir_i <<'EOF';
.sub main :main
    .const 'String' s = "Hello World"
    print s
.end
EOF
close $pir_i;

# Compile them
system($PARROT, '-o', $pbc_file, $pir_file);

# Test -n option
dump_raw_output_like("-n " . $pbc_file, qr/0003:  returncc/s, "pbc_dump -n command");

# Test -t option
dump_raw_output_like("-t " . $pbc_file, qr/HEADER.*DIRECTORY.*BYTECODE.*CONSTANT/s, "pbc_dump -t command");

# Test -h option
dump_raw_output_like("-h " . $pbc_file, qr/HEADER/s, "pbc_dump -h command");

# Test -d option
dump_raw_output_like("-d " . $pbc_file, qr/HEADER.*DIRECTORY.*BYTECODE/s, "pbc_dump -d command");

# Test -o option
dump_raw_output_like("-o " . $pbcpack_file . " " . $pbc_file, qr//s, "pbc_dump -o command");

# Test if the generated pbc file really works
my $output = `$PARROT $pbc_file 2>&1`;
is($output, "Hello World", "pbc_dump -o created a file that works");



# Test PackFile_Constant_dump_pmc on packdump.c
($pir_i, $pir_file) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );
(undef,  $pbc_file) = create_tempfile( SUFFIX => '.pbc', UNLINK => 1 );

print $pir_i <<'EOF';
.sub main :main
    $P0 = new ['Hash']

    $P0['key';0] = 2

    $I0 = 1
    $S0 = 'new_key'
    $P0[$I0; $S0] = 'value'

    print "Hallo Welt"
.end
EOF
close $pir_i;

system($PARROT, '-o', $pbc_file, $pir_file);

dump_raw_output_like("" . $pbc_file, qr/I REGISTER.*S REGISTER/s, "pbc_dump packdump.c");


=head1 HELPER SUBROUTINES

=head2 dump_output_like

    dump_output_like(<<PASM, "pasm", "some output", "running $file");

Takes 3-4 arguments: a file to run,
the filename-extension of the file (probably "pir" or "pasm"),
an arrayref or single regex string to match within pbc_dump's output,
and the optional test diagnostic.

=cut

sub dump_output_like {
    pbc_postprocess_output_like($path, @_ );
}

sub dump_raw_output_like {
    my ($options, $snippet, $desc)  = @_;
    my $out = `$exefile $options 2>&1`;
    like( $out, $snippet, $desc );
    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
