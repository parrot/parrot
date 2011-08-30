#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie;
use System::Command;
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
    "test" =>  [qq<make test>],
    "tmp"  => $tmp_dir,
    "use_cwd" => 1,
});


{
    local %ENV = %ENV;
    $ENV{"PATH"} = "$install_dir/bin:" . $ENV{"PATH"};

    build_project({
        "name" => "Winxed",
        "clone" => [qw<git clone https://github.com/NotFound/winxed.git winxed_test>],
        "build" => [qq<winxed setup.winxed>],
        "test" =>  [qq<winxed setup.winxed test>],
        "tmp"  => $tmp_dir,
    });

    build_project({
        "name" => "Rosella",
        "clone" => [qw<git clone https://github.com/Whiteknight/Rosella.git rosella_test>],
        "build" => [qq<winxed setup.winxed>],
        "test" =>  [qq<winxed setup.winxed test>],
        "tmp"  => $tmp_dir,
    });

    build_project({
        "name"      => "nqp",
        "clone"     => [qw<git clone https://github.com/perl6/nqp.git nqp_test>],
        "configure" => [qq<perl Configure.pl --with_parrot=$install_dir/bin/parrot>],
        "install"   => [qq<make install>],
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

    build_project({
        "name"      => "Rakudo",
        "clone"     => [qw<git clone -b nom https://github.com/rakudo/rakudo.git rakudo_test>],
        "configure" => [qq<perl Configure.pl --with-parrot=$install_dir/bin/parrot>],
        #XXX: should be spectest_regression; using test to make this easier to test
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

    build_project({
        "name"  => "Lua",
        "clone" => [qw<git clone https://github.com/fperrad/lua.git lua_test>],
        "build" => [qq<parrot setup.pir>],
        "test"  => [qq<parrot setup.pir test>],
        "tmp"   => $tmp_dir,
    });

}

sub build_project {
    my %opts = %{$_[0]};
    my $proj_name     = $opts{name};
    my $clone_cmd     = $opts{clone};
    my $tmp_dir       = $opts{tmp};
    my $use_cwd       = $opts{use_cwd};

    my $proj_dir = lc($proj_name) . "_test";

    foreach my $stage (qw<clone configure build install test>){
        if ($stage eq "clone" && exists $opts{$stage} && !$use_cwd) {
            say "running stage '$stage' for $proj_name";
            chdir $tmp_dir;
            qx<rm -rf $proj_dir>;
            say "cloning $proj_name";
            my $cmd = System::Command->new(@$clone_cmd);
            waitpid($cmd->pid(), 0);
            my $cmd_stdout = join('', readline($cmd->stdout()));
            my $cmd_stderr = join('', readline($cmd->stderr()));
            if (!waitpid($cmd->pid(), 0)) {
                die "OH NOES TEH CLOEN HAVE DIED";
            }
            chdir $proj_dir;
        }
        elsif (exists $opts{$stage}) {
            say "running stage '$stage' for $proj_name";
            my $cmd = System::Command->new(@{$opts{$stage}});
            waitpid($cmd->pid(), 0);
            my $cmd_stdout = join('', readline($cmd->stdout()));
            my $cmd_stderr = join('', readline($cmd->stderr()));
            if (!waitpid($cmd->pid(), 0)) {
                die "OH NOES TEH $stage STAEG HAVE DIED";
            }
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
