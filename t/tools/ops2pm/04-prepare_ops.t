#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# 04-prepare_ops.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More qw(no_plan); # tests => 70;
use Carp;
use File::Copy;
use File::Temp (qw| tempdir |);
use IO::File;

use_ok('Parrot::Ops2pm::Base');
use IO::CaptureOutput qw| capture |;

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );

# regular case
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
    );
    my $self = Parrot::Ops2pm::Base->new(
        {
            argv    => [@ARGV],
            script  => "tools/build/ops2pm.pl",
            nolines => undef,
        }
    );
    isa_ok( $self, q{Parrot::Ops2pm::Base} );

    ok( $self->prepare_ops, "prepare_ops() returned successfully" );
    ok( defined( $self->{ops} ), "'ops' key has been defined" );

    # The following tests will break if the output of Parrot::OpsFile changes
    my %temp = %{ $self->{ops} };
    is( scalar( keys %temp ), 4, "4 keys in object's internal hash" );
    ok( defined( $temp{FILE} ),     "FILE key in object is defined" );
    ok( defined( $temp{OPS} ),      "OPS key in object is defined" );
    ok( defined( $temp{PREAMBLE} ), "PREAMBLE key in object is defined" );
    ok( defined( $temp{VERSION} ),  "VERSION key in object is defined" );
    ok( !ref( $temp{FILE} ),        "FILE key in object is not a reference" );
    ok( ref( $temp{OPS} ),          "OPS key in object is a reference" );
    is( ref( $temp{OPS} ), q{ARRAY}, "OPS key in object is an array reference" );
    ok( !ref( $temp{PREAMBLE} ), "PREAMBLE key in object is not a reference" );
    ok( !ref( $temp{VERSION} ),  "VERSION key in object is not a reference" );
}

# nolines option is set true
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
    );
    my $self = Parrot::Ops2pm::Base->new(
        {
            argv    => [@ARGV],
            script  => "tools/build/ops2pm.pl",
            nolines => 1,
        }
    );
    isa_ok( $self, q{Parrot::Ops2pm::Base} );

    ok( $self->prepare_ops, "prepare_ops() returned successfully" );
    ok( defined( $self->{ops} ), "'ops' key has been defined" );

    # The following tests will break if the output of Parrot::OpsFile changes
    my %temp = %{ $self->{ops} };
    is( scalar( keys %temp ), 4, "4 keys in object's internal hash" );
    ok( defined( $temp{FILE} ),     "FILE key in object is defined" );
    ok( defined( $temp{OPS} ),      "OPS key in object is defined" );
    ok( defined( $temp{PREAMBLE} ), "PREAMBLE key in object is defined" );
    ok( defined( $temp{VERSION} ),  "VERSION key in object is defined" );
    ok( !ref( $temp{FILE} ),        "FILE key in object is not a reference" );
    ok( ref( $temp{OPS} ),          "OPS key in object is a reference" );
    is( ref( $temp{OPS} ), q{ARRAY}, "OPS key in object is an array reference" );
    ok( !ref( $temp{PREAMBLE} ), "PREAMBLE key in object is not a reference" );
    ok( !ref( $temp{VERSION} ),  "VERSION key in object is not a reference" );
}

# mistakenly list an ops file twice; confirm warning is correct
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/bit.ops
    );
    my $self = Parrot::Ops2pm::Base->new(
        {
            argv    => [@ARGV],
            script  => "tools/build/ops2pm.pl",
            nolines => undef,
        }
    );
    isa_ok( $self, q{Parrot::Ops2pm::Base} );

    my ($stdout, $stderr);
    my $ret = capture(
        sub { $self->prepare_ops },
        \$stdout,
        \$stderr
    );
    ok($ret, "prepare_ops() returned successfully" );
    ok( defined( $self->{ops} ), "'ops' key has been defined" );
    like(
        $stderr,
        qr|Ops file 'src/ops/bit.ops' mentioned more than once!|,
        "Got expected message about .ops file being mentioned twice"
    );

    # The following tests will break if the output of Parrot::OpsFile changes
    my %temp = %{ $self->{ops} };
    is( scalar( keys %temp ), 4, "4 keys in object's internal hash" );
    ok( defined( $temp{FILE} ),     "FILE key in object is defined" );
    ok( defined( $temp{OPS} ),      "OPS key in object is defined" );
    ok( defined( $temp{PREAMBLE} ), "PREAMBLE key in object is defined" );
    ok( defined( $temp{VERSION} ),  "VERSION key in object is defined" );
    ok( !ref( $temp{FILE} ),        "FILE key in object is not a reference" );
    ok( ref( $temp{OPS} ),          "OPS key in object is a reference" );
    is( ref( $temp{OPS} ), q{ARRAY}, "OPS key in object is an array reference" );
    ok( !ref( $temp{PREAMBLE} ), "PREAMBLE key in object is not a reference" );
    ok( !ref( $temp{VERSION} ),  "VERSION key in object is not a reference" );
}

