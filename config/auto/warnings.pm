# Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

config/auto/warnings.pm - Warning flags probing.

=head1 DESCRIPTION

Given a list of potential warnings available for a certain type of
compiler, probe to see which of those are valid for this particular version.

=over 4

=cut

package auto::warnings;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ();
use Parrot::BuildUtil;

=item C<_init>

Declare potential warnings for various compilers.  Note that the compiler
key used here doesn't really exist in a unified way in Configure - would
be nice if it did so we could simplify our checks in runstep().

We create a data structure here that breaks out the warnings by compiler,
using this structure:

warnings:
  gcc:
    basic:
      - -Warning1
      - -Warning2
    cage:
      - -Warning3
      - -Warning4
    only:
      - -Warning5:
        - foo.c
        - bar.c
    never:
      - -Warning6:
        - baz.c
        - frob.c
    todo:
      - -Warning7:
        - cow.c
        - pig.c
  g++:
    ...

'basic' warnings are always used.

'cage' warnings are added only if --cage is specified during
Configure. This can be used to hold warnings that aren't ready to be
added to the default run yet.

'only' should be used as we add new warnings to the build, it will let
us insure that files we know are clean for a new warning stay clean.

'never' should be used when a particular file contains generated code
(e.g. imcc) and we cannot update it to conform to the standards.

'todo' functions just like never does, but it indicates that these
files are expected to eventually be free of this warning.

Note that there is no actual requirement that the 'file' be a full path
to a .c file; the file could be "PMCS" or "OPS" or some other identifier;
whatever the value, it will generate a Config entry prefixed with
C<ccwarn::>, which will probably be used via @@ expansion in a makefile.

It is tempting to put this into a config file, but having it in
perl gives us the ability to dynamically setup certain warnings based
on any criteria already discovered via Config.

Order is important - some warnings are invalid unless they are specified
after other warnings.

=cut

