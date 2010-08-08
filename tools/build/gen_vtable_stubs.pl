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

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";
use Parrot::Vtable;
use IO::File;
use Fcntl qw(:DEFAULT :flock);

my %param_type = (
    'PMC*'     => 'P',
    'INTVAL'   => 'I',
    'FLOATVAL' => 'F',
    'STRING*'  => 'S'
);

my $dynpmc_file = 'src/dynpmc/instrumentclass.pmc';
my $dynpmc_fh = IO::File->new($dynpmc_file, O_RDWR | O_CREAT);

die "Could not open $dynpmc_file!" if !$dynpmc_fh;

flock($dynpmc_fh, LOCK_EX) or die "Cannot lock $dynpmc_file!";

# Parse the vtable entries.
my $vtbl = parse_vtable("$FindBin::Bin/../../src/vtable.tbl");

# Process the entries.
my(%groups, @entries, @prototypes, @stubs);
for (@$vtbl) {
    my @entry = @$_;
    $entry[3] = lc $entry[3]; # lowercase group

    push @{$groups{'all'}}, $entry[1];
    push @{$groups{$entry[3]}}, $entry[1];

    push @prototypes, gen_prototype(@entry);
    push @stubs, gen_stub(@entry);
    push @entries, \@entry;
}

my %placeholders = (
    'vtable prototypes'            => join("\n", map { chomp; $_; } @prototypes),
    'vtable stubs'                 => join("\n", map { chomp; $_; } @stubs),
    'vtable mapping name stubs'    => gen_mapping_name_stubs(@entries),
    'vtable mapping name offset'   => gen_mapping_name_offset(@entries),
    'vtable mapping name original' => gen_mapping_name_original(@entries),
    'vtable mapping group items'   => gen_mapping_group_items(\%groups),
    'vtable mapping item groups'   => gen_mapping_item_groups(@entries)
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

$dynpmc_fh->close();

# Write to the file.
$dynpmc_fh = IO::File->new($dynpmc_file, O_WRONLY | O_CREAT | O_TRUNC)
or die "Could not write to file $dynpmc_file!";

flock($dynpmc_fh, LOCK_EX);
print $dynpmc_fh join("\n", @contents)."\n";
flock($dynpmc_fh, LOCK_UN);

$dynpmc_fh->close();

sub gen_prototype {
    my($ret, $name, $params, $anno) = @_;

    if(length $params > 0) { $params = ', '.$params; }

    return <<PROTO;
static $ret stub_$name(PARROT_INTERP, PMC *pmc$params);
PROTO
}

sub gen_stub {
    my($ret, $name, $args, $group) = @_;

    # Process the parameter list.
    my @param_types = ();
    my @param_names = ();
    my $param_flat;
    my $param_format;
    my $arg;
    foreach $arg (split /\s*,\s*/, $args) {
        chomp $arg;
        if($arg eq '') { next; }

        my @tokens = split(/\s+/, $arg);
        push @param_types, ($param_type{$tokens[0]} || 'V');
        push @param_names, $tokens[1];
    }
    unshift @param_names, 'pmc';
    $param_flat   = join(', ', @param_names);
    $param_format = "P".join('', @param_types);
    if($args ne '') { $args = ', '.$args; }

    # Prepare the return value.
    my($ret_declaration, $ret_receive, $ret_return, $ret_pack) = ('', '', '', '');
    if($ret ne 'void') {
        $ret_declaration = "\n    $ret ret; PMC *ret_pack;";
        $ret_receive     = "ret = ";
        $ret_return      = "\n    return ret;";

        my $type = ($param_type{$ret} || 'V');
        $ret_pack = "\n".<<PACK;
    ret_pack = instrument_pack_params(supervisor, "$type", ret);
    VTABLE_set_pmc_keyed_str(supervisor, data, CONST_STRING(supervisor, "return"), ret_pack);
PACK
        chomp $ret_pack;
    }

    # Prepare the event string to be appended to the the event prefix.
    my $event_entry = join '::', ('vtable',$group,$name);

    # Return the generated stub.
    return <<CODE;
static
$ret stub_$name(PARROT_INTERP, PMC *pmc$args) {$ret_declaration
    VTABLE_STUB_VARS;
    VTABLE_STUB_SETUP;
    params = instrument_pack_params(supervisor, "$param_format", $param_flat);
    VTABLE_push_string(supervisor, event_array,
                       CONST_STRING(supervisor, "$event_entry"));
    VTABLE_STUB_CALL_PRE;
    $ret_receive((_vtable *)orig_vtable)->$name(interp, $param_flat);$ret_pack
    VTABLE_STUB_CALL_POST;$ret_return
}

CODE
}

sub gen_mapping_name_stubs {
    my @entries = @_;
    return join("\n", map {
        my $name = @{$_}[1];
        my $stub = <<STUB;
    parrot_hash_put(interp, vtable_name_stubs,
        CONST_STRING(interp, "$name"), stub_$name);
STUB
        chomp $stub;
        $stub;
    } @entries);
}

sub gen_mapping_name_original {
    my @entries = @_;
    return join("\n", map {
        my $name = @{$_}[1];
        my $stub = <<STUB;
    parrot_hash_put(interp, orig_hash,
        CONST_STRING(interp, "$name"), vt_orig->$name);
STUB
        chomp $stub;
        $stub;
    } @entries);
}

sub gen_mapping_name_offset {
    my @entries = @_;
    return join("\n", map {
        my $name = @{$_}[1];
        my $stub = <<STUB;
    parrot_hash_put(interp, instr_hash,
        CONST_STRING(interp, "$name"), &(vt_instr->$name));
STUB
        chomp $stub;
        $stub;
    } @entries);
}

sub gen_mapping_group_items {
    my %groups = %{shift @_};

    my $key;
    my @ret;
    foreach $key (keys %groups) {
        my $item;
        my $entry = <<PRE;
    temp = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
PRE

        foreach $item (@{$groups{$key}}) {
            $entry .= <<ENTRY;
    VTABLE_push_string(interp, temp, CONST_STRING(interp, "$item"));
ENTRY
        }

        $key = lc $key;
        $entry .= <<POST;
    parrot_hash_put(interp, vtable_group_items,
        CONST_STRING(interp, "$key"), temp);
POST

        chomp $entry;
        push @ret, $entry;
    }

    return join("\n\n", @ret);
}

sub gen_mapping_item_groups {
    my @entries = @_;
    return join("\n", map {
        my $name = @{$_}[1];
        my $group = @{$_}[3];
        my $stub = <<STUB;
    parrot_hash_put(interp, vtable_item_groups, CONST_STRING(interp, "$name"),
                    CONST_STRING(interp, "$group"));
STUB
        chomp $stub;
        $stub;
    } @entries);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
