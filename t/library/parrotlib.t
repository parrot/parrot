# Copyright (C) 2001-2004 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

t/library/parrotlib.t - testing library/parrotlib.imc

=head1 SYNOPSIS

	% perl t/library/parrotlib.t

=head1 DESCRIPTION

This test program test wether the library 'parrotlib.imc' returns the expected
absolut filenames.

=cut

use strict;

use Parrot::Test tests => 6;
use Parrot::Config;


# Common code in the test files

my $template_top = << 'END_CODE';
##PIR##
.sub _main 

  load_bytecode 'runtime/parrot/include/parrotlib.pbc'
  .local pmc    location_sub
  .local string location
END_CODE

my $template_bottom = << 'END_CODE';
  print location
  print "\n"

  end
.end
END_CODE


# Testing include_file_location 

output_is( << "END_CODE", << 'END_OUT', 'include_file_location' );
$template_top
  location_sub = find_global "_parrotlib", "include_file_location"
  location     = location_sub( 'datatypes.pasm' )
$template_bottom
END_CODE
runtime/parrot/include/datatypes.pasm
END_OUT

output_is( << "END_CODE", << 'END_OUT', 'include_file_location, non-existent' );
$template_top
  location_sub = find_global "_parrotlib", "include_file_location"
  location     = location_sub( 'nonexistent.pasm' )
$template_bottom
END_CODE

END_OUT


# Testing imcc_compile_file_location

output_is( << "END_CODE", << 'END_OUT', 'imcc_compile_file_location' );
$template_top
  location_sub = find_global "_parrotlib", "imcc_compile_file_location"
  location     = location_sub( 'parrotlib.pbc' )
$template_bottom
END_CODE
runtime/parrot/include/parrotlib.pbc
END_OUT

output_is( << "END_CODE", << 'END_OUT', 'imcc_compile_file_location, non-existent' );
$template_top
  location_sub = find_global "_parrotlib", "imcc_compile_file_location"
  location     = location_sub( 'nonexistent.pbc' )
$template_bottom
END_CODE

END_OUT


# Testing dynext_location

output_is( << "END_CODE", << "END_OUT", 'dynext_location' );
$template_top
  location_sub = find_global "_parrotlib", "dynext_location"
  location     = location_sub( 'libnci', '$PConfig{so}' )
$template_bottom
END_CODE
runtime/parrot/dynext/libnci$PConfig{so}
END_OUT

output_is( << "END_CODE", << 'END_OUT', 'dynext_location, non-existent' );
$template_top
  location_sub = find_global "_parrotlib", "imcc_compile_file_location"
  location     = location_sub( 'nonexistent', '$PConfig{so}' )
$template_bottom
END_CODE

END_OUT

=head1 AUTHOR

Bernhard Schmalhofer <Bernhard.Schmalhofer@gmx.de>

=head1 SEE ALSO

F<runtime/parrot/library/parrotlib.imc>
