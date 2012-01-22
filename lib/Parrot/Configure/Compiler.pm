# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

Parrot::Configure::Compiler - C-Related methods for configuration and more

=head1 DESCRIPTION

The Parrot::Configure::Compiler module provides methods inherited by
Parrot::Configure which prepare and/or run C programs during compilation.
Other methods from this module will be used to generate makefiles and other
files.  Template entries of the form C<@key@> will be replaced with C<key>'s
value from the configuration system's data.

=head2 Methods

=over 4

=cut

package Parrot::Configure::Compiler;

use strict;
use warnings;

use Carp;
use File::Spec ();
use lib ('lib');
use Parrot::Configure::Utils qw(
    prompt copy_if_diff move_if_diff integrate
    capture_output check_progs _slurp
    _run_command _build_compile_command
    move_if_diff
);

# report the makefile and lineno
sub makecroak {
    my ($conf, $error) = @_;
    my ($file, $line) = ($conf->{_compiler_file}, $conf->{_compiler_line});
    die "$error at $file line $line\n";
}

our %file_types_info = (
    makefile => {
        comment_type    => '#',
    },
    c => {
        comment_type    => '/*',
    },
    pmc => {
        comment_type    => '/*',
    },
    perl => {
        comment_type    => '#',
    },
    pir => {
        comment_type    => '#',
    },
);

=item C<cc_gen()>

    $conf->cc_gen($source)

Generates F<test_$$.c> from the specified source file.

=cut

