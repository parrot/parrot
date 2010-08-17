#! nqp
# Copyright (C) 2010, Parrot Foundation.
# $Id$

class Ops::Trans is Hash;

=begin

Base class for Runcode transformations.

=end

method prefix() { 'Parrot_' };

# We can't use yada-yada-yada
method suffix() { die("...") }

method core_type() { die("...") }

# Prepare internal structures from Ops::File.ops.
method prepare_ops($emitter, $ops_file) { die('...') }

#
method emit_c_op_funcs_header_part($fh) { die('...') }

# Called from Ops::Op.
method body_prelude() { '' }

method defines($emitter) { die('...') }

method emit_source_part($emitter, $fh) { die('...') }

# Default op lookup do nothing. But op_deinit referenced anyway.
method emit_op_lookup($fh) {
    $fh.print(q|static void hop_deinit(SHIM_INTERP) {}|);
}

method init_func_init1() { '' }
method init_func_disaptch() { '' }

method op_info($emitter) { 'NULL' }
method op_func($emitter) { 'NULL' }
method getop($emitter)   { '( int (*)(PARROT_INTERP, const char *, int) )NULL' };

our %arg_maps := {};

method access_arg($type, $num) { die('...'); }

method restart_address($addr) { die('...'); }
method restart_offset($offset) { die('...'); }

method goto_address($addr) { die('...'); }
method goto_offset($offset) { die('...'); }

method expr_address($addr) { die('...'); }
method expr_offset($offset) { die('...'); }

# vim: expandtab shiftwidth=4 ft=perl6:
