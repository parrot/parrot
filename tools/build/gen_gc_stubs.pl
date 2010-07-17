#! perl
# $Id$

# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

tools/build/gen_gc_stubs.pl

=head1 DESCRIPTION

Generate GC stubs for use in InstrumentGC.

Read the GC_Subsytem struct from src/gc/gc_private.h
and from there, generate the prototype and the stub
functions before putting in the the respective placeholders
in src/dynpmc/instrumentgc.pmc.

=cut

use warnings;
use strict;

use IO::File;
use Fcntl qw(:DEFAULT :flock);

my $dynpmc_file = 'src/dynpmc/instrumentgc.pmc';
my $source_file = 'src/gc/gc_private.h';

my $dynpmc_fh = IO::File->new($dynpmc_file, O_RDWR | O_CREAT);
my $source_fh = IO::File->new($source_file, O_RDWR | O_CREAT);

die "Could not open $dynpmc_file!" if !$dynpmc_fh;
die "Could not open $source_file!" if !$source_fh;

flock($dynpmc_fh, LOCK_EX) or die "Cannot lock $dynpmc_file!";
flock($source_fh, LOCK_EX) or die "Cannot lock $source_file!";

my(%groups, @entries, @prototypes, @stubs, %stub_memory_sizes);
init_stub_memory_sizes(\%stub_memory_sizes);

# Read the whole file.
my $contents = join('', map { chomp;$_; } <$source_fh>);

# Extract struct GC_Subsystem.
$contents =~ /typedef struct GC_Subsystem {(.*)} GC_Subsystem;/;
my $subsystem      = $1;

# Remove comments.
$subsystem =~ s/\/\*.*?\*\///g;

# Extract the entries.
foreach (split /\s*;\s*/, $subsystem) {
    chomp;

    if(/^\s*(.*)\s*\(\*(.+)\)\s*\((.*)\)$/) {
        my @data = ($1, $2, $3);
        $data[2] = fix_params($data[2]);

        # Ignore is_blocked_mark, is_blocked_sweep, get_gc_info.
        next if $data[1] eq 'is_blocked_mark'
             || $data[1] eq 'is_blocked_sweep'
             || $data[1] eq 'get_gc_info';

        # Deduce the group.
        my @tokens = split(/_/, $data[1]);
        if($tokens[0] eq "allocate") {
            push(@{$groups{'allocate'}}, $data[1]);
            push @data, 'allocate';
        }
        elsif($tokens[0] eq "free") {
            push(@{$groups{'free'}}, $data[1]);
            push @data, 'free';
        }
        elsif($tokens[0] eq "reallocate") {
            push(@{$groups{'reallocate'}}, $data[1]);
            push @data, 'reallocate';
        }
        else {
            push(@{$groups{'administration'}}, $data[1]);
            push @data, 'administration';
        }
        push @{$groups{'all'}}, $data[1];

        push @prototypes, gen_prototype(@data);
        push @stubs, gen_stub(@data);

        push @entries, \@data;
    }
}