sub cc_gen {
    my $conf   = shift;
    my $source = shift;

    $conf->genfile( $source, "test_$$.c", file_type => 'c' );
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

=item C<shebang_mod()>

    $conf->shebang_mod($source, $target);

Takes the specified source file, replacing entries like C<@key@> with
C<key>'s value from the configuration system's data, and writes the results
to specified target file. The replacement is only done in the first line of
the file normally to set the shebang value accordingly.

=cut

sub shebang_mod {
    my $conf = shift;
    my ( $source, $target ) = @_;

    open my $in,  '<', $source       or die "Can't open $source: $!";
    open my $out, '>', "$target.tmp" or die "Can't open $target.tmp: $!";

    my $line = <$in>;

    # interpolate @foo@ values
    $line =~ s{ \@ (\w+) \@ }{
        if(defined(my $val=$conf->data->get($1))) {
            $val;
        }
        else {
            warn "value for '\@$1\@' in $source is undef";
            '';
        }
    }egx;

    print $out $line;

    while ( my $line = <$in> ) {
        print $out $line;
    }

    close($in)  or die "Can't close $source: $!";
    close($out) or die "Can't close $target: $!";

    move_if_diff( "$target.tmp", $target );
}

=item C<genfile()>

    $conf->genfile($source, $target, %options);

Takes the specified source file, replacing entries like C<@key@> with
C<key>'s value from the configuration system's data, and writes the results
to specified target file.

If a C<::> is present in the C<@key@>, the replaced value will first try to
use the full key, but if that is not present, the key up to the C<::> is used.
For example, if C<@cc_warn::src/embed.c@> is used, and that key doesn't
exist, the fallback key would be C<@cc_warn@>.

Respects the following options when manipulating files (Note: most of the
replacement syntax assumes the source text is on a single line.)

=over 4

=item file_type

If set to a C<makefile>, C<c> or C<perl> value, C<comment_type> will be set to
corresponding value.  Moreover, when set to a C<makefile> value, it will
enable C<conditioned_lines>.

Its value will be detected automatically by target file name unless you set
it to a special value C<none>.

=item conditioned_lines #IF #UNLESS #ELSIF #ELSE

If conditioned_lines is true, then lines beginning in C<#IF>, C<#UNLESS>,
C<#ELSIF>, and C<#ELSE> are evaluated conditionally, and the content after the
C<:> is included or excluded, depending on the evaluation of the expression.

Lines beginning with C<#IF(expr):> are skipped if the expr condition is false,
otherwise the content after the C<:> is inserted. Lines beginning with
C<#UNLESS(expr):> are skipped if the expr condition is true, otherwise the
content after the C<:> is inserted. Lines beginning with C<#ELSIF(expr):> or
C<#ELSE:> are evaluated if the preceding C<#IF(expr):> evaluated to false.

A condition C<expr> may be:

=over 4

=item *

A single key, which is true if a config key is true,

=item *

Equal to the platform name or the osname - case-sensitive,

=item *

A C<key==value> expression, which is true if the config key has the expected
value, or

=item *

A logical combination of C<|>, C<OR>, C<&>, C<AND>, C<!>, C<NOT>.

=back

A key must only consist of the characters C<A-Z a-z 0-9 _ ->, and is checked
case-sensitively against the configuration key or the platform name. Truth is
defined as any value that is not C<0>, an empty string, or C<undef>.

The value in C<key==value> expressions may not contain spaces. Quotes in
values are not supported.

The word ops C<AND>, C<OR> and C<NOT> are case-insensitive. C<!> and C<NOT>
bind closer than C<&>, C<AND>, C<|>, and C<OR>. The order of precedence for
C<AND> and C<OR> is undefined.


For instance:

  #IF(win32): src/atomic/gcc_x86$(O)

will be included if the platform is win32.

  #IF(cpuarch==i386): src/atomic/gcc_x86$(O)

will be included if the value of the config key "cpuarch" is "i386".

  #IF(cpuarch==i386): src/atomic/gcc_x86$(O)
  #ELSIF(cpuarch==sparcv9): src/atomic/sparc_v9.s
  #ELSE:

will include " src/atomic/gcc_x86$(O)" if the config key "cpuarch" is
ste to "i386", will include " src/atomic/sparc_v9.s" instead if
"cpuarch" is set to "sparcv9", and will include an empty line otherwise.

  #IF(win32 and glut and not cygwin):

will be used on "win32" and if "glut" is defined, but not on "cygwin".

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
        if ( $target =~ m/makefile$/i || $target =~ m/\.mak/) {
            $options{file_type} = 'makefile';
        }
        elsif ($target =~ m/\.p[lm]$/i ) {
            $options{file_type} = 'perl';
        }
        elsif ($target =~ m/\.[hc]$/ ) {
            $options{file_type} = 'c';
        }
        elsif ($target =~ m/\.pmc$/ ) {
            $options{file_type} = 'pmc';
        }
        elsif ($target =~ m/\.pir$/ ) {
            $options{file_type} = 'pir';
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
            $options{conditioned_lines} = 1;
        }
    }

    if ( $options{comment_type} ) {
        my @comment = ( 'ex: set ro:',
            'DO NOT EDIT THIS FILE',
            'Generated by ' . __PACKAGE__ . " from $source" );

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

    if ($target eq 'CFLAGS') {
        $options{conditioned_lines} = 1;
    }

    # this loop can not be implemented as a foreach loop as the body
    # is dependent on <IN> being evaluated lazily

    $conf->{_compiler_file} = $source;
    my $former_truth = -1;
  LINE:
    while ( my $line = <$in> ) {
        $conf->{_compiler_line} = $.;

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
            croak $@ if $@;
            last LINE;
        }
        if ( $options{conditioned_lines} ) {
            my ($op, $expr, $rest);
            # allow multiple keys and nested parens here
            if (($op,$expr,$rest)=($line =~ m/^#(IF|UNLESS|ELSIF)\((.+)\):(.*)/s)) {
#print STDERR "$line\n";
                $conf->debug("genfile(): line: $line");
                if (($op eq 'ELSIF') and $former_truth) {
                    next LINE;  # no useless check if former IF was true
                }
                my $truth = cond_eval($conf, $expr);
                if ($op eq 'IF') {
                    $former_truth = $truth;
                    next LINE unless $truth;
                }
                elsif ($op eq 'UNLESS') {
                    $former_truth = !$truth;
                    next LINE if $truth;
                }
                elsif ($op eq 'ELSIF') {
                    $former_truth = $truth;
                    next LINE unless $truth;
                }
                $line = $rest;
            }
            elsif ( $former_truth != -1 and $line =~ m/^#ELSE:(.*)/s ) {
                next LINE if $former_truth;
                $line = $1;
            }
            else { # reset
                $former_truth = -1; # ELSE must immediately follow a conditional.
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
                $val;
            }
            else {
                warn "value for '\@$1\@' in $source is undef";
                '';
            }
        }egx;

        # interpolate @foo::bar@ values
        $line =~ s{ \@ (\w+) :: ([^\@]+) \@ }{
            my $full = $1 . '::' . $2;
            my $base = $1;
            if(defined(my $val=$conf->data->get($full))) {
                $val;
            }
            elsif(defined($val=$conf->data->get($base))) {
                $val;
            }
            else {
                warn "value for '\@$full\@' in $source is undef, no fallback";
                '';
            }
        }egx;

        print $out $line;
    }

    close($in)  or die "Can't close $source: $!";
    close($out) or die "Can't close $target: $!";

    move_if_diff( "$target.tmp", $target, $options{ignore_pattern} );
}

