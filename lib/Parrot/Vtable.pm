package Parrot::Vtable;

use FileHandle;

use Exporter;
use strict;

@Parrot::Vtable::ISA = qw(Exporter);
@Parrot::Vtable::EXPORT = qw(parse_vtable vtbl_defs vtbl_struct);

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
        
    while(<$fh>) {

        chomp;

        next if /^\s*#/ or /^\s*$/;
        
        if (/^\s*($type_re)\s+($ident_re)\s*\(($arglist_re)\)\s*$/) {
            push @{$vtable}, [ $1, $2, $3 ];
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
    INTVAL int_type;
    INTVAL float_type;
    INTVAL num_type;
    INTVAL string_type;

    /* Vtable Functions */

EOF
    for $entry (@{$vtable}) {
        $struct .= "    $entry->[1]_method_t $entry->[1];\n";
    }
    
    $struct .= "};\n";
    
    return $struct;
}

"SQUAWK";

=head1 NAME

Parrot::Vtable - Internal functions for manipulating vtables

=head1 DESCRIPTION

No user-serviceable parts inside.
