# Copyright (C) 2007, The Perl Foundation.
# $Id$
package GenerateCore;
use strict;
use warnings;
our ( @ISA, @EXPORT_OK );
@ISA       = qw(Exporter);

our @srcopsfiles = qw( src/ops/core.ops src/ops/bit.ops src/ops/cmp.ops
    src/ops/debug.ops src/ops/experimental.ops src/ops/io.ops src/ops/math.ops
    src/ops/object.ops src/ops/pic.ops src/ops/pmc.ops src/ops/set.ops
    src/ops/stack.ops src/ops/stm.ops src/ops/string.ops src/ops/sys.ops
    src/ops/var.ops );
our $num  = "src/ops/ops.num";
our $skip = "src/ops/ops.skip";

@EXPORT_OK = qw(
    generate_core
    @srcopsfiles
    $num
    $skip
);
use Carp;
use File::Copy;
use lib ("./lib");
use Parrot::Ops2pm;


sub generate_core {
    my ( $cwd, $tdir, $srcopsref, $num_file, $skip_file ) = @_;
    my @srcopsfiles = @$srcopsref;
    mkdir qq{$tdir/src};
    mkdir qq{$tdir/src/ops};
    mkdir qq{$tdir/src/dynoplibs};

    foreach my $f (@srcopsfiles) {
        copy( qq{$cwd/$f}, qq{$tdir/$f} );
    }
    copy( qq{$cwd/$num},  qq{$tdir/$num} );
    copy( qq{$cwd/$skip}, qq{$tdir/$skip} );
    my @opsfiles = glob("./src/ops/*.ops");

    mkdir qq{$tdir/lib};
    mkdir qq{$tdir/lib/Parrot};
    mkdir qq{$tdir/lib/Parrot/Ops2c};
    mkdir qq{$tdir/include};
    mkdir qq{$tdir/include/parrot};
    mkdir qq{$tdir/include/parrot/oplib};

    my $o2p = Parrot::Ops2pm->new(
        {
            argv   => [@opsfiles],
            script => "tools/build/ops2pm.pl",
            moddir => "lib/Parrot/OpLib",
            module => "core.pm",
        }
    );

    $o2p->prepare_ops();
    $o2p->load_op_map_files();
    $o2p->sort_ops();
    $o2p->prepare_real_ops();
    $o2p->print_module();

    croak "Temporary core.pm file not written"
        unless ( -f qq|$tdir/$o2p->{moddir}/$o2p->{module}| );
    return qq{$tdir/lib};
}

1;

################### DOCUMENTATION ###################

=head1 NAME

GenerateCore - functionality used in testing Parrot::Ops2c::Utils

=head1 SYNOPSIS

    use lib ("t/tools/ops2cutils/testlib");
    use GenerateCore qw| generate_core |;

    @srcopsfiles = qw(
        src/ops/core.ops src/ops/bit.ops src/ops/cmp.ops
        src/ops/debug.ops src/ops/experimental.ops src/ops/io.ops
        src/ops/math.ops src/ops/object.ops src/ops/pic.ops
        src/ops/pmc.ops src/ops/set.ops src/ops/stack.ops
        src/ops/stm.ops src/ops/string.ops src/ops/sys.ops
        src/ops/var.ops
    );

    $num = "src/ops/ops.num";
    $skip = "src/ops/ops.skip";

    $cwd = cwd();
    $tdir = tempdir( CLEANUP => 1 );

    $tlib = generate_core(
        $cwd, $tdir, \@srcopsfiles, $num, $skip);

=head1 DESCRIPTION

=head2 Purpose

The test suite found in F<t/tools/ops2cutils/> tests the methods of
Parrot::Ops2c::Utils.  Those methods are invoked by Parrot build tool
F<tools/build/ops2c.pl>, which in turn is invoked several times by F<make>.
Parrot::Ops2c::Utils has as a prerequisite Parrot::OpLib::core.  But
Parrot::OpLib::core is not part of the Parrot distribution, nor does it exist
at the point F<make> is called.  Rather, it is created
during the Parrot build process prior to the first call to F<ops2c.pl>.

To test Parrot::Ops2c::Utils therefore requires a module which does not exist
'pre-F<make>'.  The tests in this suite, however, are designed to be run when
your filesystem is in a 'post-F<Configure.pl>, pre-F<make>' state.  The
solution to this conundrum is to create a copy of Parrot::OpLib::core which
exists only for the duration of a single test file.

This package, GenerateCore, exports upon request a single subroutine,
C<generate_core>, which (a) creates subdirectories needed underneath a
temporary directory created solely for testing purposes; then
(b) creates a temporary copy of Parrot::OpLib::core such that
C<Parrot::Ops2c::Utils::new()> can successfully execute.

=head2 C<generate_core()>

=over 4

=item *  B<Purpose:>  (See above.)

=item *  B<Arguments:>  Five scalar arguments, in this order:

  cwd           :   String with full path of directory from which
                    tests are invoked (generally, the top-level
                    Parrot directory).
  tdir          :   String holding full path of temporary
                    directory into which you have changed for
                    testing.
  \@srcopsfiles :   Reference to an array of F<.ops> files
                    (generally, the list of arguments to ops2c.pl
                    as invoked by make).
  $num          :   Path to ops.num file.
  $skip         :   Path to ops.skip file.

=item *  B<Return Value:>  String holding full path to a directory F<lib/>
found one level underneath the temporary directory denoted by F<tdir> above.
(This is the directory underneath which the temporary copy of
Parrot::OpLib::core is created.)  The return value may be used in testing as a
marker for the creation of all the needed temporary subdirectories and the
temporary copy of Parrot::OpLib::core.

=back

=head1 DEPENDENCIES

=over 4

=item *  File::Copy

=item *  Parrot::Ops2c::Utils

=back

=head1 AUTHOR

James E Keenan (jkeenan@cpan.org).

=head1 SEE ALSO

=over 4

=item *  Parrot::Ops2c::Utils

=item *  F<tools/build/ops2c.pl>

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
