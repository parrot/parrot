package Parrot::Opcode;

use strict;
use Symbol;
use Parrot::Config;

my %opcode;
my $fingerprint;
my $revision;

my $nvivsize;
$nvivsize = $PConfig{nvsize}/$PConfig{ivsize};

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

	my $num_i = () = grep {/i/} @params;
	my $num_n = () = grep {/n/} @params;
	$opcode{$name}{RETURN_OFFSET} = 1 + $num_i + $num_n * $nvivsize;
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

The fingerprint() function returns the MD5 signature (in hex) of the
opcode table.

=cut
package Parrot::Opcode;

use strict;
use Symbol;

sub read_ops {
    my $file = @_ ? shift : "opcode_table";

    my $fh = gensym;
    open $fh, $file or die "$file: $!\n";

    my %opcode;
    my $count = 1;
    while (<$fh>) {
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
	$opcode{$name}{FUNC}  = "Parrot_op_$name";

	my $num_i = () = grep {/i/} @params;
	my $num_n = () = grep {/n/} @params;
	$opcode{$name}{RETURN_OFFSET} = 1 + $num_i + $num_n * $nvivsize;
    }

    return %opcode;
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

=cut
