#! perl
use strict;
use warnings;

use Getopt::Long;
use Pod::Usage;

use Data::Dumper; $Data::Dumper::Indent= 1;


## process command-line optional arguments
GetOptions( \my(%o),
    qw/ check syndir=s outdir=s css=s help fast testres /
) or pod2usage(2);

$o{help} and pod2usage(1);
$o{man}  and pod2usage(-exitstatus => 0, -verbose => 2);

$o{css}    ||= 'http://dev.perl.org/css/perl.css';
$o{outdir} ||= '.';


## process command-line required arguments
pod2usage(1) unless @ARGV;

mkdir $o{outdir}
    unless -d $o{outdir};


## retrieve/compile smartlink-related data
my $sls= SmartLinkServer->new;
print Dumper $sls->testfiles;

## TODO: scan test files; collect smartlinks and positional info.
## TODO: relate and store smartlink info with test filenames and line numbers
## TODO: process spec files, integrate smartlink info, emit html


__END__

=head1 NAME

smartlinks.pl -- link your tests (and results) to specification documents

=head1 SYNOPSIS

  smartlinks.pl t/*/*.t t/*/*/*.t t/*/*/*/*.t
  smartlinks.pl --css foo.css --outdir=public_html t/op/*.t
  smartlinks.pl --check t/*/*.t t/*/*/*.t
  smartlinks.pl --check t/some/test.t

=head1 DESCRIPTION

Based on F<util\smartlinks.pl> from the pugs distribution, but converted both
to work for Parrot, and to use the L<Moose> family of modules.

=head1 AUTHOR

Jerry Gay a.k.a. particle, E<jerry.gay@gmail.com>

=cut

## vim: shiftwidth=4 expandtab
