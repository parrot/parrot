# Copyright (C) 2007, Parrot Foundation.
# $Id$
package Parrot::Ops2pm;
use strict;
use warnings;
use Cwd;
use Data::Dumper ();
use File::Path ();
use File::Spec;
use lib qw ( lib );
use base qw( Parrot::Ops2pm::Base );
use Parrot::OpsFile;

=head1 NAME

Parrot::Ops2pm - Methods holding functionality for F<tools/build/ops2pm.pl>.

=head1 SYNOPSIS

    use Parrot::Ops2pm;

    $self = Parrot::Ops2pm->new( {
        argv            => [ @ARGV ],
        nolines         => $nolines_flag,
        moddir          => "lib/Parrot/OpLib",
        module          => "core.pm",
        inc_dir         => "include/parrot/oplib",
        inc_f           => "ops.h",
        script          => "tools/build/ops2pm.pl",
    } );

    $self->prepare_ops();
    $self->load_op_map_files();
    $self->sort_ops();
    $self->prepare_real_ops();
    $self->print_module();
    $self->print_h();
    exit 0;

=cut

=head1 DESCRIPTION

Parrot::Ops2pm provides methods called by F<tools/build/ops2pm.pl>, a
program which is called at the very beginning of the Parrot F<make> process.
The program's function is to build two files:

=over 4

=item * F<lib/Parrot/OpLib/core.pm>

=item * F<include/parrot/oplib/ops.h>

=back

The functionality once (pre-April 2007) found in F<tools/build/ops2pm.pl> has
been extracted into this package's methods in order to support
component-focused testing and future refactoring.

=head1 METHODS

=head2 C<new()>

Inherited from Parrot::Ops2pm::Base and documented in
F<lib/Parrot/Ops2pm/Base.pm>.

=head2 C<prepare_ops()>

Inherited from Parrot::Ops2pm::Base and documented in
F<lib/Parrot/Ops2pm/Base.pm>.

=head2 C<load_op_map_files()>

=over 4

=item * Purpose

When F<tools/build/ops2pm.pl> is called by F<make>, this method
checks the number of ops strictly against F<src/ops/ops.num> and
F<src/ops/ops.skip>.

=item * Arguments

None.  (Implicitly requires that the C<argv> and C<script> keys
have been provided to the constructor.)

=item * Return Value and Side Effects

Returns true value upon success.  Internally, sets these
values in these elements in the object's data structure:

=over 4

=item * C<max_op_num>

Scalar holding number of highest non-experimental op.  Example:

    'max_op_num' => 1246,

=item * C<optable>

Reference to hash holding mapping of opcode names ops to their numbers.
Example:

  'optable' => {
    'pow_p_p_i' => 650,
    'say_s' => 463,
    'lsr_p_p_i' => 207,
    'lt_s_sc_ic' => 289,
    # ...
    'debug_init' => 429,
    'iseq_i_nc_n' => 397,
    'eq_addr_sc_s_ic' => 254
  },

Per F<src/ops/ops.num>, this mapping exists so that we can nail down
the op numbers for the core opcodes in a particular version of the
bytecode and provide backward-compatibility for bytecode.

=item * C<skiptable>

Reference to a 'seen-hash' of skipped opcodes.

  'skiptable' => {
    'bor_i_ic_ic' => 1,
    'xor_i_ic_ic' => 1,
    'tanh_n_nc' => 1,
    # ...
  },

As F<src/ops/ops.skip> states, these are "... opcodes that could be listed in
F<[src/ops/]ops.num> but aren't ever to be generated or implemented because
they are useless and/or silly."

=back

=back

=cut

sub load_op_map_files {
    my $self      = shift;
    my $num_file  = $self->{num_file};
    my $skip_file = $self->{skip_file};

    my ( $op, $name, $number, $prev );

    $self->{max_op_num} ||= 0;

    open $op, '<', $num_file
        or die "Can't open $num_file: $!";
    $prev = -1;
    while (<$op>) {
        chomp;
        s/#.*$//;
        s/\s*$//;
        s/^\s*//;
        next unless $_;
        ( $name, $number ) = split( /\s+/, $_ );
        if ( $prev + 1 != $number ) {
            die "hole in ops.num before #$number";
        }
        if ( exists $self->{optable}{$name} ) {
            die "duplicate opcode $name and $number";
        }
        $prev = $number;
        $self->{optable}{$name} = $number;
        if ( $number > $self->{max_op_num} ) {
            $self->{max_op_num} = $number;
        }
    }
    undef $op;

    open $op, '<', $skip_file
        or die "Can't open $skip_file: $!";
    while (<$op>) {
        chomp;
        s/#.*$//;
        s/\s*$//;
        s/^\s*//;
        next unless $_;
        ($name) = split( /\s+/, $_ );
        if ( exists $self->{optable}{$name} ) {
            die "skipped opcode is also in $num_file:$.";
        }
        $self->{skiptable}{$name} = 1;
    }
    undef $op;
    return 1;
}

