# Copyright (C) 2004-2009, Parrot Foundation.

=head1 NAME

Parrot::Test - testing routines for Parrot and language implementations

=head1 SYNOPSIS

Set the number of tests to be run like this:

    use Parrot::Test tests => 8;

Write individual tests like this:

    pasm_output_is(<<'CODE', <<'OUTPUT', "description of test");
    print "this is ok\n"
    end
    CODE
    this is ok
    OUTPUT

=head1 DESCRIPTION

This module provides various Parrot-specific test functions.

=head2 Function Parameters

=over 4

=item C<$language>

The language of the code being tested.

=item C<$code>

The code that should be executed or transformed.

=item C<$expected>

The expected result.

=item C<$unexpected>

The unexpected result.

=item C<$description>

A short description of the test.

=back

Any optional parameters can follow. For example, to mark a test as a TODO test
(where you know the implementation does not work yet), pass:

    todo => 'reason to consider this TODO'

at the end of the argument list. Valid reasons include C<bug>,
C<unimplemented>, and so on.

B<Note:> you I<must> use a C<$description> with TODO tests.

=head2 Functions

=over 4

=item C<language_output_is($language, $code, $expected, $description)>

=item C<language_error_output_is($language, $code, $expected, $description)>

Runs a language test and passes the test if a string comparison
of the output with the expected result is true. For
C<language_error_output_is()>, the exit code also has to be non-zero.

=item C<language_output_like($language, $code, $expected, $description)>

=item C<language_error_output_like($language, $code, $expected, $description)>

Runs a language test and passes the test if the output matches the expected
result. For C<language_error_output_like()>, the exit code also has to be
non-zero.

=item C<language_output_isnt($language, $code, $expected, $description)>

=item C<language_error_output_isnt($language, $code, $expected, $description)>

Runs a language test and passes the test if a string comparison
of the output with the unexpected result is false. For
C<language_error_output_isnt()>, the exit code also has to be non-zero.

=item C<pasm_output_is($code, $expected, $description)>

Runs the PASM code and passes the test if a string comparison of
the output with the expected result is true.

=item C<pasm_error_output_is($code, $expected, $description)>

Runs the PASM code and passes the test if a string comparison of
the output with the expected result is true I<and> if Parrot exits with a
non-zero exit code.

=item C<pasm_output_like($code, $expected, $description)>

Runs the PASM code and passes the test if the output matches
C<$expected>.

=item C<pasm_error_output_like($code, $expected, $description)>

Runs the PASM code and passes the test if the output matches
C<$expected> I<and> if Parrot exits with a non-zero exit code.

=item C<pasm_output_isnt($code, $unexpected, $description)>

Runs the PASM code and passes the test if a string comparison of
the output with the unexpected result is false.

=item C<pasm_error_output_isnt($code, $unexpected, $description)>

Runs the PASM code and passes the test if a string comparison of
the output with the unexpected result is false I<and> if Parrot exits with a
non-zero exit code.

=item C<pasm_exit_code_is($code, $exit_code, $description)>

Runs the PASM code and passes the test if the exit code equals $exit_code,
fails the test otherwise.

=item C<pir_output_is($code, $expected, $description)>

Runs the PIR code and passes the test if a string comparison of the output
with the expected result is true.

=item C<pir_error_output_is($code, $expected, $description)>

Runs the PIR code and passes the test if a string comparison of the output
with the expected result is true I<and> if Parrot exits with a non-zero exit
code.

=item C<pir_output_like($code, $expected, $description)>

Runs the PIR code and passes the test if the output matches the expected
result.

=item C<pir_error_output_like($code, $expected, $description)>

Runs the PIR code and passes the test if the output matches the expected result
I<and> if Parrot exits with a non-zero exit code.

=item C<pir_output_isnt($code, $unexpected, $description)>

Runs the PIR code and passes the test if a string comparison of the output with
the unexpected result is false.

=item C<pir_error_output_isnt($code, $unexpected, $description)>

Runs the PIR code and passes the test if a string comparison of the output with
the unexpected result is false I<and> if Parrot exits with a non-zero exit
code.

=item C<pir_exit_code_is($code, $exit_code, $description)>

Runs the PIR code and passes the test if the exit code equals $exit_code,
fails the test otherwise.

=item C<pbc_output_is($code, $expected, $description)>

