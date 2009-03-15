# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

fetch_languages.pl - A helper to fetch language implementations from the SCM repoistories

=head1 SYNOPSIS

    perl fetch_languages.pl

    perl fetch_languages.pl --update

=head1 DESCRIPTION

Creates a directory called 'languages' and checks out the languages.

=head1 HISTORY

2009-03-14 Salvaged from https:/svn.parrot.org/parrot/trunk/config/gen/makefiles/languages.in@37396.

=cut

use strict;
use warnings;
use 5.008;

use Getopt::Long;
use Pod::Usage;
use Cwd;

my ( $update_flag, $checkout_flag ) = ( 0, 1 );
GetOptions( "update" => \$update_flag ) or pod2usage();

mkdir 'languages';
chdir 'languages';

# some commands
my %checkout_cmd = (
    SVN => [qw(svn checkout)],
    GIT => [qw(git clone)],
    HG  => [qw(hg clone)],
);
my %update_cmd = (
    SVN => [qw(svn update)],
    GIT => [qw(git pull)],
    HG  => [qw(hg pull)],
);

my @hlls = (

    {
        name       => 'dotnet',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/dotnet/trunk'
    },

    {
        name       => 'c99',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/c99/trunk'
    },

    {
        name       => 'eclectus',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/eclectus.git'
    },

    {
        name       => 'ecmascript',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/ecmascript/trunk'
    },

    {
        name       => 'fun',
        scm        => 'GIT',
        repository => 'git://github.com/TiMBuS/fun.git'
    },

    {
        name       => 'gil',
        scm        => 'GIT',
        repository => 'git://github.com/tene/gil.git'
    },

    {
        name       => 'hq9plus',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/hq9plus.git'
    },

    {
        name       => 'json',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/json/trunk'
    },

    {
        name       => 'kea-cl',
        scm        => 'SVN',
        repository => 'https://rgrjr.dyndns.org/svn/kea-cl/trunk'
    },

    {
        name       => 'lazy-k',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/lazy-k.git'
    },

    {
        name       => 'lolcode',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/lolcode/trunk'
    },

    {
        name       => 'lua',
        scm        => 'GIT',
        repository => 'git://github.com/fperrad/lua.git'
    },

    {
        name       => 'm4',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/m4.git'
    },

    {
        name       => 'markdown',
        scm        => 'GIT',
        repository => 'git://github.com/fperrad/markdown.git'
    },

    {
        name       => 'matrixy',
        scm        => 'SVN',
        repository => 'http://matrixy.googlecode.com/svn/trunk'
    },

    {
        name       => 'paraplegic',
        scm        => 'SVN',
        repository => 'http://paraplegic.googlecode.com/svn/trunk'
    },

    {
        name       => 'perk',
        scm        => 'GIT',
        repository => 'git://github.com/chrisdolan/perk.git'
    },

    {
        name       => 'pheme',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/pheme/trunk'
    },

    {
        name       => 'pipp',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/pipp.git'
    },

    {
        name       => 'pir',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/pir/trunk'
    },

    {
        name       => 'pjs',
        scm        => 'SVN',
        repository => 'http://parrotjs.googlecode.com/svn/trunk'
    },

    {
        name       => 'pod',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/pod/trunk'
    },

    {
        name       => 'primitivearc',
        scm        => 'GIT',
        repository => 'git://github.com/stefano/primitivearc.git'
    },

    {
        name       => 'punie',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/punie/trunk'
    },

    {
        name       => 'pynie',
        scm        => 'SVN',
        repository => 'http://pynie.googlecode.com/svn/trunk'
    },

    {
        name       => 'rakudo',
        scm        => 'GIT',
        repository => 'git://github.com/rakudo/rakudo.git'
    },

    {
        name       => 'shakespeare',
        scm        => 'HG',
        repository => 'http://bitbucket.org/riffraff/shakespeare-parrot'
    },

    {
        name       => 'tcl',
        scm        => 'SVN',
        repository => 'http://partcl.googlecode.com/svn/trunk'
    },

    {
        name       => 'unlambda',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/unlambda.git'
    },

    {
        name       => 'wmlscript',
        scm        => 'GIT',
        repository => 'git://github.com/fperrad/wmlscript.git'
    },
);

foreach (@hlls) {
    if ($checkout_flag && ! -d $_->{name}) {
        my @cmd = ( @{ $checkout_cmd{ $_->{scm} } }, $_->{repository}, $_->{name} );
        my $dir = getcwd();
        print "Running: '@cmd' in $dir.\n";
        system(@cmd);
    }
    if ($update_flag) {
        chdir $_->{name};
        my @cmd = ( @{ $update_cmd{ $_->{scm} } } );
        my $dir = getcwd();
        print "Running: '@cmd' in $dir.\n";
        system(@cmd);
        chdir '..';
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
