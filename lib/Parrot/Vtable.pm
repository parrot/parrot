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
    unique => [""],
    int   => ["PMC *", "INTVAL", "BIGINT", "PMC *"],
    float => ["PMC *", "FLOATVAL", "BIGFLOAT", "PMC *"],
    num   => ["PMC *", "INTVAL", "BIGINT", "FLOATVAL", "BIGFLOAT", "PMC *"],
    str   => ["PMC *", "STRING *", "STRING *", "STRING *", "PMC *"]
);

#
# Handle the special argument names 'value', 'src_value', and 'dst_value'.
#
sub munge_arguments {
    my ($vtable,$func_name,$cur_param,$arg_ref) = @_;
    for(@$arg_ref) {
	my $type = $_->{type};
	if($_->{name} eq 'value') {
	    $type = $cur_param ne '' ? $cur_param : $_->{type};
	}

	push @{$vtable->{$func_name}{args}}, {
	    type => $type,
	    name => $_->{name}
	};

	if($_->{name} =~ /_value/) {
	    my $key_name;
	    ($key_name = $_->{name}) =~ s/^(.*)_value/${1}_key/;
	    push @{$vtable->{$func_name}{args}}, {
		type => 'KEY *',
		name => 'src_key',
	    };
	}
    }
}

sub parse_vtable {
    my $file = defined $_[0] ? shift() : 'vtable.tbl';
    my $vtable;
    open INPUT, "< $file" or die "Can't open < $file: $!\n";
    while(<INPUT>) {
	chomp;
	next if /^\s*#/ or /^\s*$/;
	my ($names,$args) = $_ =~ /^(.*)\((.*)\)/;
	#
	# Split the names, then make sure '*'s precede the appropriate name.
	#
	my @names;
	for(split /\s+/,$names) {
	    s/^\s+//; s/\s+$//;
	    if($_ eq '*') {
		$names[-1] .= '*';
	    }
	    else {
		push @names,$_;
	    }
	}
	my $function     = $names[-1];
	my $return_value = @names>1?$names[-2]:'void'; # Default to 'void'
	my $signature    = @names>2?$names[-3]:'unique'; # Default to 'unique'
	my @args;
	if($args=~/\S/) {
	    for (split /,/,$args) {
	        s/^\s+//; s/\s+$//;
	        my ($foo,$bar) = /^(.*)\s(\w+)$/;
	        push @args,{type=>$foo,name=>$bar};
	    }
	}

	for(0..$#{$expand{$signature}}) {
	    my $func_name = $function;
	    my $cur_sig   = $expand{$signature}[$_];
	    my $cur_param;
	    $cur_param = $types{$signature}[$_] if
	      defined $types{$signature}[$_];

	    if($cur_sig ne 'object' and $cur_sig ne '') {
		$func_name .= "_$cur_sig";
	    }
	    my $proto =
"$return_value (*$func_name)(struct Parrot_Interp* interpreter, PMC* pmc";
	    $vtable->{$func_name} = {
	        type  => $return_value,
	        proto => $proto,
            };
	    push @{$vtable->{order}},$func_name;
	    if(@args>0) {
		#
		# Hnadle the special 'value' and '{src,dst}_value' tags.
		#
		munge_arguments($vtable,$func_name,$cur_param,\@args);
	        my $params = join ", ",
	    		       map { "$_->{type} $_->{name}" }
	    		       @{$vtable->{$func_name}{args}};
	        $vtable->{$func_name}{proto} .= ", $params";
	    }
	    $vtable->{$func_name}{proto} .= ')';
	}
    }
    close INPUT;

    return %$vtable;
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
