# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 1;
use Parrot::Config;

=head1 NAME

t/examples/namespace.t - Test examples in F<examples/namespace>

=head1 SYNOPSIS

    % prove t/examples/namespace.t

=head1 DESCRIPTION

Test the examples in F<examples/namespace>.

=head1 SEE ALSO

F<t/examples/pir.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut


# Set up expected output for examples
my %expected
    = (
    'namespace_dump.pir'        =>  << 'END_EXPECTED',
parrot => parrot
    Undef => Undef
    Null => Null
    Env => Env
    PerlEnv => PerlEnv
    Key => Key
    Random => Random
    UnManagedStruct => UnManagedStruct
        __is_equal => NCI
    ManagedStruct => ManagedStruct
    delegate => delegate
    CSub => CSub
        __is_equal => NCI
    Compiler => Compiler
    NCI => NCI
        get_multisig => NCI
    Exception => Exception
        __is_equal => NCI
    SArray => SArray
    Version => Version
    VtableCache => VtableCache
    ParrotIO => ParrotIO
        say => NCI
        open => NCI
        set_readline_interactive => NCI
        readline => NCI
        flush => NCI
        setbuf => NCI
        setlinebuf => NCI
        puts => NCI
        eof => NCI
    ParrotLibrary => ParrotLibrary
    ConstParrotLibrary => ConstParrotLibrary
    ParrotInterpreter => ParrotInterpreter
        thread1 => NCI
        thread2 => NCI
        thread3 => NCI
        yield => NCI
        join => NCI
        detach => NCI
        kill => NCI
        recursion_limit => NCI
        __is_equal => NCI
    ParrotThread => ParrotThread
    LexPad => LexPad
        get_lexinfo => NCI
    Timer => Timer
    Pointer => Pointer
    Sub => Sub
        get_namespace => NCI
        __get_regs_used => NCI
        get_lexinfo => NCI
        get_outer => NCI
        get_multisig => NCI
        __is_equal => NCI
    Closure => Closure
    Continuation => Continuation
        caller => NCI
        continuation => NCI
    RetContinuation => RetContinuation
    Exception_Handler => Exception_Handler
    Coroutine => Coroutine
    Eval => Eval
    Float => Float
        acos => NCI
        cos => NCI
        asec => NCI
        asin => NCI
        atan => NCI
        atan2 => NCI
        cosh => NCI
        exp => NCI
        ln => NCI
        log10 => NCI
        log2 => NCI
        sec => NCI
        sech => NCI
        sin => NCI
        sinh => NCI
        tan => NCI
        tanh => NCI
        __add =>  Multi [
            Float Complex 
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum Complex 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_add =>  Multi [
            Float Complex 
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum Complex 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __subtract =>  Multi [
            Float Complex 
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum Complex 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_subtract =>  Multi [
            Float Complex 
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum Complex 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __multiply =>  Multi [
            Float Complex 
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum Complex 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_multiply =>  Multi [
            Float Complex 
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum Complex 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __divide =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_divide =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __floor_divide =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_floor_divide =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __modulus =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_modulus =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __cmodulus =>  Multi [
            Float PMC 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum FLOATVAL 
        ]
        __i_cmodulus =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __pow =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __i_pow =>  Multi [
            Float PMC 
            Float INTVAL 
            Float FLOATVAL 
            PerlNum PMC 
            PerlNum INTVAL 
            PerlNum FLOATVAL 
        ]
        __bitwise_or =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_bitwise_or =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __bitwise_and =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_bitwise_and =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __bitwise_xor =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_bitwise_xor =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __bitwise_shl =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_bitwise_shl =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __bitwise_shr =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_bitwise_shr =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __bitwise_lsr =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_bitwise_lsr =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __is_equal =>  Multi [
            Float PMC 
            Float Float 
        ]
        __is_equal_num =>  Multi [
            Float PMC 
            Float Float 
        ]
        __cmp =>  Multi [
            Float PMC 
            Float Float 
        ]
        __cmp_num =>  Multi [
            Float PMC 
            Float Float 
        ]
        __cmp_string => NCI
        __logical_or => NCI
        __logical_and => NCI
        __logical_xor => NCI
        __concatenate =>  Multi [
            Float PMC 
            Float STRING 
            PerlNum PMC 
            PerlNum STRING 
        ]
        __i_concatenate =>  Multi [
            Float PMC 
            Float STRING 
            PerlNum PMC 
            PerlNum STRING 
        ]
        __repeat =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
        __i_repeat =>  Multi [
            Float PMC 
            Float INTVAL 
            PerlNum PMC 
            PerlNum INTVAL 
        ]
    Integer => Integer
        get_as_base => NCI
        __add =>  Multi [
            Integer Complex 
            Integer PMC 
            Integer Integer 
            Integer Complex 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt FLOATVAL 
            PerlUndef Integer 
            PerlUndef Complex 
            PerlUndef BigInt 
            PerlUndef PMC 
            PerlUndef INTVAL 
            PerlUndef FLOATVAL 
            Boolean FLOATVAL 
        ]
        __i_add =>  Multi [
            Integer Complex 
            Integer PMC 
            Integer Integer 
            Integer Complex 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __subtract =>  Multi [
            Integer Complex 
            Integer PMC 
            Integer Integer 
            Integer Complex 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt FLOATVAL 
            PerlUndef Integer 
            PerlUndef Complex 
            PerlUndef BigInt 
            PerlUndef PMC 
            PerlUndef INTVAL 
            PerlUndef FLOATVAL 
            Boolean FLOATVAL 
        ]
        __i_subtract =>  Multi [
            Integer Complex 
            Integer PMC 
            Integer Integer 
            Integer Complex 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __multiply =>  Multi [
            Integer Complex 
            Integer PMC 
            Integer Integer 
            Integer Complex 
            Integer BigInt 
            Integer String 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt FLOATVAL 
            PerlUndef Integer 
            PerlUndef Complex 
            PerlUndef BigInt 
            PerlUndef String 
            PerlUndef PMC 
            PerlUndef INTVAL 
            PerlUndef FLOATVAL 
            Boolean FLOATVAL 
        ]
        __i_multiply =>  Multi [
            Integer Complex 
            Integer PMC 
            Integer Integer 
            Integer BigInt 
            Integer Complex 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __divide =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt INTVAL 
            PerlInt FLOATVAL 
            PerlUndef BigInt 
            PerlUndef PMC 
            PerlUndef INTVAL 
            PerlUndef FLOATVAL 
            Boolean INTVAL 
            Boolean FLOATVAL 
        ]
        __i_divide =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt INTVAL 
            PerlInt FLOATVAL 
            PerlUndef INTVAL 
            PerlUndef FLOATVAL 
            Boolean INTVAL 
            Boolean FLOATVAL 
        ]
        __floor_divide =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __i_floor_divide =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __modulus =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlUndef BigInt 
            PerlUndef PMC 
            PerlUndef INTVAL 
            PerlUndef FLOATVAL 
        ]
        __i_modulus =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __cmodulus =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __i_cmodulus =>  Multi [
            Integer PMC 
            Integer BigInt 
            Integer INTVAL 
            Integer FLOATVAL 
        ]
        __pow =>  Multi [
            Integer PMC 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt FLOATVAL 
            PerlUndef FLOATVAL 
            Boolean FLOATVAL 
        ]
        __i_pow =>  Multi [
            Integer PMC 
            Integer INTVAL 
            Integer FLOATVAL 
            PerlInt FLOATVAL 
            PerlUndef FLOATVAL 
            Boolean FLOATVAL 
        ]
        __bitwise_or =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_bitwise_or =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __bitwise_and =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_bitwise_and =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __bitwise_xor =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_bitwise_xor =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __bitwise_shl =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_bitwise_shl =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __bitwise_shr =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_bitwise_shr =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __bitwise_lsr =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_bitwise_lsr =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __is_equal =>  Multi [
            Integer PMC 
            Integer BigInt 
            PerlUndef BigInt 
            PerlUndef PMC 
        ]
        __cmp =>  Multi [
            Integer PMC 
            Integer String 
            Integer Float 
        ]
        __cmp_num =>  Multi [
            Integer PMC 
            Integer String 
            Integer Float 
        ]
        __cmp_string => NCI
        __logical_or => NCI
        __logical_and => NCI
        __logical_xor => NCI
        __concatenate =>  Multi [
            Integer PMC 
            Integer STRING 
            PerlInt PMC 
            PerlInt STRING 
            PerlUndef PMC 
            PerlUndef STRING 
            Boolean PMC 
            Boolean STRING 
        ]
        __i_concatenate =>  Multi [
            Integer PMC 
            Integer STRING 
            PerlInt PMC 
            PerlInt STRING 
            PerlUndef PMC 
            PerlUndef STRING 
            Boolean PMC 
            Boolean STRING 
        ]
        __repeat =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
        __i_repeat =>  Multi [
            Integer PMC 
            Integer INTVAL 
            PerlInt PMC 
            PerlInt INTVAL 
            PerlUndef PMC 
            PerlUndef INTVAL 
            Boolean PMC 
            Boolean INTVAL 
        ]
    BigInt => BigInt
        __add =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_add =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
            BigInt FLOATVAL 
        ]
        __subtract =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_subtract =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
            BigInt FLOATVAL 
        ]
        __multiply =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_multiply =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
            BigInt FLOATVAL 
        ]
        __divide =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_divide =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __floor_divide =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_floor_divide =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __modulus =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
        ]
        __i_modulus =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
        ]
        __cmodulus =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
        ]
        __i_cmodulus =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
        ]
        __bitwise_shl =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_bitwise_shl =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __bitwise_shr =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __i_bitwise_shr =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
            BigInt INTVAL 
        ]
        __is_equal =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
        ]
        __cmp =>  Multi [
            BigInt PMC 
            BigInt BigInt 
            BigInt Integer 
        ]
    Complex => Complex
        ln => NCI
        exp => NCI
        sin => NCI
        cos => NCI
        atan => NCI
        __add =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __i_add =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __subtract =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __i_subtract =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __multiply =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __i_multiply =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __divide =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __i_divide =>  Multi [
            Complex PMC 
            Complex Complex 
            Complex INTVAL 
            Complex FLOATVAL 
        ]
        __pow =>  Multi [
            Complex PMC 
            Complex Complex 
        ]
        __is_equal =>  Multi [
            Complex PMC 
            Complex Complex 
        ]
    String => String
        replace => NCI
        lower => NCI
        trans => NCI
        reverse => NCI
        is_integer => NCI
        __add =>  Multi [
            String Complex 
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString Complex 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_add =>  Multi [
            String Complex 
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString Complex 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __subtract =>  Multi [
            String Complex 
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString Complex 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_subtract =>  Multi [
            String Complex 
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString Complex 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __multiply =>  Multi [
            String Complex 
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString Complex 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_multiply =>  Multi [
            String Complex 
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString Complex 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __divide =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_divide =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __floor_divide =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_floor_divide =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __modulus =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_modulus =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __cmodulus =>  Multi [
            String PMC 
            String FLOATVAL 
            PerlString PMC 
            PerlString FLOATVAL 
        ]
        __i_cmodulus =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __pow =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __i_pow =>  Multi [
            String PMC 
            String INTVAL 
            String FLOATVAL 
            PerlString PMC 
            PerlString INTVAL 
            PerlString FLOATVAL 
        ]
        __bitwise_or =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_bitwise_or =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __bitwise_and =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_bitwise_and =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __bitwise_xor =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_bitwise_xor =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __bitwise_ors =>  Multi [
            String PMC 
            String STRING 
        ]
        __i_bitwise_ors =>  Multi [
            String PMC 
            String STRING 
        ]
        __bitwise_ands =>  Multi [
            String PMC 
            String STRING 
        ]
        __i_bitwise_ands =>  Multi [
            String PMC 
            String STRING 
        ]
        __bitwise_xors =>  Multi [
            String PMC 
            String STRING 
        ]
        __i_bitwise_xors =>  Multi [
            String PMC 
            String STRING 
        ]
        __bitwise_shl =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_bitwise_shl =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __bitwise_shr =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_bitwise_shr =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __bitwise_lsr =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_bitwise_lsr =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __is_equal => NCI
        __is_equal_num => NCI
        __is_equal_string => NCI
        __cmp => NCI
        __cmp_num => NCI
        __cmp_string => NCI
        __logical_or => NCI
        __logical_and => NCI
        __logical_xor => NCI
        __concatenate =>  Multi [
            String PMC 
            String STRING 
            PerlString PMC 
            PerlString STRING 
        ]
        __i_concatenate =>  Multi [
            String PMC 
            String STRING 
            PerlString PMC 
            PerlString STRING 
        ]
        __repeat =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
        __i_repeat =>  Multi [
            String PMC 
            String INTVAL 
            PerlString PMC 
            PerlString INTVAL 
        ]
    PerlInt => PerlInt
        __cmp_string =>  Multi [
            Integer PMC 
            PerlInt PMC 
            PerlUndef PMC 
        ]
        __logical_or =>  Multi [
            Integer PMC 
            PerlInt PMC 
            PerlUndef PMC 
        ]
        __logical_and =>  Multi [
            Integer PMC 
            PerlInt PMC 
            PerlUndef PMC 
        ]
        __logical_xor =>  Multi [
            Integer PMC 
            PerlInt PMC 
            PerlUndef PMC 
            PerlUndef PerlUndef 
        ]
    PerlNum => PerlNum
        __cmp_string =>  Multi [
            Float PMC 
            PerlNum PMC 
        ]
        __logical_or =>  Multi [
            Float PMC 
            PerlNum PMC 
        ]
        __logical_and =>  Multi [
            Float PMC 
            PerlNum PMC 
        ]
        __logical_xor =>  Multi [
            Float PMC 
            PerlNum PMC 
        ]
    PerlString => PerlString
        __logical_or =>  Multi [
            String PMC 
            PerlString PMC 
        ]
        __logical_and =>  Multi [
            String PMC 
            PerlString PMC 
        ]
        __logical_xor =>  Multi [
            String PMC 
            PerlString PMC 
        ]
    PerlUndef => PerlUndef
    Boolean => Boolean
        __cmp_string =>  Multi [
            Integer PMC 
            Boolean PMC 
        ]
        __logical_or =>  Multi [
            Integer PMC 
            Boolean PMC 
        ]
        __logical_and =>  Multi [
            Integer PMC 
            Boolean PMC 
        ]
        __logical_xor =>  Multi [
            Integer PMC 
            Boolean PMC 
        ]
    True => 1
    False => 0
    Ref => Ref
    SharedRef => SharedRef
    Array => Array
        __is_equal => NCI
    FixedIntegerArray => FixedIntegerArray
    IntList => IntList
    Iterator => Iterator
        next => NCI
    PerlArray => PerlArray
    ConstSArray => ConstSArray
    FixedStringArray => FixedStringArray
    MultiArray => MultiArray
    Hash => Hash
        __is_equal => NCI
    PerlHash => PerlHash
    OrderedHash => OrderedHash
    TQueue => TQueue
    ParrotClass => ParrotClass
    ParrotObject => ParrotObject
    OS => OS
        cwd => NCI
        chdir => NCI
        rm => NCI
        mkdir => NCI
        stat => NCI
        lstat => NCI
        symlink => NCI
        link => NCI
        umask => NCI
        chroot => NCI
    File => File
        is_dir => NCI
        is_file => NCI
        is_link => NCI
        copy => NCI
        rename => NCI
    AddrRegistry => AddrRegistry
    Bound_NCI => Bound_NCI
    deleg_pmc => deleg_pmc
    Enumerate => Enumerate
    FixedBooleanArray => FixedBooleanArray
        fill => NCI
    FixedFloatArray => FixedFloatArray
    FixedPMCArray => FixedPMCArray
        sort => NCI
        __is_equal => NCI
    LexInfo => LexInfo
        declare_lex_preg => NCI
    MultiSub => MultiSub
    ResizablePMCArray => ResizablePMCArray
        __is_equal =>  Multi [
            FixedPMCArray PMC 
            ResizablePMCArray PMC 
        ]
    NameSpace => NameSpace
        name => NCI
    None => None
        __is_equal =>  Multi [
            None PMC 
            None None 
        ]
    Pair => Pair
        key => NCI
        value => NCI
        kv => NCI
        __is_equal => NCI
    ResizableBooleanArray => ResizableBooleanArray
    ResizableFloatArray => ResizableFloatArray
    ResizableIntegerArray => ResizableIntegerArray
    ResizableStringArray => ResizableStringArray
    Slice => Slice
    Super => Super
    main => main
    dump => dump
    dump_multi => dump_multi
__parrot_core => __parrot_core
    __add =>  Multi [
        Float Complex 
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer Complex 
        Integer PMC 
        Integer Integer 
        Integer Complex 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt FLOATVAL 
        PerlNum Complex 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString Complex 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef Integer 
        PerlUndef Complex 
        PerlUndef BigInt 
        PerlUndef PMC 
        PerlUndef INTVAL 
        PerlUndef FLOATVAL 
        Boolean FLOATVAL 
    ]
    __i_add =>  Multi [
        Float Complex 
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer Complex 
        Integer PMC 
        Integer Integer 
        Integer Complex 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        BigInt FLOATVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum Complex 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString Complex 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __subtract =>  Multi [
        Float Complex 
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer Complex 
        Integer PMC 
        Integer Integer 
        Integer Complex 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt FLOATVAL 
        PerlNum Complex 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString Complex 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef Integer 
        PerlUndef Complex 
        PerlUndef BigInt 
        PerlUndef PMC 
        PerlUndef INTVAL 
        PerlUndef FLOATVAL 
        Boolean FLOATVAL 
    ]
    __i_subtract =>  Multi [
        Float Complex 
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer Complex 
        Integer PMC 
        Integer Integer 
        Integer Complex 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        BigInt FLOATVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum Complex 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString Complex 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __multiply =>  Multi [
        Float Complex 
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer Complex 
        Integer PMC 
        Integer Integer 
        Integer Complex 
        Integer BigInt 
        Integer String 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt FLOATVAL 
        PerlNum Complex 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString Complex 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef Integer 
        PerlUndef Complex 
        PerlUndef BigInt 
        PerlUndef String 
        PerlUndef PMC 
        PerlUndef INTVAL 
        PerlUndef FLOATVAL 
        Boolean FLOATVAL 
    ]
    __i_multiply =>  Multi [
        Float Complex 
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer Complex 
        Integer PMC 
        Integer Integer 
        Integer BigInt 
        Integer Complex 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        BigInt FLOATVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum Complex 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString Complex 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __divide =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt INTVAL 
        PerlInt FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef BigInt 
        PerlUndef PMC 
        PerlUndef INTVAL 
        PerlUndef FLOATVAL 
        Boolean INTVAL 
        Boolean FLOATVAL 
    ]
    __i_divide =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        Complex PMC 
        Complex Complex 
        Complex INTVAL 
        Complex FLOATVAL 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt INTVAL 
        PerlInt FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef INTVAL 
        PerlUndef FLOATVAL 
        Boolean INTVAL 
        Boolean FLOATVAL 
    ]
    __floor_divide =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __i_floor_divide =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __modulus =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef BigInt 
        PerlUndef PMC 
        PerlUndef INTVAL 
        PerlUndef FLOATVAL 
    ]
    __i_modulus =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __cmodulus =>  Multi [
        Float PMC 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        String PMC 
        String FLOATVAL 
        PerlNum PMC 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString FLOATVAL 
    ]
    __i_cmodulus =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer BigInt 
        Integer INTVAL 
        Integer FLOATVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
    ]
    __pow =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer INTVAL 
        Integer FLOATVAL 
        Complex PMC 
        Complex Complex 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef FLOATVAL 
        Boolean FLOATVAL 
    ]
    __i_pow =>  Multi [
        Float PMC 
        Float INTVAL 
        Float FLOATVAL 
        Integer PMC 
        Integer INTVAL 
        Integer FLOATVAL 
        String PMC 
        String INTVAL 
        String FLOATVAL 
        PerlInt FLOATVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlNum FLOATVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlString FLOATVAL 
        PerlUndef FLOATVAL 
        Boolean FLOATVAL 
    ]
    __bitwise_or =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_bitwise_or =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __bitwise_and =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_bitwise_and =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __bitwise_xor =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_bitwise_xor =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __bitwise_ors =>  Multi [
        String PMC 
        String STRING 
    ]
    __i_bitwise_ors =>  Multi [
        String PMC 
        String STRING 
    ]
    __bitwise_ands =>  Multi [
        String PMC 
        String STRING 
    ]
    __i_bitwise_ands =>  Multi [
        String PMC 
        String STRING 
    ]
    __bitwise_xors =>  Multi [
        String PMC 
        String STRING 
    ]
    __i_bitwise_xors =>  Multi [
        String PMC 
        String STRING 
    ]
    __bitwise_shl =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_bitwise_shl =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __bitwise_shr =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_bitwise_shr =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        BigInt INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __bitwise_lsr =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_bitwise_lsr =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __is_equal =>  Multi [
        UnManagedStruct PMC 
        CSub PMC 
        Exception PMC 
        ParrotInterpreter PMC 
        Sub PMC 
        Float PMC 
        Float Float 
        Integer PMC 
        Integer BigInt 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        Complex PMC 
        Complex Complex 
        String PMC 
        PerlUndef BigInt 
        PerlUndef PMC 
        Array PMC 
        Hash PMC 
        FixedPMCArray PMC 
        None PMC 
        None None 
        Pair PMC 
        ResizablePMCArray PMC 
    ]
    __is_equal_num =>  Multi [
        Float PMC 
        Float Float 
        String PMC 
    ]
    __is_equal_string =>  Multi [
        String PMC 
    ]
    __cmp =>  Multi [
        Float PMC 
        Float Float 
        Integer PMC 
        Integer String 
        Integer Float 
        BigInt PMC 
        BigInt BigInt 
        BigInt Integer 
        String PMC 
    ]
    __cmp_num =>  Multi [
        Float PMC 
        Float Float 
        Integer PMC 
        Integer String 
        Integer Float 
        String PMC 
    ]
    __cmp_string =>  Multi [
        Float PMC 
        Integer PMC 
        String PMC 
        PerlInt PMC 
        PerlNum PMC 
        PerlUndef PMC 
        Boolean PMC 
    ]
    __logical_or =>  Multi [
        Float PMC 
        Integer PMC 
        String PMC 
        PerlInt PMC 
        PerlNum PMC 
        PerlString PMC 
        PerlUndef PMC 
        Boolean PMC 
    ]
    __logical_and =>  Multi [
        Float PMC 
        Integer PMC 
        String PMC 
        PerlInt PMC 
        PerlNum PMC 
        PerlString PMC 
        PerlUndef PMC 
        Boolean PMC 
    ]
    __logical_xor =>  Multi [
        Float PMC 
        Integer PMC 
        String PMC 
        PerlInt PMC 
        PerlNum PMC 
        PerlString PMC 
        PerlUndef PMC 
        PerlUndef PerlUndef 
        Boolean PMC 
    ]
    __concatenate =>  Multi [
        Float PMC 
        Float STRING 
        Integer PMC 
        Integer STRING 
        String PMC 
        String STRING 
        PerlInt PMC 
        PerlInt STRING 
        PerlNum PMC 
        PerlNum STRING 
        PerlString PMC 
        PerlString STRING 
        PerlUndef PMC 
        PerlUndef STRING 
        Boolean PMC 
        Boolean STRING 
    ]
    __i_concatenate =>  Multi [
        Float PMC 
        Float STRING 
        Integer PMC 
        Integer STRING 
        String PMC 
        String STRING 
        PerlInt PMC 
        PerlInt STRING 
        PerlNum PMC 
        PerlNum STRING 
        PerlString PMC 
        PerlString STRING 
        PerlUndef PMC 
        PerlUndef STRING 
        Boolean PMC 
        Boolean STRING 
    ]
    __repeat =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
    __i_repeat =>  Multi [
        Float PMC 
        Float INTVAL 
        Integer PMC 
        Integer INTVAL 
        String PMC 
        String INTVAL 
        PerlInt PMC 
        PerlInt INTVAL 
        PerlNum PMC 
        PerlNum INTVAL 
        PerlString PMC 
        PerlString INTVAL 
        PerlUndef PMC 
        PerlUndef INTVAL 
        Boolean PMC 
        Boolean INTVAL 
    ]
END_EXPECTED
    );

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/namespace/$example", $expected );
}

