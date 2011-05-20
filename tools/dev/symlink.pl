#! perl -s

# Copyright (C) 2004-2008, Parrot Foundation.

=head1 NAME

symlink.pl - create a symlink shadow of the Parrot source.

=head1 SYNOPSIS

   # when in directory containing the checked out source in 'trunk'
   mkdir shadow
   cd shadow
   perl ../trunk/tools/dev/symlink.pl

=head1 DESCRIPTION

Create a symlink tree shadowing the Parrot source tree.  Nifty for
having just one (read-only) copy of the sources but several different
build trees.  The -v option displays the created symlinks.

=head1 CHANGES

1.1: Handle also:
      - being called with a relative path
      - being called through a symlink

=head1 AUTHOR

jhi@iki.fi

=cut

use strict;
use warnings;

use File::Basename;
use File::Spec;
use Cwd;

my $self = $0;
my $cwd  = getcwd();

$self = readlink($self) while -l $self;

$self = File::Spec->catfile( $cwd, $self )
    unless File::Spec->file_name_is_absolute($self);

my $toolsrcdir  = dirname($self);
my $toolsrcbase = basename($self);

use vars qw($v);

if ( $toolsrcdir ne '' && -d $toolsrcdir && lc $toolsrcbase eq 'symlink.pl' ) {
    my $trydir  = File::Spec->catdir( 'include', 'parrot' );
    my $tryfile = File::Spec->catfile( 'src',    'main.c' );
    die "$0: Do not run this under the original Parrot tree.\n"
        if ( -d $trydir ) && ( -f $tryfile && !-l $tryfile );
}
else {
    die "$0: I am very confused.\n";
}

my @toolsrcdir = File::Spec->splitdir($toolsrcdir);
die "$self: not in tools/dev\n"
    unless @toolsrcdir >= 2
        && lc( $toolsrcdir[-1] ) eq 'dev'
        && lc( $toolsrcdir[-2] ) eq 'tools';
my @topsrcdir = @toolsrcdir[ 0 .. $#toolsrcdir - 2 ];
my $topsrcdir = File::Spec->catdir(@topsrcdir);
my $manifest  = File::Spec->catfile( $topsrcdir, 'MANIFEST' );
my @srcfiles;
if ( open( my $MANIFEST, '<', $manifest ) ) {
    my %dstdir;
    while (<$MANIFEST>) {
        next if /^\#/;
        if (/^(.+?)\s+\[/) {
            my $manifile = $1;
            my @manifile = split( m!/!, $manifile );
            my $dstfile  = File::Spec->catfile(@manifile);
            my $srcfile  = File::Spec->catfile( $topsrcdir, @manifile );
            unless ( -f $srcfile ) {
                warn "$self: cannot find $dstfile\n";
                next;
            }
            push @srcfiles, $srcfile;
            if ( @manifile > 1 ) {
                for my $i ( 0 .. $#manifile - 1 ) {
                    my $dstdir = File::Spec->catdir( @manifile[ 0 .. $i ] );
                    if ( !-d $dstdir && !$dstdir{$dstdir}++ ) {
                        unless ( mkdir( $dstdir, 0755 ) ) {
                            warn "$self: mkdir $dstdir failed: $!\n";
                        }
                    }
                }
            }
            my $readlink;
            if ( -e $dstfile ) {
                if ( -l $dstfile ) {
                    unless ( defined( $readlink = readlink($dstfile) ) ) {
                        warn "$self: readlink $dstfile failed: $!\n";
                    }
                }
                else {
                    warn "$self: $dstfile exists but is not a symlink\n";
                }
            }
            if ( !defined $readlink || $readlink ne $srcfile ) {
                print "$dstfile\n" if $v;
                if ( defined $readlink ) {
                    unless ( unlink($dstfile) ) {
                        warn "$self: unlink $dstfile failed: $!\n";
                    }
                }
                unless ( symlink( $srcfile, $dstfile ) ) {
                    warn "$self: symlink $srcfile $dstfile failed: $!\n";
                }
            }
        }
    }
    warn "$self: could not find any files to symlink\n" unless @srcfiles;
    close($MANIFEST);
}
else {
    die "$self: Failed to open $manifest: $!\n";
}

exit(0);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