Runs the Parrot bytecode and passes the test if a string comparison of the
output with the expected result is true.

=item C<pbc_error_output_is($code, $expected, $description)>

Runs the Parrot bytecode and passes the test if a string comparison of the
output with the expected result is true I<and> if Parrot exits with a non-zero
exit code.

=item C<pbc_output_like($code, $expected, $description)>

Runs the Parrot bytecode and passes the test if the output matches the expected
result.

=item C<pbc_error_output_like($code, $expected, $description)>

Runs the Parrot bytecode and passes the test if the output matches the expected
result I<and> if Parrot exits with a non-zero exit code.

=item C<pbc_output_isnt($code, $unexpected, $description)>

Runs the Parrot bytecode and passes the test if a string comparison of the
output with the unexpected result is false.

=item C<pbc_error_output_isnt($code, $unexpected, $description)>

Runs the Parrot bytecode and passes the test if a string comparison of the
output with the unexpected result is false I<and> if Parrot exits with a
non-zero exit code.

=item C<pbc_exit_code_is($code, $exit_code, $description)>

Runs the Parrot bytecode and passes the test if the exit code equals $exit_code,
fails the test otherwise.

=item C<c_output_is($code, $expected, $description, %options)>

Compiles and runs the C code, passing the test if a string comparison of the
output with the expected result is true. Valid options are 'todo' => 'reason'
to mark a TODO test.

=item C<c_output_like($code, $expected, $description, %options)>

Compiles and runs the C code, passing the test if the output matches the
expected result. Valid options are 'todo' => 'reason' to mark a TODO test.

=item C<c_output_isnt($code, $unexpected, $description, %options)>

Compiles and runs the C code, passing the test if a string comparison of the
output with the unexpected result is false. Valid options are
'todo' => 'reason' to mark a TODO test.

=item C<example_output_is($example_f, $expected, @todo)>

=item C<example_output_like($example_f, $expected, @todo)>

=item C<example_output_isnt($example_f, $expected, @todo)>

Determines the language, PIR or PASM, from the extension of C<$example_f> and runs
the appropriate C<language_output_(is|like|isnt)> subroutine. C<$example_f> is
used as a description, so don't pass one.

=item C<skip($why, $how_many)>

Use within a C<SKIP: { ... }> block to indicate why and how many tests to skip,
just like in Test::More.

=item C<run_command($command, %options)>

Run the given $command in a cross-platform manner.

%options include...

    STDOUT    name of file to redirect STDOUT to
    STDERR    name of file to redirect STDERR to
    CD        directory to run the command in

For example:

    # equivalent to "cd some_dir && make test"
    run_command("make test", CD => "some_dir");

=item C<slurp_file($file_name)>

Read the whole file $file_name and return the content as a string. This is
just an alias for C<Parrot::BuildUtil::slurp_file>.

=item C<convert_line_endings($text)>

Convert Win32 style line endings with Unix style line endings.

=item C<path_to_parrot()>

Construct an absolute path to the Parrot root directory.

=item C<per_test($ext, $test_no)>

Construct a path for temporary files. Takes C<$0> into account.

=item C<write_code_to_file($code, $code_f)>

Writes C<$code> into the file C<$code_f>.

=item C<generate_languages_functions()>

Generate functions that are only used by a couple of Parrot::Test::<lang>
modules. This implementation is experimental and currently only works for
languages/pipp.

=back

=cut

package Parrot::Test;

use strict;
use warnings;

use Cwd;
use File::Spec;
use File::Basename;
use Memoize ();
use IO::File ();

use lib qw( lib );
use Parrot::BuildUtil ();
use Parrot::Config;
use Parrot::Test::Util 'create_tempfile';

require Exporter;
require Test::Builder;
require Test::More;

our @EXPORT = qw( plan run_command skip slurp_file pbc_postprocess_output_like
                  pir_stdin_output_is pir_stdin_output_like );

use base qw( Exporter );

# Memoize functions with a fixed output
Memoize::memoize('path_to_parrot');

# Tell parrot it's being tested--disables searching of installed libraries.
$ENV{PARROT_TEST} = 1 unless defined $ENV{PARROT_TEST};

my $builder = Test::Builder->new();

# Generate subs where the name serves as an
# extra parameter.
_generate_test_functions();

sub import {
    my ( $class, $plan, @args ) = @_;

    $builder->plan( $plan, @args );

    __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}

