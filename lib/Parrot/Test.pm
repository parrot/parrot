# Copyright: 2004-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

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

=head2 Functions

The parameter C<$language> is the language of the code.
The parameter C<$code> is the code that should be executed or transformed.
The parameter C<$expected> is the expected result.
The parameter C<$unexpected> is the unexpected result.
The parameter C<$description> should describe the test.

Any optional parameters can follow.  For example, to mark a test as a TODO test
(where you know the implementation does not yet work), pass:

    todo => 'reason to consider this TODO'

at the end of the argument list.  Valid reasons include C<bug>,
C<unimplemented>, and so on.

B<Note:> you I<must> use a C<$description> with TODO tests.

=over 4

=item C<language_output_is( $language, $code, $expected, $description)> 

Runs a langugage test and passes the test if a string comparison
of the output with the expected result it true.

=item C<language_output_like( $language, $code, $expected, $description)> 

Runs a langugage test and passes the test
if the  output matches the expected result.

=item C<language_output_isnt( $language, $code, $expected, $description)> 

Runs a langugage test and passes the test if a string comparison
if a string comparison of the output with the unexpected result is false.

=item C<pasm_output_is($code, $expected, $description)> or C<output_is($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if a string comparison
of the output with the expected result it true.

=item C<pasm_output_like($code, $expected, $description)> or C<output_like($code, $expected, $description)>

Runs the Parrot Assembler code and passes the test if
the  output matches the expected result.

=item C<pasm_output_isnt($code, $unexpected, $description)> or C<output_isnt($code, $unexpected, $description)>

Runs the Parrot Assembler code and passes the test
if a string comparison of the output with the unexpected result is false.

=item C<past_output_is($code, $expected, $description)>

Runs the PAST code and passes the test if a string comparison of output
with the expected result is true.

=item C<past_output_like($code, $expected, $description)>

Runs the PAST code and passes the test if output matches the expected
result.

=item C<past_output_isnt($code, $unexpected, $description)>

Runs the PAST code and passes the test if a string comparison of the output
with the unexpected result is false.

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

=item C<example_output_is( $example_f, $expected, @todo )>

Determine the language from the extension of C<$example_f> and runs
language_output_is().  This I<does> set a description for you, so don't pass
one.

=item C<example_output_like( $example_f, $expected, @todo )>

Determine the language from the extension of C<$example_f> and runs
language_output_like().  This I<does> set a description for you, so don't pass
one.

=item C<example_output_isnt( $example_f, $expected, @todo )>

Determine the language from the extension of C<$example_f> and runs
language_output_isnt().  This I<does> set a description for you, so don't pass
one.

=item C<skip($why, $how_many)>

Use within a C<SKIP: { ... }> block to indicate why and how many tests to skip,
just like in Test::More.

=item C<run_command($command, %options)>

Run the given $command in a cross-platform manner.

%options include...

    STDOUT    filehandle to redirect STDOUT to
    STDERR    filehandle to redirect STDERR to
    CD        directory to run the command in

For example:

    # equivalent to "cd some_dir && make test"
    run_command("make test", CD => "some_dir");

=item C<slurp_file($file_name)>

Read the whole file $file_name and return the content as a string.

=back

=cut

package Parrot::Test;

use strict;
use warnings;

use Cwd;
use Data::Dumper;
use File::Spec;
use Parrot::Config;

require Exporter;
require Test::Builder;
require Test::More;

our @EXPORT = qw( plan run_command skip slurp_file );

use base qw( Exporter );

# tell parrot it's being tested--disables searching of installed libraries.
# (see Parrot_get_runtime_prefix in src/library.c).
$ENV{PARROT_TEST} = 1 unless defined $ENV{PARROT_TEST};

my $builder = Test::Builder->new();

sub import {
    my ($class, $plan, @args) = @_;

    $builder->plan( $plan, @args );

    __PACKAGE__->export_to_level( 2, __PACKAGE__ );
}

# this kludge is an hopefully portable way of having
# redirections ( tested on Linux and Win2k )
# An alternative is using Test::Output
sub run_command {
    my ($command, %options) = @_;

    # To run the command in a different directory.
    my $chdir = delete $options{CD};

    foreach (keys %options) {
        m/^STD(OUT|ERR)$/ or die "I don't know how to redirect '$_' yet! ";
    }
    foreach (values %options) {
        $_ = 'NUL:' if $^O eq 'MSWin32' and $_ eq '/dev/null';
    }

    my $out = $options{'STDOUT'} || '';
    my $err = $options{'STDERR'} || '';

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
    if ( $chdir ) {
        $orig_dir = cwd;
        chdir $chdir;
    }

    # Execute all commands
    system( $_ ) for (@{$command});

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

    return unless defined $ext and defined $test_no;

    my $t = $0;  # $0 is name of the test script
    $t =~ s/\.t$/_$test_no$ext/;

    return $t;
}

sub write_code_to_file {
    my ($code, $code_f) = @_;

    open my $CODE, '>', $code_f or die "Unable to open '$code_f'";
    binmode $CODE;
    print $CODE $code;
    close $CODE;

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

sub convert_line_endings {
    my ( $text ) = @_;

    $text =~ s/\cM\cJ/\n/g;
}

# 
# private methods, should not be used by Modules inherition from Parrot::Test
#

sub _generate_functions {
    my $package = 'Parrot::Test';

    my $path_to_parrot = $INC{"Parrot/Config.pm"};
    $path_to_parrot =~ s:lib/Parrot/Config.pm$::;
    $path_to_parrot = File::Spec->curdir() if $path_to_parrot eq "";
    my $parrot = File::Spec->join(File::Spec->curdir(), 'parrot' . $PConfig{exe});

    my %parrot_test_map = (
        pbc_output_is      => 'is_eq',
        pbc_output_isnt    => 'isnt_eq',
        pbc_output_like    => 'like',
        pasm_output_is     => 'is_eq',
        pasm_output_isnt   => 'isnt_eq',
        pasm_output_like   => 'like',
        past_output_is     => 'is_eq',
        past_output_isnt   => 'isnt_eq',
        past_output_like   => 'like',
        pir_output_is      => 'is_eq',
        pir_output_isnt    => 'isnt_eq',
        pir_output_like    => 'like',
                          );

    foreach my $func ( keys %parrot_test_map ) {
        push @EXPORT, $func;
        no strict 'refs';

        *{$package.'::'.$func} = sub {
            local $SIG{__WARN__} = \&report_odd_hash;
            my( $code, $expected, $desc, %extra) = @_;

            # Strange Win line endings
            convert_line_endings( $expected );

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
            if ( $func =~ m/^pir_output/ ) {
                $code_f = per_test('.pir', $test_no);
            }
            elsif ( $func =~ m/^pasm_output_/ ) {
                $code_f = per_test('.pasm', $test_no);
            }
            elsif ( $func =~ m/^past_/) {
                $code_f = per_test('.past', $test_no);
            }
            elsif ( $func =~ m/^pbc_output_/ ) {
                $code_f = per_test('.pbc', $test_no);
            }
            else {
                die "Unknown test function: $func";
            }
            $code_f = File::Spec->rel2abs($code_f);

            # native tests are just run, others need to write code first
            if ($code_f !~ /\.pbc$/) {
                write_code_to_file($code, $code_f);
            }

            my $args = $ENV{TEST_PROG_ARGS} || '';
            my $run_exec = 0;
            if ( $args =~ s/--run-exec// ) {
                $run_exec = 1;
                my $pbc_f  = per_test('.pbc', $test_no);
                my $o_f    = per_test('_pbcexe' . $PConfig{o}, $test_no);
                my $exe_f  = per_test( '_pbcexe' . $PConfig{exe}, $test_no);  # Make cleanup and svn:ignore more simple
                my $exec_f = per_test( '_pbcexe', $test_no);  # Make cleanup and svn:ignore more simple
                $exe_f =~ s@[\\/:]@$PConfig{slash}@g;
                # XXX put this into sub generate_pbc()
                run_command(qq{$parrot $args -o $pbc_f "$code_f"},
                            CD     => $path_to_parrot,
                            STDOUT => $out_f,
                            STDERR => $out_f);
                if ( -e $pbc_f ) {
                    run_command(qq{$parrot $args -o $o_f "$pbc_f"},
                                CD     => $path_to_parrot,
                                STDOUT => $out_f,
                                STDERR => $out_f);
                    if ( -e $o_f ) {
                        run_command(qq{$PConfig{make} EXEC=$exec_f exec},
                                    CD     => $path_to_parrot,
                                    STDOUT => $out_f,
                                    STDERR => $out_f);
                        if ( -e $exe_f ) {
                            run_command($exe_f,
                                        CD     => $path_to_parrot,
                                        STDOUT => $out_f,
                                        STDERR => $out_f);
                        }
                    }
                }
            }

            if ( $func =~ /^pbc_output_/ && $args =~ /-r / ) {
                # native tests with --run-pbc don't make sense
                return $builder->skip( "no native tests with -r" );
            }

            my ( $exit_code, $cmd );
            unless ( $run_exec ) {
                if ( $args =~ s/--run-pbc// || $args =~ s/-r // ) {
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
                $exit_code = run_command($cmd,
                                         CD     => $path_to_parrot,
                                         STDOUT => $out_f,
                                         STDERR => $out_f);
            }

            my $meth = $parrot_test_map{$func};
            my $real_output = slurp_file($out_f);

            # set a TODO for Test::Builder to find
            my $call_pkg = $builder->exported_to() || '';
            # die Dumper( $code, $expected, $desc, \%extra, $extra{todo}, $call_pkg ) if ( keys %extra );
            local *{ $call_pkg . '::TODO' } = \$extra{todo}
                if defined $extra{todo};

            my $pass = $builder->$meth( $real_output, $expected, $desc );
            $builder->diag("'$cmd' failed with exit code $exit_code")
                  if $exit_code and not $pass;

            unless($ENV{POSTMORTEM}) {
                unlink $out_f;
            }

            return $pass;
        };
    }

    my %pir_2_pasm_test_map = (
        pir_2_pasm_is      => 'is_eq',
        pir_2_pasm_isnt    => 'isnt_eq',
        pir_2_pasm_like    => 'like',
                              );

    foreach my $func ( keys %pir_2_pasm_test_map ) {
        push @EXPORT, $func;
        no strict 'refs';

        *{$package.'::'.$func} = sub {
            my ( $code, $expected, $desc, %extra ) = @_;

            # Strange Win line endings
            convert_line_endings( $expected );

            # set up default description
            unless ( $desc ) {
               (undef, my $file, my $line) = caller();
               $desc = "($file line $line)";
            }

            # $test_no will be part of temporary file
            my $test_no = $builder->current_test() + 1;

            # Name of the file with test code.
            my $code_f = File::Spec->rel2abs( per_test('.pir', $test_no) );

            # output file
            my $out_f  = per_test('.pasm', $test_no);

            my $opt = $code_f =~ m!opt(.)! ? "-O$1" : "-O1";
            my $args = $ENV{TEST_PROG_ARGS} || '';
            $args .= " $opt --output=$out_f";
            $args =~ s/--run-exec//;

            write_code_to_file($code, $code_f);

            my $cmd = qq{$parrot $args "$code_f"};
            my $exit_code = run_command($cmd,
                                        CD     => $path_to_parrot,
                                        STDOUT => $out_f,
                                        STDERR => $out_f);

            my $meth = $pir_2_pasm_test_map{$func};
            my $real_output = slurp_file($out_f);
            {
                # The parrot open '--outfile=file.pasm' seems to create unnecessary whitespace
                $real_output =~ s/^\s*$//gm;
                $real_output =~ s/[\t ]+/ /gm;
                $real_output =~ s/ +$//gm;

                $expected =~ s/[\t ]+/ /gm;
            }

            # set a TODO for Test::Builder to find
            my $call_pkg = $builder->exported_to() || '';
            # die Dumper( $code, $expected, $desc, \%extra, $extra{todo}, $call_pkg ) if ( keys %extra );
            local *{ $call_pkg . '::TODO' } = \$extra{todo}
                if defined $extra{todo};

            my $pass = $builder->$meth( $real_output, $expected, $desc );
            $builder->diag("'$cmd' failed with exit code $exit_code")
                  if $exit_code and not $pass;

            unless($ENV{POSTMORTEM}) {
                unlink $out_f;
            }

            return $pass;
        };
    }

    my %builtin_language_prefix = (
        IMC   => 'pir',
        PASM  => 'pasm',
        PAST  => 'past',
        PIR   => 'pir',
                                  );

    my %language_test_map = (
        language_output_is   => 'output_is',
        language_output_like => 'output_like',
        language_output_isnt => 'output_isnt',
                            );

    foreach my $func ( keys %language_test_map ) {
        push @EXPORT, $func;
        no strict 'refs';

        *{$package.'::'.$func} = sub {
            my ( $language, @remaining ) = @_;

            my $meth = $language_test_map{$func};
            if ( my $prefix = $builtin_language_prefix{$language} ) { 
                my $level = $builder->level();
                $builder->level( $level + 2 );
                my $test_func = "${package}::${prefix}_${meth}";
                $test_func->( @remaining );
                $builder->level( $level );
            }
            else {
                # TODO: $language should be the name of the test Module
                #       that would open the door for Scheme::Test
                $language = ucfirst($language);

                # make sure TODO will work, by telling Test::Builder which
                # package the .t file is in (one more than usual, due to the
                # extra layer of package indirection
                my $level = $builder->level();
                $builder->level(2);

                # Load module that knows how to test the language implementation
                require "Parrot/Test/$language.pm";
                my $class = "Parrot::Test::${language}";

                # set the builder object, and parrot config.
                my $obj         = $class->new();
                $obj->{builder} = $builder;
                $obj->{relpath} = $path_to_parrot;
                $obj->{parrot}  = $parrot;
                $obj->$meth(@remaining);

                # restore prior level, just in case.
                $builder->level($level);
            }
        }
    }

    # XXX this is broken WRT todo tests
    my %example_test_map = (
        example_output_is   => 'language_output_is',
        example_output_like => 'language_output_like',
        example_output_isnt => 'language_output_isnt',
                           );

    foreach my $func ( keys %example_test_map ) {
        push @EXPORT, $func;
        no strict 'refs';

        *{$package.'::'.$func} = sub {
            my ($example_f, $expected, @options) = @_;

            my %lang_for_extension 
                = ( pasm => 'PASM',
                    past => 'PAST',
                    pir  => 'PIR',
                    imc  => 'PIR', );

            my ( $extension ) = $example_f =~ m{ [.]                         # introducing extension
                                                 ( pasm | pir | imc | past ) # match and capture the extension
                                                 \z                          # at end of string
                                               }ixms or Usage();
            if ( defined $extension ) { 
                my $code = slurp_file($example_f);
                my $test_func = join( '::', $package, $example_test_map{$func} );
                $test_func->( $lang_for_extension{$extension}, $code, $expected, $example_f, @options );
            }
            else {
                fail( defined $extension, "no extension recognized for $example_f" );
            }
        }
    }

    my %c_test_map = (
         c_output_is   => 'is_eq',
         c_output_isnt => 'isnt_eq',
         c_output_like => 'like'
                     );

    foreach my $func ( keys %c_test_map ) {
        push @EXPORT, $func;
        no strict 'refs';

        *{$package.'::'.$func} = sub {
            my ($source, $expected, $desc) = @_;

            # $test_no will be part of temporary file
            my $test_no = $builder->current_test() + 1;

            $expected =~ s/\cM\cJ/\n/g;
            my $source_f = per_test('.c', $test_no);
            my $obj_f = per_test($PConfig{o}, $test_no);
            my $exe_f = per_test($PConfig{exe}, $test_no);  
            $exe_f =~ s@[\\/:]@$PConfig{slash}@g;
            my $out_f = per_test('.out', $test_no);
            my $build_f = per_test('.build', $test_no);
            my $pdb_f = per_test('.pdb', $test_no);
            my $ilk_f = per_test('.ilk', $test_no);

            open my $SOURCE, '>', $source_f or die "Unable to open '$source_f'";
            binmode $SOURCE;
            print $SOURCE "/* DO NOT EDIT - Autogenerated test file */\n";
            print $SOURCE $source;
            close $SOURCE;

            my $libparrot_shared = "$PConfig{rpath_blib} -L$PConfig{blib_dir} -lparrot";
            my $libparrot_static  = $PConfig{blib_dir}.$PConfig{slash}.$PConfig{libparrot_static};

            my $libparrot = $PConfig{parrot_is_shared} ? $libparrot_shared : $libparrot_static;

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
        $cmd =   "$PConfig{link} $PConfig{linkflags} $PConfig{ld_debug} "
               . "$obj_f $cfg $PConfig{ld_out}$exe_f "
               . "$libparrot $iculibs $PConfig{libs}";
            $exit_code = run_command($cmd,
                                     'STDOUT' => $build_f,
                                     'STDERR' => $build_f);
            $builder->diag("'$cmd' failed with exit code $exit_code")
        if $exit_code;

            if (! -e $exe_f) {
                $builder->diag("Failed to build '$exe_f': " . slurp_file($build_f));
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
                unlink $pdb_f;
                unlink $ilk_f;
            }

            return $pass;
        }
    }
}

Parrot::Test::_generate_functions();

=head1 SEE ALSO

=over 4

=item F<t/harness>

=item F<docs/tests.pod>

=item L<Test/More>

=item L<Test/Builder>

=back

=cut

sub report_odd_hash {
    my $warning = shift;
    if ($warning =~ /Odd number of elements in hash assignment/) {
        require Carp;
        my @args = DB::uplevel_args();
        shift @args;
        my $func = ( caller() )[2];

        Carp::carp(
            "Odd $func invocation; probably missing description for TODO test"
        );
    } else {
        warn $warning;
    }
}

package DB;

sub uplevel_args {
    my @foo = caller( 2 );
    return @DB::args;
}

1;

# vim: expandtab sw=4
