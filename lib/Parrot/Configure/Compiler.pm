# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Configure::Compiler - C-Related methods for configuration

=head1 DESCRIPTION

The Parrot::Configure::Compiler module provides methods inherited by
Parrot::Configure which prepare and/or run C programs during
compilation.

=head2 Methods

=over 4

=cut

package Parrot::Configure::Compiler;

use strict;
use warnings;

use base qw( Exporter );

use Carp;
use File::Spec;
use lib ("lib");
use Parrot::Configure::Utils qw(
    prompt copy_if_diff move_if_diff integrate
    capture_output check_progs _slurp
    _run_command _build_compile_command
    move_if_diff
);

our %file_types_info = (
    makefile => {
        comment_type    => '#',
        vim_ft          => 'make',
    },
    c => {
        comment_type    => '/*',
        vim_ft          => 'c',
    },
    pmc => {
        comment_type    => '/*',
        vim_ft          => 'pmc',
    },
    perl => {
        comment_type    => '#',
        vim_ft          => 'perl',
    },
);

=item C<cc_gen()>

    $conf->cc_gen($source)

Generates F<test_$$.c> from the specified source file.

=cut

sub cc_gen {
    my $conf   = shift;
    my $source = shift;

    $conf->genfile( $source, "test_$$.c", file_type => 'none' );
}

=item C<cc_build()>

    $conf->cc_build($cc_args, $link_args)

These items are used from current config settings:

  $cc, $ccflags, $ldout, $o, $link, $linkflags, $cc_exe_out, $exe, $libs

Calls the compiler and linker on F<test_$$.c>.

=cut

sub cc_build {
    my $conf = shift;
    my ( $cc_args, $link_args ) = @_;

    $cc_args   = '' unless defined $cc_args;
    $link_args = '' unless defined $link_args;

    my $verbose = $conf->options->get('verbose');

    my ( $cc, $ccflags, $ldout, $o, $link, $linkflags, $cc_exe_out, $exe, $libs ) =
        $conf->data->get(qw(cc ccflags ld_out o link linkflags cc_exe_out exe libs));

    # unique test file name for parallel builds
    my $test            = 'test_' . $$;
    my $compile_command = _build_compile_command( $cc, $ccflags, $cc_args );
    my $compile_result  = _run_command( $compile_command, "$test.cco", "$test.cco", $verbose );

    if ($compile_result) {
        confess "C compiler failed (see $test.cco)";
        return $compile_result;
    }

    my $link_result =
        _run_command( "$link $linkflags $test$o $link_args ${cc_exe_out}${test}${exe}  $libs",
        "$test.ldo", "$test.ldo", $verbose )
        and confess "Linker failed (see $test.ldo)";
    if ($link_result) {
        return $link_result;
    }
}

=item C<cc_run()>

    $conf->cc_run();

Calls the F<test> (or F<test.exe>) executable. Any output is directed to
F<test.out>.

=cut

sub cc_run {
    my $conf = shift;
    my $exe      = $conf->data->get('exe');
    my $slash    = $conf->data->get('slash');
    my $verbose  = $conf->options->get('verbose');
    my $test     = 'test_' . $$;
    my $test_exe = ".${slash}${test}${exe}";

    my $run_error;
    if ( defined( $_[0] ) && length( $_[0] ) ) {
        local $" = ' ';
        $run_error = _run_command( "$test_exe @_", "./$test.out", undef, $verbose );
    }
    else {
        $run_error = _run_command( $test_exe, "./$test.out", undef, $verbose );
    }

    my $output = _slurp("./$test.out");

    return $output;
}

=item C<cc_run_capture()>

    $conf->cc_run_capture();

Same as C<cc_run()> except that warnings and errors are also directed to
F<test.out>.

=cut

sub cc_run_capture {
    my $conf    = shift;
    my $exe     = $conf->data->get('exe');
    my $slash   = $conf->data->get('slash');
    my $verbose = $conf->options->get('verbose');
    my $test    = 'test_' . $$;

    if ( defined( $_[0] ) && length( $_[0] ) ) {
        local $" = ' ';
        _run_command( ".${slash}$test${exe} @_", "./$test.out", "./$test.out", $verbose );
    }
    else {
        _run_command( ".${slash}$test${exe}", "./$test.out", "./$test.out", $verbose );
    }

    my $output = _slurp("./$test.out");

    return $output;
}

=item C<cc_clean()>

    $conf->cc_clean();

Cleans up all files in the root folder that match the glob F<test.*>.

=cut