# this kludge is an hopefully portable way of having
# redirections ( tested on Linux and Win2k )
# An alternative is using Test::Output
sub run_command {
    my ( $command, %options ) = @_;

    my ( $out, $err, $chdir ) = _handle_test_options( \%options );

    if ($PConfig{parrot_is_shared}) {
        _handle_blib_path();
    }

    local *OLDOUT if $out;    ## no critic Variables::ProhibitConditionalDeclarations
    local *OLDERR if $err;    ## no critic Variables::ProhibitConditionalDeclarations

    # Save the old filehandles; we must not let them get closed.
    open OLDOUT, '>&STDOUT'   ## no critic InputOutput::ProhibitBarewordFileHandles
        or die "Can't save     stdout"
        if $out;
    open OLDERR, '>&STDERR'   ## no critic InputOutput::ProhibitBarewordFileHandles
        or die "Can't save     stderr"
        if $err;

    open STDOUT, '>', $out or die "Can't redirect stdout to $out" if $out;

    # See 'Obscure Open Tricks' in perlopentut
    open STDERR, ">$err"      ## no critic InputOutput::ProhibitTwoArgOpen
        or die "Can't redirect stderr to $err"
        if $err;

    # If $command isn't already an arrayref (because of a multi-command
    # test), make it so now so the code below can treat everybody the
    # same.
    $command = _handle_command( $command );

    my $orig_dir;
    if ($chdir) {
        $orig_dir = cwd;
        chdir $chdir;
    }

    # Execute all commands
    # [#42161] [BUG] Parrot::Test throws "Can't spawn" warning on windows
    # ...if a system call returns a negative value
    # removed exec warnings to prevent this warning from messing up test results
    {
        no warnings 'exec';
        system($_) for ( @{$command} );
    }

    if ($chdir) {
        chdir $orig_dir;
    }

    my $exit_message = _prepare_exit_message();

    close STDOUT or die "Can't close    stdout" if $out;
    close STDERR or die "Can't close    stderr" if $err;

    open STDOUT, ">&", \*OLDOUT or die "Can't restore  stdout" if $out;
    open STDERR, ">&", \*OLDERR or die "Can't restore  stderr" if $err;

    return $exit_message;
}

sub per_test {
    my ( $ext, $test_no ) = @_;

    return unless defined $ext and defined $test_no;

    my $t = $0;    # $0 is name of the test script
    $t =~ s/\.t$/_$test_no$ext/;

    return $t;
}

sub write_code_to_file {
    my ( $code, $code_f ) = @_;

    open my $CODE, '>', $code_f or die "Unable to open '$code_f'";
    binmode $CODE;
    print $CODE $code;
    close $CODE;

    return;
}

{
    no warnings 'once';
# We can inherit from other modules, so we do so.
*plan = \&Test::More::plan;
*skip = \&Test::More::skip;
*slurp_file = \&Parrot::BuildUtil::slurp_file;

}

sub convert_line_endings {
    my ($text) = @_;

    $text =~ s/\cM\cJ/\n/g;

    return;
}

sub path_to_parrot {

    my $path = $INC{'Parrot/Config.pm'};
    $path =~ s{ /lib/Parrot/Config.pm \z}{}xms;

    return Cwd::realpath( $path );
}

