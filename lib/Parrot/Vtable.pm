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
struct _vtable {
    /* XXX - What on earth are these for??? */
    struct PACKAGE *package;
    INTVAL base_type;
    STRING* whoami;
    PMC* method_table;
    INTVAL reserved1;
    INTVAL reserved2;

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
	my $args = join ', ', map { (split / /, $args[$_])[1] } (0..@args);
	$macros .= <<"EOM";
#define VTABLE_$entry->[1]($args) \\
    (pmc)->vtable->$entry->[1]($args)
EOM
    }
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

