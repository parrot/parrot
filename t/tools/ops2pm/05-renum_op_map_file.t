#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$
# 05-renum_op_map_file.t

use strict;
use warnings;

use Test::More tests =>  6;
use Carp;
use Cwd;
use File::Copy;
use File::Path qw( mkpath );
use File::Spec;
use File::Temp qw( tempdir );
use Tie::File;
use lib 'lib';
use Parrot::OpsRenumber;

my ($self, @opsfiles);
my ($lastcode, $lastnumber);
my $numoutput = q{src/ops/ops.num};
my $cwd = cwd();
my $samplesdir = File::Spec->catdir( $cwd,
    ( qw| t tools ops2pm samples | )
);;
ok(-d $samplesdir, "Able to locate samples directory");

{
    ##### Prepare temporary directory for testing #####

    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to testing directory: $!";
    my $opsdir = File::Spec->catdir ( $tdir, 'src', 'ops' );
    mkpath( [ $opsdir ], 0, 0755 ) or croak "Unable to make testing directory";
    my $incpardir = File::Spec->catdir ( $tdir, 'include', 'parrot' );
    mkpath( [ $incpardir ], 0, 0755 ) or croak "Unable to make testing directory";

    ##### Stage 1:  Generate ops.num de novo #####

    my @stage1 = qw(
        core_ops.original
        bit_ops.original
        ops_num.original
    );
    copy_into_position($samplesdir, \@stage1, q{original}, $opsdir);
    foreach my $f ( qw| core bit | ) {
        copy qq{$samplesdir/${f}_ops.original}, qq{src/ops/$f.ops.post}
            or croak "Unable to store $f for later testing: $!";
    }
    ($lastcode, $lastnumber) = run_test_stage(
        [ qw(
            src/ops/core.ops
            src/ops/bit.ops
        ) ],
        $numoutput,
    );
    is($lastcode, q{bxors_s_s_sc},
        "Stage 1:  Got expected last opcode");
    is($lastnumber, 177,
        "Stage 1:  Got expected last opcode number");

    ###### Stage 2:  Delete some opcodes and regenerate ops.num #####

    my @stage2 = qw( bit_ops.second );
    copy_into_position($samplesdir, \@stage2, q{second}, $opsdir);
    ($lastcode, $lastnumber) = run_test_stage(
        [ qw(
            src/ops/core.ops
            src/ops/bit.ops
        ) ],
        $numoutput,
    );

    is($lastcode, q{bxor_i_i_ic},
        "Stage 2:  Got expected last opcode");
    is($lastnumber, 172,
        "Stage 2:  Got expected last opcode number");

    # Go back where we started to activate cleanup
    chdir $cwd or croak "Unable to change back to starting directory: $!";
}

pass("Completed all tests in $0");

#################### SUBROUTINES ####################

sub run_test_stage {
    my ($opsfilesref, $numoutput) = @_;
    my $self = Parrot::OpsRenumber->new(
        {
            argv    => $opsfilesref,
            moddir  => "lib/Parrot/OpLib",
            module  => "core.pm",
            inc_dir => "include/parrot/oplib",
            inc_f   => "ops.h",
            script  => $0,
        }
    );

    $self->prepare_ops();
    $self->renum_op_map_file();
    my ($lastcode, $lastnumber) = get_last_opcode($numoutput);
    return ($lastcode, $lastnumber);
}

sub copy_into_position {
    my ($samplesdir, $stageref, $ext, $opsdir) = @_;
    foreach my $or ( @{ $stageref } ) {
        my $fullor = File::Spec->catfile( $samplesdir, $or );
        my $real;
        ($real = $or) =~ s/\.$ext$//;
        $real =~ s/_/\./g;
        my $fullreal = File::Spec->catfile( $opsdir, $real );
        copy $fullor, $fullreal or croak "Unable to copy $or";
    }
}

sub get_last_opcode {
    my $file = shift;
    croak "$file not found: $!" unless -f $file;
    my (@lines, $lastline);
    tie @lines, 'Tie::File', $file or croak "Unable to tie to $file: $!";
    $lastline = $lines[-1];
    untie @lines or croak "Unable to untie from $file: $!";
    my ($lastcode, $lastnumber) = split /\s+/, $lastline, 2;
    croak "Couldn't parse last line of $file: $!"
        unless (defined $lastcode and defined $lastnumber);
    return ($lastcode, $lastnumber);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

