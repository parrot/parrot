#! perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 16;
use Parrot::Config;
use Cwd;
use File::Spec;

my $MSWin32 = $^O =~ m!MSWin32!;
my $cygwin  = $^O =~ m!cygwin!;
my $solaris = $^O =~ m!solaris!;
my $MSVC = $PConfig{cc} =~ m/\bcl(?:\.exe)?/i;

=head1 NAME

t/pmc/os.t - Files and Dirs

=head1 SYNOPSIS

    % prove t/pmc/os.t

=head1 DESCRIPTION

Tests the C<OS> PMC.

=cut

END {
    # Clean up environment on exit
    rmdir "xpto"  if -d "xpto";
    unlink "xpto" if -f "xpto";
}

# test 'cwd'
my $cwd = File::Spec->canonpath(getcwd);
if (File::Spec->case_tolerant(substr($cwd,0,2))) {
    $cwd = lc($cwd);
    pir_output_is( <<'CODE', <<"OUT", 'Test cwd' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']
        $S1 = $P1."cwd"()
        $S2 = downcase $S1
        print $S2
        print "\n"
        end
.end
CODE
$cwd
OUT
}
else {
    pir_output_is( <<'CODE', <<"OUT", 'Test cwd' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']
        $S1 = $P1."cwd"()
        print $S1
        print "\n"
        end
.end
CODE
$cwd
OUT
}

#  TEST chdir
chdir "src";
my $upcwd = File::Spec->canonpath(getcwd);
chdir '..';

if (File::Spec->case_tolerant(substr($cwd,0,2))) {
    $cwd = lc($cwd);
    $upcwd = lc($upcwd);

    pir_output_is( <<'CODE', <<"OUT", 'Test chdir' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "src"
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        $S2 = downcase $S1
        say $S2

        $S1 = ".."
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        $S2 = downcase $S1
        say $S2

        end
.end
CODE
$upcwd
$cwd
OUT
}
else {
    pir_output_is( <<'CODE', <<"OUT", 'Test chdir' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "src"
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        say $S1

        $S1 = ".."
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        say $S1

        end
.end
CODE
$upcwd
$cwd
OUT
}

# Test mkdir

my $xpto = $upcwd;
$xpto =~ s/src([\/\\]?)$/xpto$1/;

if (File::Spec->case_tolerant(substr($cwd,0,2))) {

    pir_output_is( <<'CODE', <<"OUT", 'Test mkdir' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "xpto"
        $I1 = 0o555
        $P1."mkdir"($S1,$I1)
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        $S2 = downcase $S1
        say $S2

        $S1 = ".."
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        $S2 = downcase $S1
        say $S2

        end
.end
CODE
$xpto
$cwd
OUT
}
else {
    pir_output_is( <<'CODE', <<"OUT", 'Test mkdir' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "xpto"
        $I1 = 0o555
        $P1."mkdir"($S1,$I1)
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        say $S1

        $S1 = ".."
        $P1."chdir"($S1)

        $S1 = $P1."cwd"()
        say $S1

        end
.end
CODE
$xpto
$cwd
OUT
}

# Test remove on a directory
mkdir "xpto" unless -d "xpto";

pir_output_is( <<'CODE', <<'OUT', 'Test rm call in a directory' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "xpto"
        $P1."rm"($S1)

        print "ok\n"

        end
.end
CODE
ok
OUT

ok( !-d $xpto, "Test that rm removed the directory" );
rmdir $xpto if -d $xpto;    # this way next test doesn't fail if this one does

# test stat

open my $X, '>', "xpto";
print $X "xpto";
close $X;

my $stat;

my $count = $MSWin32 ? 11 : 13;
my @s = stat('xpto');
if ( $cygwin ) {
    # Mask inode number (fudge it)
    $s[1] &= 0xffffffff;
}

if ( $MSWin32 ) {
    $stat = sprintf("0x%08x\n" x 11, @s);
    pir_output_is( <<'CODE', $stat, 'Test OS.stat' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']
        $S1 = "xpto"
        $P2 = $P1."stat"($S1)

        $S1 = repeat "0x%08x\n", 11
        $S2 = sprintf $S1, $P2
        print $S2
done:
        end
.end
CODE
}
else {
  SKIP: {
    skip 'broken test TT #457', 1 if $solaris;

    $stat = sprintf("0x%08x\n" x 13, @s);
    pir_output_is( <<'CODE', $stat, 'Test OS.stat' );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']
        $S1 = "xpto"
        $P2 = $P1."stat"($S1)

        $S1 = repeat "0x%08x\n", 13
        $S2 = sprintf $S1, $P2
        print $S2
done:
        end
.end
CODE
}
}

# test readdir
SKIP: {
    skip 'not implemented on windows yet', 1 if ( $MSWin32 && $MSVC );

    opendir my $IN, 'docs';
    my @entries = readdir $IN;
    closedir $IN;
    my $entries = join( ' ', @entries ) . "\n";
    pir_output_is( <<'CODE', $entries, 'Test OS.readdir' );
.sub main :main
    $P0 = loadlib 'os'
    $P1 = new ['OS']
    $P2 = $P1.'readdir'('docs')

    $S0 = join ' ', $P2
    print $S0
    print "\n"
.end
CODE
}

# test rename
SKIP: {
    open my $FILE, ">", "____some_test_file";
    close $FILE;
    pir_output_is( <<'CODE', <<"OUT", 'Test OS.rename' );
.loadlib 'io_ops'
.sub main :main
    $P0 = loadlib 'os'
    $P1 = new ['OS']
    $P1.'rename'('____some_test_file', '___some_other_file')
    $I0 = stat '___some_other_file', 0
    print $I0
    print "\n"
    $P1.'rm'('___some_other_file')
.end
CODE
1
OUT
}

# test lstat

my $lstat;

SKIP: {
    skip 'lstat not on Win32', 1 if $MSWin32;
    skip 'broken test TT #457', 1 if $solaris;

    my @s = lstat('xpto');
    if ($cygwin) {
        # Mask inode number (fudge it)
        $s[1] &= 0xffffffff;
    }
    $lstat = sprintf( "0x%08x\n" x 13, @s );
    pir_output_is( <<'CODE', $lstat, "Test OS.lstat" );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']
        $S1 = "xpto"
        $P2 = $P1."lstat"($S1)

        $S1 = repeat "0x%08x\n", 13
        $S2 = sprintf $S1, $P2
        print $S2

        end
.end
CODE
}

# Test remove on a file
pir_output_is( <<'CODE', <<"OUT", "Test rm call in a file" );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "xpto"
        $P1."rm"($S1)

        print "ok\n"

        end
.end
CODE
ok
OUT

ok( !-f $xpto, "Test that rm removed file" );
rmdir $xpto if -f $xpto;    # this way next test doesn't fail if this one does

# Test symlink
SKIP: {
    skip "Symlinks not available under Windows", 2 if $MSWin32;

    pir_output_is( <<'CODE', <<"OUT", "Test symlink" );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "xpto"
        $S2 = "MANIFEST"
        $P1."symlink"($S2, $S1)

        print "ok\n"

        end
.end
CODE
ok
OUT

    ok( -l "xpto", "symlink was really created" );
    unlink "xpto" if -f "xpto";
}

# Test link to file. May require root permissions
SKIP: {
    skip "Hardlinks to files not possible on Windows", 2 if $MSWin32 or $cygwin;

    pir_output_is( <<'CODE', <<"OUT", "Test link" );
.sub main :main
        $P0 = loadlib 'os'
        $P1 = new ['OS']

        $S1 = "xpto"
        $S2 = "myconfig"
        $P1."link"($S2, $S1)

        print "ok\n"

        end
.end
CODE
ok
OUT

    my $nl = [ stat("myconfig") ]->[3];
    ok( $nl > 1, "hard link to file was really created" );
    unlink "xpto" if -f "xpto";
}

SKIP: {
    skip "Hardlinks to files not possible on Windows", 1 if $MSWin32 or $cygwin;

    my $prevnl = [ stat("tools") ]->[3];
    pir_output_like( <<"CODE", <<"OUT", "Test dirlink" );
.sub main :main
    .local pmc os
    .local string xpto, tools
    \$P0 = loadlib 'os'
    os    = new ['OS']
    xpto  = "xpto"
    tools = "tools"

    push_eh no_root_perms
    os."link"(tools, xpto)
    pop_eh

    .local pmc statvals
    statvals = os.'stat'(tools)

    # nlink
    .local int nlink
    nlink = statvals[3]

    gt nlink, $prevnl, is_okay
    end

  no_root_perms:
    .local pmc e
    .local string message
    .get_results( e )
    pop_eh
    message = e['message']
    say message
    end

  is_okay:
    say "ok"
    end
.end
CODE
/link.* failed for OS PMC:/
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