sub generate_languages_functions {

    my %test_map = (
        output_is         => 'is_eq',
        error_output_is   => 'is_eq',
        output_like       => 'like',
        error_output_like => 'like',
        output_isnt       => 'isnt_eq',
        error_output_isnt => 'isnt_eq',
    );

    foreach my $func ( keys %test_map ) {

        my $test_sub = sub {
            local *__ANON__ = $func;
            my $self        = shift;
            my ( $code, $expected, $desc, %options ) = @_;

            # set a todo-item for Test::Builder to find
            my $call_pkg = $self->{builder}->exported_to() || '';

            no strict 'refs';  ## no critic Variables::ProhibitConditionalDeclarations

            local *{ $call_pkg . '::TODO' } = ## no critic Variables::ProhibitConditionalDeclarations
                \$options{todo}
                if defined $options{todo};

            my $count = $self->{builder}->current_test() + 1;

            # These are the thing that depend on the actual language implementation
            my $out_f     = $self->get_out_fn( $count,    \%options );
            my $lang_f    = $self->get_lang_fn( $count,   \%options );
            my $cd        = $self->get_cd( \%options );
            my @test_prog = $self->get_test_prog( $count, \%options );

            Parrot::Test::write_code_to_file( $code, $lang_f );

            # set a todo-item for Test::Builder to find
            my $skip_why = $self->skip_why( \%options );
            if ($skip_why) {
                $self->{builder}->skip($skip_why);
            }
            else {

                # STDERR is written into same output file
                my $exit_code = Parrot::Test::run_command(
                    \@test_prog,
                    CD     => $cd,
                    STDOUT => $out_f,
                    STDERR => $out_f
                );
                my $real_output = slurp_file($out_f);

                if ( $func =~ m/^ error_/xms ) {
                    return _handle_error_output( $self->{builder}, $real_output, $expected, $desc )
                        unless $exit_code;
                }
                elsif ($exit_code) {
                    $self->{builder}->ok( 0, $desc );

                    my $test_prog = join ' && ', @test_prog;
                    $self->{builder}->diag("'$test_prog' failed with exit code $exit_code.");

                    return 0;
                }

                my $meth = $test_map{$func};
                $self->{builder}->$meth( $real_output, $expected, $desc );
            }

            # The generated files are left in the t/* directories.
            # Let 'make clean' and '.gitignore' take care of them.

            return;
        };

        my ($package) = caller();

        create_sub($package, $func, $test_sub);
    }
}

sub create_sub {
    my $package = shift;
    my $func    = shift;
    my $sub     = shift;

    no strict 'refs';

    *{ $package . '::' . $func } = $sub;

    return;
}

=over

=item "pbc_postprocess_output_like"

Takes a path to binary which will post process PBC, a file to run, the extension
of the file, one regex or an array reference of regexes,  and an optional
diagnostic message. This function generates PBC for the input file, then post
processes this with the binary and captures the output. The output is then
verified to match the single or multiple regular expressions given.

    my $postprocess = File::Spec->catfile( ".", "pbc_dump" );
    my $file  = 'foo.pir';
    my $ext   = 'pir';
    my $check = [ qr/has a foo/, qr/and a bar/ ];
    pbc_postprocess_output_like ( $postprocess,
                                  $file, $ext, $check,
                                  "checking pbc_dump"
                                );

=back

=cut

sub pbc_postprocess_output_like {
    my ( $postprocess, $file, $ext, $check, $diag ) = @_;
    my $testno   = $builder->current_test() + 1;
    my $codefn   = "$0.$testno.$ext";
    my $pbcfn    = "$0.$testno.pbc";
    my $stdoutfn = "$0.$testno.stdout";
    my $f        = IO::File->new(">$codefn");
    my $parrot   = File::Spec->catfile( ".", $PConfig{test_prog} );
    $f->print($file);
    $f->close();
    system("$parrot -o $pbcfn $codefn 2>&1");
    system("$postprocess $pbcfn >$stdoutfn 2>&1");
    $f = IO::File->new($stdoutfn);

    my $output = join( '', <$f> );

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    unlink ($codefn, $pbcfn, $stdoutfn);
    if (ref $check eq 'ARRAY') {
        for my $regex (@$check) {
            Test::More::like( $output, $regex, $diag );
            $testno++;
        }
    }
    else {
        Test::More::like( $output, $check, $diag );
    }

}

sub _pir_stdin_output_slurp {
    my ($input_string, $code, $expected_ouptut) = @_;

    my $stuff = sub {
        # Put the string on a file.
        my $string = shift;

        my (undef, $file) = create_tempfile(UNLINK => 1);
        open(my $out, '>', $file) or die "bug";
        binmode $out;
        print $out $string;
        return $file;
    };

    # Write the input and code strings.
    my $input_file = $stuff->($input_string);
    my $code_file = $stuff->($code);

    my $parrot = ".$PConfig{slash}parrot$PConfig{exe}";
    # Slurp and compare the output.
    my $result = do {
        local $/;
        open(my $in, '-|', "$parrot $code_file 2>&1 < $input_file")
            or die "bug";
        <$in>;
    };

    return $result;
}

=over

=item C<pir_stdin_output_is($input_string, $code, $expected, $description)>

Runs the PIR code while piping data into its standard input and passes the test
if a string comparison of output with the expected result is true.

=cut

sub pir_stdin_output_is {
    my ($input_string, $code, $expected_output, $description) = @_;

    my $result = _pir_stdin_output_slurp($input_string, $code, $expected_output);
    Test::More::is($result, $expected_output, $description);
}

