#!/usr/bin/perl
# .NET CLI => PIR Translator Built-in Methods Build Tool
# Script to take a file containing internal methods and spit out a chunk of
# PIR that can look up the built-in that's needed and return its PIR.

use strict;
use Getopt::Long;

# Grab parameters.
my ($input_file, $output_file);
GetOptions(
    "output=s"    => \$output_file
) or usage();
$input_file = shift @ARGV;
usage() if !$input_file || @ARGV;

# Parse the file to get the methods.
my $fh;
open $fh, "< $input_file" or die "Could not open $input_file: $!\n";
my $input = join('', <$fh>);
close $fh;
my @methods = parse($input);

# Start of output.
my $output = <<'PIR_OUT';
.sub internal_method_body
    .param pmc class
    .param pmc meth
    .local string class_name, method_name, body

    # Get class and method names.
    class_name = class.get_fullname()
    method_name = meth
PIR_OUT

# Generate the lookup.
$output .= generate_lookup(@methods);

# Generate method code suppliers.
$output .= generate_bodies(@methods);

# End of output.
$output .= <<'PIR_OUT';
    # Generic unimplemented internal method body (throws exception).
UNIMPLEMENTED:
    body = <<"PIR"
$P0 = new .Exception
$P0["_message"] = "System.NotImplementedException"
$P1 = new "System.NotImplementedException"
$P0["obj"] = $P1
throw $P0
PIR

    # Return.
END:
    .return(body)
.end
PIR_OUT

# Write output.
open $fh, "> $output_file" or die "Cannot open $output_file: $!\n";
print $fh $output;
close $fh;


##############################################################################
# Subroutines.
##############################################################################

# This parses the input file, extracting each method.
# ###################################################
sub parse($) {
    my $input = shift;
    my @methods = ();
    my $cur_method;
    my $line_count = 1;
    
    # Loop over lines of input.
    foreach my $line (split(/\n/, $input)) {
        # Is this the start of a new method?
        if ($line =~ /^\[([\w\.]+)\s*\:\:\s*(\w+)\s*(\:unimplemented)?\s*\]\s*$/) {
            # If there is an existing one, stash it.
            if ($cur_method) {
                push @methods, $cur_method;
            }

            # Initiate new method info.
            $cur_method = {
                class           => $1,
                method          => $2,
                unimplemented   => $3 ? 1 : 0,
                body            => ''
            };

        # Have we got a blank line that we should skip over?
        } elsif ($line eq "" && (!$cur_method || $cur_method->{'unimplemented'})) {
            # Do nothing.

        # Have we got a non-blank line when we've got no method specified yet?
        } elsif (!$cur_method) {
            die "Syntax error at line $line_count\n";

        # Have we got a non-blank line in an unimplemented method?
        } elsif ($cur_method->{'unimplemented'}) {
            die "Unimplemented method given body at line $line_count\n";

        # Otherwise, just append it to current method.
        } else {
            $cur_method->{'body'} .= "$line\n";
        }

        $line_count++;
    }

    # If we have another method, add it.
    if ($cur_method) {
        push @methods, $cur_method;
    }

    # Return methods.
    return @methods;
}


# Generate the lookup table.
# ##########################
sub generate_lookup {
    my @methods = @_;
    my $pir = "";

    # Group methods by class.
    my %classes = ();
    foreach (@methods) {
        if ($classes{$_->{'class'}}) {
            push @{$classes{$_->{'class'}}}, $_;
        } else {
            $classes{$_->{'class'}} = [$_];
        }
    }

    # Build classes dispatch table.
    foreach (keys %classes) {
        my $label = "CLASS_$_";
        $label =~ s/\./_/g;
        $pir .= "if class_name == \"$_\" goto $label\n";
    }
    $pir .= "goto FAIL\n";

    # Now build method dispatch table for each class.
    foreach (keys %classes) {
        # Stick label at top.
        my $label = "CLASS_$_";
        $label =~ s/\./_/g;
        $pir .= "$label:\n";

        # Now do dispatch for each method.
        foreach (@{$classes{$_}}) {
            my $label = $_->{'unimplemented'} ? 'UNIMPLEMENTED' : 
                        "BODY_$_->{'class'}___$_->{'method'}";
            $label =~ s/\./_/g;
            $pir .= "if method_name == \"$_->{'method'}\" goto $label\n";
        }
        $pir .= "goto FAIL\n";
    }

    # Add failure.
    $pir .= <<'PIR'
FAIL:
    $P0 = new .Exception
    $P0["_message"] = "No body supplied for built-in method"
    throw $P0
PIR
}


# Generate the bodies.
# ####################
sub generate_bodies {
    # Just loop over the methods and emit code to set body and go to the end.
    my $pir = '';
    foreach (@_) {
        next if $_->{'unimplemented'};
        my $label = "BODY_$_->{'class'}___$_->{'method'}";
        $label =~ s/\./_/g;
        $pir .= "$label:\nbody = <<\"___BUILTIN_CODE___\"\n";
        $pir .= $_->{'body'};
        $pir .= "___BUILTIN_CODE___\ngoto END\n";
    }
    return $pir;
}


# Usage message.
# ##############
sub usage() {
    print <<USAGE;
Usage:
  perl build/builtins.pl src/internal.methods --ouptput src/builtins.pir
USAGE
    exit(1);
}