sub _init {
    my $self = shift;

    my $data = {
        description => 'Detect supported compiler warnings',
        result      => '',
        validated   => [],
    };

    # begin gcc/g++
    my $gcc = {};
    my $gpp = {};
    my $icc = {};

    my @gcc_or_gpp = qw(
        -falign-functions=16
        -funit-at-a-time
        -fexcess-precision=standard
        -maccumulate-outgoing-args
        -W
        -Wall
        -Waggregate-return
        -Wcast-align
        -Wcast-qual
        -Wchar-subscripts
        -Wcomment
        -Wdisabled-optimization
        -Wdiv-by-zero
        -Wenum-compare
        -Wendif-labels
        -Wextra
        -Wformat
        -Wformat-extra-args
        -Wformat-nonliteral
        -Wformat-security
        -Wformat-y2k
        -Wimplicit
        -Wimport
        -Winit-self
        -Winline
        -Winvalid-pch
        -Wjump-misses-init
        -Wlogical-op
        -Wmissing-braces
        -Wmissing-field-initializers
        -Wno-missing-format-attribute
        -Wmissing-include-dirs
        -Wmultichar
        -Wpacked
        -Wparentheses
        -Wpointer-arith
        -Wpointer-sign
        -Wreturn-type
        -Wsequence-point
        -Wsign-compare
        -Wstrict-aliasing
        -Wstrict-aliasing=2
        -Wswitch
        -Wswitch-default
        -Wtrigraphs
        -Wundef
        -Wno-unused
        -Wunknown-pragmas
        -Wvariadic-macros
        -Wwrite-strings
    );

    $gcc->{'basic'} = [ @gcc_or_gpp ];
    $gpp->{'basic'} = [ @gcc_or_gpp ];

    # Add some gcc-only warnings that would break g++
    push @{$gcc->{'basic'}}, qw(
        -Wc++-compat
        -Wdeclaration-after-statement
        -Werror=declaration-after-statement
        -Wimplicit-function-declaration
        -Wimplicit-int
        -Wmain
        -Wmissing-declarations
        -Wmissing-prototypes
        -Wnested-externs
        -Wnonnull
        -Wold-style-definition
        -Wstrict-prototypes
    );

    my $gcc_or_gpp_cage = [ qw(
        -std=c89
        -Werror=implicit-function-declaration
        -Wformat=2
        -Wlarger-than-4096
        -Wlong-long
        -Wmissing-format-attribute
        -Wdeprecated-declarations
        -Wno-format-extra-args
        -Wno-import
        -Wsuggest-attribute=const
        -Wsuggest-attribute=noreturn
        -Wsuggest-attribute=pure
        -Wunreachable-code
        -Wunused
        -Wunused-function
        -Wunused-label
        -Wunused-value
        -Wunused-variable
    ) ];

    $gcc->{'cage'} = $gcc_or_gpp_cage;
    $gpp->{'cage'} = $gcc_or_gpp_cage;

    $gcc->{'todo'} = $gpp->{'todo'} = {
        '-Wformat-nonliteral' => [ qw(
            src/spf_render.c
            compilers/imcc/optimizer.c
        ) ],
        '-Wstrict-prototypes' => [ qw(
            src/nci/extra_thunks.c
            src/extra_nci_thunks.c
        ) ],
    };

    $gcc->{'never'} = $gpp->{'never'} = {
        '-Wformat-nonliteral' => [ qw(
            compilers/imcc/imclexer.c
        ) ],
        '-Wswitch-default' => [ qw(
            compilers/imcc/imclexer.c
        ) ],
        '-Wcast-qual' => [ qw(
            compilers/imcc/imcparser.c
        ) ],
        '-Wlogical-op' => [ qw(
            compilers/imcc/imcparser.c
        ) ],
    };

    # Warning flags docs
    # http://software.intel.com/sites/products/documentation/hpc/compilerpro/en-us/cpp/lin/compiler_c/index.htm

    $icc->{'basic'} = [ qw(
        -w2
        -Wabi
        -Wall
        -Wcheck
        -Wcomment
        -Wdeprecated
        -Weffc++
        -Wextra-tokens
        -Wformat
        -Wformat-security
        -Wmain
        -Wmaybe-uninitialized
        -Wmissing-declarations
        -Wmissing-prototypes
        -Wpointer-arith
        -Wport
        -Wreturn-type
        -Wshadow
        -Wstrict-prototypes
        -Wuninitialized
        -Wunknown-pragmas
        -Wunused-function
        -Wunused-variable
        -Wwrite-strings
        ),
        # Disable some warnings and notifications that are overly noisy
        '-diag-disable 271',  # trailing comma is nonstandard
        '-diag-disable 981',  # operands are evaluated in unspecified order
        '-diag-disable 1572', # floating-point equality and inequality comparisons are unreliable
        '-diag-disable 2259', # non-pointer conversion from "typeA" to "typeB" may lose significant bits
    ];
    $icc->{'cage'} = [
        # http://software.intel.com/sites/products/documentation/hpc/compilerpro/en-us/cpp/lin/compiler_c/bldaps_cls/common/bldaps_svover.htm
        '-diag-enable sc3',
        '-diag-enable sc-include',
    ];

    $data->{'warnings'}{'gcc'} = $gcc;
    $data->{'warnings'}{'g++'} = $gpp;
    $data->{'warnings'}{'icc'} = $icc;
    $data->{'warnings'}{'clang'} = $gcc;

    ## end gcc/g++

    return $data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->debug("\n");

    my $compiler = '';
    if ( defined $conf->data->get('gccversion') ) {
        $compiler = $conf->data->get('g++') ? 'g++' : 'gcc';
    }
    elsif ( $conf->option_or_data('cc') =~ /icc/ ) {
        $compiler = 'icc';
    }
    elsif ( $conf->option_or_data('cc') =~ /clang/ ) {
        $compiler = 'clang';
    }

    if ($compiler eq '') {
        $conf->debug("We do not (yet) probe for warnings for your compiler\n");
        $self->set_result('skipped');
        return 1;
    }

    if (
        ( $compiler eq 'gcc' or $compiler eq 'g++' ) and
        ( $conf->data->get('gccversion') >= 4.0    )
    ) {
        push @{$self->{'warnings'}{$compiler}{'basic'}},
            '-fvisibility=hidden';
    };
    # standard warnings.
    my @warnings = grep {$self->valid_warning($conf, $_)}
        @{$self->{'warnings'}{$compiler}{'basic'}};

    # --cage?
    if ($conf->options->get('cage')) {
        push @warnings, grep {$self->valid_warning($conf, $_)}
            @{$self->{'warnings'}{$compiler}{'cage'}}
    }

    # -- only?
    my %per_file;
    if (exists $self->{'warnings'}{$compiler}{'only'}) {
        my %only = %{$self->{'warnings'}{$compiler}{'only'}};
        foreach my $warning (keys %only) {
            next unless $self->valid_warning($conf, $warning);
            foreach my $file (@{$only{$warning}}) {
                $per_file{$file} = [ @warnings ] unless exists $per_file{$file};
                push @{$per_file{$file}}, $warning;
            }
        }
    }

    foreach my $key (qw/todo never/) {
        if (exists $self->{'warnings'}{$compiler}{$key}) {
            my %dont = %{$self->{'warnings'}{$compiler}{$key}};
            foreach my $warning (keys %dont) {
                foreach my $file (@{$dont{$warning}}) {
                    $per_file{$file} = [ @warnings ] unless exists $per_file{$file};
                    @{$per_file{$file}} = grep {$warning ne $_} @{$per_file{$file}};
                }
            }
        }
    }

    $conf->data->set('ccwarn', join(' ', @warnings));
    foreach my $file (keys %per_file) {
        $conf->data->set("ccwarn::$file", join(' ', @{$per_file{$file}}));
    }

    $self->set_result('done');
    return 1;
}

