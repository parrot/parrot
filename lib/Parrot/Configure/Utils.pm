# Copyright (C) 2001-2008, Parrot Foundation.

=head1 NAME

Parrot::Configure::Utils - Configuration Step Utilities

=head1 DESCRIPTION

The C<Parrot::Configure::Utils> module contains utility functions for use by
the configuration step classes found under F<config/>.

The subroutines found in this module do B<not> require the Parrot::Configure
object as an argument.  Those subroutines formerly found in this module which
B<do> require the Parrot::Configure object as an argument have been moved into
Parrot::Configure::Compiler.

=head2 Functions

=over 4

=cut

package Parrot::Configure::Utils;

use strict;
use warnings;

use base qw( Exporter );

use Carp;
use File::Copy ();
use File::Spec;
use File::Which;
use lib ("lib");
use Parrot::BuildUtil ();
our @EXPORT    = ();
our @EXPORT_OK = qw(
    prompt copy_if_diff move_if_diff integrate
    capture_output check_progs _slurp
    _run_command _build_compile_command
    print_to_cache
);
our %EXPORT_TAGS = (
    inter => [qw(prompt integrate)],
    auto  => [
        qw(capture_output check_progs)
    ],
    gen => [qw( copy_if_diff move_if_diff )]
);

=item C<_run_command($command, $out, $err)>

Runs the specified command. Output is directed to the file specified by
C<$out>, warnings and errors are directed to the file specified by C<$err>.

=cut

sub _run_command {
    my ( $command, $out, $err, $verbose ) = @_;

    if ($verbose) {
        print "$command\n";
    }

    # Mostly copied from Parrot::Test.pm
    foreach ( $out, $err ) {
        $_ = File::Spec->devnull
            if $_ and $_ eq '/dev/null';
    }

    if ( $out and $err and $out eq $err ) {
        $err = "&STDOUT";
    }

    # Save the old filehandles; we must not let them get closed.
    open my $OLDOUT, '>&', \*STDOUT or die "Can't save     stdout" if $out;
    open my $OLDERR, '>&', \*STDERR or die "Can't save     stderr" if $err;

    open STDOUT, '>', $out or die "Can't redirect stdout" if $out;

    # See 'Obscure Open Tricks' in perlopentut
    open STDERR, ">$err"    ## no critic InputOutput::ProhibitTwoArgOpen
        or die "Can't redirect stderr"
        if $err;

    system $command;
    my $exit_code = $? >> 8;

    close STDOUT or die "Can't close    stdout" if $out;
    close STDERR or die "Can't close    stderr" if $err;

    open STDOUT, '>&', $OLDOUT or die "Can't restore  stdout" if $out;
    open STDERR, '>&', $OLDERR or die "Can't restore  stderr" if $err;

    if ($verbose) {
        foreach ( $out, $err ) {
            if (   ( defined($_) )
                && ( $_ ne File::Spec->devnull )
                && ( !m/^&/ ) )
            {
                open( my $verbose_handle, '<', $_ );
                print <$verbose_handle>;
                close $verbose_handle;
            }
        }
    }

    return $exit_code;
}

=item C<_build_compile_command( $cc, $ccflags, $cc_args )>

Constructs a command-line to do the compile.

=cut

sub _build_compile_command {
    my ( $cc, $ccflags, $cc_args ) = @_;
    $_ ||= '' for ( $cc, $ccflags, $cc_args );

    return "$cc $ccflags $cc_args -I./include -c test_$$.c";
}

=item C<integrate($orig, $new)>

Integrates C<$new> into C<$orig>.  Returns C<$orig> if C<$new> is undefined.

=cut

sub integrate {
    my ( $orig, $new ) = @_;

    # Rather than sprinkling "if defined(...)", everywhere,
    # various inter::* steps (coded in config/inter/*.pm) permit simply
    # passing in potentially undefined strings.
    # In these instances, we simply pass back the original string without
    # generating a warning.
    return $orig unless defined $new;

    if ( $new =~ /\S/ ) {
        $orig = $new;
    }

    return $orig;
}

=item C<prompt($message, $value)>

Prints out "message [default] " and waits for the user's response. Returns the
response, or the default if the user just hit C<ENTER>.

=cut

sub prompt {
    my ( $message, $value ) = @_;

    print("$message [$value] ");

    chomp( my $input = <STDIN> );

    if ($input) {
        $value = $input;
    }

    return integrate( $value, $input );
}

=item C<file_checksum($filename, $ignore_pattern)>

