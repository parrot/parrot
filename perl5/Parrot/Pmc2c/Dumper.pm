# Copyright (C) 2004-2011, Parrot Foundation.
package Parrot::Pmc2c::Dumper;

use strict;
use warnings;

use Parrot::Pmc2c::UtilFunctions qw(slurp spew filename);
use Parrot::Pmc2c::Parser qw(parse_pmc);
use Carp;

use base 'Exporter';
@Parrot::Pmc2c::Dumper::EXPORT_OK = 'dump_pmc';

=head1 NAME

Parrot::Pmc2c::Dumper

=head1 DESCRIPTION

Create dump file for PMCs.

=head1 FUNCTIONS

=head2 Public Functions

=head3 C<dump_pmc()>

    $return_value = dump_pmc($pmc2cMain);

B<Purpose:>  Creates a F<.dump> file for each file listed in pmc2cMain's C<arg>
key (which can be found in the directories listed in pmc2cMain's C<include>
key).

B<Arguments:>

B<Return Values:>  Returns 1 upon success.

B<Comments:>  Called when C<--dump> is specified as the command-line option to
F<pmc2c.pl>.

=cut

sub dump_pmc {
    my ($self)    = @_;
    my $pmc2cMain = $self;
    my @files     = @{ $pmc2cMain->{args} };
    my $pmcs;

    # help those dumb 'shells' that are not shells
    @files = glob $files[0] if $files[0] eq 'src/pmc/*.pmc';

    # make sure that a default.dump will always be created if it doesn't
    $pmc2cMain->find_file('default.dump') or unshift @files, 'default.pmc';

    # load and parse all pmc files in @files
    for my $filename (@files) {
        my $parsed_pmc = parse_pmc( $pmc2cMain, $filename );
        $pmcs->{ $parsed_pmc->name } = $parsed_pmc;
    }

    $pmcs->{default} = $pmc2cMain->read_dump("default.pmc")
        unless $pmcs->{default};

    # ensure that the default pmc's super entries point back to itself.
    my $vtable_dump = $pmc2cMain->read_dump("vtable.pmc");
    my $default_pmc = $pmcs->{default};

    for my $vt_method_name ( @{ $vtable_dump->names } ) {
        $default_pmc->super_method( $vt_method_name, 'default' );
    }

    for my $pmc ( values %$pmcs ) {
        next if $pmc->name =~ /default$/ && $pmc->dump_is_current($pmc2cMain->find_file('default.dump'));

        gen_parent_lookup_info( $pmc, $pmc2cMain, $pmcs );
        gen_parent_reverse_lookup_info( $pmc, $pmcs, $vtable_dump );

        $pmc->dump;
    }

    return 1;
}

=head2 Non-Public Methods

These functions are expressed as methods called on the Parrot::Pmc2c::Pmc2cMain
object, but only because they make use of data stored in that object.  They
are called within the publicly available methods described above and are not
intended to be publicly callable.

=head3 C<gen_parent_lookup_info()>

    $pmc2cMain->gen_parent_lookup_info($name, \%all);

B<Purpose:>  Generate an ordered list of parent classes to put in the
C<$classes->{name}->{parents}> array, using the given directories to find parents.

B<Arguments:>  List of two arguments:

=over 4

=item *

String holding class name.

=item *

Hash reference holding data structure being built up within C<dump_pmc()>.

=back

B<Return Value:>  Returns 1 upon success.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub gen_parent_lookup_info {
    my ( $pmc, $pmc2cMain, $pmcs ) = @_;

    my @c3_work_queue = ( $pmc->name );
    while (@c3_work_queue) {
        my $current_pmc_name = shift @c3_work_queue;
        next if $current_pmc_name eq 'default';

        for my $parent_name ( @{ [ @{ $pmcs->{$current_pmc_name}->parents } ] } ) {
            next if $parent_name eq 'default';

            # load $parent_name pmc into $pmcs if needed
            $pmcs->{$parent_name} = $pmc2cMain->read_dump( lc("$parent_name.pmc") )
                unless $pmcs->{$parent_name};

            $pmc->add_parent( $pmcs->{$parent_name} );

            # add parent_name on to work queue list.
            push @c3_work_queue, $parent_name;
        }
    }

    # default should appear very last in the @c3 order
    $pmc->add_parent( $pmcs->{"default"} );
    return 1;
}

=head2 Subroutines

=head3 C<gen_parent_reverse_lookup_info()>

    $class = gen_parent_reverse_lookup_info($name, $all, $vt);

B<Purpose:>  Generate a list of inherited methods for C<$name> by searching the
inheritance tree. The method list is found in C<$vt>.

B<Arguments:>  List of three elements:

=over 4

=item *

String holding name of class being dumped.

=item *

Reference to the hash holding the data structure being built up within
C<dump_pmc()>.

=item *

The result of a call of C<read_dump()> on F<vtable.pmc>.

=back

B<Return Value:>  Returns 1 upon success.

B<Comments:>  Called within C<dump_pmc()>.

=cut

sub gen_parent_reverse_lookup_info {
    my ( $pmc, $pmcs, $vt ) = @_;

    # for each vt_meth in pmc, locate the implementing
    foreach my $vt_method_name ( @{ $vt->names } ) {
        # skip if super mapping is already set
        next if $pmc->super_method($vt_method_name);

        foreach my $parent_name ( @{ $pmc->parents } ) {
            my $parent = $pmcs->{$parent_name};
            if ( $pmc->parent_has_method( $parent_name, $vt_method_name ) ) {
                $pmc->super_method( $vt_method_name, $parent );
                last;
            }
        }
    }
    return 1;
}
1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