sub cc_clean {    ## no critic Subroutines::RequireFinalReturn
    my $conf = shift;
    unlink map "test_${$}$_", qw( .c .cco .ldo .out ),
        $conf->data->get(qw( o exe )),
        # MSVC
        qw( .exe.manifest .ilk .pdb );
}

=item C<genfile()>

    $conf->genfile($source, $target, %options);

Takes the specified source file, replacing entries like C<@FOO@> with
C<FOO>'s value from the configuration system's data, and writes the results
to specified target file.

Respects the following options when manipulating files (Note: most of the
replacement syntax assumes the source text is on a single line.)

=over 4

=item file_type

If set to a C<makefile>, C<c> or C<perl> value, C<comment_type> will be set
to corresponding value.
Moreover, when set to a C<makefile> value, it will set C<replace_slashes> to
enabled, and C<conditioned_lines> to enabled.

Its value will be detected automatically by target file name unless you set
it to a special value C<none>.

=item conditioned_lines

If C<conditioned_lines> is true, then lines in the file that begin with:
C<#CONDITIONED_LINE(var):> are skipped if the C<var> condition is false. Lines
that begin with C<#INVERSE_CONDITIONED_LINE(var):> are skipped if
the C<var> condition is true.  For instance:

  #CONDITIONED_LINE(win32): $(SRC_DIR)/atomic/gcc_x86$(O)

will be processed if the platform is win32.

=item comment_type

This option takes has two possible values, C<#> or C</*>. If present and
set to one of these two values, the generated file will contain a
generated header that is commented out appropriately.

=item ignore_pattern

A regular expression. Any lines in the file matching this expression are
ignored when determining if the target file has changed (and should therefore
be overwritten with a new copy).

=item feature_file

When feature_file is set to a true value, a lines beginning with C<#perl>
forces the remaining lines of the file to be evaluated as perl code. Before
this evaluation occurs, any substitution of @@ values is performed on the
original text.

=item replace_slashes

If set to a true value, this causes any C</>s in the file to automatically
be replaced with an architecture appropriate slash. C</> or C<\>. This is
a very helpful option when writing Makefiles.

=item expand_gmake_syntax

If set to a true value, then certain types of I<gmake> syntax will be expanded
into their full equivalents. For example:

 $(wildcard PATTERN)

Will be replaced B<at config time> with the list of files that match this
pattern. Note! Be very careful when determining whether or not to disable
this expansion during config time and letting I<gmake> evaluate these: the
config system itself may change state of the filesystem, causing the
directives to expand differently depending on when they're run. Another
potential issue to consider there is that most makefiles, while generated
from the root directory, are B<run> from a subdirectory. So relative path names
become an issue.

The I<gmake> replacements are done repeatedly on a single line, so nested
syntax works ok.

=over 4

=item addprefix

=item basename

=item wildcard

=item notdir

=back

=back

=back

=cut