=head2 C<sort_ops()>

=over 4

=item * Purpose

Internal manipulation of the Parrot::Ops2pm object: sorting by number of the
list of op codes found in the object's C<{ops}-E<gt>{OPS}> element.

=item * Arguments

None.

=item * Return Value and Side Effects

No return value.  Internally, re-sets the C<ops> key of the object's data
structure.

=item * Comment

It is at this point that warnings about experimental opcodes will be
emitted if you are working in a checkout from the Parrot repository.  Example:

    trap                      1247       experimental, not in ops.num

=back

=cut

sub sort_ops {
    my $self = shift;
    for my $el ( @{ $self->{ops}{OPS} } ) {
        if ( exists $self->{optable}{ $el->full_name } ) {
            $el->{CODE} = $self->{optable}{ $el->full_name };
        }
        elsif ( exists $self->{skiptable}{ $el->full_name } ) {
            $el->{CODE} = -1;
        }
        elsif ( $el->{experimental} ) {
            my $n = $self->{optable}{ $el->full_name } = ++$self->{max_op_num};
            warn sprintf(
                "%-25s %-10s experimental, not in ops.num\n",
                $el->full_name, $n
            ) if -e "DEVELOPING";
            $el->{CODE} = $n;
        }
        else {
            die sprintf(
                "%-25s %-10s FATAL: not in ops.num nor ops.skip\n",
                $el->full_name, ""
            ) if -e "DEVELOPING";
            $el->{CODE} = -1;
        }
    }
    @{ $self->{ops}{OPS} } =
        sort { $a->{CODE} <=> $b->{CODE} } ( @{ $self->{ops}{OPS} } );
}

=head2 C<prepare_real_ops()>

=over 4

=item * Purpose

Final stage of preparation of ops.

=item * Arguments

None.  (Same implicit requirements for the constructor as
C<load_op_map_files()> above.)

=item * Return Value and Side Effects

No return value.  Internally, adds the C<real_ops> key of the object's
data structure.  Its value is a Parrot::OpsFile object.

=back

=cut

sub prepare_real_ops {
    my $self = shift;

    my $real_ops = Parrot::OpsFile->new( [], $self->{nolines} );
    $real_ops->{PREAMBLE} = $self->{ops}{PREAMBLE};
    $real_ops->version( $self->{ops}->version );

    # verify opcode numbers
    my $seq = 0;
    for my $el ( @{ $self->{ops}{OPS} } ) {
        next if $el->{CODE} < 0;    # skip
        my $opname = $el->full_name;
        my $n      = $self->{optable}{$opname};    # former global
        if ( $n != $el->{CODE} ) {
            die "op $opname: number mismatch: ops.num $n vs. core.ops $el->{CODE}";
        }
        push @{ $real_ops->{OPS} }, $el;
        ++$seq;
    }
    $self->{real_ops} = $real_ops;
}

=head2 C<print_module()>

=over 4

=item * Purpose

Uses information in the object's data structure -- principally
the C<real_ops> element -- to create F<lib/Parrot/OpLib/core.pm>.

=item * Arguments

None.  (Implicitly requires that the constructor have the
following keys defined:  C<argv>, C<script>, C<moddir> and C<module>.)

=item * Return Value

Returns true value upon success.

=item * Comment

=back

=cut

