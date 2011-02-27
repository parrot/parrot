#! perl
# Copyright (C) 2006-2011, Parrot Foundation.

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config qw(%PConfig);
use Parrot::Distribution;
use Parrot::Headerizer;

=head1 NAME

t/codingstd/pmc_docs.t - checks for missing function documentation

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/pmc_docs.t

    # test specific files
    % perl t/codingstd/pmc_docs.t src/foo.pmc src/bar.pmc

=head1 DESCRIPTION

Checks that all PMC source files have documentation for each function
declared.

=cut

my $DIST = Parrot::Distribution->new;
my $headerizer = Parrot::Headerizer->new;

my @files = @ARGV ? @ARGV :
    map {s/^$PConfig{build_dir}\///; $_}
    map {s/\\/\//g; $_}
    map {$_->path} $DIST->pmc_source_files();

plan tests => scalar @files;

my %todos;
while (<DATA>) {
    next if /^#/;
    next if /^\s*$/;
    chomp;
    $todos{$_} = 1;
}

my %all_files = ();

# Traverse each file, analyzing each function declaration therein, then
# post results in %all_files.

foreach my $path (@files) {
    my $buf = $DIST->slurp($path);
    my @function_decls = $headerizer->extract_function_declarations($buf);

    # We start out asserting that every file will have documentation for each
    # of its function declarations.  We then seek to contradict this
    # assertion.

    my %this_file = ( overall => 1 );

    for my $function_decl (@function_decls) {
        my $escaped_decl
            = $headerizer->generate_documentation_signature($function_decl);
        $this_file{$function_decl}{esc} = $escaped_decl;

        if ( $buf =~ m/^\Q$escaped_decl\E$(.*?)^=cut/sm ) {
            my $docs = $1;
            $docs =~ s/\s//g;
            if ($docs eq '') { # boilerplate only
                $this_file{$function_decl}{status} = 0;
                $this_file{overall} = 0;
            }
            else { # documentation found
                $this_file{$function_decl}{status} = 1;
            }
        }
        else { # no documentation found
            $this_file{$function_decl}{status} = undef;
            $this_file{overall} = 0;
        }
    }
    $all_files{$path} = \%this_file;
}

foreach my $path (sort keys %all_files) {
    TODO: {
        local $TODO = 'Missing function docs' if $todos{$path};
        ok( $all_files{$path}{overall}, $path )
            or diag( diagnosis( \%all_files, $path ) );
    }
}

sub diagnosis {
    my ($all_files_ref, $path) = @_;
    my $missing = '';
    my $boilerplate = '';
    my %this_file = %{ $all_files_ref->{$path} };
    delete $this_file{overall};
    foreach my $decl ( sort keys %this_file ) {
        if ( ! defined $this_file{$decl}{status} ) {
            $missing .= "$decl\n";
            $missing .= "Need:\n";
            $missing .= "$this_file{$decl}{esc}\n\n";
        }
        elsif ( ! $this_file{$decl}{status} ) {
            $boilerplate .= "$this_file{$decl}{esc}\n\n";
        }
        else {
            # docs!
        }
    }
    my $diagnosis = "$path\n";
    $diagnosis .= "Undocumented functions:\n\n$missing" if $missing;
    $diagnosis .= "Boilerplate only:\n$boilerplate" if $boilerplate;
    return "$diagnosis";
}

__DATA__
src/pmc/bigint.pmc
src/pmc/callcontext.pmc
src/pmc/class.pmc
src/pmc/complex.pmc
src/pmc/coroutine.pmc
src/pmc/eval.pmc
src/pmc/imageio.pmc
src/pmc/namespace.pmc
src/pmc/object.pmc
src/pmc/sub.pmc

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
