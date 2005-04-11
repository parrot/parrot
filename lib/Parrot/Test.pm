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

=over 4

=item C<output_is($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if a string comparison
of the output with the expected result it true.

=item C<pasm_output_is($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if a string comparison
of the output with the expected result it true.

=item C<output_like($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if
the  output matches the expected result.

=item C<pasm_output_like($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if
the  output matches the expected result.

=item C<output_isnt($code, $unexpected, $description)>

Runs the Parrot Assembler code and passes the test
if a string comparison of the output with the unexpected result is false.

=item C<pasm_output_isnt($code, $unexpected, $description)>

Runs the Parrot Assembler code and passes the test
if a string comparison of the output with the unexpected result is false.

=item C<pir_output_is($code, $expected, $description)>

Runs the PIR code and passes the test if a string comparison of output
with the expected result it true.

=item C<pir_output_like($code, $expected, $description)>

Runs the PIR code and passes the test if output matches the expected
result.

=item C<pir_output_isnt($code, $unexpected, $description)>

Runs the PIR code and passes the test if a string comparison of the output
with the unexpected result is false.

=item C<pbc_output_is($code, $expected, $description)>

Runs the Parrot Bytecode and passes the test if a string comparison of output
with the expected result it true.

=item C<pbc_output_like($code, $expected, $description)>

Runs the Parrot Bytecode and passes the test if output matches the expected
result.

=item C<pbc_output_isnt($code, $unexpected, $description)>

Runs the Parrot Bytecode and passes the test if a string comparison of output
with the unexpected result is false.

=item C<pir_2_pasm_is($code, $expected, $description)>

Compile the Parrot Intermediate Representation and generate Parrot Assembler Code.

=item C<pir_2_pasm_like($code, $expected, $description)>

Compile the Parrot Intermediate Representation and generate Parrot Assembler Code.

=item C<pir_2_pasm_isnt($code, $unexpected, $description)>

Compile the Parrot Intermediate Representation and generate Parrot Assembler Code.

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

=back

=cut

package Parrot::Test;

use strict;
use vars qw(@EXPORT @ISA);
use Parrot::Config;
use File::Spec;
use Data::Dumper;

require Exporter;
require Test::Builder;
require Test::More;


@EXPORT = qw( output_is          output_like          output_isnt
              pbc_output_is      pbc_output_like      pbc_output_isnt
              pasm_output_is     pasm_output_like     pasm_output_isnt
              pir_output_is      pir_output_like      pir_output_isnt
              pir_2_pasm_is      pir_2_pasm_like      pir_2_pasm_isnt
              c_output_is        c_output_like        c_output_isnt
              language_output_is
              skip );
@ISA = qw(Exporter);

# tell parrot it's being tested.  this disables searching of installed libraries
# (see Parrot_get_runtime_prefix in src/library.c).
$ENV{PARROT_TEST} = 1
    unless defined($ENV{PARROT_TEST});

my $builder = Test::Builder->new();

sub import {
    my($class, $plan, @args) = @_;

    Test::Builder->plan( $plan, @args );

    __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}

# this kludge is an hopefully portable way of having
# redirections ( tested on Linux and Win2k )
# An alternative is using Test::Output
sub _run_command {
    my($command, %redir) = @_;

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

    open  STDOUT, ">$out"    or die "Can't redirect stdout" if $out;
    open  STDERR, ">$err"    or die "Can't redirect stderr" if $err;

    $command = "$ENV{VALGRIND} $command" if defined $ENV{VALGRIND};
    system( $command );

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
}

# Why can't we inherit from Test::More ?
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

sub generate_functions {
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

        *{$package.'::'.$func} = sub ($$;$) {
            my( $code, $expected, $desc) = @_;

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
                $code_f = per_test('.imc', $test_no);
            }
            elsif ( $func =~ m/^output_/ || $func =~ m/^pasm_output_/ ) {
                $code_f = per_test('.pasm', $test_no);
            }
            elsif ( $func =~ /^pir_2_pasm_/) {
                $code_f = per_test('.imc', $test_no);
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
                my $cmd = qq{(cd $path_to_parrot && $parrot ${args} -o $pbc_f "$code_f")};
                _run_command($cmd, STDOUT => $out_f, STDERR => $out_f);

                my $o_f = per_test('.o', $test_no);
                $cmd = qq{(cd $path_to_parrot && $parrot ${args} -o $o_f "$pbc_f")};
                _run_command($cmd, STDOUT => $out_f, STDERR => $out_f);

                my $noext_f = per_test('', $test_no);
                $cmd = qq{(cd $path_to_parrot && make EXEC=$noext_f exec)};
                _run_command($cmd, STDOUT => $out_f, STDERR => $out_f);
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
                    $args = qq{$args -o "$pbc_f" -r -r};
                }
                $cmd = qq{(cd $path_to_parrot && $parrot $args "$code_f")};
                $exit_code = _run_command($cmd, STDOUT => $out_f, STDERR => $out_f);
            }

            my $meth = $parrot_test_map{$func};
            my $real_output = slurp_file($out_f);
            if ( $func =~ /^pir_2_pasm_/ ) {
                # The parrot open '--outfile=file.pasm' seems to create unnecessare whitespace
                $real_output =~ s/^\s*$//gm;
                $real_output =~ s/[\t ]+/ /gm;
                $real_output =~ s/[\t ]+$//gm;

                # Normalize the expected output,
                # Let's not worry too much about whitespace
	        $expected =~ s/^\s*$//gm;
	        $expected =~ s/[\t ]+/ /gm;
	        $expected =~ s/[\t ]+$//gm;
            }
            my $pass = $builder->$meth( $real_output, $expected, $desc );
            $builder->diag("'$cmd' failed with exit code $exit_code")
                  if $exit_code and not $pass;

            unless($ENV{POSTMORTEM}) {
                unlink $out_f;
            }

            return $pass;
        }
    }

    my %languages_test_map = (
        language_output_is => 'is_eq',
                             );

    foreach my $func ( keys %languages_test_map ) {
        no strict 'refs';

        my $delegate_func = $func;
        $delegate_func =~ s/^language_//;
        *{$package.'::'.$func} = sub ($$$;$) {
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
            $obj->$delegate_func(@_[1..$#_]);

            # restore prior level, just in case.
            $builder->level($level);
        }
    }

    my %c_test_map = ( c_output_is   => 'is_eq',
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
            $exit_code = _run_command($cmd,
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

            $cmd = "$PConfig{link} $PConfig{linkflags} $PConfig{ld_debug} " .
		   "$obj_f $PConfig{ld_out}$exe_f " .
		   "$libparrot $iculibs $PConfig{libs}";
            $exit_code = _run_command($cmd,
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
            $exit_code = _run_command($cmd, 'STDOUT' => $out_f, 'STDERR' => $out_f);

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

Parrot::Test::generate_functions(__PACKAGE__, \&generate_code );

=head1 SEE ALSO

=over 4

=item F<t/harness>

=item F<docs/tests.pod>

=item L<Test/More>

=item L<Test/Builder>

=back

=cut

1;