=item C<pir_stdin_output_like($input_string, $code, $expected, $description)>

Runs the PIR code while piping data into its standard input and passes the test
if the output matches the expected result.

=back

=cut

sub pir_stdin_output_like {
    my ($input_string, $code, $expected_output, $description) = @_;

    my $result = _pir_stdin_output_slurp($input_string, $code, $expected_output);
    Test::More::like($result, $expected_output, $description);
}

# The following methods are private. They should not be used by modules
# inheriting from Parrot::Test.

sub _handle_error_output {
    my ( $builder, $real_output, $expected, $desc ) = @_;

    my $level = $builder->level();
    $builder->level( $level + 1 );
    $builder->ok( 0, $desc );
    $builder->diag(
        "Expected error but exited cleanly\n" . "Received:\n$real_output\nExpected:\n$expected\n" );
    $builder->level($level);

    return 0;
}

sub _run_test_file {
    my ( $func, $code, $expected, $desc, %extra ) = @_;
    my $path_to_parrot = path_to_parrot();
    my $parrot = File::Spec->join( File::Spec->curdir(), 'parrot' . $PConfig{exe} );

    # Strange Win line endings
    convert_line_endings($expected);

    # $test_no will be part of temporary file
    my $test_no = $builder->current_test() + 1;

    # Name of the file where output is written.
    # Switch to a different extension when we are generating code.
    my $out_f = per_test( '.out', $test_no );

    # Name of the file with test code.
    # This depends on which kind of code we are testing.
    my $code_f;
    if ( $func =~ m/^pir_(exit_code|.*?output)/ ) {
        $code_f = per_test( '.pir', $test_no );
    }
    elsif ( $func =~ m/^pasm_(exit_code|.*?output_)/ ) {
        $code_f = per_test( '.pasm', $test_no );
    }
    elsif ( $func =~ m/^pbc_(exit_code|.*?output_)/ ) {
        $code_f = per_test( '.pbc', $test_no );
    }
    else {
        die "Unknown test function: $func";
    }
    $code_f = File::Spec->rel2abs($code_f);
    my $code_basef = basename($code_f);

    # native tests are just run, others need to write code first
    if ( $code_f !~ /\.pbc$/ ) {
        write_code_to_file( $code, $code_f );
    }

    # honor opt* filename to actually run code with -Ox
    my $args = $ENV{TEST_PROG_ARGS} || '';
    my $opt = $code_basef =~ m!opt(.)! ? "-O$1" : "";
    $args .= " $opt";

    my $run_exec = 0;
    if ( $args =~ s/--run-exec// ) {
        $run_exec = 1;
        my $pbc_f = per_test( '.pbc', $test_no );
        my $o_f = per_test( '_pbcexe' . $PConfig{o}, $test_no );

        # make cleanup and .gitignore more simple
        my $exe_f = per_test( '_pbcexe' . $PConfig{exe}, $test_no );
        my $exec_f = per_test( '_pbcexe', $test_no );
        $exe_f =~ s@[\\/:]@$PConfig{slash}@g;

        run_command(
            qq{$parrot $args -o $pbc_f "$code_f"},
            CD     => $path_to_parrot,
            STDOUT => $out_f,
            STDERR => $out_f
        );
        if ( -e $pbc_f ) {
            run_command(
                qq{$parrot $args -o $o_f "$pbc_f"},
                CD     => $path_to_parrot,
                STDOUT => $out_f,
                STDERR => $out_f
            );
            if ( -e $o_f ) {
                run_command(
                    qq{$PConfig{make} EXEC=$exec_f exec},
                    CD     => $path_to_parrot,
                    STDOUT => $out_f,
                    STDERR => $out_f
                );
                if ( -e $exe_f ) {
                    run_command(
                        $exe_f,
                        CD     => $path_to_parrot,
                        STDOUT => $out_f,
                        STDERR => $out_f
                    );
                }
            }
        }
    }

    my ( $exit_code, $cmd );
    unless ($run_exec) {
        if ( $args =~ s/--run-pbc// || $args =~ s/-r // ) {
            my $pbc_f = per_test( '.pbc', $test_no );
            $args = qq{$args -o "$pbc_f"};

            # In this case, we need to execute more than one command. Instead
            # of a single scalar, build an array of commands.
            $cmd = [ qq{$parrot $args "$code_f"}, qq{$parrot "$pbc_f"}, ];
        }
        else {
            $cmd = qq{$parrot $args "$code_f"};
        }
        $exit_code = run_command(
            $cmd,
            CD     => $path_to_parrot,
            STDOUT => $out_f,
            STDERR => $out_f
        );
    }

    return ( $out_f, $cmd, $exit_code );
}

