#! perl -w
# Copyright: 2002 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::PakFile2 - XS interface to writing Parrot bytecode files

=head1 SYNOPSIS

    use Parrot::PakFile2;
    open (OUT, ">foo.pbc") or die $!;
  
    Parrot::PakFile2::output_bytecode(
    {
        bytecode => $gibberish,
        constants => [
            [ "N", 123.4567 ],
            [ "S", "Hello world" ],
            ...
        ]
    }

=head1 DESCRIPTION

This is a very simple XS wrapper which creates a C<struct PackFile>
suitable for passing to C<PackFile_pack>, in turn generating a Parrot
bytecode file. Be warned that it is very precise in its expectation
of your input.

=cut

package Parrot::PakFile2;

require 5.005_62;
use strict;
use warnings;
use Carp;

require Exporter;
require DynaLoader;
use AutoLoader;

our @ISA = qw(Exporter DynaLoader);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Parrot::PakFile2 ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);
our $VERSION = '0.01';

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.  If a constant is not found then control is passed
    # to the AUTOLOAD in AutoLoader.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "& not defined" if $constname eq 'constant';
    my $val = constant($constname, @_ ? $_[0] : 0);
    if ($! != 0) {
	if ($! =~ /Invalid/ || $!{EINVAL}) {
	    $AutoLoader::AUTOLOAD = $AUTOLOAD;
	    goto &AutoLoader::AUTOLOAD;
	}
	else {
	    croak "Your vendor has not defined Parrot::PakFile2 macro $constname";
	}
    }
    {
	no strict 'refs';
	# Fixed between 5.005_53 and 5.005_61
	if ($] >= 5.00561) {
	    *$AUTOLOAD = sub () { $val };
	}
	else {
	    *$AUTOLOAD = sub { $val };
	}
    }
    goto &$AUTOLOAD;
}

bootstrap Parrot::PakFile2 $VERSION;

=head1 HISTORY

Author: Simon Cozens, C<simon@cpan.org>

=cut

1;
