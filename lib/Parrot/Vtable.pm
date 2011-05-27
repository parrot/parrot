# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

Parrot::Vtable - Functions for manipulating vtables

=head1 SYNOPSIS

    use Parrot::Vtable;

=head1 DESCRIPTION

C<Parrot::Vtable> provides a collection of functions for manipulating PMC
vtables. It is used by F<tools/build/pmc2c.pl>, F<tools/build/vtable_h.pl>,
F<tools/build/vtable_extend.pl> and F<tools/dev/gen_class.pl>.

=head2 Functions

The following functions are exported:

=over 4

=cut

package Parrot::Vtable;

use strict;
use warnings;

use base qw( Exporter );

use FileHandle;

our @EXPORT = qw(parse_vtable vtbl_defs vtbl_struct vtbl_macros vtbl_embed);

sub make_re {
    my $re      = shift;
    my $comp_re = qr/$re/;
    return ( defined $comp_re )
        ? $comp_re
        : "(?:$re)";
}

my $ident_re   = make_re('[A-Za-z_][A-Za-z0-9_]*');
my $type_re    = make_re( '(?:(?:struct\s+)|(?:union\s+))?' . $ident_re . '\**' );
my $const_re   = make_re( '(?:const\s+)?' );
my $c_param_re = make_re( $const_re . $type_re . '\s+' . $ident_re );
my $param_re   = make_re( '(?:(?:' . $c_param_re . ')|(?:ARG[_A-Z]+\(\s*' . $c_param_re . '\)))' );
my $arglist_re = make_re( '(?:' . $param_re . '(?:\s*,\s*' . $param_re . ')*)?' );
my $method_re =
    make_re( '^\s*(' . $type_re . ')\s+(' . $ident_re . ')\s*\((' . $arglist_re . ')\)\s*$' );
my $attrs_re = make_re('(?::(\w+)\s*)*');
my $attr_re  = make_re(':(\w+)\s*');

sub parse_attrs {
    my $attrs = shift;
    my $default = shift || {};

    my $result = {%$default};
    $result->{$1} = 1 while $attrs =~ /$attr_re/g;
    return $result;
}

=item C<parse_vtable($file)>

Returns a reference to an array containing

  [ return_type method_name parameters section MMD_type attributes ]

for each vtable function defined in C<$file>.  If it is not an MMD method,
C<MMD_type> is -1.

=cut

sub parse_vtable {

    my $file    = shift;
    my $vtable  = [];
    my $mmd     = [];
    my $fh      = FileHandle->new( $file, O_RDONLY ) or die "Can't open $file for reading: $!\n";
    my $section = 'MAIN';

    my $default_attrs = {};
    while (<$fh>) {
        chomp;

        s/\s+$//;
        next if /^\s*#/ or /^$/;

        if (/^\[(\w+)\]\s*($attrs_re)/) {
            $section       = $1;
            $default_attrs = parse_attrs($2);
        }
        elsif (
            m/^\s*
            ($type_re)\s+
            ($ident_re)\s*
            \(($arglist_re)\)
            (?:\s+(MMD_\w+))?\s*($attrs_re)$/x
            )
        {
            my $mmdop = defined $4 ? $4 : -1;
            my $entry = [ $1, $2, $3, $section, $mmdop, parse_attrs( $5, $default_attrs ) ];

            if ( defined $4 ) {
                push @{$mmd}, $entry;
            }
            else {
                push @{$vtable}, $entry;
            }
        }
        else {
            die "Syntax error at $file line " . $fh->input_line_number() . "\n";
        }
    }

    # We probably should sort on insert, but this is easier for now. And it's
    # compile time, so it's not all that important.
    return [ @{$mmd}, sort { $a->[1] cmp $b->[1] } @{$vtable} ];
}

=item C<vtbl_defs($vtable)>

Returns the C C<typedef> definitions for the elements in the referenced
vtable array.

=cut

