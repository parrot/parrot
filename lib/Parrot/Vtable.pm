# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Vtable - Functions for manipulating vtables

=head1 SYNOPSIS

    use Parrot::Vtable;

=head1 DESCRIPTION

C<Parrot::Vtable> provides a collection of functions for manipulating
PMC vtables. It is used by F<build_tools/jit2h.pl>, F<build_tools/vtable_h.pl>,
F<classes/genclass.pl>, F<classes/null.pl> and F<classes/pmc2c2.pl>.


=head2 Functions

The following functions are exported:

=over 4

=cut

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


=item C<parse_vtable($file)>

Returns a reference to an array containing

  [ return_type method_name parameters section ]

for each vtable method defined in C<$file>. If C<$file> is unspecified
it defaults to F<vtable.tbl>.

=cut

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
        elsif (m/^\s*
	        ($type_re)\s+
	        ($ident_re)\s*
		\(($arglist_re)\)
		(?:\s+(MMD_\w+))?\s*$/x) {
	    my $mmd = defined $4 ? $4 : -1;
            push @{$vtable}, [ $1, $2, $3, $section, $mmd ];
        } else {
            die "Syntax error at $file line ".$fh->input_line_number()."\n";
        }
    }

    return $vtable;
}

=item C<vtbl_defs($vtable)>

Returns the C C<typedef> definitions for the elements in the referenced
vtable array.

=cut

sub vtbl_defs {
    my $vtable = shift;
    my $defs = "";
    my $entry;

    for $entry (@{$vtable}) {
	next if ($entry->[4] =~ /MMD_/);
        my $args = join(", ", 'Interp* interpreter', 'PMC* pmc', split(/\s*,\s*/, $entry->[2]));
        $defs .= "typedef $entry->[0] (*$entry->[1]_method_t)($args);\n";
    }

    return $defs;
}

=item C<vtbl_struct($vtable)>

Returns the C C<struct> definitions for the elements in the referenced
vtable array.

=cut

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
	next if ($entry->[4] =~ /MMD_/);
        $struct .= "    $entry->[1]_method_t $entry->[1];\n";
    }

    $struct .= "};\n";

    return $struct;
}

=item C<vtbl_macros($vtable)>

Returns the C C<#define> definitions for the elements in the referenced
vtable array.

=cut

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
	next if ($entry->[4] =~ /MMD_/);
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
 * vtable method name defines for delegate
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

    # finally the name mapping
    $macros .= <<"EOM";
/*
 * vtable slot names
 */
#ifdef PARROT_IN_OBJECTS_C
static const char * const Parrot_vtable_slot_names[] = {
    "",     /* Pointer to package this vtable belongs to */
    "",     /* 'type' value for MMD */
    "",     /* Name of class this vtable is for */
    "",     /* Flags. Duh */
    "",	    /* space separated list of interfaces */
    "",	    /* space separated list of classes */
    "",     /* To hang data off this vtable */

    /* Vtable Functions */
EOM
    for my $entry (@{$vtable}) {
	$macros .= <<"EOM";
        \"__$entry->[1]\",
EOM
    }
    $macros .= <<"EOM";
    NULL
};
#endif

EOM

    $macros;
}

=back

=head1 SEE ALSO

=over 4

=item F<build_tools/jit2h.pl>

=item F<build_tools/vtable_h.pl>

=item F<classes/genclass.pl>

=item F<classes/null.pl>

=item F<classes/pmc2c2.pl>

=back

1;

