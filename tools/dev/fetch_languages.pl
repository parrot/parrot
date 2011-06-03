# Copyright (C) 2009, Parrot Foundation.

=head1 NAME

fetch_languages.pl - Fetch language implementations from their source code
management repositories

=head1 SYNOPSIS

    perl fetch_languages.pl

    perl fetch_languages.pl [--update] [--lang=<hll>]


=head1 DESCRIPTION

Creates a directory called 'languages' and checks out the languages.

=head1 HISTORY

2009-03-14 Salvaged from https:/svn.parrot.org/parrot/trunk/config/gen/makefiles/languages.in@37396.

2009-06-28 --lang=<hll> option added by s1n++.

=cut

use strict;
use warnings;
use 5.008;

use Getopt::Long;
use Pod::Usage;
use Cwd;

my ( $update_flag, $checkout_flag, $lang_flag ) = ( 0, 1, undef );
GetOptions( 'lang=s' => \$lang_flag, 'update' => \$update_flag ) or pod2usage();

my $languages_dir = 'languages';
mkdir $languages_dir;
chdir $languages_dir;

# some commands
my %checkout_cmd = (
    SVN => [qw(svn checkout)],
    GIT => [qw(git clone)],
    HG  => [qw(hg clone)],
);
my %update_cmd = (
    SVN => [qw(svn update)],
    GIT => [qw(git pull)],
    HG  => [qw(hg pull --update)],
);

my @hlls = (

    {
        name       => 'bf',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/bf.git'
    },

    {
        name       => 'blizkost',
        scm        => 'GIT',
        repository => 'git://github.com/jnthn/blizkost.git'
    },

    {
        name       => 'c99',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/c99.git'
    },

    {
        name       => 'cardinal',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/cardinal.git'
    },

    {
        name       => 'chitchat',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/chitchat.git'
    },

    {
        name       => 'close',
        scm        => 'SVN',
        repository => 'http://close.googlecode.com/svn/trunk/'
    },

    {
        name       => 'dotnet',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/dotnet/trunk'
    },

    {
        name       => 'eclectus',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/eclectus.git'
    },

    {
        name       => 'ecmascript',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/ecmascript.git'
    },

    {
        name       => 'forth',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/forth.git'
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
        name       => 'jako',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/jako/trunk'
    },

    {
        name       => 'json',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/json/trunk'
    },

    {
        name       => 'kea',
        scm        => 'GIT',
        repository => 'git://github.com/leto/kea.git'
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
        name       => 'lisp',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/lisp.git'
    },

    {
        name       => 'lolcode',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/lolcode.git'
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
        scm        => 'GIT',
        repository => 'git://github.com/Whiteknight/matrixy.git'
    },

    {
        name       => 'ook',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/ook.git'
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
        scm        => 'GIT',
        repository => 'git://github.com/parrot/pheme.git'
    },

    {
        name       => 'pipp',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/pipp.git'
    },

    {
        name       => 'pir',
        scm        => 'GIT',
        repository => 'http://github.com/parrot/pir.git'
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
        name       => 'porcupine',
        scm        => 'SVN',
        repository => 'http://porcupinepascal.googlecode.com/svn/trunk'
    },

    {
        name       => 'primitivearc',
        scm        => 'GIT',
        repository => 'git://github.com/stefano/primitivearc.git'
    },

    {
        name       => 'punie',
        scm        => 'GIT',
        repository => 'git://github.com/parrot/punie.git'
    },

    {
        name       => 'pynie',
        scm        => 'HG',
        repository => 'http://bitbucket.org/allison/pynie'
    },

    {
        name       => 'rakudo',
        scm        => 'GIT',
        repository => 'git://github.com/rakudo/rakudo.git'
    },

    {
        name       => 'scheme',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/scheme/trunk'
    },

    {
        name       => 'shakespeare',
        scm        => 'HG',
        repository => 'http://bitbucket.org/riffraff/shakespeare-parrot'
    },

    {
        name       => 'steme',
        scm        => 'GIT',
        repository => 'git://github.com/tene/steme.git'
    },

    {
        name       => 'tcl',
        scm        => 'GIT',
        repository => 'git://github.com/partcl/partcl.git'
    },

    {
        name       => 'unlambda',
        scm        => 'GIT',
        repository => 'git://github.com/bschmalhofer/unlambda.git'
    },

    {
        name       => 'urm',
        scm        => 'SVN',
        repository => 'https://svn.parrot.org/languages/urm/trunk'
    },

    {
        name       => 'winxed',
        scm        => 'SVN',
        repository => 'http://winxed.googlecode.com/svn/trunk/'
    },

    {
        name       => 'wmlscript',
        scm        => 'GIT',
        repository => 'git://github.com/fperrad/wmlscript.git'
    },

    {
        name       => 'xml',
        scm        => 'GIT',
        repository => 'git://github.com/fperrad/xml.git'
    },
);

foreach (@hlls) {
    next if $lang_flag && $_->{name} ne $lang_flag;
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