# Return the next subexpression from the expression in $_[0]
# and remove it from the input expression.
# Allowed chars: A-Z a-z 0-9 _ -, so let's take [-\w].
# E.g. "(not win32 and has_glut)"
#        => not win32 => has_glut
#      "(!win32&has_glut)|cygwin"   - perl-style
#        !win32&has_glut => !win32 => &has_glut => |cygwin
sub next_expr {
    my $s = $_[0];
    return "" unless $s;
    # start of a subexpression?
    if ($s =~ /^\((.+)\)\s*(.*)/o) {    # longest match to matching closing paren
        $_[0] = $2 ? $2 : "";           # modify the 2nd arg
        return $1;
    }
    else {
        $s =~ s/^\s+//;                 # left-trim to make it more robust
        if ($s =~ m/^([-\w=]+)\s*(.*)?/o) { # shortest match to next non-word char
            # start with word expr
            $_[0] = $2 ? $2 : "";       # modify the 2nd arg expr in the caller
            return $1;
        }
        else {
            # special case: start with non-word op (perl-syntax only)
            $s =~ m/^([|&!])\s*(.*)?/o; # shortest match to next word char
            $_[0] = $2 ? $2 : "";       # modify the 2nd arg expr in the caller
            return $1;
        }
    }
}

# Checks the logical truth of the hash value: exists and not empty.
# Also check the platform name, the 'osname' key, if the hash key does not exist.
# Also check for key==value, like #IF(ld==gcc)
sub cond_eval_single {
    my $conf = $_[0];
    my $key  = $_[1];
    return unless defined $key;
    if ($key =~ /^([-\w]+)==(.+)$/) {
        return ($2 eq $conf->data->get($1));
    }
    else {
        return exists($conf->data->{c}->{$key})
            ? ($conf->data->get($key) ? 1 : 0)
            : $key eq $conf->data->get('osname');
    }
}

# Recursively evaluate boolean expressions with multiple keys and | & ! ops.
# Order of precedence: Just "!" and "NOT" binds tighter than AND and OR.
# There's no precedence for AND over OR defined, just left to right.
sub cond_eval {
    my $conf = $_[0];
    my $expr = $_[1];
#print STDERR "cond_eval expr:  $expr\n";
    $conf->debug("cond_eval(): $expr\n");
    my @count = split /[\s!&|\(]+/, $expr; # optimizable with tr
    my $truth = 0;
    if (@count > 1) { # multiple keys: recurse into
        my $prevtruth = 0;
        my $key = next_expr($expr);
        my $op  = '';
      LOOP:
        while ($key) {
            if (($key eq '!') or (uc($key) eq 'NOT')) {
                # bind next key immediately
                $op = 'NOT';
                $key = next_expr($expr);
            }
            elsif ($truth and ($op eq 'OR')) {
                # true OR: => true
                last LOOP;
            }
            $prevtruth = $truth;
            if (!$truth and ($op eq 'AND')) { # false AND: => false, skip rest
                last LOOP;
            }
            $truth = cond_eval($conf, $key);
            if ($op eq 'NOT') { # NOT *: invert
                $truth = $truth ? 0 : 1;
            }
            elsif ($op eq 'AND' and !$truth) { # * AND false: => false
                last LOOP;
            }
            # * OR false => * (keep $truth). true OR * already handled before
            my $prevexpr = $expr;
            $op  = next_expr($expr);
            if ($op) {
                if ($op eq '|' or uc($op) eq 'OR') {
                    $op = 'OR';
                }
                elsif ($op eq '&' or uc($op) eq 'AND') {
                    $op = 'AND';
                }
                elsif ($op eq '!' or uc($op) eq 'NOT') {
                    $op = 'NOT';
                }
                else {
                    makecroak($conf, "invalid op \"$op\" in \"$_[1]\" at \"$prevexpr\"");
                }
                $key = next_expr($expr);
            }
            elsif ($prevexpr) {
                makecroak($conf, "Makefile conditional syntax error: missing op in \"$_[1]\" at \"$prevexpr\"");
            }
            else {
                last LOOP; # end of expr, nothing left
            }
            if ($prevexpr eq $expr) {
                makecroak($conf, "Makefile conditional parser error in \"$_[1]\" at \"$prevexpr\"");
            }
        }
    }
    else {
        $truth = cond_eval_single($conf, $expr);
    }
    return $truth;
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
