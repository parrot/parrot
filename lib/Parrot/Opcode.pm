package Parrot::Opcode;

use strict;
use Symbol;
use Parrot::Config;

my %opcode;
my $fingerprint;
my $revision;

sub _load {
    my $file = @_ ? shift : "opcode_table";

    my $fh = gensym;
    open $fh, $file or die "$file: $!\n";

    my $count = 1;
    while (<$fh>) {
	$fingerprint += unpack('%32C*', $_);

	if (m/^# \$Id: opcode_table,v ([0-9.]+) /) {
	  $revision = $1;
        }

	s/#.*//;
	s/^\s+//;
	chomp;
	next unless $_;

	my($name, @params) = split /\s+/;
	if (@params && $params[0] =~ /^\d+$/) {
	    my $count = shift @params;
	    die "$file, line $.: opcode $name parameters don't match count\n"
	      if ($count != @params);
	}

	warn "$file, line $.: opcode $name redefined\n" if $opcode{$name};

	$opcode{$name}{ARGS}  = @params;
	$opcode{$name}{TYPES} = \@params;
	$opcode{$name}{CODE}  = ($name eq "end") ? 0 : $count++;
	$opcode{$name}{FUNC}  = $name;
	$opcode{$name}{RETURN_OFFSET} = 1 + scalar(@params);
    }
}

sub read_ops {
    _load(@_) unless defined $fingerprint;
    return %opcode;
}


sub fingerprint {
    _load(@_) unless defined $fingerprint;
    return $fingerprint;
}

sub revision {
    _load(@_) unless defined $revision;
    return $revision;
}

1;


__END__

=head1 NAME

Parrot::Opcode - Read opcode definitions

=head1 SYNOPSIS

  use Parrot::Opcode;

  %opcodes = Parrot::Opcode::read_ops();

=head1 DESCRIPTION

The read_ops() function parses the Parrot opcode_table file, and
returns the contents as a hash.  The hash key is the opcode name;
values are hashrefs containing the following fields:

=over

=item CODE

The opcode number.

=item ARGS

The opcode argument count.

=item TYPES

The opcode argument types, as an arrayref.

=item FUNC

The name of the C function implementing this op.

=back

read_ops() takes an optional argument: the file to read the opcode table
from.

The fingerprint() function returns a checksum for the opcode table.  It is
used to ensure that bytecode is only executed if it was generated for
a version of parrot supporting the appropriate opcodes.

=cut
