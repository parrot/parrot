#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie;
use System::Command;
use File::Slurp;
use feature qw<say>;

=head1 NAME

tools/dev/all_hll_test.pl - run the test suite for a many of Parrot-dependent
projects.

=head1 SYNOPSIS

  $ perl tools/dev/all_hll_test.pl

=cut

my $tmp_dir = "/tmp/parrot_all_hll_test";
my $install_dir = "$tmp_dir/parrot_install";
qx<rm -rf $tmp_dir>;
mkdir $tmp_dir;
mkdir $install_dir;

build_project({
    "name" => "Parrot",
    "configure" => [qq<perl Configure.pl --prefix=$install_dir --optimize>],
    "build" => [qq<make>],
    "install" => [qq<make install>],
    #"test" =>  [qq<make test>],
    "tmp"  => $tmp_dir,
    "use_cwd" => 1,
});


{
    local %ENV = %ENV;
    $ENV{"PATH"} = "$install_dir/bin:" . $ENV{"PATH"};

    build_project({
        "name" => "Winxed",
        "clone" => [qw<git clone https://github.com/NotFound/winxed.git CLONE_DIR>],
        "build" => [qq<winxed setup.winxed>],
        "test" =>  [qq<winxed setup.winxed test>],
        "tmp"  => $tmp_dir,
    });

    build_project({
        "name" => "Rosella",
        "clone" => [qw<git clone https://github.com/Whiteknight/Rosella.git CLONE_DIR>],
        "build" => [qq<winxed setup.winxed>],
        "test" =>  [qq<winxed setup.winxed test>],
        "tmp"  => $tmp_dir,
    });

    build_project({
        "name"      => "nqp",
        "clone"     => [qw<git clone https://github.com/perl6/nqp.git CLONE_DIR>],
        "configure" => [qq<perl Configure.pl --with_parrot=$install_dir/bin/parrot>],
        "install"   => [qq<make install>],
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

    build_project({
        "name"      => "Rakudo",
        "clone"     => [qw<git clone -b nom https://github.com/rakudo/rakudo.git CLONE_DIR>],
        "configure" => [qq<perl Configure.pl --with-parrot=$install_dir/bin/parrot>],
        #XXX: should be spectest_regression; using test to make this quicker to test
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

    build_project({
        "name"  => "Lua",
        "clone" => [qw<git clone https://github.com/fperrad/lua.git CLONE_DIR>],
        "build" => [qq<parrot setup.pir>],
        "test"  => [qq<parrot setup.pir test>],
        "tmp"   => $tmp_dir,
    });

    build_project({
        "name"      => "Partcl-nqp",
        "clone"     => [qw<git clone https://github.com/partcl/partcl-nqp.git CLONE_DIR>],
        "configure" => [qq<perl Configure.pl --parrot-config=$install_dir/bin/parrot_config>],
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

}

sub build_project {
    my %opts = %{$_[0]};
    my $proj_name     = $opts{name};
    my $tmp_dir       = $opts{tmp};
    my $use_cwd       = exists $opts{use_cwd} ? 1 : 0;
    my $stage_num     = 0;

    my $proj_dir = lc($proj_name) . "_test";
    mkdir "$tmp_dir/logs" unless -d "$tmp_dir/logs";

    foreach my $stage (qw<clone configure build install test>){
        if ($stage eq "clone" && exists $opts{$stage} && !$use_cwd) {

            say "running stage '$stage' for $proj_name: ";
            chdir $tmp_dir;
            qx<rm -rf $proj_dir>;

            my @cmd_args = map { $_ =~ s/CLONE_DIR/$proj_dir/g; $_ } @{$opts{$stage}};
            my $cmd = System::Command->new(@cmd_args);
            my $cmd_stdout = '';
            while (readline($cmd->stdout())) {
                $cmd_stdout .= $_;
                print $_;
            }
            waitpid($cmd->pid(), 0);

            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stdout.log", $cmd_stdout);
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stderr.log", join('', readline($cmd->stderr())));
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_cmdline.log", join(' ', $cmd->cmdline()));

            if ($cmd->exit()) {
                die "OH NOES TEH CLOEN HAVE DIED";
            }
            #say "done";
            #say "cmdline: ". join(" ",$cmd->cmdline());
            #say "stdout: $cmd_stdout";
            #say "stderr: $cmd_stderr";
            chdir "$tmp_dir/$proj_dir";
            $stage_num++;
        }
        elsif (exists $opts{$stage}) {

            say "running stage '$stage' for $proj_name: " . join(' ', @{$opts{$stage}});
            $use_cwd || chdir "$tmp_dir/$proj_dir";
            my $cmd = System::Command->new(@{$opts{$stage}});
            my $cmd_stdout = '';

            while (readline($cmd->stdout())) {
                $cmd_stdout .= $_;
                print $_;
            }
            my $cmd_stderr = join('', readline($cmd->stderr()));
            waitpid($cmd->pid(), 0);

            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stdout.log", $cmd_stdout);
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_stderr.log", join('', readline($cmd->stderr())));
            write_file("$tmp_dir/logs/${proj_name}_stage${stage_num}_${stage}_cmdline.log", join(' ', $cmd->cmdline()));

            if ($cmd->exit()) {
                say "cmdline: ". join(" ",$cmd->cmdline());
                say "stdout: $cmd_stdout";
                say "stderr: $cmd_stderr";
                die "OH NOES TEH $stage STAEG HAVE DIED";
            }
            #say "done";
            #say "cmdline: ". join(" ",$cmd->cmdline());
            #say "stdout: $cmd_stdout";
            #say "stderr: $cmd_stderr";
            $stage_num++;
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
