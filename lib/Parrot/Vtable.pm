package Parrot::Vtable;
use Exporter;
use strict;
@Parrot::Vtable::ISA = qw(Exporter);
@Parrot::Vtable::EXPORT = qw(parse_vtable vtbl_defs vtbl_struct vtbl_enumerate);

my(%type_counts) = (unique => 1,
		    int => 5,
		    float =>5,
		    num =>7,
		    str => 5);

sub parse_vtable {
    my (%vtbl, @order);
    open IN, shift || "vtable.tbl" or die "Can't open vtable table! $!\n";
    while (<IN>) {
        next if /^#/ or !/\S/;
        chomp;
        s/\s+$//;
	next unless $_;
        my (@line) = split /\t+/, $_;
	my $meth_type = shift @line; # Method type
        my $tn = shift @line; # Type and name;
        my ($type, $name) = $tn =~ /(.*?)\s+(\w+)/;
        $vtbl{$name}{type} = $type;
	$vtbl{$name}{meth_type} = $meth_type;
        $vtbl{$name}{proto} = "$type (*$name)(struct Parrot_Interp *interpreter, PMC* pmc";
        for (@line) {
            my ($argtype, $argname) = /(.*?)\s+(\w+)/;
            push @{$vtbl{$name}{args}},
                { type => $argtype, name => $argname };
            $vtbl{$name}{proto} .= ", $_";
        }
        $vtbl{$name}{proto} .=")";
        push @order, $name;
    }
    $vtbl{order} = [@order];
    return %vtbl;
}

# This code is unused, but I'm keeping it around in case
# we ever go back to using array-based vtables.
sub vtbl_defs {
    my %vtbl = @_;
    my $rv;
    my $offset = 0;

    # First, typedef all the methods.
    for (@{$vtbl{order}}) {
        my $decl = "VTABLE_" . uc($_);
        $rv .= "#define $decl $offset\n";
	$offset += $type_counts{$vtbl{$_}{meth_type}};
    }
    return $rv;
}

sub vtbl_struct {
    my %vtbl = @_;
    my $rv;

    # First, typedef all the methods.
    for (@{$vtbl{order}}) {
        my $f_proto = $vtbl{$_}{proto};
        $f_proto =~ s/$_/${_}_method_t/;
        $rv .= "typedef $f_proto;\n";
    }
    $rv .= "struct _vtable {\n";
    $rv .= <<EOF;
  struct PACKAGE *package;
  INTVAL base_type;
  INTVAL int_type;
  INTVAL float_type;
  INTVAL num_type;
  INTVAL string_type;

  /* vtable functions */

EOF
    for (vtbl_enumerate(%vtbl)) {
        $rv.= "\t$_->[0] $_->[1]";
        $rv .= "[$_->[3]]" if ($_->[3] > 1);
        $rv.= ";\n";
    }
    $rv .= "};\n";
    return $rv;
}

# Returns an array of [type, name, prototype, variations] arrays
sub vtbl_enumerate {
    my %vtbl = @_;
    my @rv;
    for (@{$vtbl{order}}) {
        my $proto = $vtbl{$_}{proto};
        $proto =~ s/\(\*$_\)/$_ /;
        push @rv, [ "${_}_method_t", $_, $proto, $type_counts{$vtbl{$_}{meth_type}}];
    }
    return @rv;
}

"SQUAWK";

=head1 NAME

Parrot::Vtable - Internal functions for manipulating vtables

=head1 DESCRIPTION

No user-serviceable parts inside.