=item C<valid_warning>

Try a given warning to see if it is supported by the compiler.  The compiler
is determined by the C<cc> value of the C<Parrot::Configure> object passed
in as the first argument to the method (not counting C<$self>.  The warning
to be checked is passed in as the second argument to the method.

Returns true if the warning flag is recognized by the compiler and undef
otherwise.

Use the running set of known valid options, since some options may depend
on previous options.

=cut

sub valid_warning {
    my ( $self, $conf, $warning ) = @_;

    # This should be using a temp file name.
    my $output_file = 'test.cco';

    $conf->debug("trying attribute '$warning'\n");

    my $cc = $conf->option_or_data('cc');
    $conf->cc_gen('config/auto/warnings/test_c.in');

    my $ccflags  = $conf->data->get('ccflags');
    my $warnings = join(' ', @{$self->{'validated'}});
    my $tryflags = "$ccflags $warnings $warning";

    my $command_line = Parrot::Configure::Utils::_build_compile_command( $cc, $tryflags );
    $conf->debug("  ", $command_line, "\n");

    # Don't use cc_build, because failure is expected.
    my $exit_code = Parrot::Configure::Utils::_run_command(
        $command_line, $output_file, $output_file
    );

    # Cleanup any remnants of the test compilation
    $conf->cc_clean();

    if ($exit_code) {
        unlink $output_file or die "Unable to unlink $output_file: $!";
        return;
    }

    my $output = Parrot::BuildUtil::slurp_file($output_file);
    unlink $output_file or die "Unable to unlink $output_file: $!";

    $conf->debug("  output: $output\n");

    if ( $output !~ /\berror|warning|not supported|ignoring (unknown )?option\b/i ) {
        push @{$self->{'validated'}}, $warning;
        $conf->debug("    valid warning: '$warning'\n");
        return 1;
    }
    else {
        $conf->debug("  invalid warning: '$warning'\n");
        return 0;
    }
}

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
