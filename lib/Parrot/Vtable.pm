package Parrot::Vtable;

use FileHandle;

use Exporter;
use strict;

@Parrot::Vtable::ISA = qw(Exporter);
@Parrot::Vtable::EXPORT = qw(parse_vtable vtbl_defs vtbl_struct vtbl_macros);

sub make_re {
    my $re = shift;

    my $comp_re = eval "qr/$re/";

    if ($@) { return "(?:$re)"; } else { return $comp_re; }
}

my $ident_re = make_re('[A-Za-z_][A-Za-z0-9_]*');
my $type_re = make_re('(?:(?:struct\s+)|(?:union\s+))?'.$ident_re.'\**');
my $param_re = make_re($type_re.'\s+'.$ident_re);
my $arglist_re = make_re('(?:'.$param_re.'(?:\s*,\s*'.$param_re.')*)?');
my $method_re = make_re('^\s*('.$type_re.')\s+('.$ident_re.')\s*\(('.$arglist_re.')\)\s*$');


sub parse_vtable {

    my $file = defined $_[0] ? shift() : 'vtable.tbl';
    my $vtable = [];
    my $fh = new FileHandle ($file, O_RDONLY) or
        die "Can't open $file for reading: $!\n";
    my $section = 'MAIN';

    while(<$fh>) {

        chomp;

        next if /^\s*#/ or /^\s*$/;

	if (/^\[(\w+)\]/) {
	    $section = $1;
	}
        elsif (/^\s*($type_re)\s+($ident_re)\s*\(($arglist_re)\)\s*$/) {
            push @{$vtable}, [ $1, $2, $3, $section ];
        } else {
            die "Syntax error at $file line ".$fh->input_line_number()."\n";
        }
    }

    return $vtable;
}

sub vtbl_defs {
    my $vtable = shift;
    my $defs = "";
    my $entry;

    for $entry (@{$vtable}) {
        my $args = join(", ", 'struct Parrot_Interp* interpreter', 'PMC* pmc', split(/\s*,\s*/, $entry->[2]));
        $defs .= "typedef $entry->[0] (*$entry->[1]_method_t)($args);\n";
    }

    return $defs;
}

sub vtbl_struct {
    my $vtable = shift;
    my $struct = "";
    my $entry;

    $struct = <<"EOF";
typedef enum {
    VTABLE_IS_CONST_FLAG = 0x01,
    VTABLE_HAS_CONST_TOO = 0x02,
    VTABLE_PMC_NEEDS_EXT = 0x04,
    VTABLE_DATA_IS_PMC   = 0x08,
    VTABLE_PMC_IS_SINGLETON = 0x10,
    VTABLE_IS_SHARED_FLAG   = 0x20
} vtable_flags_t;

struct _vtable {
    struct PACKAGE *package; /* Pointer to package this vtable belongs to */
    INTVAL base_type;        /* 'type' value for MMD */
    STRING* whoami;          /* Name of class this vtable is for */
    UINTVAL flags;           /* Flags. Duh */
    STRING* does_str;	     /* space separated list of interfaces */
    STRING* isa_str;	     /* space separated list of classes */
    void *data;              /* To hang data off this vtable */

    /* Vtable Functions */

EOF
    for $entry (@{$vtable}) {
        $struct .= "    $entry->[1]_method_t $entry->[1];\n";
    }

    $struct .= "};\n";

    return $struct;
}

sub vtbl_macros {
    my $vtable = shift;
    my $macros = <<"EOM";

/*
 * vtable accessor macros
 * as vtable methods might get moved around internally
 * these macros hide the details
 */

EOM
    for my $entry (@{$vtable}) {
	my @args = split /,\s*/, $entry->[2];
	unshift @args, "i interp", "p pmc";
	my $args = join ', ', map { (split / /, $args[$_])[1] } (0..$#args);
	$macros .= <<"EOM";
#define VTABLE_$entry->[1]($args) \\
    (pmc)->vtable->$entry->[1]($args)
EOM
    }
    $macros .= <<"EOM";

/*
 * vtable method name defines
 */

/* &gen_from_def(vtable_methods.pasm) */
EOM
    for my $entry (@{$vtable}) {
	my $uc_meth = uc $entry->[1];
	$macros .= <<"EOM";
#define PARROT_VTABLE_${uc_meth}_METHNAME \"__$entry->[1]\"
EOM

    }
    $macros .= <<"EOM";
/* &end_gen */

EOM
    $macros;
}

"SQUAWK";

=head1 NAME

Parrot::Vtable - Internal functions for manipulating vtables

=head1 DESCRIPTION

=over 4

=item parse_vtable

Returns a ref to an array containing

  [ return_type method_name parameters section ]

per vtable method defined in vtable.tbl

=back