my %placeholders = (
    'gc struct entries'        => join("\n", map { s/^\s+//;chomp; $_.';'; }
                                             split(/\s*;\s*/, $subsystem)),
    'gc prototypes'            => join("\n", map { chomp; $_; } @prototypes),
    'gc stubs'                 => join("\n", map { chomp; $_; } @stubs),
    'gc mapping name stubs'    => gen_mapping_name_stubs(@entries),
    'gc mapping name offset'   => gen_mapping_name_offset(@entries),
    'gc mapping name original' => gen_mapping_name_original(@entries),
    'gc mapping group items'   => gen_mapping_group_items(\%groups),
    'gc mapping item groups'   => gen_mapping_item_groups(@entries)
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
flock($source_fh, LOCK_UN) or die "Cannot unlock $source_file!";

$dynpmc_fh->close();
$source_fh->close();

# Write to the file.
$dynpmc_fh = IO::File->new($dynpmc_file, O_WRONLY | O_CREAT | O_TRUNC)
or die "Could not write to file $dynpmc_file!";

flock($dynpmc_fh, LOCK_EX);
print $dynpmc_fh join("\n", @contents)."\n";
flock($dynpmc_fh, LOCK_UN);

$dynpmc_fh->close();

sub gen_prototype {
    my @data = @_;

    return <<PROTOTYPE;
$data[0] stub_$data[1]($data[2]);
PROTOTYPE
}

sub gen_stub {
    my($ret, $name, $params, $group) = @_;

    # Process the parameter list.
    my @param_types = ();
    my @param_names = ();
    my $param;
    my $param_count = 0;
    foreach $param (split /\s*,\s*/, $params) {
        $param_count++;
        chomp $param;

        if($param eq '') { next; }

        # First parameter is always an interp.
        if($param eq 'PARROT_INTERP') {
            push @param_types, 'Parrot_Interp';
            push @param_names, 'interp';
            next;
        }
        elsif($param_count == 1) {
            my @tokens = split(/\s+/, $param);
            push @param_types, $tokens[0];
            push @param_names, 'interp';
            next;
        }

        # Some parameters have more than 2 tokens,
        #  eg struct a* b
        my @tokens = split(/\s+/, $param);
        if(scalar(@tokens) > 2) {
            push @param_names, pop(@tokens);
            push @param_types, join(' ', @tokens);
        }
        else {
            push @param_types, $tokens[0];
            push @param_names, $tokens[1];
        }
    }

    my $param_list_flat = (scalar(@param_names)) ? join(', ', @param_names) : '';
    $param_count = 0;
    $params = join(', ', map { $_.' '.$param_names[$param_count++] } @param_types);

    my($ret_dec, $ret_ret, $ret_last) = ('','','');
    if ($ret !~ /^\s*void\s*$/) {
        $ret_dec  = '    '.$ret.' ret;'."\n";
        $ret_ret  = ' ret =';
        $ret_last = ' ret';
    }

    # Prepare to pass the parameter list to instrument.
    my $instr_params = '';
    for(my $i = 1; $i < @param_types; $i++) {
        if($param_types[$i] eq 'size_t' || $param_types[$i] eq 'UINTVAL') {
            $instr_params .= <<INTEGER;
    temp = Parrot_pmc_new(supervisor, enum_class_Integer);
    VTABLE_set_integer_native(supervisor, temp, $param_names[$i]);
    VTABLE_push_pmc(supervisor, params, temp);
INTEGER
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

    # For allocations and reallocations, expose the size of the allocation.
    my $alloc = $stub_memory_sizes{$name} || '';

    return <<STUB;
$ret stub_$name($params) {
    GC_Subsystem *gc_orig    = ((InstrumentGC_Subsystem *) interp->gc_sys)->original;
    Parrot_Interp supervisor = ((InstrumentGC_Subsystem *) interp->gc_sys)->supervisor;

    PMC *event_data;
    PMC *temp;
    PMC *params = Parrot_pmc_new(supervisor, enum_class_ResizablePMCArray);
$ret_dec

   $ret_ret gc_orig->$name($param_list_flat);

$instr_params
    event_data = Parrot_pmc_new(supervisor, enum_class_Hash);
    VTABLE_set_string_keyed_str(supervisor, event_data,
        CONST_STRING(supervisor, "type"),
        CONST_STRING(supervisor, "$name"));
    VTABLE_set_pmc_keyed_str(supervisor, event_data,
        CONST_STRING(supervisor, "parameters"),
        params);
$alloc
    raise_gc_event(supervisor, interp, CONST_STRING(supervisor, "$group"), event_data);

    return$ret_last;
}

STUB
}

sub gen_mapping_name_stubs {
    my @entries = @_;
    return join("\n", map {
        my $name = @{$_}[1];
        my $stub = <<STUB;
    parrot_hash_put(interp, gc_name_stubs,
        CONST_STRING(interp, "$name"),
        stub_$name);
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
        CONST_STRING(interp, "$name"),
        gc_orig->$name);
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
        CONST_STRING(interp, "$name"),
        &(gc_instr->$name));
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
    VTABLE_push_string(interp, temp,
                       CONST_STRING(interp, "$item"));
ENTRY
        }

        $entry .= <<POST;
    parrot_hash_put(interp, gc_group_items,
                    CONST_STRING(interp, "$key"),
                    temp);
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
    temp = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    VTABLE_push_string(interp, temp,
                       CONST_STRING(interp, "$group"));
    parrot_hash_put(interp, gc_item_groups,
        CONST_STRING(interp, "$name"),
        temp);
STUB
        chomp $stub;
        $stub;
    } @entries);
}

sub fix_params {
    my $params = shift;
    my @param_list;
    my $param;
    my $stub_count = 1;

    foreach $param (split(/\s*,\s*/, $params)) {
        # Fix void * to void* and similar.
        $param =~ s/(.*) \*/$1\* /;

        # Remove annotations, eg ARGMOD(Buffer* buf)
        $param =~ s/\w+\((.*)\)/$1/;

        # Add stub parameter names for unnamed parameters.
        # Eg, Buffer*, struct Fixed_Size_Pool*
        if($param ne 'PARROT_INTERP') {
            if($param !~ /^(.+)\s+(\w+)$/) {
                $param .= " stub_var".$stub_count++;
                #print $param."\n";
            }
        }

        push @param_list, $param;
    }

    return join(', ', @param_list);
}

sub init_stub_memory_sizes {
    my $ref = shift;

    my %sources = (
        'allocate_pmc_header'         => 'sizeof (PMC)',
        'allocate_string_header'      => 'sizeof (STRING)',
        'allocate_bufferlike_header'  => 'sizeof (Buffer)',
        'allocate_pmc_attributes'     => 'VTABLE_get_pmc_keyed_int(supervisor, params, 0)->vtable->attr_size',
        'allocate_string_storage'     => 'size',
        'allocate_buffer_storage'     => 'nsize',
        'allocate_fixed_size_storage' => 'size',
        'allocate_memory_chunk'       => 'size',
        'allocate_memory_chunk_with_interior_pointers' => 'size',
        'reallocate_string_storage'   => 'size',
        'reallocate_buffer_storage'   => 'newsize',
        'reallocate_memory_chunk'     => 'newsize',
        'reallocate_memory_chunk_with_interior_pointers' => 'newsize'
    );

    my $key;
    for $key (keys %sources) {
        my $source = $sources{$key};
        $ref->{$key} = <<SIZE;
    temp = Parrot_pmc_new(supervisor, enum_class_Integer);
    VTABLE_set_integer_native(supervisor, temp,
                              $source);
    VTABLE_set_pmc_keyed_str(supervisor, event_data,
                            CONST_STRING(supervisor, "size"),
                            temp);
SIZE
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
