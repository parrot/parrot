#! perl
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;
use autodie;
use System::Command;

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

print "running Configure.pl on Parrot in cwd\n";
my $parrot_configure = System::Command->new(qq<perl Configure.pl --prefix=$install_dir --optimize>);
waitpid($parrot_configure->pid(), 0);
if (!waitpid($parrot_configure->pid(), 0)) {
    die "OH NOES TEH PARROT CONFIGUER DIED";
}
my $configure_stdout = join('', readline($parrot_configure->stdout()));
my $configure_stderr = join('', readline($parrot_configure->stderr()));

print "building Parrot\n";
my $parrot_build = System::Command->new(qw<make>);
print while readline($parrot_build->stdout());
waitpid($parrot_build->pid(), 0);
print "installing Parrot into tmp dir\n";
my $parrot_install = System::Command->new(qw<make install>);
print while readline($parrot_install->stdout());
waitpid($parrot_install->pid(), 0);

{
    local %ENV = %ENV;
    $ENV{"PATH"} = "$install_dir/bin:" . $ENV{"PATH"};

    test_hll({
        "name" => "Winxed",
        "clone" => [qw<git clone https://github.com/NotFound/winxed.git winxed_test>],
        "build" => [qq<winxed setup.winxed>],
        "test" =>  [qq<winxed setup.winxed test>],
        "tmp"  => $tmp_dir,
    });

    test_hll({
        "name" => "Rosella",
        "clone" => [qw<git clone https://github.com/Whiteknight/Rosella.git rosella_test>],
        "build" => [qq<winxed setup.winxed>],
        "test" =>  [qq<winxed setup.winxed test>],
        "tmp"  => $tmp_dir,
    });

    test_hll({
        "name"      => "nqp",
        "clone"     => [qw<git clone https://github.com/perl6/nqp.git nqp_test>],
        "configure" => [qq<perl Configure.pl --with_parrot=$install_dir/bin/parrot>],
        "install"   => [qq<make install>],
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

    test_hll({
        "name"      => "Rakudo",
        "clone"     => [qw<git clone -b nom https://github.com/rakudo/rakudo.git rakudo_test>],
        "configure" => [qq<perl Configure.pl --with_parrot=$install_dir/bin/parrot>],
        #XXX: should be spectest_regression; using test to make this easier to test
        "test"      => [qq<make test>],
        "tmp"       => $tmp_dir,
    });

    test_hll({
        "name"  => "Lua",
        "clone" => [qw<git clone https://github.com/fperrad/lua.git lua_test>],
        "build" => [qq<parrot setup.pir>],
        "test"  => [qq<parrot setup.pir test>],
        "tmp"   => $tmp_dir,
    });

}

sub test_hll {
    my %opts = %{$_[0]};
    my $proj_name     = $opts{name};
    my $clone_cmd     = $opts{clone};
    my $configure_cmd = $opts{configure};
    my $build_cmd     = $opts{build};
    my $install_cmd   = $opts{install};
    my $test_cmd      = $opts{test};
    my $tmp_dir       = $opts{tmp};

    my $proj_dir = lc($proj_name) . "_test";
    chdir $tmp_dir;
    qx<rm -rf $proj_dir>;
    print "cloning $proj_name\n";
    system @$clone_cmd;
    chdir $proj_dir;

    if ($configure_cmd) {
        print "configuring $proj_name";
        system @$configure_cmd;
    }
    if ($build_cmd) {
        print "building $proj_name\n";
        system @$build_cmd;
    }
    if ($install_cmd) {
        print "installing $proj_name";
        system @$install_cmd;
    }
    if ($test_cmd) {
        print "testing $proj_name";
        system @$test_cmd;
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
