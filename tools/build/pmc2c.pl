#! perl
# Copyright (C) 2001-2007, Parrot Foundation.

use strict;
use warnings;
use Getopt::Long ();
use FindBin qw($Bin);
use lib "$Bin/../lib";    # install location
use lib "$Bin/../../lib"; # build location
use Parrot::Pmc2c::Pmc2cMain ();

my ( %action, %options, @pmc_include_paths );

Getopt::Long::GetOptions(
    #pmc include paths
    "include=s" => \@pmc_include_paths,

    #program actions
    "vtable"  => \$action{default},
    "dump"    => \$action{dump},
    "c|gen-c" => \$action{gen_c},

    #command line options
    "no-lines"  => \$options{nolines}, # Configure.pl --no-line-directives
    "library=s" => \$options{library},
    "testing"   => \$options{testing},
) or exit 1;

if ( 0 == grep { $action{$_} } keys %action ) {
    die "No action specified!\n";
}

my @args = @ARGV;

my $self = Parrot::Pmc2c::Pmc2cMain->new(
    {
        include => \@pmc_include_paths,
        opt     => \%options,
        args    => \@args,
        bin     => $Bin,
    }
);

if ( $action{default} ) {
    $self->dump_vtable("$Bin/../../src/vtable.tbl");
    exit;
}

if ( $action{dump} ) {
    $self->dump_pmc();
    exit;
}

if ( $options{library} ) {
    $self->gen_library( $options{library} );
    exit;
}

if ( $action{gen_c} ) {
    $self->gen_c();
    exit;
}

__END__

=head1 NAME

tools/build/pmc2c.pl - PMC definition to C compiler

=head1 SYNOPSIS

=head2 Options used in Parrot F<Makefile>

Create F<src/pmc/foo.dump>:

    % perl tools/build/pmc2c.pl --dump src/pmc/foo.pmc ...

Create F<vtable.dump>:

    % perl tools/build/pmc2c.pl --vtable

Create F<src/pmc/foo.c> and C<pmc_foo.h> from F<src/pmc/foo.dump>:

    % perl tools/build/pmc2c.pl -c src/pmc/foo.pmc ...

=head2 Other Options

Create foo.c and pmc_foo.h from foo.dump files, also create libfoo.c
containing the initialization function for all foo PMCs.

    % perl tools/build/pmc2c.pl --library libfoo -c \
           src/pmc/foo1.pmc src/pmc/foo2.pmc ...

=head1 DESCRIPTION

The job of the PMC compiler is to take .pmc files and create C files
that can be compiled for use with the Parrot interpreter.

=head1 COMMAND-LINE OPTIONS

=over 4

=item C<--no-lines>

Omit source line info

=item C<--include=/path/to/pmc>

Specify include path where to find PMCs.

=item C<--library=libname>

Specify the library name. This will create F<E<lt>libnameE<gt>.c> and
F<pmc_E<lt>libnameE<gt>.h>. The initialization function will be named
after libname and will initialize all PMCs in the library.

=back

=head1 NOTES

You must use lowercase filenames for C<.pmc> files, and lowercase group
names in the PMC specification in those files.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
