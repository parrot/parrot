# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Vtable - Functions for manipulating vtables

=head1 SYNOPSIS

    use Parrot::Vtable;

=head1 DESCRIPTION

C<Parrot::Vtable> provides a collection of functions for manipulating
PMC vtables. It is used by F<build_tools/jit2h.pl>, F<build_tools/pmc2c.pl>,
F<build_tools/vtable_h.pl>, F<classes/genclass.pl>, and F<classes/null.pl>.

=head2 Functions

The following functions are exported:

=over 4

=cut

package Parrot::Vtable;

use strict;

use Exporter;
use FileHandle;

@Parrot::Vtable::ISA    = qw(Exporter);
@Parrot::Vtable::EXPORT =
    qw( parse_vtable vtbl_defs vtbl_struct vtbl_macros vtbl_embed );

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

  [ return_type method_name parameters section MMD_type ]

for each vtable method defined in C<$file>. If C<$file> is unspecified it
defaults to F<vtable.tbl>.  If it is not an MMD method, C<MMD_type> is -1.

=cut

sub parse_vtable {

    my $file = defined $_[0] ? shift() : 'vtable.tbl';
    my $vtable = [];
    my $fh = FileHandle->new($file, O_RDONLY) or
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
    STRING* does_str;        /* space-separated list of interfaces */
    STRING* isa_str;         /* space-separated list of classes */
    PMC *class;              /* for PMCs: a PMC of that type
                                for objects: the class PMC */
    PMC *mro;                /* array PMC of [class, parents ... ] */
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
    "",     /* space-separated list of interfaces */
    "",     /* space-separated list of classes */
    "",     /* class */
    "",     /* mro */

    /* Vtable Functions */
EOM
    for my $entry (@{$vtable}) {
    next if ($entry->[4] =~ /MMD_/);
    $macros .= <<"EOM";
        \"__$entry->[1]\",
EOM
    }
    $macros .= <<"EOM";
    NULL
};

#endif /* PARROT_IN_OBJECTS_C */

/* Need this for add, subtract, multiply, divide, mod, cmod, bitwise
   (and, or, xor, lshift, rshift), concat, logical (and, or, xor),
   repeat, eq, cmp */

/* &gen_from_enum(mmd.pasm) */

typedef enum {
EOM
    for my $entry (@{$vtable}) {
    next unless ($entry->[4] =~ /MMD_/);
    next if ($entry->[4] =~ /_INT$/);
    next if ($entry->[4] =~ /_STR$/);
    next if ($entry->[4] =~ /_FLOAT$/);
    $macros .= <<"EOM";
        $entry->[4],
EOM
    }
    $macros .=<<"EOM";
        MMD_USER_FIRST
} parrot_mmd_func_enum;

/* &end_gen */

#ifdef PARROT_IN_OBJECTS_C
static const char * const Parrot_mmd_func_names[] = {
EOM

    for my $entry (@{$vtable}) {
    next unless ($entry->[4] =~ /MMD_/);
    next if ($entry->[4] =~ /_INT$/);
    next if ($entry->[4] =~ /_STR$/);
    next if ($entry->[4] =~ /_FLOAT$/);
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

=item C<vtbl_embed($vtable)>

Returns the C function definitions to call the vtable methods on a PMC for the
elements in the referenced vtable array.

=cut

sub vtbl_embed
{
    my $vtable = shift;

    my $funcs  = '';
    my $protos = '';

    for my $entry (@$vtable)
    {
        my ($return_type, $name, $params, $section, $mmd) = @$entry;
        next unless $mmd eq '-1';

        my @params    = parse_params( $params );
        my @sig       = ( 'Parrot_INTERP interp', 'Parrot_PMC pmc' );
        my @args      = ( 'interp', 'pmc' );

        while (my ($type, $name) = splice( @params, 0, 2 ))
        {
           eval
           {
               push @sig, find_type( $type ) . ' ' . $name;
               push @args, $name;
            };
        }

        next if $@;

        my $signature = join( ', ', @sig  );
        my $arguments = join( ', ', @args );

        my $ret_type  = find_type( $return_type );

        $protos .= sprintf "extern %s Parrot_PMC_%s( %s );\n",
            $ret_type, $name, $signature;

        $funcs .= sprintf 
"/*

=item C<%s
%s(%s)>

=cut

*/

%s Parrot_PMC_%s( %s )
{
", ($ret_type, $name, $signature) x 2;

        $funcs .= "    $ret_type retval;\n" unless $ret_type eq 'void';
	$funcs .= "    PARROT_CALLIN_START( interp );\n    ";
        $funcs .= "retval = " unless $ret_type eq 'void';
        $funcs .= "VTABLE_$name( $arguments );
    PARROT_CALLIN_END( interp );
    return";
        $funcs .= " retval" unless $ret_type eq 'void';
        $funcs .= ";\n}\n\n";

    }

    return ($funcs, $protos);
}

sub find_type
{
    my $type    = shift;

    my %typemap =
    (
        'STRING*'  => 'Parrot_STRING',
        'void*'    => 'void*',
        'INTVAL'   => 'Parrot_Int',
        'PMC*'     => 'Parrot_PMC',
        'FLOATVAL' => 'Parrot_Float',
        'void'     => 'void',
        'UINTVAL'  => 'Parrot_Int',
        'size_t'   => 'size_t',
    );

    die "Unknown type $type\n" unless exists $typemap{ $type };

    return $typemap{ $type };
}

sub parse_params
{
    my $params = shift;

    my @params;

    while ($params =~ m/(\w+\*?) (\w+)/g)
    {
        push @params, $1, $2;
    }

    return @params;
}

=back

=head1 SEE ALSO

=over 4

=item F<build_tools/jit2h.pl>

=item F<build_tools/pmc2c.pl>

=item F<build_tools/vtable_h.pl>

=item F<classes/genclass.pl>

=item F<classes/null.pl>

=back

1;
