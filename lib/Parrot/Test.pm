# Copyright: 2004-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Test - Functions for testing Parrot and language implementations

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

=head2 Functions

The parameter C<$code> is the code that should be executed or transformed.
The parameter C<$expected> is the expected result.
The parameter C<$unexpected> is the unexpected result.
The parameter C<$description> should describe the test.

Any optional parameters can follow.  For example, to mark a test as a TODO test (where you know the implementation does not yet work), pass:

	todo => 'reason to consider this TODO'

at the end of the argument list.  Valid reasons include C<bug>,
C<unimplemented>, and so on.

=over 4

=item C<pasm_output_is($code, $expected, $description)> or C<output_is($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if a string comparison
of the output with the expected result it true.

=item C<pasm_output_like($code, $expected, $description)> or C<output_like($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if
the  output matches the expected result.

=item C<pasm_output_isnt($code, $unexpected, $description)> or C<output_isnt($code, $unexpected, $description)>

Runs the Parrot Assembler code and passes the test
if a string comparison of the output with the unexpected result is false.

=item C<pir_output_is($code, $expected, $description)>

Runs the PIR code and passes the test if a string comparison of output
with the expected result is true.

=item C<pir_output_like($code, $expected, $description)>

Runs the PIR code and passes the test if output matches the expected
result.

=item C<pir_output_isnt($code, $unexpected, $description)>

Runs the PIR code and passes the test if a string comparison of the output
with the unexpected result is false.

=item C<pbc_output_is($code, $expected, $description)>

Runs the Parrot Bytecode and passes the test if a string comparison of output
with the expected result is true.

=item C<pbc_output_like($code, $expected, $description)>

Runs the Parrot Bytecode and passes the test if output matches the expected
result.

=item C<pbc_output_isnt($code, $unexpected, $description)>

Runs the Parrot Bytecode and passes the test if a string comparison of output
with the unexpected result is false.

=item C<pir_2_pasm_is($code, $expected, $description)>

Compile the Parrot Intermediate Representation and generate Parrot Assembler Code.
Pass if the generated PASM is $expected.

=item C<pir_2_pasm_like($code, $expected, $description)>

Compile the Parrot Intermediate Representation and generate Parrot Assembler Code.
Pass if the generated PASM matches $expected.

=item C<pir_2_pasm_isnt($code, $unexpected, $description)>

Compile the Parrot Intermediate Representation and generate Parrot Assembler Code.
Pass unless the generated PASM is $expected.

=item C<c_output_is($code, $expected, $description)>

Compiles and runs the C code, passing the test if a string comparison of
output with the expected result it true.

=item C<c_output_like($code, $expected, $description)>

Compiles and runs the C code, passing the test if output matches the
expected result.

=item C<c_output_isnt($code, $unexpected, $description)>

Compiles and runs the C code, passing the test if a string comparison of
output with the unexpected result is false.

=item C<skip($why, $how_many)>

Use within a C<SKIP: { ... }> block to indicate why and how many test
are being skipped. Just like in Test::More.

=item C<run_command($command, %options)>

Run the given $command in a cross-platform manner.

%options include...

    STDOUT	filehandle to redirect STDOUT to
    STDERR     	filehandle to redirect STDERR to
    CD		directory to run the command in

For example:

    # equivalent to "cd some_dir && make test"
    run_command("make test", CD => "some_dir");

=item C<slurp_file($file_name)>

Read the whole file $file_name and return the content as a string.

=back

=cut

package Parrot::Test;

use strict;
use vars qw(@EXPORT @ISA);

use Parrot::Config;
use File::Spec;
use Data::Dumper;
use Cwd;

require Exporter;
require Test::Builder;
require Test::More;


@EXPORT = qw( output_is          output_like          output_isnt
              pasm_output_is     pasm_output_like     pasm_output_isnt
              pir_output_is      pir_output_like      pir_output_isnt
              pir_2_pasm_is      pir_2_pasm_like      pir_2_pasm_isnt
              pbc_output_is      pbc_output_like      pbc_output_isnt
              c_output_is        c_output_like        c_output_isnt
              language_output_is language_output_like language_output_isnt
              plan
              skip
              slurp_file
              run_command
          );
@ISA = qw(Exporter);

# tell parrot it's being tested.  this disables searching of installed libraries
# (see Parrot_get_runtime_prefix in src/library.c).
$ENV{PARROT_TEST} = 1 unless defined($ENV{PARROT_TEST});

my $builder = Test::Builder->new();

sub import {
    my($class, $plan, @args) = @_;

    $builder->plan( $plan, @args );

    __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}

# this kludge is an hopefully portable way of having
# redirections ( tested on Linux and Win2k )
# An alternative is using Test::Output
sub run_command {
    my($command, %redir) = @_;

    # To run the command in a different directory.
    my $chdir = delete $redir{CD};

    foreach (keys %redir) {
        m/^STD(OUT|ERR)$/ or die "I don't know how to redirect '$_' yet! ";
    }
    foreach (values %redir) {
        $_ = 'NUL:' if $^O eq 'MSWin32' and $_ eq '/dev/null';
    }

    my $out = $redir{'STDOUT'} || '';
    my $err = $redir{'STDERR'} || '';

    if ( $out and $err and $out eq $err ) {
        $err = "&STDOUT";
    }

    local *OLDOUT if $out;
    local *OLDERR if $err;

    # Save the old filehandles; we must not let them get closed.
    open  OLDOUT, ">&STDOUT" or die "Can't save     stdout" if $out;
    open  OLDERR, ">&STDERR" or die "Can't save     stderr" if $err;

    open  STDOUT, ">$out"    or die "Can't redirect stdout to $out" if $out;
    open  STDERR, ">$err"    or die "Can't redirect stderr to $err" if $err;

    # If $command isn't already an arrayref (because of a multi-command
    # test), make it so now so the code below can treat everybody the
    # same.
    $command = [$command] unless (ref $command);

    if (defined $ENV{VALGRIND}) {
        $_ = "$ENV{VALGRIND} $_" for (@$command);
    }

    my $orig_dir;
    if( $chdir ) {
        $orig_dir = cwd;
        chdir $chdir;
    }

    # Execute all commands
    system $_ for (@$command);

    if( $chdir ) {
        chdir $orig_dir;
    }

    my $exit_code = $? >> 8;

    close STDOUT             or die "Can't close    stdout" if $out;
    close STDERR             or die "Can't close    stderr" if $err;

    open  STDOUT, ">&OLDOUT" or die "Can't restore  stdout" if $out;
    open  STDERR, ">&OLDERR" or die "Can't restore  stderr" if $err;

    return $exit_code;
}


sub per_test {
    my ($ext, $test_no) = @_;

    my $t = $0;  # $0 is name of the test script
    $t =~ s/\.t$/_$test_no$ext/;

    return $t;
}

sub generate_code {
    my ($code, $directory, $test_no, $code_f) = @_;

    local( *CODE );
    open(CODE, "> $code_f") or die "Unable to open '$code_f'";
    binmode(CODE);
    print CODE $code;
    close( CODE );

    return;
}

# We can inherit from Test::More, so we do it.
*plan = \&Test::More::plan;
*skip = \&Test::More::skip;

# What about File::Slurp?
sub slurp_file {
    my ($file_name) = @_;

    open( SLURP, "< $file_name" ) or die "open '$file_name': $!";
    local $/ = undef;
    my $file = <SLURP> . '';
    $file =~ s/\cM\cJ/\n/g;
    close SLURP;

    return $file;
}

sub _generate_functions {
    my ($package, $code_generator) = @_;

    my $path_to_parrot = $INC{"Parrot/Config.pm"};
    $path_to_parrot =~ s:lib/Parrot/Config.pm$::;
    $path_to_parrot = File::Spec->curdir() if $path_to_parrot eq "";
    my $parrot = File::Spec->join(File::Spec->curdir(), 'parrot' . $PConfig{exe});

    my %parrot_test_map = (
        output_is          => 'is_eq',
        output_isnt        => 'isnt_eq',
        output_like        => 'like',
        pbc_output_is      => 'is_eq',
        pbc_output_isnt    => 'isnt_eq',
        pbc_output_like    => 'like',
        pasm_output_is     => 'is_eq',
        pasm_output_isnt   => 'isnt_eq',
        pasm_output_like   => 'like',
        pir_output_is      => 'is_eq',
        pir_output_isnt    => 'isnt_eq',
        pir_output_like    => 'like',
        pir_2_pasm_is      => 'is_eq',
        pir_2_pasm_isnt    => 'isnt_eq',
        pir_2_pasm_like    => 'like',
                          );

    foreach my $func ( keys %parrot_test_map ) {
        no strict 'refs';

        *{$package.'::'.$func} = sub ($$;$%) {
            my( $code, $expected, $desc, %extra ) = @_;

            # Strange Win line endings
            $expected =~ s/\cM\cJ/\n/g;

            # set up default description
            unless ( $desc ) {
               (undef, my $file, my $line) = caller();
               $desc = "($file line $line)";
            }

            # $test_no will be part of temporary file
            my $test_no = $builder->current_test() + 1;

            # Name of the file where output is written.
            # Switch to a different extension when we are generating code.
            my $out_f = per_test('.out', $test_no);

            # Name of the file with test code.
            # This depends on which kind of code we are testing.
            my $code_f;
            if ( $func =~ /^pir_output/ ) {
                $code_f = per_test('.pir', $test_no);
            }
            elsif ( $func =~ m/^output_/ || $func =~ m/^pasm_output_/ ) {
                $code_f = per_test('.pasm', $test_no);
            }
            elsif ( $func =~ /^pir_2_pasm_/) {
                $code_f = per_test('.pir', $test_no);
            }
            elsif ( $func =~ /^pbc_output_/ ) {
                $code_f = per_test('.pbc', $test_no);
            }
            else {
                die "Unknown test function: $func";
            }

            my $args = $ENV{TEST_PROG_ARGS} || '';
            my $run_exec = 0;
            if ( $args =~ s/--run-exec// ) {
                $run_exec = 1;
                my $pbc_f = per_test('.pbc', $test_no);
                my $cmd = qq{$parrot ${args} -o $pbc_f "$code_f"};
                run_command($cmd, CD => $path_to_parrot,
			    STDOUT => $out_f, STDERR => $out_f);

                my $o_f = per_test('.o', $test_no);
                $cmd = qq{$parrot ${args} -o $o_f "$pbc_f"};
                run_command($cmd, CD => $path_to_parrot,
			    STDOUT => $out_f, STDERR => $out_f);

                my $noext_f = per_test('', $test_no);
                $cmd = qq{make EXEC=$noext_f exec};
                run_command($cmd, CD => $path_to_parrot,
			    STDOUT => $out_f, STDERR => $out_f);
            }
            if ( $func =~ /^pbc_output_/ && $args =~ /-r / ) {
                # native tests with --run-pbc don't make sense
                return $builder->skip( "no native tests with -r" );
            }
            elsif ( $func =~ /^pir_2_pasm_/) {
                $out_f = per_test('.pasm', $test_no);
	        my $opt = $code_f =~ m!opt(.)! ? "-O$1" : "-O1";
                $args = "$args $opt --output=$out_f";
            }
            $code_f = File::Spec->rel2abs($code_f);

            # native tests are just run, others need to write code first
            if ($code_f !~ /\.pbc$/) {
                $code_generator->($code, $path_to_parrot, $test_no, $code_f);
            }

            my ( $exit_code, $cmd );
            unless ( $run_exec ) {
                if ( $func !~ /^pir_2_pasm_/ &&
                     ( $args =~ s/--run-pbc// || $args =~ s/-r //) ) {
                    my $pbc_f = per_test('.pbc', $test_no);
                    $args = qq{$args -o "$pbc_f"};

                    # In this case, we need to execute more than one
                    # command. Instead of a single scalar, build an
                    # array of commands.
                    $cmd = [
                        qq{$parrot $args "$code_f"},
                        qq{$parrot "$pbc_f"},
                    ];
                } else {
                    $cmd = qq{$parrot $args "$code_f"};
                }
                $exit_code = run_command($cmd, CD => $path_to_parrot,
                    STDOUT => $out_f, STDERR => $out_f);
            }

            my $meth = $parrot_test_map{$func};
            my $real_output = slurp_file($out_f);
            if ( $func =~ /^pir_2_pasm_/ ) {
                # The parrot open '--outfile=file.pasm' seems to create unnecessary whitespace
                $real_output =~ s/^\s*$//gm;
                $real_output =~ s/[\t ]+/ /gm;
                $real_output =~ s/[\t ]+$//gm;

                # Normalize the expected output,
                # Let's not worry too much about whitespace
	        $expected =~ s/^\s*$//gm;
	        $expected =~ s/[\t ]+/ /gm;
	        $expected =~ s/[\t ]+$//gm;
            }

            # set a TODO for Test::Builder to find
            my $call_pkg = $builder->exported_to() || '';
            local *{ $call_pkg . '::TODO' } = \$extra{todo}
                if defined $extra{todo};

            my $pass = $builder->$meth( $real_output, $expected, $desc );
            $builder->diag("'$cmd' failed with exit code $exit_code")
                  if $exit_code and not $pass;

            unless($ENV{POSTMORTEM}) {
                unlink $out_f;
            }

            return $pass;
        }
    }

    my %language_test_map = (
        language_output_is   => 'output_is',
        language_output_like => 'output_like',
        language_output_isnt => 'output_isnt',
                             );

    foreach my $func ( keys %language_test_map ) {
        no strict 'refs';

        *{$package.'::'.$func} = sub ($$$;$) {
            # TODO: $language should be the name of the test Module
            #       that would open the door for Scheme::Test
            my $language = $_[0];
            $language = ucfirst($language) unless ( $language eq 'm4' );

            # make sure TODO will work, by telling Test::Builder which package
            # the .t file is in (one more than usual, due to the extra layer
            # of package indirection
            my $level = $builder->level();
            $builder->level(2);

            # get modified parrot command.
            require "Parrot/Test/$language.pm";
            # set the builder object, and parrot config.
            my $obj = eval "Parrot::Test::${language}->new()";
            $obj->{builder} = $builder;
            $obj->{relpath} = $path_to_parrot;
            $obj->{parrot}  = $parrot;
            my $meth = $language_test_map{$func};
            $obj->$meth(@_[1..$#_]);

            # restore prior level, just in case.
            $builder->level($level);
        }
    }

    my %c_test_map = (
         c_output_is   => 'is_eq',
         c_output_isnt => 'isnt_eq',
         c_output_like => 'like'
                     );

    foreach my $func ( keys %c_test_map ) {
        no strict 'refs';

        *{$package.'::'.$func} = sub ($$;$ ) {
            my($source, $expected, $desc) = @_;

            # $test_no will be part of temporary file
            my $test_no = $builder->current_test() + 1;

            $expected =~ s/\cM\cJ/\n/g;
            local( *SOURCE );
            my $source_f = per_test('.c', $test_no);
            my $obj_f = per_test($PConfig{o}, $test_no);
            my $exe_f = per_test($PConfig{exe}, $test_no);
            $exe_f =~ s@[\\/:]@$PConfig{slash}@g;
            my $out_f = per_test('.out', $test_no);
            my $build_f = per_test('.build', $test_no);

            open SOURCE, "> $source_f" or die "Unable to open '$source_f'";
            binmode SOURCE;
            print SOURCE "/* DO NOT EDIT - Autogenerated test file */\n";
            print SOURCE $source;
            close SOURCE;

            (my $libparrot_root = $PConfig{blib_lib_libparrot_a}) =~ s/\$\(A\)//;
            my $libparrot_dynamic = $libparrot_root.$PConfig{share_ext};

            my $libparrot;

            # use shared library version if available
            if( -e $libparrot_dynamic ) {
                $libparrot = '-Lblib/lib -lparrot';
            } else {
                $libparrot = $libparrot_root.$PConfig{a};
            }

            my $iculibs = "";
            if ($PConfig{'has_icu'}) {
                $iculibs = $PConfig{icu_shared};
            }

            my ($cmd, $exit_code);
            $cmd = "$PConfig{cc} $PConfig{ccflags} $PConfig{cc_debug} " .
	           " -I./include -c " .
                   "$PConfig{cc_o_out}$obj_f $source_f";
            $exit_code = run_command($cmd,
		    'STDOUT' => $build_f,
		    'STDERR' => $build_f);
            $builder->diag("'$cmd' failed with exit code $exit_code")
			if $exit_code;

            if (! -e $obj_f) {
                $builder->diag("Failed to build '$obj_f': " .
			slurp_file($build_f));
                unlink $build_f;
                $builder->ok(0,$desc);
                return 0;
            }

	    my $cfg = "src$PConfig{slash}parrot_config$PConfig{o}";
            $cmd = "$PConfig{link} $PConfig{linkflags} $PConfig{ld_debug} " .
		   "$obj_f $cfg $PConfig{ld_out}$exe_f " .
		   "$libparrot $iculibs $PConfig{libs}";
            $exit_code = run_command($cmd,
		'STDOUT' => $build_f,
		'STDERR' => $build_f);
            $builder->diag("'$cmd' failed with exit code $exit_code")
		if $exit_code;

            if (! -e $exe_f) {
                $builder->diag("Failed to build '$exe_f': " .
			slurp_file($build_f));
                unlink $build_f;
                $builder->ok(0,$desc);

                return 0;
            }

            $cmd       = ".$PConfig{slash}$exe_f";
            $exit_code = run_command($cmd, 'STDOUT' => $out_f, 'STDERR' => $out_f);

            my $meth = $c_test_map{$func};
            my $pass = $builder->$meth(slurp_file($out_f), $expected, $desc);
            $builder->diag("'$cmd' failed with exit code $exit_code") if $exit_code and not $pass;

            unless($ENV{POSTMORTEM}) {
                unlink $out_f;
                unlink $build_f;
                unlink $exe_f;
                unlink $obj_f;
            }

            return $pass;
        }
    }
}

Parrot::Test::_generate_functions(__PACKAGE__, \&generate_code );

=head1 TODO

C<generate_code> should be renamed and be published to everybody who needs
to generate files.

=head1 SEE ALSO

=over 4

=item F<t/harness>

=item F<docs/tests.pod>

=item L<Test/More>

=item L<Test/Builder>

=back

=cut

1;