sub print_module {
    my $self    = shift;
    my $cwd     = cwd();
    my $fulldir = File::Spec->catdir( $cwd, $self->{moddir} );
    if ( !-d $fulldir ) {
        if ( !File::Path::mkpath( $fulldir, 0, 0755 ) ) {
            -d $fulldir
                or die "$self->{script}: Could not mkdir $fulldir: $!!\n";
        }
    }
    my $fullpath = File::Spec->catfile( ($fulldir), $self->{module} );
    open my $MODULE, '>', $fullpath
        or die "$self->{script}: Could not open module file '$fullpath' for writing: $!!\n";

    my $version = $self->{real_ops}->version();
    ( my $pod = <<"END_POD") =~ s/^    //osmg;
    =head1 NAME

    Parrot::OpLib::core - Parrot Op Info

    =head1 DESCRIPTION

    This is an autogenerated file, created by F<$self->{script}>.

    It contains Parrot version info, a preamble for inclusion in C code,
    and an array of C<Parrot::Op> instances representing the Parrot ops.

    =cut
END_POD

    my $preamble = <<END_C;
#! perl -w
#
# !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
#
# This file is generated automatically from '$self->{file}'.
# Any changes made here will be lost!
#

$pod

use strict;

package Parrot::OpLib::core;

use vars qw(\$VERSION \$ops \$preamble);

\$VERSION = "$version";

END_C

    print {$MODULE} $preamble;
    print {$MODULE} Data::Dumper->Dump( [ $self->{real_ops}->preamble, [ $self->{real_ops}->ops ] ],
        [qw($preamble $ops)] );

    print {$MODULE} <<END_C;

1;
END_C

    close $MODULE or die;

    return 1;
}

=head2 C<print_h()>

=over 4

=item * Purpose

Uses information in the object's data structure -- principally
the C<real_ops> key -- to create F<include/parrot/oplib/ops.h>.

=item * Arguments

None.  (Implicitly requires that the constructor have the
following keys defined:  C<argv>, C<script>, C<inc_dir> and C<inc_f>.)

=item * Return Value

Returns true value upon success.

=item * Comment

=back

=cut

sub print_h {
    my $self    = shift;
    my $cwd     = cwd();
    my $fulldir = File::Spec->catdir( $cwd, $self->{inc_dir} );
    if ( !-d $fulldir ) {
        if ( !File::Path::mkpath( $fulldir, 0, 0755 ) ) {
            -d $fulldir
                or die "$self->{script}: Could not mkdir $fulldir: $!!\n";
        }
    }

    my $fullpath = File::Spec->catfile( ($fulldir), $self->{inc_f} );
    open my $OUT, '>', $fullpath
        or die "$self->{script}: Could not open module file '$fullpath' for writing: $!!\n";

    print $OUT <<END_C;
/* ex: set ro:
 * !!!!!!!   DO NOT EDIT THIS FILE   !!!!!!!
 *
 * This file is generated automatically from '$self->{file}'
 * by $self->{script}.
 *
 * Any changes made here will be lost!
 */

#ifndef PARROT_OPS_H_GUARD
#define PARROT_OPS_H_GUARD

typedef enum {
END_C

    my @OPS = @{ $self->{real_ops}->{OPS} };
    for my $el (@OPS) {
        my $opname = $el->full_name;
        my $n      = $el->{CODE};
        my $comma  = $n < @OPS - 1 ? "," : "";
        $opname = "PARROT_OP_$opname$comma";

        printf $OUT "    %-30s\t/* %4d */\n", $opname, $n;
    }

    print $OUT <<END_C;
} parrot_opcode_enums;

#endif /* PARROT_OPS_H_GUARD */

END_C

    # append the C code coda
    print $OUT <<END_C;
/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
END_C
    close $OUT;
    return 1;
}

=head1 NOTE ON TESTING

A suite of test files to accompany this package is found in
F<t/tools/ops2pm>.  This suite has been developed to maximize its
coverage of the code of Parrot::Ops2pm (as measured by Perl module
Devel::Cover).  Should you wish to refactor this package, it is recommended
that you do so in a B<test-driven> manner:

=over 4

=item 1

Write the specification for any additions or modifications to
Parrot::Ops2pm' interface.

=item 2

Write tests that reflect any such modifications.

=item 3

Write the additional or modified code that reflects the new specification.

=item 4

Test the new code and debug.  The tests in the suite should be run B<after>
Parrot's F<Configure.pl> has run but B<before> F<make> has run.  Example:

    $> perl Configure.pl
    $> prove -v t/tools/ops2pm/*.t
    $> make

=item 5

Use Devel::Cover to measure the extent to which the existing and new tests
cover the existing and revised code.

=item 6

Refactor and retest to ensure high test coverage.

=back

This package's methods are called by F<tools/build/ops2pm.pl>, which in turn
is invoked by F<make> in the Parrot build process.  Successful execution of
F<make> proves that the functionality in this package achieved its overall
objective but does not necessarily invoke many of the individual code
statements in the package.  That is the rationale for the component-focused
testing provided by the test suite.

=head1 AUTHOR

See F<tools/build/ops2pm.pl> for a list of the Parrot hackers who, over a
period of several years, developed the functionality now found in the methods
of Parrot::Ops2pm.  Jim Keenan extracted that functionality and placed
it in this package's methods.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
