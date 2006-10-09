# Some utility subs for aiding the test process.
# ##############################################

package DotNetTesting;

use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(compile_cs translate run_pir);

use File::Spec;

use Parrot::Test   ();
require "config/N2PConfig.pm";

# globals
my $path_to_parrot = Parrot::Test::path_to_parrot();
my $parrot = File::Spec->catfile( $path_to_parrot, 'parrot' );

# This compiles C# code to an exe/dll.
# ####################################
sub compile_cs {
	my $file_name = shift;
	my $cs_code = shift;
    my $opt = shift;
    $opt ||= '';
	
	# Write file.
	my $fh;
	open $fh, "> $file_name.cs" or die "$!\n";
	print $fh $cs_code;
	close $fh;
	
	# Attempt to compile.
	my $kind = $file_name =~ /\.dll$/ ? '-target:library' : '';
	my $output = `mcs -warn:0 -out:$file_name $kind $opt $file_name.cs`;
	if ($output) {
		print "compile_cs failed:\n$output";
		return 0;
	}
	
	# Clean up file.
	unlink "$file_name.cs";
	return 1;
}

# This translates a .NET DLL or EXE to a PBC.
# ###########################################
sub translate($$) {
	my $net_name = shift;
	my $out_name = shift;
	
	# Attempt to translate.
	my $output = `$parrot $path_to_parrot/languages/dotnet/net2pbc.pbc -q -s -p $net_name > $out_name.pir`;
	if ($output) {
		print "translate failed:\n$output";
		return 0;
	}
	$output = `$parrot -o $out_name $out_name.pir`;
	unlink "$out_name.pir";
	if ($output) {
		print "translate failed:\n$output";
		return 0;
	}
	return 1;
}

# This takes some PIR, saves it to a file then runs it.
# #####################################################
sub run_pir($) {
	my $pir_code = shift;
	
	# Write.
	my $fh;
	open $fh, "> __temp__.pir" or die "$!\n";
	print $fh $pir_code;
	close $fh;

	# Run and get output.
	my $output = `$parrot __temp__.pir`;

	# Clean up file and return output.
	unlink "__temp__.pir";
	return $output;
}

1;
