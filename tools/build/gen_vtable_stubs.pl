#! perl
# $Id$

# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

tools/build/gen_vtable_stubs.pl

=head1 DESCRIPTION

Generate VTable stubs for use in InstrumentVtable.

Read the vtable entries from src/vtable.tbl and from
there, generate the prototypes, stubs and groups and
put the information in the appropriate placeholders in
src/dynpmc/instrumentvtable.pmc.

=cut

use warnings;
use strict;

use IO::File;
use Fcntl qw(:DEFAULT :flock);

my $dynpmc_file = 'src/dynpmc/instrumentvtable.pmc';
my $vtable_file = 'src/vtable.tbl';

my $dynpmc_fh = IO::File->new($dynpmc_file, O_RDWR | O_CREAT);
my $vtable_fh = IO::File->new('src/vtable.tbl', O_RDWR | O_CREAT);

die "Could not open $dynpmc_file!" if !$dynpmc_fh;
die "Could not open $vtable_file!" if !$vtable_fh;

flock($dynpmc_fh, LOCK_EX) or die "Cannot lock $dynpmc_file!";
flock($vtable_fh, LOCK_EX) or die "Cannot lock $vtable_file!";

my(%groups, @entries, @prototypes, @stubs);
my $cur_group = 'CORE';
while(<$vtable_fh>) {
    # Remove whitespace and go on to the next line
    # for comments and empty lines.
    chomp;
    if(m/^#/) { next; }
    if(m/^\s*$/) { next; }

    # Check for group change.
    if(m/^\[(\w+)\]$/) {
        $cur_group = $1;
        next;
    }

    # Separate out the components.
    # type name(params) annotations
    if(m/^(.+)\s+(.+)\s*\((.+)\)\s*(.*)$/) {
        # Generate the components.
        my @data = ($1, $2, $3, $4);
        #print "($1) ($2) ($3) ($4)\n";

        # Prepend the first 2 parameters that all vtable entries will
        # receive: PARROT_INTERP, PMC *pmc
        $data[2] = ($data[2] eq '')
                 ? 'PARROT_INTERP, PMC* pmc'
                 : 'PARROT_INTERP, PMC* pmc, '.$data[2];

        # Set the groups that this vtable entry belongs to.
        my @groups = ($cur_group);
        my $annotation;
        foreach $annotation (split /\s+/, $data[3]) {
            $annotation =~ s/://;
            push @{$groups{$annotation}}, $data[1];
            push @groups, $annotation;
        }
        push @{$groups{$cur_group}}, $data[1];
        push @data, \@groups;

        push @prototypes, gen_prototype(@data);
        push @stubs, gen_stub(@data);
        push @entries, $data[1];


    }
}

my %placeholders = (
    'vtable prototypes' => join('', @prototypes),
    'vtable stubs'      => join('', @stubs),
    'vtable mappings'   => gen_mapping_string(@entries),
    'vtable groupings'     => gen_grouping_string(\%groups, \@entries)
);

my @contents = ();
my($ignore, $matching_string) = (0, undef);
while(<$dynpmc_fh>) {
    chomp;

    # If we are supposed to ignore, check for end of placeholder
    # before ignoring.
    if($ignore) {
        if(m/^\s*\/\* END (.*) \*\/$/) {
            if($1 eq $matching_string) {
                push @contents, $_;
                $ignore = 0;
            }
        }
        next;
    }

    # Push into @contents and check if we have the beginnings of a placeholder.
    push @contents, $_;
    if(m/^\s*\/\* BEGIN (.*) \*\/$/) {
        $matching_string = $1;
        $ignore          = 1;
        push @contents, $placeholders{$matching_string};
    }
}

flock($dynpmc_fh, LOCK_UN) or die "Cannot unlock $dynpmc_file!";
flock($vtable_fh, LOCK_UN) or die "Cannot unlock $vtable_file!";

$dynpmc_fh->close();
$vtable_fh->close();

# Write to the file.
$dynpmc_fh = IO::File->new($dynpmc_file, O_WRONLY | O_CREAT | O_TRUNC)
or die "Could not write to file $dynpmc_file!";

flock($dynpmc_fh, LOCK_EX);
print $dynpmc_fh join("\n", @contents)."\n";
flock($dynpmc_fh, LOCK_UN);

$dynpmc_fh->close();

sub gen_prototype {
    my($ret, $name, $params, $anno) = @_;

    return <<PROTO;
static $ret stub_$name($params);
PROTO
}

sub gen_stub {
    my($ret, $name, $params, $anno, $groups) = @_;

    # Process the parameter list.
    my @param_types = ();
    my @param_names = ();
    my $param;
    foreach $param (split /\s*,\s*/, $params) {
        chomp $param;

        if($param eq '') { next; }

        if($param eq 'PARROT_INTERP') {
            push @param_types, 'Parrot_Interp';
            push @param_names, 'interp';
            next;
        }

        my @tokens = split(/\s+/, $param);
        push @param_types, $tokens[0];
        push @param_names, $tokens[1];
    }

    my $param_list_flat = (scalar(@param_names)) ? join(', ', @param_names) : '';

    my($ret_dec, $ret_ret, $ret_last) = ('','','');
    if ($ret ne 'void') {
        $ret_dec  = '    '.$ret.' ret;'."\n";
        $ret_ret  = ' ret =';
        $ret_last = ' ret';
    }

    # Prepare to pass the parameter list to instrument.
    my $instr_params = '';
    for(my $i = 1; $i < @param_types; $i++) {
        if($param_types[$i] eq 'size_t' || $param_types[$i] eq 'UINTVAL'
        || $param_types[$i] eq 'INTVAL') {
            $instr_params .= <<INTEGER;
    temp = Parrot_pmc_new(supervisor, enum_class_Integer);
    VTABLE_set_integer_native(supervisor, temp, $param_names[$i]);
    VTABLE_push_pmc(supervisor, params, temp);
INTEGER
        }
        elsif($param_types[$i] eq 'FLOATVAL') {
            $instr_params .= <<FLOAT;
    temp = Parrot_pmc_new(supervisor, enum_class_Float);
    VTABLE_set_number_native(supervisor, temp, $param_names[$i]);
    VTABLE_push_pmc(supervisor, params, temp);
FLOAT
        }
        elsif($param_types[$i] eq 'PMC*') {
            $instr_params .= <<PMC;
    VTABLE_push_pmc(supervisor, params, $param_names[$i]);
PMC
        }
        elsif($param_types[$i] eq 'STRING*') {
            $instr_params .= <<STRING;
    temp = Parrot_pmc_new(supervisor, enum_class_String);
    VTABLE_set_string_native(supervisor, temp, $param_names[$i]);
    VTABLE_push_pmc(supervisor, params, temp);
STRING
        }
        else {
            # Assume pointer.
            $instr_params .= <<POINTER;
    temp = Parrot_pmc_new(supervisor, enum_class_Pointer);
    VTABLE_set_pointer(supervisor, temp, $param_names[$i]);
    VTABLE_push_pmc(supervisor, params, temp);
POINTER
        }
    }

    # Set up the individual group events for this
    # stub.
    my $events = '';
    my $group;
    foreach $group (@{$groups}) {
        $group = lc $group;
        $events .= <<EVENT;
    raise_vtable_event(supervisor, interp, pmc, data,
                   CONST_STRING(supervisor, "$group"),
                   CONST_STRING(supervisor, "$name"));
EVENT
    }

    return <<CODE;
static
$ret stub_$name($params) {
    PMC *instr_vt, *data;
    _vtable *orig_vtable;
    Parrot_Interp supervisor;
    PMC *temp;
    PMC *params = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
$ret_dec
    instr_vt = (PMC *) parrot_hash_get(interp, Instrument_Vtable_Entries, pmc->vtable);

    GETATTR_InstrumentVtable_original_vtable(interp, instr_vt, orig_vtable);
    GETATTR_InstrumentVtable_supervisor(interp, instr_vt, supervisor);

   $ret_ret orig_vtable->$name($param_list_flat);

$instr_params

    data = Parrot_pmc_new(supervisor, enum_class_Hash);
    VTABLE_set_pmc_keyed_str(supervisor, data,
        CONST_STRING(supervisor, "parameters"),
        params);

$events

    return$ret_last;
}

CODE
}

sub gen_mapping_string {
    my @entries = @_;

    my($name, @orig, @instr, @stubs);
    foreach $name (@entries) {
        my $orig = <<OFFSET;
    parrot_hash_put(interp, orig, CONST_STRING(interp, "$name"),
                orig_vtable->$name);
OFFSET
        push @orig, $orig;

        my $instr = <<INSTR;
    parrot_hash_put(interp, instr, CONST_STRING(interp, "$name"),
                &(instr_vtable->$name));
INSTR
        push @instr, $instr;

        my $stub_entry = <<STUB_ENTRY;
        parrot_hash_put(interp, stub, CONST_STRING(interp, "$name"),
                        stub_$name);
STUB_ENTRY
        push @stubs, $stub_entry;
    }

    return <<MAPPINGS;
    /* Build mappings for name -> original function.vtable entry */
@orig

    /* Build mappings for name -> instrumented function.vtable entry. */
@instr

    /* Build mappings for name -> stub_function if it wasn't done already. */
    if (parrot_hash_size(interp, stub) == 0) {
@stubs
    }
MAPPINGS
}

sub gen_grouping_string {
    my($groups, $entries) = @_;
    my($group, $entry);

    my @groups;
    foreach $group (keys %{$groups}) {
        my @list = @{$groups->{$group}};
        $group = lc($group);

        my $ret .= <<PRE;
if (Parrot_str_equal(INTERP, name, CONST_STRING(INTERP, "$group"))) {
PRE

        foreach $entry (@list) {
            $ret .= <<ENTRY;
           VTABLE_push_string(INTERP, list,
               CONST_STRING(INTERP, "$entry"));
ENTRY
        }

        $ret .= <<END;
        }
END

        push @groups, $ret;
    }

    return '        '.join('        else ', @groups);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
