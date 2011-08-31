#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie;
use System::Command;
use File::Slurp;
use Data::Dumper;
use feature qw<say>;

=head1 NAME

tools/dev/all_hll_test.pl - run the test suite for a many of Parrot-dependent
projects.

=head1 SYNOPSIS

  $ perl tools/dev/all_hll_test.pl

=head1 DESCRIPTION

This script builds Parrot from the cwd, installs it to a temporary directory
and installs/tests a number of HLLs and libraries, storing the output from
their builds.  Its goal is to provide us with improved assurance that changes
made to Parrot won't adversely affect HLLs and libraries without our knowledge.

Hopefully an irc bot or some other form of notification will get involved at
some point.

=cut


my $tmp_dir = "/tmp/parrot_all_hll_test_$$";
my $install_dir = "$tmp_dir/parrot_install";
qx<rm -rf $tmp_dir>;
mkdir $tmp_dir;
mkdir $install_dir;
my $status = [];
my $verbose = 0;
if ($ARGV[0] eq '-v' || $ARGV[0] eq '--verbose') {
    $verbose = 1;
}

build_project({
    "name"      => "Parrot",
    "configure" => [qq<perl Configure.pl --prefix=$install_dir --optimize>],
    "build"     => [qq<make>],
    "install"   => [qq<make install>],
    #"test"      => [qq<make test>],
    "tmp"       => $tmp_dir,
    "use_cwd"   => 1,
}, $status);

