# Copyright: 2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Pmc2c::Library - PMC to C Code Generation

=head1 SYNOPSIS

	use Parrot::Pmc2c::Library;

=head1 DESCRIPTION

Parrot::Pmc2c::Library is a wrapper around a collection of PMCs linked in the
same dynamic library. A degenerate case is having an unnamed library with just
one PMC, which is the case used by the Parrot core. See L<Parrot::Pmc2c>

=head2 Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Library;
use Parrot::Pmc2c qw(dynext_load_code dont_edit);

=item C<new($opt, $vtable_dump, %pmcs)>

    $library = Parrot::Pmc2c::Library->new
        ( $options,     # hash refernce, the same passet to other constructors
          $vtable_dump, # vtable.dump
          pmc1        => $pmc1_dump,
          pmc2        => $pmc2_dump,
          ... );

Creates a new library object. If the C<$options> hash contains a
C<library> key its value will be used for the library name.

=cut

sub new {
    my ($class, $opt, $vtable_dump) = (shift, shift, shift);
    my %pmcs = @_;

    foreach my $file (keys %pmcs) {
        $pmcs{$file}->{vtable} = $vtable_dump;
        $pmcs{$file} = Parrot::Pmc2c->new($pmcs{$file}, $opt);
    }

    return bless { opt         => $opt,
                   pmcs        => \%pmcs,
                 }, $class;
}

sub _write_a_file($$$) {
    my ($generator, $h_name, $c_name) = @_;
    my $opt = $generator->{opt};
    local (*H, *C);

    print Data::Dumper->Dump([$generator]) if $opt->{debug} > 1;
    my $cout = $generator->gen_c($c_name);
    print $cout if $opt->{debug};
    print "Writing $c_name\n" if $opt->{verbose};
    open C, ">$c_name" or die "Can't write '$c_name";
    print C $cout;
    close C;
    my $hout = $generator->gen_h($h_name);
    print $hout if $opt->{debug};
    print "Writing $h_name\n" if $opt->{verbose};
    open H, ">$h_name" or die "Can't write '$h_name";
    print H $hout;
    close H;
}

=item C<write_all_files()>

Writes C and header files for all the PMCs in the library,
I<or> E<lt>libnameE<gt>.c and pmc_E<lt>libnameE<gt>.h if his object
represents a named library.

=cut

sub write_all_files {
    my $self = shift;
    my $library = $self->{opt}{library};

    if ($library) {
	my $hout = $self->gen_h($library);
        my $h = "$library.h";
        my $c = "$library.c";
	_write_a_file($self, $h, $c);
    } else {
	while (my @fc = each %{$self->{pmcs}}) {
	    my ($file, $generator) = @fc;
	    my $h;
	    ($h = $file) =~ s/\.\w+$/.h/;
	    $h =~ s/(\w+)\.h$/pmc_$1.h/;
	    my $c;
	    ($c = $file) =~ s/\.\w+$/.c/;

	    _write_a_file($generator, $h, $c);
	}
    }
}

=item C<gen_h>

Writes the header file for the library.

=cut

sub gen_h {
    my ($self) = @_;
    my $hout = dont_edit('various files');
    my $lc_libname = lc $self->{opt}{library};

    $hout .= <<"EOH";
Parrot_PMC Parrot_lib_${lc_libname}_load(Parrot_INTERP interpreter);
EOH

    return $hout;
}

=item C<gen_c>

Writes the C file for the library.

=cut

sub gen_c {
    my ($self) = @_;
    my $cout = dont_edit('various files');

    $cout .= $self->includes;
    $cout .= dynext_load_code($self->{opt}{library},
			      map { $_->{class} => $_ }
			      values %{$self->{pmcs}} );

    return $cout;
}

=item C<includes()>

Returns the set of C C<#include>s for the library.

=cut

sub includes() {
    my $self = shift;
    my $cout = "";
    $cout .= <<"EOC";
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/dynext.h"
EOC
    foreach my $pmc (values %{$self->{pmcs}}) {
	my $name = lc $pmc->{class};
	$cout .= <<"EOC";
#include "pmc_$name.h"
EOC
    }
    "$cout\n";
}

=back

=head1 SEE ALSO

=over 4

=item F<build_tools/pmc2c.pl>

=back

=cut

# vim: expandtab shiftwidth=4:
1;

