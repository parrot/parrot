package Parrot::Vtable;
use Exporter;
use strict;
@Parrot::Vtable::ISA = qw(Exporter);
@Parrot::Vtable::EXPORT = qw(parse_vtable vtbl_defs vtbl_struct vtbl_enumerate);

my(%expand) = (
    unique => [""], # Dummy element, so we go through the loop exactly once
    int    => [qw[object native bigint same]],
    float  => [qw[object native bigfloat same]],
    num    => [qw[object int bigint float bigfloat same]],
    str    => [qw[object native unicode other same]]
);

my (%types)  = (
    int   => ["PMC *", "INTVAL", "BIGINT", "PMC *"],
    float => ["PMC *", "FLOATVAL", "BIGFLOAT", "PMC *"],
    num   => ["PMC *", "INTVAL", "BIGINT", "FLOATVAL", "BIGFLOAT", "PMC *"],
    str   => ["PMC *", "STRING *", "STRING *", "STRING *", "PMC *"]
);


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

        # You are in a maze of twisty multimethods, all different.
        for my $i (0..$#{$expand{$meth_type}}) {
            my $expand_name = $name;

            # If we're in a multimethod, we need to expand the name if
            # it's not the default argument type of "object".
            if ($meth_type ne "unique") { 
                if ($expand{$meth_type}[$i] eq "object") {
                    $vtbl{$expand_name}{meth_type} = $meth_type; # For reference
                } else {
                    $expand_name .= "_".$expand{$meth_type}[$i] 
                }
            }
            $vtbl{$expand_name}{type} = $type;
            $vtbl{$expand_name}{proto} = "$type (*$expand_name)(struct Parrot_Interp *interpreter, PMC* pmc";

            # Parse the function parameters
            for (@line) {
                my ($argtype, $argname) = /(.*?)\s+(\w+)$/;

                # In multimethods, we need to rewrite the type of
                # parameters called "value".
                $argtype = $types{$meth_type}[$i]
                    if $argname eq "value" and $meth_type ne "unique";

                # Add the function parameters to the prototype
                push @{$vtbl{$expand_name}{args}},
                    { type => $argtype, name => $argname };
                $vtbl{$expand_name}{proto} .= ", $argtype $argname";
            }
            $vtbl{$expand_name}{proto} .=")";
            
            # So they're ordered according to their position in the file
            push @order, $expand_name;
        }
    }
    $vtbl{order} = [@order];
    return %vtbl;
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

# Returns an array of [type, name, prototype] arrays
sub vtbl_enumerate {
    my %vtbl = @_;
    my @rv;
    for (@{$vtbl{order}}) {
        my $proto = $vtbl{$_}{proto};
        $proto =~ s/\(\*$_\)/$_ /;
        push @rv, [ "${_}_method_t", $_, $proto];
    }
    return @rv;
}

"SQUAWK";

=head1 NAME

Parrot::Vtable - Internal functions for manipulating vtables

=head1 DESCRIPTION

No user-serviceable parts inside.