sub _generate_test_functions {

    my $package        = 'Parrot::Test';
    my $path_to_parrot = path_to_parrot();
    my $parrot         = File::Spec->join( File::Spec->curdir(),
                            'parrot' . $PConfig{exe} );

    ##### 1: Parrot test map #####
    my %parrot_test_map = map {
        $_ . '_output_is'           => 'is_eq',
        $_ . '_error_output_is'     => 'is_eq',
        $_ . '_exit_code_is'        => 'is_eq',
        $_ . '_output_isnt'         => 'isnt_eq',
        $_ . '_error_output_isnt'   => 'isnt_eq',
        $_ . '_output_like'         => 'like',
        $_ . '_error_output_like'   => 'like',
        $_ . '_output_unlike'       => 'unlike',
        $_ . '_error_output_unlike' => 'unlike',
    } qw( pasm pbc pir );
    for my $func ( keys %parrot_test_map ) {
        push @EXPORT, $func;

        my $test_sub = sub {
            local *__ANON__                        = $func;
            my ( $code, $expected, $desc, %extra ) = @_;
            my $args                               = $ENV{TEST_PROG_ARGS} || '';

            # Due to ongoing changes in PBC format, all tests in
            # t/native_pbc/*.t are currently being SKIPped. This means we
            # have no tests on which to model tests of the following block.
            # Hence, test coverage will be lacking.
            if ( $func =~ /^pbc_output_/ && $args =~ /-r / ) {
                # native tests with --run-pbc don't make sense
                return $builder->skip("no native tests with -r");
            }

            my ( $out_f, $cmd, $exit_code ) = _run_test_file( $func, @_ );

            my $meth        = $parrot_test_map{$func};
            my $real_output = slurp_file($out_f);

            _unlink_or_retain( $out_f );

            # set a todo-item for Test::Builder to find
            my $call_pkg = $builder->exported_to() || '';

            no strict 'refs';
            local *{ $call_pkg . '::TODO' } = ## no critic Variables::ProhibitConditionalDeclarations
                \$extra{todo}
                if defined $extra{todo};

            if ( $func =~ /_exit_code_is$/ ) {
                $expected = int($expected);
                if ($exit_code == $expected) {
                    my $pass = $builder->$meth( $exit_code, $expected, $desc );
                    return $pass;
                }
                else {
                    $builder->ok(0);
                    return 0;
                }
            }

            if ( $func =~ /_error_/ ) {
                return _handle_error_output( $builder, $real_output, $expected, $desc )
                    unless $exit_code;
            }
            elsif ($exit_code) {
                $builder->ok( 0, $desc );
                $builder->diag( "Exited with error code: $exit_code\n"
                        . "Received:\n$real_output\nExpected:\n$expected\n" );
                return 0;
            }
            my $pass = $builder->$meth( $real_output, $expected, $desc );
            $builder->diag("'$cmd' failed with exit code $exit_code")
                if not $pass and $exit_code;
            return $pass;
        };

        create_sub($package, $func, $test_sub);
    }

    ##### 2: Language test map #####
    my %builtin_language_prefix = (
        PIR_IMCC  => 'pir',
        PASM_IMCC => 'pasm',
    );

    my %language_test_map = (
        language_output_is         => 'output_is',
        language_error_output_is   => 'error_output_is',
        language_output_like       => 'output_like',
        language_error_output_like => 'error_output_like',
        language_output_isnt       => 'output_isnt',
        language_error_output_isnt => 'error_output_isnt',
    );

    foreach my $func ( keys %language_test_map ) {
        push @EXPORT, $func;

        my $test_sub = sub {
            local *__ANON__              = $func;
            my ( $language, @remaining ) = @_;

            my $meth = $language_test_map{$func};
            if ( my $prefix = $builtin_language_prefix{$language} ) {

                # builtin languages are no tested with the example_output_xx() functions
                my $level = $builder->level();
                $builder->level( $level + 2 );
                my $test_func = "${package}::${prefix}_${meth}";

                no strict 'refs';

                $test_func->(@remaining);
                $builder->level($level);
            }
            else {

                $language = ucfirst($language);

                # make sure todo-items will work, by telling Test::Builder which
                # package the .t file is in (one more than usual, due to the
                # extra layer of package indirection
                my $level = $builder->level();
                $builder->level(2);

                # Load module that knows how to test the language implementation
                require "Parrot/Test/$language.pm";
                my $class = "Parrot::Test::${language}";

                # set the builder object, and parrot config.
                my $obj = $class->new();
                $obj->{builder} = $builder;
                $obj->{relpath} = $path_to_parrot;
                $obj->{parrot}  = $parrot;
                $obj->$meth(@remaining);

                # restore prior level, just in case.
                $builder->level($level);
            }
        };

        create_sub($package, $func, $test_sub);
    }

    ##### 3:  Example test map #####
    my %example_test_map = (
        example_output_is   => 'language_output_is',
        example_output_like => 'language_output_like',
        example_output_isnt => 'language_output_isnt',
        example_error_output_is     => 'language_error_output_is',
        example_error_output_isnt   => 'language_error_output_is',
        example_error_output_like   => 'language_error_output_like',
    );

    foreach my $func ( keys %example_test_map ) {
        push @EXPORT, $func;

        my $test_sub = sub {
            local *__ANON__                        = $func;
            my ( $example_f, $expected, @options ) = @_;

            my %lang_for_extension = (
                pasm => 'PASM_IMCC',
                pir  => 'PIR_IMCC',
            );

            my ($extension) = $example_f =~ m{ [.]                    # introducing extension
                                               ( pasm | pir )         # match and capture the extension
                                               \z                     # at end of string
                                             }ixms;
            if ( defined $extension ) {
                my $code = slurp_file($example_f);
                my $test_func = join( '::', $package, $example_test_map{$func} );

                no strict 'refs';

                $test_func->(
                    $lang_for_extension{$extension},
                    $code, $expected, $example_f, @options
                );
            }
            else {
                $builder->diag("no extension recognized for $example_f");
            }
        };

        create_sub($package, $func, $test_sub);
    }

    ##### 4: C test map #####
    my %c_test_map = (
        c_output_is     => 'is_eq',
        c_output_isnt   => 'isnt_eq',
        c_output_like   => 'like',
        c_output_unlike => 'unlike',
    );

    foreach my $func ( keys %c_test_map ) {
        push @EXPORT, $func;

        my $test_sub = sub {
            local *__ANON__                            = $func;
            my ( $source, $expected, $desc, %options ) = @_;

            # $test_no will be part of temporary files
            my $test_no = $builder->current_test() + 1;

            convert_line_endings($expected);

            my $obj_f = per_test( $PConfig{o},   $test_no );
            my $exe_f = per_test( $PConfig{exe}, $test_no );
            $exe_f =~ s@[\\/:]@$PConfig{slash}@g;
            my $out_f   = per_test( '.out',   $test_no );
            my $build_f = per_test( '.build', $test_no );

            # set todo-option before trying to compile or link
            local *main::TODO;
            *main::TODO = \$options{todo} if $options{todo};

            # compile the source
            {
                my $source_f = per_test( '.c', $test_no );
                write_code_to_file( $source, $source_f );

                my $cmd =
                      "$PConfig{cc} $PConfig{ccflags} $PConfig{cc_debug} "
                    . ($^O =~ m/MSWin32/ and $PConfig{cc} eq 'cl' ? "-DPARROT_IN_EXTENSION" : "")
                    . " -I./include -c "
                    . "$PConfig{cc_o_out}$obj_f $source_f";
                my $exit_code = run_command(
                    $cmd,
                    'STDOUT' => $build_f,
                    'STDERR' => $build_f
                );
                $builder->diag("'$cmd' failed with exit code $exit_code")
                    if $exit_code;

                if ( !-e $obj_f ) {
                    $builder->diag( "Failed to build '$obj_f': " . slurp_file($build_f) );
                    unlink $build_f;
                    $builder->ok( 0, $desc );

                    return 0;
                }
            }

            # link the compiled source, get an executable
            {
                my $cfg = File::Spec->join( 'src', "parrot_config$PConfig{o}" );
                my $iculibs = $PConfig{has_icu} ? $PConfig{icu_shared} : q{};
                my $cmd =
                      "$PConfig{link} "
                    . "$PConfig{ld_out}$exe_f "
                    . "$obj_f $cfg "
                    . "$PConfig{libparrot_linkflags} "
            # If rpath is defined (and therefore rpath_blib), use it to get at the build libraries
            . ( defined($PConfig{rpath_blib})
            ? (  $PConfig{rpath_blib} . " " )
            : "" )
                    . "$PConfig{linkflags} $PConfig{ld_debug} "
                    . "$iculibs $PConfig{libs}";
                my $exit_code = run_command(
                    $cmd,
                    'STDOUT' => $build_f,
                    'STDERR' => $build_f
                );
                $builder->diag("'$cmd' failed with exit code $exit_code")
                    if $exit_code;

                if ( !-e $exe_f ) {
                    $builder->diag( "Failed to build '$exe_f': " . slurp_file($build_f) );
                    unlink $build_f;
                    $builder->ok( 0, $desc );

                    return 0;
                }
            }

            # run the generated executable
            my $pass;
            {
                my $cmd = File::Spec->join( File::Spec->curdir(), $exe_f );
                my $exit_code = run_command(
                    $cmd,
                    'STDOUT' => $out_f,
                    'STDERR' => $out_f
                );
                my $output = slurp_file($out_f);

                if ($exit_code) {
                    $pass = $builder->ok( 0, $desc );
                    $builder->diag( "Exited with error code: $exit_code\n"
                            . "Received:\n$output\nExpected:\n$expected\n" );
                }
                else {
                    my $meth = $c_test_map{$func};
                    $pass = $builder->$meth( $output, $expected, $desc );
                    $builder->diag("'$cmd' failed with exit code $exit_code")
                        unless $pass;
                }
            }

            _unlink_or_retain(
                $out_f, $build_f, $exe_f, $obj_f,
                per_test( '.ilk', $test_no ),
                per_test( '.pdb', $test_no ),
            );

            return $pass;
        };

        create_sub($package, $func, $test_sub);
    }

    return;
}

