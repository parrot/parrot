# Copyright (C) 2004-2009, Parrot Foundation.

=head1 NAME

Parrot::Docs::Section::C - C source code documentation section

=head1 SYNOPSIS

    use Parrot::Docs::Section::C;

=head1 DESCRIPTION

A documentation section describing all the C source code in Parrot.

=head2 Class Methods

=over

=cut

package Parrot::Docs::Section::C;

use strict;
use warnings;

use base qw( Parrot::Docs::Section );

use Parrot::Distribution;

=item C<header_item($text, @names)>

Returns a C header files documentation item.

=cut

sub c_header_item {
    my $self = shift;

    return $self->c_item( shift, 'headers' => [@_] );
}

=item C<c_source_item($text, @names)>

Returns a C source files documentation item.

=cut

sub c_source_item {
    my $self = shift;

    return $self->c_item( shift, 'sources' => [@_] );
}

=item C<c_pair_item($text, $name)>

Returns a new C source and header file documentation item.

=cut

sub c_pair_item {
    my $self = shift;

    return $self->c_item( shift, 'pairs' => [@_] );
}

=item C<c_item($text, %contents)>

Returns a new C source and/or header files documentation item. Recognized keys
for C<%contents> are C<pairs>, C<sources>, C<headers> and C<contents>.

=cut

sub c_item {
    my $self     = shift;
    my $text     = shift;
    my %contents = @_;
    my @contents = ();
    my $dist     = Parrot::Distribution->new;

    if ( exists $contents{'pairs'} ) {
        foreach my $name ( @{ $contents{'pairs'} } ) {
            push @contents, $dist->relative_path( $dist->c_source_file_with_name($name) ),
                $dist->relative_path( $dist->c_header_file_with_name($name) );
        }
    }

    if ( exists $contents{'sources'} ) {
        foreach my $name ( @{ $contents{'sources'} } ) {
            push @contents, $dist->relative_path( $dist->c_source_file_with_name($name) );
        }
    }

    if ( exists $contents{'headers'} ) {
        foreach my $name ( @{ $contents{'headers'} } ) {
            push @contents, $dist->relative_path( $dist->c_header_file_with_name($name) );
        }
    }

    if ( exists $contents{'contents'} ) {
        push @contents, @{ $contents{'contents'} };
    }

    return $self->new_item( $text, grep { defined } @contents );
}

=item C<new()>

Returns a new section.

=cut

sub new {
    my $self = shift;

    return $self->SUPER::new(
        'C', 'c.html', '',
        $self->new_group(
            'General',
            '',
            $self->c_header_item( '', 'parrot' ),
            $self->c_pair_item( '', 'warnings' ),
            $self->c_pair_item( '', 'longopt' ),
        ),
        $self->new_group(
            'Interpreter',
            '',
            $self->c_pair_item( '', 'embed' ),
            $self->c_pair_item( '', 'global_setup' ),
            $self->c_item(
'Parrot Interpreter: Callback Function Handling; Creation and Destruction; Misc functions; Run Ops and Methods.',
                'pairs'   => ['interpreter'],
                'sources' => [ 'inter_cb', 'inter_create', 'inter_misc' ],
                'headers' => ['interp_guts']
            ),
            $self->c_pair_item( '', 'exit' ),
        ),
        $self->new_group(
            'Registers and Stacks',
            '',
            $self->c_item( '', 'pairs' => ['register'], ),
            $self->c_item( '', 'pairs'   => ['stacks'], ),
            $self->c_header_item( '', 'enums' ),
        ),
        $self->new_group(
            'Ops', '',
            $self->c_pair_item( '', 'runops_cores' ),
            $self->c_header_item( '', 'op' ),
            $self->c_header_item( '', 'oplib' ),
        ),
        $self->new_group(
            'Bytecode',
            '',
            $self->c_item( 'Parrot Packfile API and utilities.', 'contents' => ['src/packfile'], ),
            $self->c_source_item( '', 'byteorder' ),
        ),
        $self->new_group(
            'Data Types',
            '',
            $self->c_pair_item( '', 'datatypes' ),
            $self->c_pair_item( '', 'hash' ),
            $self->c_pair_item( '', 'list' ),
        ),
        $self->new_group(
            'PMCs',
            '',
            $self->c_pair_item( '', 'pmc' ),
            $self->c_header_item( '', 'vtables' ),
            $self->c_pair_item( '', 'key' ),
            $self->c_pair_item( '', 'sub' ),
            $self->c_header_item( '', 'pobj' ),
            $self->c_pair_item( '', 'pmc_freeze' ),
        ),
        $self->new_group( 'Objects', '', $self->c_pair_item( '', 'oo' ), ),
        $self->new_group(
            'Strings',
            '',
            $self->c_item(
                '',
                'sources' => [ 'string/api' ],
                'headers' => [ 'string', 'string_funcs' ]
            ),
            $self->c_item( 'String encodings', 'contents' => ['src/string/encoding'] ),
            $self->c_item(
                'Miscellaneous, <code>sprintf</code> and utility functions.',
                'pairs'   => ['misc'],
                'sources' => [ 'spf_render', 'spf_vtable', 'utils' ]
            ),
        ),
        $self->new_group( 'Multi-methods', '', $self->c_pair_item( '', 'multidispatch' ), ),
        $self->new_group( 'Extensions',    '', $self->c_pair_item( '', 'extend' ), ),
        $self->new_group(
            'JIT', '',
            $self->c_item(
                'Parrot\'s JIT subsystem, with support for stabs files.',
                'pairs'   => ['jit'],
                'sources' => [ 'jit_debug', 'jit_debug_xcoff' ]
            ),
        ),
        $self->new_group(
            'Exec', '',
            $self->c_item(
                'Parrot\'s native executable subsystem.',
                'pairs'   => [ 'exec', 'exec_save' ],
                'sources' => ['exec_start']
            ),
        ),
        $self->new_group(
            'IO', '',
            $self->c_item(
                'Parrot\'s layer-based I/O subsystem.',
                'headers'  => ['io'],
                'contents' => ['src/io']
            ),
        ),
        $self->new_group(
            'Threads', '',
            $self->c_pair_item( '', 'thread' ),
            $self->c_header_item( '', 'thr_pthread' ),
        ),
        $self->new_group(
            'Exceptions', '',
            $self->c_pair_item( '', 'exceptions' )
        ),
        $self->new_group(
            'Memory', '',
            $self->c_pair_item( '', 'memory' ),
            $self->c_source_item( '', 'malloc' ),
            $self->c_source_item( '', 'malloc-trace' ),
            $self->c_source_item( '', 'mark_sweep' ),
        ),
        $self->new_group(
            'Garbage Collection',
            '',
            $self->c_item( 'Parrot\'s garbage collection subsystem.', 'contents' => ['src/gc'] ),
        ),
        $self->new_group(
            'Debugging',
            '',
            $self->c_item(
                '',
                'pairs'   => ['debug'],
                'sources' => ['parrot_debugger']
            ),
            $self->c_source_item( '', 'pbc_disassemble' ),
            $self->c_pair_item( '', 'trace' ),
            $self->c_source_item( '', 'test_main' ),
        ),
    );
}

=back

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
