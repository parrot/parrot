#! perl
# Copyright (C) 2009, Parrot Foundation.

use 5.008;
use strict;
use warnings;
use FindBin qw($Bin);
use lib "$Bin/../lib";    # install location
use lib "$Bin/../../lib"; # build location
use IO::File ();
use File::Spec;
use Parrot::Config;
use File::Temp qw/ tempfile /;
use Benchmark qw/timeit timestr :hireswallclock/;

=head1 NAME

tools/dev/parrot_shell.pl - The Parrot Shell

=head1 SYNOPSIS

    % perl tools/dev/parrot_shell.pl

=head1 DESCRIPTION

The Parrot Shell allows you to rapidly prototype Parrot code. It wraps your code
in a ".sub main" and ".end", so you don't have to, unless your code begins with
".sub". It reads code from STDIN until it sees a line containing a single ".",
which is how you tell parrot_shell to run the code you are giving to it:

Example:
    parrot_shell 0> $I0 = 42
    $N1 = sqrt $I0
    say $N1
    .
    Output:
    6.48074069840786

    parrot_shell 1> quit
    Thanks for visiting the Parrot Shell, come back soon!

Each numbered Parrot Shell session is run in its own interpreter, so no registers
or variables are shared/leaked between them.

=cut

my $parrot;
my $session_no = 0;

BEGIN {
    $parrot = File::Spec->catfile( ".", "parrot");
    unless (-e $parrot) {
        warn "$parrot not found, attempting to use an installed parrot";
        $parrot = 'parrot';
    }
    my $exefile = $parrot . $PConfig{exe};
}

show_welcome();

while(1) {
    my $code;
    show_prompt($session_no);

    while( my $line = <STDIN> ) {
        exit_shell() if $line =~ m/^q(uit)?$/;

        if ($line =~ m/^h(elp)?$/) {
            show_help();
            show_prompt($session_no) if !defined $code;
            next;
        }
        if ($line =~ m/^\s*\.\s*$/) { # Run it, baby!
            print eval_snippet($code);
            last;
        }
        else {
            $code .= $line;
        }
    }

    $session_no++;
}

sub show_welcome {
    print <<BIENVENIDO;
Welcome to the Parrot Shell, it's experimental!
Type h or help for some basic help
Type q or quit to flee the madness
BIENVENIDO

}

sub show_prompt {
    my ($session_no) = @_;
    print "\nparrot_shell $session_no> ";
}
sub exit_shell {
    print "Thanks for visiting the Parrot Shell, come back soon!\n";
    exit 0;
}

sub show_help {
    print <<'EX';

The Parrot Shell allows you to rapidly prototype Parrot code. It wraps your code
in a ".sub main" and ".end", so you don't have to, unless your code begins with
".sub". It reads code from STDIN until it sees a line containing a single ".",
which is how you tell parrot_shell to run the code you are giving to it:

Example:
    parrot_shell> $I0 = 42
    $N1 = sqrt $I0
    say $N1
    .
    Output:
    6.48074069840786
EX
}

sub eval_snippet {
    my ($snippet) = @_;
    my $codefn   = get_tempfile();
    my $stdoutfn = get_tempfile();
    my $f        = IO::File->new(">$codefn");

    $f->print(normalize_snippet($snippet || ''));
    $f->close();

    my $time = timestr(timeit(1, sub { system("$parrot $codefn >$stdoutfn 2>&1") } ));
    $time =~ s/\(.*//g;

    handle_errors($?) if $?;

    $f = IO::File->new($stdoutfn);

    my $output = join( '', <$f> );
    return "Time: $time\nOutput:\n$output";
}

sub handle_errors {
    my ($exit_code) = @_;
    if ($exit_code == -1) {
        print "Error: failed to execute: $!\n";
    }
    elsif ($exit_code & 127) {
        printf "Error: child died with signal %d, %s coredump\n",
            ($exit_code & 127),  ($exit_code & 128) ? 'with' : 'without';
    }
    else {
        printf "Error: child exited with value %d\n", $? >> 8;
    }
}

sub get_tempfile {
    my (undef, $name)   = tempfile( CLEANUP => 1);
    return $name;
}

sub normalize_snippet {
    my ($snippet) = @_;

    if ($snippet =~ m/^\.sub/) {
        # don't wrap snippet
        return $snippet;
    }
    else {
        return <<SNIP;
.sub main :main
$snippet
.end
SNIP
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