sub genfile {
    my $conf = shift;
    my ( $source, $target, %options ) = @_;

    my $calling_sub = (caller(1))[3] || q{};
    if ( $calling_sub !~ /cc_gen$/ ) {
        $conf->append_configure_log($target);
    }

    open my $in,  '<', $source       or die "Can't open $source: $!";
    open my $out, '>', "$target.tmp" or die "Can't open $target.tmp: $!";

    if ( !exists $options{file_type}) {
        if ( $target =~ m/makefile$/i ) {
            $options{file_type} = 'makefile';
        }
        elsif ($target =~ m/\.pl$/i ) {
            $options{file_type} = 'perl';
        }
        elsif ($target =~ m/\.[hc]$/ ) {
            $options{file_type} = 'c';
        }
        elsif ($target =~ m/\.pmc$/ ) {
            $options{file_type} = 'pmc';
        }
    } elsif ( $options{file_type} eq 'none' ) {
        delete $options{file_type};
    }

    if ( $options{file_type} ) {
        unless ( exists $file_types_info{$options{file_type}} ) {
            die "Unknown file_type '$options{file_type}'";
        }
        unless ( exists $options{comment_type} ) {
            $options{comment_type} =
                $file_types_info{$options{file_type}}{comment_type};
        }
        if ( $options{file_type} eq 'makefile' ) {
            $options{replace_slashes}   = 1;
            $options{conditioned_lines} = 1;
        }
    }

    if ( $options{comment_type} ) {
        my @comment = ( 'ex: set ro',
            'DO NOT EDIT THIS FILE',
            'Generated by ' . __PACKAGE__ . " from $source" );

        if ($options{file_type}) {
            $comment[0] .=
                ' ft=' . $file_types_info{$options{file_type}}{vim_ft} . ':';
        }
        else {
            $comment[0] .= ':';
        }

        if ( $options{comment_type} eq '#' ) {
            foreach my $line (@comment) {
                $line = "# $line\n";
            }
        }
        elsif ( $options{comment_type} eq '/*' ) {
            foreach my $line (@comment) {
                $line = " * $line\n";
            }
            $comment[0]  =~ s{^}{/*\n};     # '/*'
            $comment[-1] =~ s{$}{\n */};    # ' */'
        }
        else {
            die "Unknown comment type '$options{comment_type}'";
        }
        print {$out} @comment, "\n"; # extra newline after header
    }

    # this loop can not be implemented as a foreach loop as the body
    # is dependent on <IN> being evaluated lazily

    while ( my $line = <$in> ) {

        # everything after the line starting with #perl is eval'ed
        if ( $line =~ /^#perl/ && $options{feature_file} ) {

            # OUT was/is used at the output filehandle in eval'ed scripts
            # e.g. feature.pl or feature_h.in
            no warnings 'once';
            local *OUT = $out;
            use warnings;
            my $text = do { local $/; <$in> };

            # interpolate @foo@ values
            $text =~ s{ \@ (\w+) \@ }{\$conf->data->get("$1")}gx;
            eval $text;
            die $@ if $@;
            last;
        }
        if ( $options{conditioned_lines} ) {
            if ( $line =~ m/^#CONDITIONED_LINE\(([^)]+)\):(.*)/s ) {
                next unless $conf->data->get($1);
                $line = $2;
            }
            elsif ( $line =~ m/^#INVERSE_CONDITIONED_LINE\(([^)]+)\):(.*)/s ) {
                next if $conf->data->get($1);
                $line = $2;
            }
        }

        # interpolate gmake-ish expansions..
        if ( $options{expand_gmake_syntax} ) {
            my $any_gmake;
        GMAKES:
            $any_gmake = 0;

            if (
                $line =~ s{\$ \( wildcard \s+ ([^)]+) \)}{
                join (' ', glob $1)
            }egx
                )
            {
                $any_gmake++;
            }

            if (
                $line =~ s{\$ \( notdir \s+ ([^)]+) \)}{
                join (' ',
                    map { (File::Spec->splitpath($_))[2] }
                        split(' ', $1)
                )
            }egx
                )
            {
                $any_gmake++;
            }

            # documented as removing any .-based suffix
            if (
                $line =~ s{\$ \( basename \s+ ([^)]+) \)}{
                join (' ',
                    map {
                        my @split = File::Spec->splitpath($_);
                        $split[2] =~ s/\.[^.]*$//;
                        File::Spec->catpath(@split);
                    } split(' ', $1)
                )
            }egx
                )
            {
                $any_gmake++;
            }

            if (
                $line =~ s{\$ \( addprefix \s+ ([^,]+) \s* , \s* ([^)]+) \)}{
                my ($prefix,$list) = ($1, $2);
                join (' ',
                    map { $_ = $prefix . $_ }
                        split(' ', $list)
                )
            }egx
                )
            {
                $any_gmake++;
            }

            # we might have only gotten the innermost expression. try again.
            goto GMAKES if $any_gmake;
        }

        # interpolate @foo@ values
        $line =~ s{ \@ (\w+) \@ }{
            if(defined(my $val=$conf->data->get($1))) {
                #use Data::Dumper;warn Dumper("val for $1 is ",$val);
                $val;
            }
            else {
                warn "value for '$1' in $source is undef";
                '';
            }
        }egx;

        if ( $options{replace_slashes} ) {
            if ( $line =~ m{/$} ) {
                die "$source:$.: line ends in a slash\n";
            }

            $line =~ s{(/+)}{
                my $len = length $1;
                my $slash = $conf->data->get('slash');
                '/' x ($len/2) . ($len%2 ? $slash : '');
            }eg;

            # replace \* with \\*, so make will not eat the \
            $line =~ s{(\\\*)}{\\$1}g;
        }

        print $out $line;
    }

    close($in)  or die "Can't close $source: $!";
    close($out) or die "Can't close $target: $!";

    move_if_diff( "$target.tmp", $target, $options{ignore_pattern} );
}

sub append_configure_log {
    my $conf = shift;
    my $target = shift;
    if ( $conf->{active_configuration} ) {
        my $generated_log = 'MANIFEST.configure.generated';
        open my $GEN, '>>', $generated_log
            or die "Can't open $generated_log for appending: $!";
        print $GEN "$target\n";
        close $GEN or die "Can't close $generated_log after appending: $!";
    }
}

=head1 SEE ALSO

=over 4

=item F<docs/configuration.pod>

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
