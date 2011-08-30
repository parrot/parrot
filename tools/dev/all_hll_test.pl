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

#print "running Configure.pl on Parrot in cwd\n";
#my $parrot_configure = System::Command->new(qq<perl Configure.pl --prefix=$install_dir --optimize>);
#waitpid($parrot_configure->pid(), 0);
#if (!waitpid($parrot_configure->pid(), 0)) {
    #die "OH NOES TEH PARROT CONFIGUER DIED";
#}
#my $configure_stdout = join('', readline($parrot_configure->stdout()));
#my $configure_stderr = join('', readline($parrot_configure->stderr()));

#print "building Parrot\n";
#my $parrot_build = System::Command->new(qw<make>);
#print while readline($parrot_build->stdout());
#waitpid($parrot_build->pid(), 0);
#print "installing Parrot into tmp dir\n";
#my $parrot_install = System::Command->new(qw<make install>);
#print while readline($parrot_install->stdout());
#waitpid($parrot_install->pid(), 0);

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
        "configure" => [qq<perl Configure.pl --with_parrot=$install_dir/bin/parrot>],
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
    my $configure_cmd = $opts{configure};
    my $build_cmd     = $opts{build};
    my $install_cmd   = $opts{install};
    my $test_cmd      = $opts{test};
    my $tmp_dir       = $opts{tmp};
    my $use_cwd       = $opts{use_cwd};

    my $proj_dir = lc($proj_name) . "_test";

    foreach my $stage (qw<clone configure build install test>){
        if ($stage eq "clone" exists $opts{$stage} && !$use_cwd) {
            print "running stage '$stage' for $proj_name\n";
            chdir $tmp_dir;
            qx<rm -rf $proj_dir>;
            print "cloning $proj_name\n";
            system @$clone_cmd;
            chdir $proj_dir;
        }
        elsif (exists $opts{$stage}) {
            print "running stage '$stage' for $proj_name\n";
            system @{$opts{$stage}}
        }
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
