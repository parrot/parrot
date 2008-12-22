#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/regex.t - Lua Regex Compiler

=head1 SYNOPSIS

    % perl t/regex.t

=head1 DESCRIPTION

Tests Lua Regex Compiler
(implemented in F<languages/lua/src/lib/luaregex.pir>).

Individual tests are stored in the C<rx_*> files in the same directory;
There is one test per line: each test consists of the following
columns (separated by one *or more* tabs):

=over 4

=item pattern

The Lua regex to test.

=item target

The string that will be matched against the pattern. Use '' to indicate
an empty string.

=item result

The expected result of the match.

=item description

Description of the test.

=back

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 150;
use Test::More;
use File::Spec;

my @test_files = (
    'rx_captures',
    'rx_charclass',
    'rx_metachars',
);

my %todo_info = (
);

my $test_number = 0;

foreach (@test_files) {
    my $filename = "$FindBin::Bin/$_" ;
    open my $FH, '<', $filename
            or die "can't open $filename ($!)\n";
    while (<$FH>) {
        last if (/^\s*$/);
        my ($pattern, $target, $result, $desc) = split /\t+/, $_;
        $pattern = '' if ($pattern eq "''");
        $pattern =~ s/"/\\"/g;
        $target = '' if ($target eq "''");
        $target =~ s/"/\\"/g;
        $result = '' if ($result eq "''");
        my $output = $result;
        $output =~ s/\\f/\f/g;
        $output =~ s/\\n/\n/g;
        $output =~ s/\\r/\r/g;
        $output =~ s/\\t/\t/g;
        $output =~ s/\\01/\01/g;
        $output =~ s/\\02/\02/g;
        $output =~ s/\\03/\03/g;
        $output =~ s/\\04/\04/g;
        $output =~ s/\\0/\0/g;
        chomp $desc;
        $test_number ++;

        my $code = "print(string.match(\"$target\", \"$pattern\"))";

        local $TODO = $todo_info{$test_number} if (exists $todo_info{$test_number});
        if ($output =~ /^\//) {
            language_output_like( 'lua', $code, $output, $desc );
        }
        else {
            language_output_is( 'lua', $code, $output . "\n", $desc );
        }
    }
    close $FH;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

