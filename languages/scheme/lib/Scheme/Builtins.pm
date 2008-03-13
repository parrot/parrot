# $Id$
# Copyright (C) 2002-2007, The Perl Foundation.

package Scheme::Builtins;

# pragmata
use strict;
use warnings;
use 5.008;

# nice for debugging
use Data::Dumper;

my %built_ins = (
    # TODO: reunify 'display' with 'write'
    display => [
        [ '',                '#', 'Write function' ],
        [ '',                '.sub',        'display' ],
        [ '',                '.param pmc',  'arg1' ],
        [ '',                '.local pmc',  'elem' ],
        [ '',                qw( typeof S0 arg1 ) ],
        [ '',                qw( ne S0 'Undef' IS_NOT_UNDEF ) ],
        [ '',                'print',       '"()"' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_UNDEF',    'ne',     'S0', q{'Integer'}, 'IS_NOT_INTEGER' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_INTEGER',  'ne',     'S0', q{'Array'}, 'IS_NOT_ARRAY' ],
        [ '',                '#', '_dumper( arg1 )' ],
        [ '',                'print',  '"("' ],
        [ 'write_NEXT',      qw( set P6 arg1 ) ],
        [ '',                qw( set arg1 P6[0] ) ],
        [ '',                'write( arg1 )' ],
        [ '',                '#',  q{} ],
        [ '',                qw( set arg1 P6[1] ) ],
        [ '',                qw( typeof S0 arg1 ) ],
        [ '',                'eq',     'S0', q{'Undef'}, 'write_KET' ],
        [ '',                'ne',     'S0', q{'Array'}, 'write_DOT' ],
        [ '',                'print',  '" "' ],
        [ '',                'branch', 'write_NEXT' ],
        [ 'write_DOT',       'print',  q{" . "} ],
        [ '',                'write( arg1 )' ],
        [ 'write_KET',       'print',  '")"' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_ARRAY',    'ne',     'S0', q{'Boolean'}, 'IS_NOT_BOOLEAN' ],
        [ '',                'if', 'arg1',  'write_TRUE' ],
        [ 'write_FALSE',     'print',  q{'#f'} ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'write_TRUE',      'print',  q{'#t'} ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_BOOLEAN',  'ne',     'S0', q{'String'}, 'IS_NOT_STRING' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_STRING',   'ne',     'S0', q{'SchemeSymbol'}, 'IS_NOT_SYMBOL' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_SYMBOL',   '' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'write_FINISHED', '' ],
        [ '', '.end' ],
    ],
    write => [
        [ '',                '#', 'Write function' ],
        [ '',                '.sub',        'write' ],
        [ '',                '.param pmc',  'arg1' ],
        [ '',                '.local pmc',  'elem' ],
        [ '',                qw( typeof S0 arg1 ) ],
        [ '',                qw( ne S0 'Undef' IS_NOT_UNDEF ) ],
        [ '',                'print',       '"()"' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_UNDEF',    'ne',     'S0', q{'Integer'}, 'IS_NOT_INTEGER' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_INTEGER',  'ne',     'S0', q{'Array'}, 'IS_NOT_ARRAY' ],
        [ '',                '#', '_dumper( arg1 )' ],
        [ '',                'print',  '"("' ],
        [ 'write_NEXT',      qw( set P6 arg1 ) ],
        [ '',                qw( set arg1 P6[0] ) ],
        [ '',                'write( arg1 )' ],
        [ '',                '#',  q{} ],
        [ '',                qw( set arg1 P6[1] ) ],
        [ '',                qw( typeof S0 arg1 ) ],
        [ '',                'eq',     'S0', q{'Undef'}, 'write_KET' ],
        [ '',                'ne',     'S0', q{'Array'}, 'write_DOT' ],
        [ '',                'print',  '" "' ],
        [ '',                'branch', 'write_NEXT' ],
        [ 'write_DOT',       'print',  q{" . "} ],
        [ '',                'write( arg1 )' ],
        [ 'write_KET',       'print',  '")"' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_ARRAY',    'ne',     'S0', q{'Boolean'}, 'IS_NOT_BOOLEAN' ],
        [ '',                'if', 'arg1',  'write_TRUE' ],
        [ 'write_FALSE',     'print',  q{'#f'} ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'write_TRUE',      'print',  q{'#t'} ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_BOOLEAN',  'ne',     'S0', q{'String'}, 'IS_NOT_STRING' ],
        [ '',                'print',  q{'"'} ],
        [ '',                'print',  'arg1' ],
        [ '',                'print',  q{'"'} ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_STRING',   'ne',     'S0', q{'SchemeSymbol'}, 'IS_NOT_SYMBOL' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'IS_NOT_SYMBOL',   '' ],
        [ '',                'print',  'arg1' ],
        [ '',                'branch', 'write_FINISHED' ],
        [ 'write_FINISHED', '' ],
        [ '', '.end' ],
    ],
    apply => [
        ['# Apply function'],
        [ 'apply_ENTRY', 'set',    'P0',  'P5' ],
        [ '',            'set',    'P16', 'P6' ],
        [ '',            'typeof', 'S16', 'P16' ],
        [ '',            'set',    'I1',  0 ],
        [ '',            'set',    'I2',  0 ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P5',  'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P6', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P7',  'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P8', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P9',  'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P10', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P11', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P12', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P13', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P14', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '', 'set',     'P15', 'P16[0]' ],
        [ '', 'bsr',     'apply_HELP' ],
        [ '', 'eq',      'S16', q{'Undef'}, 'apply_CALL' ],
        [ '',            'set', 'P17', 'P16' ],
        [ 'apply_COUNT', 'ne',  'S16', q{'Undef'}, 'apply_ARRAY' ],
        [ '',            'inc', 'I2' ],
        [ '',            'set',    'P17',     'P17[1]' ],
        [ '',            'typeof', 'S16',     'P17' ],
        [ '',            'branch', 'apply_COUNT' ],
        [ 'apply_ARRAY', qw( new P3 'Array' ) ],
        [ '',            'set',    'P3',      'I2' ],
        [ '',            'set',    'I16',     0 ],
        [ 'apply_ITER',  'set',    'P3[I16]', 'P16[0]' ],
        [ '',            'set',    'P16',     'P16[1]' ],
        [ '',            'inc',    'I16' ],
        [ '',            'ne',  'I16', 'I2', 'apply_ITER' ],
        [ 'apply_CALL',  'set', 'I0',  0 ],
        [ '',            'invoke' ],
        [ 'apply_HELP',  'P16', 'P16[1]' ],
        [ '',            'inc', 'I1' ],
        [ '',            'typeof',  'S16', 'P16' ],
        [ '',            'ret' ],
    ],
);

sub new {
    my $class = shift;

    my $self = { instruction => [] };

    return bless $self, $class;
}

sub _add_inst {
    my $self = shift;

    push @{ $self->{instruction} }, [@_];

    return;
}

sub generate {
    my ( $code, $name ) = @_;

    die "$name: Unknown builtin\n" unless exists $built_ins{$name};

    my $self = Scheme::Builtins->new();

    foreach ( @{ $built_ins{$name} } ) {
        my ( $label, $op, @args ) = @{$_};
        $self->_add_inst( $label, $op, [@args] );
    }

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
