# Copyright (C) 2007, Parrot Foundation.
# $Id$
package Parrot::Ops2pm::Base;
use strict;
use warnings;
use Cwd;
use File::Spec;
use lib qw ( lib );
use Parrot::OpsFile;

=head1 NAME

Parrot::Ops2pm::Base - Methods inherited by Parrot::Ops2pm and Parrot::OpsRenumber.

=head1 SYNOPSIS

    use base qw( Parrot::Ops2pm::Base );

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

=cut

=head1 DESCRIPTION

Parrot::Ops2pm::Base provides a constructor and other method(s) to be
inherited by Parrot::Ops2pm and Parrot::OpsRenumber.  The former provides
methods called by F<tools/build/ops2pm.pl>, a program which is called at the
very beginning of the Parrot F<make> process.  The latter is called by
F<tools/dev/opsrenumber.pl>.

=head1 METHODS

=head2 C<new()>

=over 4

=item * Purpose

Process files provided as command-line arguments to
F<tools/build/ops2pm.pl> and construct a Parrot::Ops2pm object.

=item * Arguments

Hash reference with the following elements:

    argv        :   reference to @ARGV
    nolines     :   set to true value to eliminate #line
                    directives in output
    moddir      :   directory where output module is created
                    (generally, lib/Parrot/OpLib)
    module      :   name of output module
                    (generally, core.pm)
    inc_dir     :   directory where C-header file is created
                    (generally, include/parrot/oplib)
    inc_f       :   name of output C-header file
                    (generally, ops.h)
    script      :   name of the script to be executed by 'make'
                    (generally, either tools/build/ops2pm.pl
                    or tools/dev/opsrenumber.pl)

=item * Return Value

Object of the invoking class (Parrot::Ops2pm or Parrot::OpsRenumber, as the
case may be).

=item * Comment

Arguments for the constructor have been selected so as to provide
subsequent methods with all information needed to execute properly and to be
testable.  A Parrot::Ops2pm object I<can> be constructed lacking some
of these arguments and still suffice for the execution of particular methods
-- this is done during the test suite -- but such an object would not suffice
for F<make>'s call to F<tools/build/ops2pm.pl>.

=back

=cut

sub new {
    my ( $class, $argsref ) = @_;
    my @argv = @{ $argsref->{argv} };
    my $file = shift @argv;
    die "$argsref->{script}: Could not find ops file '$file'!\n"
        unless -e $file;
    $argsref->{file} = $file;
    $argsref->{argv} = \@argv;
    $argsref->{num_file}    = "src/ops/ops.num";
    $argsref->{skip_file}   = "src/ops/ops.skip";
    $argsref->{opsenum_file} = File::Spec->catfile(
        cwd(), qw(  include parrot opsenum.h )
    );
    return bless $argsref, $class;
}

=head2 C<prepare_ops()>

=over 4

=item * Purpose

Call C<Parrot::OpsFile::new()>, then populate the resulting
C<$opts> hash reference with information from  each of the F<.ops> files
provided as command-line arguments to F<tools/build/ops2pm.pl>.

=item * Arguments

None.  (Implicitly requires that at least the C<argv> and
C<script> elements were provided to the constructor.)

=item * Return Value

None.  Internally, sets the C<ops> key in the object's data
structure.

=item * Comment

This method calls C<Parrot::OpsFile::new()> on the first F<.ops>
file found in C<@ARGV>, then copies the ops from the remaining F<.ops> files
to the object just created.  Experimental ops are marked as such.

=back

=cut

sub prepare_ops {
    my $self = shift;
    my $ops = Parrot::OpsFile->new( [ $self->{file} ], $self->{nolines} );
    die "$self->{script}: Could not read ops file '$self->{file}'!\n"
        unless defined $ops;

    # Copy the ops from the remaining .ops files to the object just created.
    my %seen;

    while ( defined( my $f = shift( @{ $self->{argv} } ) ) ) {
        if ( $seen{$f} ) {
            print STDERR "$self->{script}: Ops file '$f' mentioned more than once!\n";
            next;
        }
        $seen{$f} = 1;

        die "$self->{script}: Could not find ops file '$f'!\n"
            unless -e $f;
        my $temp_ops = Parrot::OpsFile->new( [$f], $self->{nolines} );
        die "$self->{script}: Could not read ops file '$f'!\n"
            unless defined $temp_ops;

        my $experimental = $f =~ /experimental/;

        if (! ref $temp_ops->{OPS}) {
            my $message = "OPS invalid for $f";
            if ($experimental) {
                # empty experimental.ops file is OK.
                warn $message;
                next;
            }
            else {
                die $message;
            }
        }

        # mark experimental ops
        if ($experimental) {
            for my $el ( @{ $temp_ops->{OPS} } ) {
                $el->{experimental} = 1;
            }
        }

        push @{ $ops->{OPS} }, @{ $temp_ops->{OPS} };
        $ops->{PREAMBLE} .= "\n" . $temp_ops->{PREAMBLE};
    }
    $self->{ops} = $ops;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
