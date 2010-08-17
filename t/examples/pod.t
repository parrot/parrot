#! perl
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use File::Temp qw(tempfile);
use Test::More qw(no_plan);

use Parrot::Test;
use Parrot::Test::Pod;
use Parrot::Config qw(%PConfig);

my @files = @ARGV;

if (!@files) {
  my $podTester = Parrot::Test::Pod->new( {
    argv => [ @ARGV ],
  } );
  @files = @{$podTester->identify_files_for_POD_testing()};
}

foreach my $file ( @files ) {
    foreach my $snippet (get_samples($file)) {
        compile_ok($snippet);
    }
}

#################### SUBROUTINES ####################

sub compile_ok {
    my $snippet = shift;

    # If it's a PIR fragment, wrap it in a sub.
    if ($snippet->{type} eq "PIR" && $snippet->{modifier} =~ /FRAGMENT/) {
        $snippet->{code} = ".sub 'testing'\n" .
            $snippet->{code} .  "\n.end";
    }

    # Generate a temp file for the source.
    my ($fh,$tempfile) = tempfile(
        SUFFIX => '.' . lc $snippet->{type},
        UNLINK => 1
    );
    print {$fh} $snippet->{code};
    close $fh;

    # Generate a temp file for stderr
    my ($err_fh,$err_tempfile) = tempfile(
        SUFFIX => '.err',
        UNLINK => 1
    );
    close $err_fh;

    # Send the output to /dev/null; similar to perl5's -c
    my $cmd = File::Spec->curdir() . $PConfig{slash} .
              $PConfig{test_prog} . " -o " . File::Spec->devnull() . " " .
              $tempfile . ' 2> ' . $err_tempfile;

    my $description = join (':', map {$snippet->{$_}}
        qw(file line type modifier));

    my $rc = system($cmd);
    open my $errout_fh, '<', $err_tempfile;

    my $error_output;
    {
        undef local $/;
        $error_output = <$errout_fh>;
    }

    my $todo = 0;
    $todo = 1 if ($snippet->{modifier} =~ /TODO|INVALID/);
    TODO: {
        # conditionally todo the file.
        local $TODO = 'invalid code' if $todo;

        is ($error_output,'',$description);
    }
}

sub get_samples {
    my $file = shift;

    open my $fh, '<', $file;

    my @snippets;
    my $snippet = {};
    my $code = '';
    my $target;

    my $in_code = 0;
    while (my $line = <$fh>) {

        if ( $in_code )  {
            if ($line =~ /^=end $target$/) {
                $snippet->{code} = $code;
                push @snippets, $snippet;
                $code = '';
                $snippet = {};
                $in_code = 0;
            }
            else {
                $code .= $line;
            }
        }
        elsif ( $line =~ /^=begin ((PIR|PASM)(_(.*))?)$/ ) {
            $in_code = 1;
            $snippet->{file} = $file;
            $snippet->{line} = $.;
            $snippet->{type} = $2;
            $snippet->{modifier} = defined($4) ? $4 : '';
            $target = $1;
        }
    }

    # We don't check for an example in progress here because no file
    # should end with =end.
    return @snippets;
}

__END__

=head1 NAME

t/examples/pod.t - Compile examples found in POD

=head1 SYNOPSIS

    # test all files
    % prove t/examples/pod.t

    # test specific files
    % perl t/examples/pod.t docs/compiler_faq.pod

=head1 DESCRIPTION

Tests the syntax for any embedded PIR in POD, for all files in the
repository that contain POD.  Any invalid examples are reported in the
test output.

To test a snippet of parrot code, wrap it in C<=begin> and C<=end> blocks
like:

 =begin PASM

   set I0, 0

 =end PASM

C<PASM> and C<PIR> are both valid target languages.

Additionally, you can add the following modifiers (prepending with an
underscore).

=over 4

=item * FRAGMENT

For PIR, wraps the code in a C<.sub> block.

=item * TODO

=item * INVALID

Either of these will force the test to be marked TODO.

=back

For example, this PIR fragment uses an old, invalid opcode and needs
to be updated:

 =begin PIR_FRAGMENT_INVALID

    find_type $I1, 'Integer'

 =end PIR_FRAGMENT_INVALID

As shown, you can "stack" the modifiers. Take care to make the begin and
and end POD targets identical. Always begin with the target language.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