sub vtbl_defs {
    my $vtable = shift;

    my $defs = q{};

    for my $entry ( @{$vtable} ) {
        next if ( $entry->[4] =~ /MMD_/ );

        # Put arg annotations on points if appropriate
        my @args = split( /\s*,\s*/, $entry->[2] );
        for my $arg ( @args ) {
            if ( $arg =~ /^STRING\b/ ) {
                # It would be nice if we could const STRINGs but they might have to calculate a hashval.
                $arg = "ARGMOD($arg)";
            }
        }

        # The source PMC can always get modified.
        my $args = join( ', ', 'PARROT_INTERP', 'ARGMOD(PMC *pmc)', @args);
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

    my $struct = q{};

    $struct = <<'EOF';
typedef enum {
    VTABLE_IS_CONST_FLAG     = 0x001,
    VTABLE_HAS_CONST_TOO     = 0x002,
    VTABLE_PMC_NEEDS_EXT     = 0x004,
    VTABLE_DATA_IS_PMC       = 0x008,
    VTABLE_PMC_IS_SINGLETON  = 0x010,
    VTABLE_IS_SHARED_FLAG    = 0x020,
    VTABLE_IS_CONST_PMC_FLAG = 0x040,
    VTABLE_HAS_READONLY_FLAG = 0x080,
    VTABLE_IS_READONLY_FLAG  = 0x100
} vtable_flags_t;

typedef struct _vtable {
    PMC    *_namespace;     /* Pointer to namespace for this class */
    INTVAL  base_type;      /* 'type' value for MMD */
    STRING *whoami;         /* Name of class this vtable is for */
    UINTVAL flags;          /* VTABLE flags (constant, is_ro, etc). */
    STRING *provides_str;   /* space-separated list of interfaces */
    Hash   *isa_hash;       /* Hash of class names */
    PMC    *pmc_class;      /* for PMCs: a PMC of that type
                               for objects: the class PMC */
    PMC    *mro;            /* array PMC of [class, parents ... ] */
    const char *attribute_defs; /* list of PMC attributes */
    struct _vtable *ro_variant_vtable; /* A variant of this vtable with the
                                   opposite IS_READONLY flag */
    /* Vtable Functions */

EOF
    for my $entry ( @{$vtable} ) {
        next if ( $entry->[4] =~ /MMD_/ );
        $struct .= "    $entry->[1]_method_t $entry->[1];\n";
    }

    $struct .= <<'EOF';
    UINTVAL attr_size;      /* Size of the attributes struct */
EOF

    $struct .= "} _vtable;\n";

    return $struct;
}

=item C<vtbl_macros($vtable)>

Returns the C C<#define> definitions for the elements in the referenced
vtable array.

=cut

sub vtbl_macros {
    my $vtable = shift;

    my $macros = <<'EOM';

/*
 * vtable accessor macros
 * as vtable functions might get moved around internally
 * these macros hide the details
 */

EOM
    for my $entry ( @{$vtable} ) {
        next if ( $entry->[4] =~ /MMD_/ );
        my @args = split /,\s*/, $entry->[2];
        s/^ARG[_A-Z]+\((.+)\)/$1/ for @args; # Strip annotations, if any
        unshift @args, "i interp", "p pmc";
        my $args = join ', ', map { ( split / /, $args[$_] )[-1] } ( 0 .. $#args );
        $macros .= <<"EOM";
#define VTABLE_$entry->[1]($args) \\
    (pmc)->vtable->$entry->[1]($args)
EOM
    }
    # Slot numbers
    $macros .= <<"EOM";
/*
 * vtable slot names
 */
EOM
    my $vtable_slot_num = 9;
    for my $entry ( @{$vtable} ) {
        my $uc_meth = uc $entry->[1];
        $macros .= <<"EOM";
#define PARROT_VTABLE_SLOT_${uc_meth} ${vtable_slot_num}
EOM
        ++$vtable_slot_num;
    }

    # finally the name mapping
    $macros .= <<'EOM';

#define PARROT_VTABLE_LOW 9

static PARROT_OBSERVER const char * const Parrot_vtable_slot_names[] = {
    "",   /* Pointer to namespace for this class */
    "",   /* 'type' value for MMD */
    "",   /* Name of class this vtable is for */
    "",   /* VTABLE flags (constant, is_ro, etc). */
    "",   /* space-separated list of interfaces */
    "",   /* space-separated list of classes */
    "",   /* class */
    "",   /* mro */
    "",   /* ro_variant_vtable */

    /* Vtable Functions */
EOM
    my $num_vtable_funcs = 0;
    for my $entry ( @{$vtable} ) {
        next if ( $entry->[4] =~ /MMD_/ );
        $num_vtable_funcs++;
        $macros .= <<"EOM";
        \"$entry->[1]\",
EOM
    }
    $macros .= <<"EOM";
    NULL
};

#define NUM_VTABLE_FUNCTIONS $num_vtable_funcs

EOM

    $macros;
}

=item C<vtbl_embed($vtable)>

Returns the C function definitions to call the vtable functions on a PMC for the
elements in the referenced vtable array.

=cut

sub vtbl_embed {
    my $vtable = shift;

    my $funcs  = q{};
    my $protos = q{};

    for my $entry (@$vtable) {
        my ( $return_type, $name, $params, $section, $mmd ) = @$entry;
        next unless $mmd eq '-1';

        my @params = parse_params($params);
        my @sig    = ( 'PARROT_INTERP', 'Parrot_PMC pmc' );
        my @args   = ( 'interp', 'pmc' );

        while ( my ( $type, $name ) = splice( @params, 0, 2 ) ) {
            eval {
                push @sig,  find_type($type) . ' ' . $name;
                push @args, $name;
            };
        }

        next if $@;

        # these are internals-ish and should not be exposed
        next if $name =~ m/^(destroy|mark|invoke)$/;

        my $signature = join( ', ', @sig );
        my $arguments = join( ', ', @args );

        my $ret_type = find_type($return_type);

        $protos .= sprintf "PARROT_EXPORT %s Parrot_PMC_%s( %s );\n", $ret_type, $name,
            $signature;

        # make sure the bare POD here doesn't appear in this module's perldoc
        (my $func_header =<< "  END_HEADER") =~ s/^    //mg;
    /*

    =item C<%s
    %s(%s)>

    =cut

    */

    PARROT_EXPORT %s
    Parrot_PMC_%s( %s )
    {
  END_HEADER

        $funcs .= sprintf $func_header, ( $ret_type, $name, $signature ) x 2;

        $funcs .= "    $ret_type retval;\n" unless $ret_type eq 'void';
        $funcs .= "    PARROT_CALLIN_START( interp );\n    ";
        $funcs .= "retval = " unless $ret_type eq 'void';
        $funcs .= "VTABLE_$name( $arguments );
    PARROT_CALLIN_END( interp );
    return";
        $funcs .= " retval" unless $ret_type eq 'void';
        $funcs .= ";\n}\n\n";

    }

    return ( $funcs, $protos );
}

sub find_type {
    my $type = shift;

    my %typemap = (
        'STRING*'   => 'Parrot_String',
        'void*'     => 'void*',
        'INTVAL'    => 'Parrot_Int',
        'PMC*'      => 'Parrot_PMC',
        'FLOATVAL'  => 'Parrot_Float',
        'void'      => 'void',
        'UINTVAL'   => 'Parrot_Int',
        'size_t'    => 'size_t',
        'opcode_t*' => 'Parrot_Opcode*',
    );

    die "Unknown type $type\n" unless exists $typemap{$type};

    return $typemap{$type};
}

sub parse_params {
    my $params = shift;

    my @params;

    while ( $params =~ m/(\w+\*?) (\w+)/g ) {
        push @params, $1, $2;
    }

    return @params;
}

=back

=head1 SEE ALSO

=over 4

=item F<tools/build/vtable_extend.pl>

=item F<tools/build/pmc2c.pl>

=item F<tools/build/vtable_h.pl>

=item F<tools/dev/gen_class.pl>

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
