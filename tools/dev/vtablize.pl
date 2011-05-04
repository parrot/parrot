#! perl -pi.bak
# Copyright (C) 2008-2009, Parrot Foundation.

=head1 NAME

tools/dev/vtablize.pl - Update PMCs to new format

=head1 SYNOPSIS

    % perl tools/dev/vtablize.pl *.pmc

=head1 DESCRIPTION

This script modifies a PMC definition file in place to mark all vtable function
declarations with the leading C<VTABLE> keyword. It was used to update all core
PMCs as part of the implementation of PDD 17 on PMCs, and will be useful in
updating HLL-specific and user-defined PMCs when we change the C<VTABLE>
keyword to be required. Once all conversions are completed, this script can be
deleted.

=head1 SEE ALSO

docs/pdds/pdd17_pmc.pod

=cut

use strict;
use warnings;

s/^(\s*)(void\s+init\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+init_pmc\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*instantiate\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+morph\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+mark\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+destroy\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_namespace\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*getprop\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+setprop\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+delprop\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*getprops\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+type\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(UINTVAL\s+subtype\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*name\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*clone\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*clone_pmc\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*find_method\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+get_integer\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+get_integer_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+get_integer_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+get_integer_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(FLOATVAL\s+get_number\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(FLOATVAL\s+get_number_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(FLOATVAL\s+get_number_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(FLOATVAL\s+get_number_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+get_bool\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*get_string\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*get_string_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*get_string_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*get_string_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*get_repr\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_pmc\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_pmc_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_pmc_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_pmc_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*slice\(PMC\s+\*\w*,\s+INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+\*get_pointer\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+\*get_pointer_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+\*get_pointer_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+\*get_pointer_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_integer_native\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_integer_same\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_integer_keyed\(PMC\s+\*\w*,\s+INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_integer_keyed_int\(INTVAL\s+\w*,\s+INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_integer_keyed_str\(STRING\s+\*\w*,\s+INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_number_native\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_number_same\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_number_keyed\(PMC\s+\*\w*,\s+FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_number_keyed_int\(INTVAL\s+\w*,\s+FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_number_keyed_str\(STRING\s+\*\w*,\s+FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_bignum_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_bignum_num\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_bignum_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_string_native\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+assign_string_native\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_string_same\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_string_keyed\(PMC\s+\*\w*,\s+STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_string_keyed_int\(INTVAL\s+\w*,\s+STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_string_keyed_str\(STRING\s+\*\w*,\s+STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pmc\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+assign_pmc\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pmc_keyed\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pmc_keyed_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pmc_keyed_str\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pointer\(void\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pointer_keyed\(PMC\s+\*\w*,\s+void\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pointer_keyed_int\(INTVAL\s+\w*,\s+void\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_pointer_keyed_str\(STRING\s+\*\w*,\s+void\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_bool\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+elements\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+pop_integer\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(FLOATVAL\s+pop_float\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*pop_string\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*pop_pmc\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+push_integer\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+push_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+push_string\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+push_string\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+shift_integer\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(FLOATVAL\s+shift_float\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*shift_string\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*shift_pmc\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+unshift_integer\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+unshift_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+unshift_string\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+unshift_string\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*add\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*add_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*add_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_add\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_add_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_add_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*subtract\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*subtract_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*subtract_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_subtract\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_subtract_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_subtract_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*multiply\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*multiply_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*multiply_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_multiply\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_multiply_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_multiply_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*divide\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*divide_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*divide_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_divide\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_divide_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_divide_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*floor_divide\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*floor_divide_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*floor_divide_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_floor_divide\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_floor_divide_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_floor_divide_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*modulus\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*modulus_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*modulus_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_modulus\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_modulus_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_modulus_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*cmodulus\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*cmodulus_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*cmodulus_float\(FLOATVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_cmodulus\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_cmodulus_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_cmodulus_float\(FLOATVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+increment\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+decrement\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*absolute\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_absolute\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*neg\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_neg\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+is_equal\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+is_equal_num\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+is_equal_string\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+is_same\(const\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+cmp\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+cmp_num\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+cmp_string\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+cmp_pmc\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*logical_or\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*logical_xor\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$2VTABLE $2/;
s/^(\s*)(PMC\s+\*logical_and\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*logical_not\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_logical_not\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*concatenate\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*concatenate_str\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_concatenate\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_concatenate_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*repeat\(PMC\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*repeat_int\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_repeat\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+i_repeat_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+substr\(INTVAL\s+\w*,\s+INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(STRING\s+\*substr_str\(INTVAL\s+\w*,\s+INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+exists_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+exists_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+exists_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+defined\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+defined_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+defined_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+defined_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+delete_keyed\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+delete_keyed_int\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+delete_keyed_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_iter\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(opcode_t\s+\*invoke\(void\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+can\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+does\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+isa\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+isa_pmc\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_attr\(INTVAL\s+\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_attr_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_attr_keyed\(PMC\s+\*\w*,\s+STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_attr\(INTVAL\s+\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_attr_str\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+set_attr_keyed\(PMC\s+\*\w*,\s+STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+add_role\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+remove_role\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+add_parent\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+remove_parent\(PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*get_class\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(INTVAL\s+class_type\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+add_attribute\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+remove_attribute\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+add_method\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+remove_method\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+add_vtable_override\(STRING\s+\*\w*,\s+PMC\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+remove_vtable_override\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*inspect\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*inspect_str\(STRING\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+freeze\(visit_info\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+thaw\(visit_info\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+thaw_finish\(visit_info\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+visit\(visit_info\s+\*\w*\)\s+{)/$1VTABLE $2/;
s/^(\s*)(void\s+share\(\)\s+{)/$1VTABLE $2/;
s/^(\s*)(PMC\s+\*share_ro\(\)\s+{)/$1VTABLE $2/;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