sub _handle_test_options {
    my $options = shift;
    # To run the command in a different directory.
    my $chdir = delete $options->{CD} || '';

    while ( my ( $key, $value ) = each %{ $options } ) {
        $key =~ m/^STD(OUT|ERR)$/
            or die "I don't know how to redirect '$key' yet!";
        my $strvalue = "$value";        # filehandle `eq' string will fail
        $value = File::Spec->devnull()  # on older perls, so stringify it
            if $strvalue eq '/dev/null';
    }

    my $out = $options->{'STDOUT'} || '';
    my $err = $options->{'STDERR'} || '';
    ##  File::Temp overloads 'eq' here, so we need the quotes.
    if ( $out and $err and "$out" eq "$err" ) {
        $err = '&STDOUT';
    }
    return ( $out, $err, $chdir );
}

sub _handle_blib_path {
    my $blib_path =
        File::Spec->catfile( $PConfig{build_dir}, 'blib', 'lib' );
    if ($^O eq 'cygwin') {
        $ENV{PATH} = $blib_path . ':' . $ENV{PATH};
    }
    elsif ($^O eq 'MSWin32') {
        $ENV{PATH} = $blib_path . ';' . $ENV{PATH};
    }
    else {
        $ENV{LD_RUN_PATH} = $blib_path;
    }
}

sub _handle_command {
    my $command = shift;
    $command = [$command] unless ( ref $command );

    if ( defined $ENV{VALGRIND} ) {
        $_ = "$ENV{VALGRIND} $_" for (@$command);
    }
    return $command;
}

sub _prepare_exit_message {
    my $exit_code = $?;
    return (
          ( $exit_code < 0 )    ? $exit_code
        : ( $exit_code & 0xFF ) ? "[SIGNAL $exit_code]"
        : ( $? >> 8 )
    );
}

sub _unlink_or_retain {
    my @deletables = @_;
    my $deleted = 0;
    unless ( $ENV{POSTMORTEM} ) {
        $deleted = unlink @deletables;
    }
    return $deleted;
}

package DB;

sub uplevel_args {
    my @foo = caller(2);

    return @DB::args;
}

1;

=head1 SEE ALSO

=over 4

=item F<t/harness>

=item F<docs/tests.pod>

=item L<Test/More>

=item L<Test/Builder>

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