# mistakenly provide a non-existent ops file; catch fatal error
{
    my $phony = q{src/ops/sdifupasdufisduuapsdfi.ops};
    local @ARGV = ( "src/ops/core.ops", $phony );

    my $self = Parrot::Ops2pm::Base->new(
        {
            argv    => [@ARGV],
            script  => "tools/build/ops2pm.pl",
            nolines => undef,
        }
    );
    isa_ok( $self, q{Parrot::Ops2pm::Base} );
    eval { $self->prepare_ops; };
    like(
        $@,
        qr/Could not find ops file '$phony'!/,
        "Got expected error message re missing .ops file"
    );
}

# provide experimental.ops as one argument
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/experimental.ops
    );
    my $self = Parrot::Ops2pm::Base->new(
        {
            argv    => [@ARGV],
            script  => "tools/build/ops2pm.pl",
            nolines => undef,
        }
    );
    isa_ok( $self, q{Parrot::Ops2pm::Base} );

    ok( $self->prepare_ops, "prepare_ops() returned successfully" );
    ok( defined( $self->{ops} ), "'ops' key has been defined" );

    # The following tests will break if the output of Parrot::OpsFile changes
    my %temp = %{ $self->{ops} };
    is( scalar( keys %temp ), 4, "4 keys in object's internal hash" );
    ok( defined( $temp{FILE} ),     "FILE key in object is defined" );
    ok( defined( $temp{OPS} ),      "OPS key in object is defined" );
    ok( defined( $temp{PREAMBLE} ), "PREAMBLE key in object is defined" );
    ok( defined( $temp{VERSION} ),  "VERSION key in object is defined" );
    ok( !ref( $temp{FILE} ),        "FILE key in object is not a reference" );
    ok( ref( $temp{OPS} ),          "OPS key in object is a reference" );
    is( ref( $temp{OPS} ), q{ARRAY}, "OPS key in object is an array reference" );
    ok( !ref( $temp{PREAMBLE} ), "PREAMBLE key in object is not a reference" );
    ok( !ref( $temp{VERSION} ),  "VERSION key in object is not a reference" );
}

# provide a file with good name but bad content
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        ok( chdir $tdir, 'changed to temp directory for testing' );
        ok( ( mkdir qq{$tdir/src} ),     "able to make tempdir/src" );
        ok( ( mkdir qq{$tdir/src/ops} ), "able to make tempdir/src" );
        foreach my $f (@ARGV) {
            ok( copy( qq{$cwd/$f}, qq{$tdir/$f} ), "copied .ops file" );
        }
        my $badops = qq{$tdir/src/ops/cmp.ops};
        my $fh     = IO::File->new();
        ok( ( $fh->open(">$badops") ),       "Able to open file for writing" );
        ok( ( $fh->print("alpha\nbeta\n") ), "Able to print to file" );
        ok( ( $fh->close ),                  "Able to close file after writing" );

        my $num = qq{src/ops/ops.num};
        ok( copy( qq{$cwd/$num}, qq{$tdir/$num} ), "copied ops.num file" );
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Base->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm::Base} );

        eval { $self->prepare_ops; };
        like( $@, qr/OPS invalid for.*?cmp\.ops/, "ops file with bad content correctly detected" );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

04-prepare_ops.t - test C<Parrot::Ops2pm::Base::prepare_ops()>

=head1 SYNOPSIS

    % prove t/tools/ops2pm/04-prepare_ops.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Ops2pm::Base.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<04-prepare_ops.t> tests whether C<Parrot::Ops2pm::Base::prepare_ops()>
works properly.

=head1 COMMENT

The following statements and branches in C<prepare_ops()> are as yet uncovered:

=over 4

=item *

Can C<$ops> be undefined as a result of a call to C<Parrot::OpsFile->new()>?

    my $ops = Parrot::OpsFile->new( [$self->{file}], $self->{nolines} );
    die "$self->{script}: Could not read ops file '$self->{file}'!\n"
        unless defined $ops;

Probably not, because the existence of C<$self->{file} has already been
checked.  But it never hurts to check whether a constructor has returned a
defined value.

=item *

Can I provoke this C<die> message?

        my $temp_ops = Parrot::OpsFile->new( [$f], $self->{nolines} );
        die "$self->{script}: Could not read ops file '$f'!\n"
            unless defined $temp_ops;

Probably not, for same reason as above.

=back

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm::Base, F<ops2pm.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