Creates a checksum for the specified file. This is used to compare files.

Any lines matching the regular expression specified by C<$ignore_pattern> are
not included in the checksum.

=cut

sub file_checksum {
    my ( $filename, $ignore_pattern ) = @_;
    open( my $file, '<', $filename ) or die "Can't open $filename: $!";
    my $sum = 0;
    while (<$file>) {
        next if defined($ignore_pattern) && /$ignore_pattern/;
        $sum += unpack( "%32C*", $_ );
    }
    close($file) or die "Can't close $filename: $!";
    return $sum;
}

=item C<copy_if_diff($from, $to, $ignore_pattern)>

Copies the file specified by C<$from> to the location specified by C<$to> if
its contents have changed.

The regular expression specified by C<$ignore_pattern> is passed to
C<file_checksum()> when comparing the files.

=cut

sub copy_if_diff {
    my ( $from, $to, $ignore_pattern ) = @_;

    # Don't touch the file if it didn't change (avoid unnecessary rebuilds)
    if ( -r $to ) {
        my $from_sum = file_checksum( $from, $ignore_pattern );
        my $to_sum   = file_checksum( $to,   $ignore_pattern );
        return if $from_sum == $to_sum;
    }

    File::Copy::copy( $from, $to );

    # Make sure the timestamp is updated
    my $now = time;
    utime $now, $now, $to;

    return 1;
}

=item C<move_if_diff($from, $to, $ignore_pattern)>

Moves the file specified by C<$from> to the location specified by C<$to> if
its contents have changed.

=cut

sub move_if_diff {    ## no critic Subroutines::RequireFinalReturn
    my ( $from, $to, $ignore_pattern ) = @_;
    copy_if_diff( $from, $to, $ignore_pattern );
    unlink $from;
}

=item C<capture_output($command)>

Executes the given command. The command's output (both stdout and stderr), and
its return status is returned as a 3-tuple. B<STDERR> is redirected to
F<test.err> during the execution, and deleted after the command's run.

=cut

sub capture_output {
    my $command = join ' ', @_;

    # disable STDERR
    open my $OLDERR, '>&', \*STDERR;
    open STDERR, '>', "test_$$.err";

    my $output = `$command`;
    my $retval = ( $? == -1 ) ? -1 : ( $? >> 8 );

    # reenable STDERR
    close STDERR;
    open STDERR, '>&', $OLDERR;

    # slurp stderr
    my $out_err = _slurp("./test_$$.err");

    # cleanup
    unlink "test_$$.err";

    return ( $output, $out_err, $retval ) if wantarray;
    return $output;
}

=item C<check_progs([$programs])>

Where C<$programs> may be either a scalar with the name of a single program or
an array ref of programs to search the current C<PATH> for.  The first matching
program name is returned or C<undef> on failure.  Note: this function only
returns the name of the program and not its complete path.

This function is similar to C<autoconf>'s C<AC_CHECK_PROGS> macro.

=cut

sub check_progs {
    my ( $progs, $verbose ) = @_;

    $progs = [$progs] unless ref $progs eq 'ARRAY';

    print "checking for program: ", join( " or ", @$progs ), "\n" if $verbose;
    foreach my $prog (@$progs) {
        my $util = $prog;

        # use the first word in the string to ignore any options
        ($util) = $util =~ /(\S+)/;
        my $path = which($util);

        if ($verbose) {
            print "$path is executable\n" if $path;
        }

        return $prog if $path;
    }

    return;
}

=item C<print_to_cache( $cachefile, $value )>

Opens a handle to write to the file specified in the first argument. Prints
the value specified in the second argument, followed by a newline.  Typically,
this will be a hidden file in the user's top-level parrot directory.
Implicitly returns true value upon success; C<die>s otherwise.

=cut

sub print_to_cache {
    my ($cache, $value) = @_;
    open my $FH, ">", $cache
        or die "Unable to open handle to $cache for writing: $!";
    print {$FH} "$value\n";
    close $FH or die "Unable to close handle to $cache after writing: $!";
}

=item C<_slurp($filename)>

Slurps C<$filename> into memory and returns it as a string.  This is just an
alias for C<Parrot::BuildUtil::slurp_file>.

=cut

*_slurp = \&Parrot::BuildUtil::slurp_file;

=back

=cut

=head1 SEE ALSO

=over 4

=item C<Parrot::Configure::runsteps()>

=item F<docs/configuration.pod>

=item F<lib/Parrot/Configure/Compiler.pm>

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