{
    local %ENV = %ENV;
    $ENV{"PATH"} = "$install_dir/bin:" . $ENV{"PATH"};

    build_project({
        "name"  => "Winxed",
        "clone" => [qw<git clone https://github.com/NotFound/winxed.git CLONE_DIR>],
        "build" => [qq<winxed setup.winxed>],
        "test"  => [qq<winxed setup.winxed test>],
        "tmp"   => $tmp_dir,
    }, $status);

    build_project({
        "name"    => "Rosella",
        "clone"   => [qw<git clone https://github.com/Whiteknight/Rosella.git CLONE_DIR>],
        "build"   => [qq<winxed setup.winxed build>],
        "test"    => [qq<winxed setup.winxed test>],
        # needed by parrot-linear-algebra and parrot-gmp
        "install" => [qq<winxed setup.winxed install>],
        "tmp"     => $tmp_dir,
    }, $status);

    build_project({
        "name"  => "parrot-gmp",
        "clone" => [qw<git clone https://github.com/bubaflub/parrot-gmp.git CLONE_DIR>],
        "build" => [qq<winxed setup.winxed build>],
        "test"  => [qq<winxed setup.winxed test>],
        "tmp"   => $tmp_dir,
    }, $status);

    build_project({
        "name"  => "parrot-linear-algebra",
        "clone" => [qw<git clone https://github.com/Whiteknight/parrot-linear-algebra.git CLONE_DIR>],
        "build" => [qq<parrot-nqp setup.nqp>],
        "test"  => [qq<parrot-nqp setup.nqp test>],
        "tmp"   => $tmp_dir,
    }, $status);

    build_project({
        "name"  => "ohm-eta-wink-kzd",
        "clone" => [qw<git clone https://github.com/plobsing/ohm-eta-wink-kzd.git CLONE_DIR>],
        "build" => [qq<make>],
        "test"  => [qq<make test>],
        "tmp"   => $tmp_dir,
    }, $status);

    build_project({
        "name"  => "Plumage",
        "clone" => [qw<git clone https://github.com/parrot/plumage.git CLONE_DIR>],
        "build" => [qq<parrot setup.pir build>],
        "test"  => [qq<parrot setup.pir test>],
        "tmp"   => $tmp_dir,
    }, $status);

    build_project({
        "name"      => "nqp",
        "clone"     => [qw<git clone https://github.com/perl6/nqp.git CLONE_DIR>],
        "configure" => [qq<perl Configure.pl --with_parrot=$install_dir/bin/parrot>],
        "build"     => [qq<make>],
        "test"      => [qq<make test>],
        # needed by Rakudo
        "install"   => [qq<make install>],
        "tmp"       => $tmp_dir,
    }, $status);

    build_project({
        "name"      => "Rakudo",
        "clone"     => [qw<git clone -b nom https://github.com/rakudo/rakudo.git CLONE_DIR>],
        "configure" => [qq<perl Configure.pl --with-parrot=$install_dir/bin/parrot>],
        "build"     => [qq<make>],
        "test"      => [qq<make spectest_regression>],
        "tmp"       => $tmp_dir,
    }, $status);

    build_project({
        "name"  => "Lua",
        "clone" => [qw<git clone https://github.com/fperrad/lua.git CLONE_DIR>],
        "build" => [qq<parrot setup.pir>],
        "test"  => [qq<parrot setup.pir test>],
        "tmp"   => $tmp_dir,
    }, $status);

    build_project({
        "name"      => "Partcl-nqp",
        "clone"     => [qw<git clone https://github.com/partcl/partcl-nqp.git CLONE_DIR>],
        "configure" => [qq<perl Configure.pl --parrot-config=$install_dir/bin/parrot_config>],
        "build"     => [qq<make>],
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    }, $status);
}

foreach my $proj_status (@$status) {
    my $proj_name = (keys %$proj_status)[0];
    print "status for '$proj_name' - ";
    my $stage_num = 0;
    my @bad_stages;
    my @good_stages;
    foreach my $stage (@{$proj_status->{$proj_name}}) {
        if ($stage->{exit}) {
            push @bad_stages, $stage->{stage};
        }
        else {
            push @good_stages, $stage->{stage};
        }
    }
    if (@bad_stages) {
        say "$bad_stages[0] failed";
    }
    else {
        say "ok";
    }
}


sub build_project {
    my %opts = %{$_[0]};
    my $global_status = $_[1];
    my $proj_name = $opts{name};
    my $tmp_dir   = $opts{tmp};
    my $use_cwd   = exists $opts{use_cwd} ? 1 : 0;
    my $stage_num = 0;
    my @proj_status;

    my $proj_dir = lc($proj_name) . "_test";
    mkdir "$tmp_dir/logs" unless -d "$tmp_dir/logs";
    print "running $proj_name: ";

    foreach my $stage (qw<clone configure build install test>){

        if ($stage eq "clone" && exists $opts{$stage} && !$use_cwd) {

            print "$stage ";
            print "\n" if $verbose;
            chdir $tmp_dir;
            qx<rm -rf $proj_dir>;

            my @cmd_args = map { $_ =~ s/CLONE_DIR/$proj_dir/g; $_ } @{$opts{$stage}};
            my $cmd = System::Command->new(@cmd_args);
            my $cmd_stdout = '';
            while (readline($cmd->stdout())) {
                $cmd_stdout .= $_;
                print $_ if $verbose;
            }

            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stdout.log", $cmd_stdout);
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stderr.log", join('', readline($cmd->stderr())));
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_cmdline.log", join(' ', $cmd->cmdline()));

            $cmd->close();
            push @proj_status, {
                stage => $stage,
                exit  => $cmd->exit(),
            };

            if ($cmd->exit()) {
                say "\n$stage failed";
                return;
            }
            chdir "$tmp_dir/$proj_dir";
            $stage_num++;
        }
        elsif (exists $opts{$stage}) {

            print "$stage ";
            print "\n" if $verbose;
            $use_cwd || chdir "$tmp_dir/$proj_dir";
            my $cmd = System::Command->new(@{$opts{$stage}});
            my $cmd_stdout = '';

            while (readline($cmd->stdout())) {
                $cmd_stdout .= $_;
                print $_ if $verbose;
            }
            my $cmd_stderr = join('', readline($cmd->stderr()));

            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stdout.log", $cmd_stdout);
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stderr.log", join('', readline($cmd->stderr())));
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_cmdline.log", join(' ', $cmd->cmdline()));

            $cmd->close();
            push @proj_status, {
                stage => $stage,
                exit  => $cmd->exit(),
            };

            if ($cmd->exit()) {
                say "$stage FAILED";
                return;
            }
            $stage_num++;
        }
    }
    say "ok!";
    push @$global_status, { $proj_name => [ @proj_status ] };
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
