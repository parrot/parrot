# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$
package Make_VERSION_File;
use strict;
use vars qw(@ISA @EXPORT_OK);
@ISA       = qw( Exporter );
@EXPORT_OK = qw( make_VERSION_file );

sub make_VERSION_file {
    my $v = shift;
    my $vfile = 'VERSION';
    open my $FH, ">", $vfile
        or die "Unable to open $vfile for writing: $!";
    print $FH $v;
    close $FH or die "Unable to close $vfile after writing: $!";
}

1;

=head1 NAME

t/configure/testlib/Make_VERSION_File.pm - Subroutines used in testing C<Parrot::Build::Util::parrot_version()>

=head1 SYNOPSIS

=head1 AUTHOR

James E Keenan

=cut

