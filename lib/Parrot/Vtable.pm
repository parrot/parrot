package Parrot::Vtable;
use Exporter;
@Parrot::Vtable::ISA = qw(Exporter);
@Parrot::Vtable::EXPORT = qw(parse_vtable vtbl_enum vtbl_struct);

sub parse_vtable {
    my (%vtbl, @order);
    open IN, "vtable.tbl" or die "Can't open vtable table! $!\n";
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
        $vtbl{$name}{proto} = "$type (*$name)(PMC* pmc";
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

sub vtbl_enum {
    my %vtbl = @_;
    my $rv = "enum {\n";
    $rv .= "\twant_vtbl_$_,\n" for @{$vtbl{order}};
    substr($rv, -2) = "\n";
    $rv .= "};\n";
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
    $rv .= "\t${_}_method_t $_;\n" for @{$vtbl{order}};
    $rv .= "};\n";
    return $rv;
}

"SQUAWK";

=head1 NAME

Parrot::Vtable - Internal functions for manipulating vtables

=head1 DESCRIPTION

No user-serviceable parts inside.
