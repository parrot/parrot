#! perl

use strict;
use warnings;
use Getopt::Long;

# Grab parameters.
my ($cfg_file, $output_file);
GetOptions(
    'output=s'  => \$output_file,
) or usage();
$cfg_file = shift @ARGV;
usage() if !$cfg_file || @ARGV;

# Parse rules file.
my $cfg = parse_cfg($cfg_file);

# Generate code.
my $pir = generate_pir($cfg);

# Finally, write generated PIR to output file.
open my $fh, '>', $output_file
    or die "Unable to open $output_file: $!\n";
print $fh $pir;
close $fh;

##############################################################################
# Subroutines.
##############################################################################

# Parse configuration file and build a data structure.
# ####################################################
sub parse_cfg {
    # Get filename and open the file.
    my ($filename) = @_;

    open my $fh, '<', $filename
        or die "Unable to open $filename: $!\n";
    
    my $lib = {};
    my $func;
    
    while (<$fh>) {
        if      (/^#.*$/) {
#           warn "Comment $_";
        }
        elsif (/^\s*$/) {
#           warn "Empty\n";
        }
        elsif (/^\@([A-Z_a-z][0-9A-Z_a-z]*)\s+([0-9]+)\s*$/) {
#           warn "Lib $1 $2\n";
            $func = {};
            $lib->{$2} = [ $1, $func ];
        }
        elsif (/^([A-Z_a-z][0-9A-Z_a-z]*)\s+([0-9]+)\s+([0-9]+)\s*$/) {
#           warn "Fct $1 $2 $3\n";
            $func->{$2} = [ $1, $3 ];
        }
        else {
            warn "cfg? $_";
        }
    }

    close $fh;
    
    return $lib;
}


# Generate the code.
# ##################
sub generate_pir {
    my ($cfg) = @_;

    # Emit the initial PIR.
    my $pir = <<'PIRCODE';
# THIS IS A GENERATED FILE! DO NOT EDIT!

.sub _init_lib
    .local pmc stdlibs
    .local pmc lib
    stdlibs = new .Hash
PIRCODE

    while (my ($num_lib, $lib) = each %{$cfg}) {
        my ($name, $h_lib) = @{$lib};
        $pir .= "\n    # $name\n";
        $pir .= "    lib = new .Hash\n";
        
        while (my ($num_func, $func) = each %{$h_lib}) {
            my ($name, $nb) = @{$func};
            $pir .= "    lib[$num_func] = $nb\t# $name\n";
        }
        
        $pir .= "    stdlibs[$num_lib] = lib\n";
    }

    # Emit the final PIR.
    $pir .= <<'PIRCODE';

    global "stdlibs" = stdlibs
.end

.sub get_nb_arg_lib
    .param int lib
    .param int func
    .local pmc stdlib
    stdlib = global "stdlibs"
    $P0 = stdlib[lib]
    $I0 = $P0[func]
    .return ($I0) 
.end
PIRCODE

    # Return generated code.
    return $pir;
}


# Usage message.
# ##############
sub usage {
    print <<'USAGE';
Usage:
  perl build/stdlibs.pl --output src/stdlibs.pir src/wmlslibs.cfg
USAGE
    exit(1);
}


