package samples;
# Copyright (C) 2008, Parrot Foundation.

use strict;
use warnings;

use Exporter;
our ($core, $debug, $mangled, $string);
our @ISA = qw( Exporter );
our @EXPORT_OK = qw($core $debug $mangled $string);


$core = q{
/*
** pseudo-core.ops
*/

BEGIN_OPS_PREAMBLE

#include "parrot/dynext.h"
#include "parrot/parrot.h"
#include "../interp/interp_guts.h"

END_OPS_PREAMBLE

=head1 NAME

pseudo-core.ops - Parrot Core Ops

=cut

=head1 DESCRIPTION

=cut

########################################

=over 4

=item B<end>()

Halts the interpreter. See also B<exit>.

=cut

inline op end() :base_core :check_event :flow {
    HALT();
}


########################################

=item B<load_bytecode>(in STR)

Load Parrot bytecode from file $1, and search the library path to locate the
file.

=cut

inline op noop() :base_core {
}

inline op cpu_ret() {
#ifdef __GNUC__
#  ifdef I386
    __asm__("ret");
#  endif
#endif
}

inline op check_events() :base_core :flow {
    opcode_t *next = expr NEXT();
    Parrot_cx_check_tasks(interp, interp->scheduler);
    goto ADDRESS(next);   /* force this being a branch op */
}

inline op check_events__() :internal :flow {
    opcode_t *_this = CUR_OPCODE;
    /* Restore op_func_table. */
    disable_event_checking(interp);
    Parrot_cx_handle_tasks(interp, interp->scheduler);
    goto ADDRESS(_this);   /* force this being a branch op */
}

inline op prederef__() :internal :flow {
    opcode_t *_this = CUR_OPCODE;
    if (interp->run_core & PARROT_CGOTO_CORE) {
        /* must be CGP then - check for events in not yet prederefed code */
        Parrot_cx_runloop_wake(interp, interp->scheduler);
    /*    _this = CHECK_EVENTS(interp, _this); */
    }
    do_prederef((void**)cur_opcode, interp, op_lib.core_type);
    goto ADDRESS(_this); /* force this being a branch op */
}

inline op reserved(inconst INT) {
    /* reserve 1 entries */
}

inline op load_bytecode(in STR) :load_file {
    Parrot_load_bytecode(interp, $1);
}


=item B<loadlib>(out PMC, in STR)

Load a dynamic link library named $2 and store it in $1.

=cut

inline op loadlib(out PMC, in STR) {
    $1 = Parrot_dyn_load_lib(interp, $2, NULL);
}

=back

###############################################################################

=head1 COPYRIGHT

Copyright (C) 2001-2008, Parrot Foundation.

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter itself.

=cut

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
 };

 $debug = q{
/*
 * Copyright (C) 2002-2008, Parrot Foundation.
 */

/*
** pseudo-debug.ops
*/

=head1 NAME

pseudo-debug.ops

=cut

=head1 DESCRIPTION

Parrot debugger

=cut

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.19

=cut

###############################################################################

=head2 Parrot debug operations

=over 4


=item B<debug_load>(inconst STR)

Load a Parrot source file for the current program.

=cut

op debug_load(inconst STR) :base_debug {
    char *f;

    if (!(interp->pdb->state & PDB_BREAK)) {
        f = string_to_cstring(interp, ($1));
        PDB_load_source(interp, f);
        Parrot_str_free_cstring(f);
    }
}

=back

=cut

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
 };

 $mangled = q{
/*
** string.ops
*/

=head1 DESCRIPTION

Operations that work on strings, whether constructing, modifying
or examining them.

=over 4

=item B<chopn>(inout STR, in INT)

Remove n characters specified by integer $2 from the tail of string $1.
If $2 is negative, cut the string after -$2 characters.

=item B<chopn>(out STR, in STR, in INT)

Remove n characters specified by integer $3 from the tail of string $2,
and returns the characters not chopped in string $1.
If $3 is negative, cut the string after -$3 characters.

=cut

inline op chopn(inout STR, in INT) :base_core {
    Parrot_str_chopn_inplace(interp, $1, $2);
}

inline op chopn(out STR, in STR, in INT) :base_core {
    $1 = Parrot_str_chopn(interp, $2, $3);
}


=back

=head1 COPYRIGHT

Copyright (C) 2001-2008, Parrot Foundation.

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter itself.

=cut

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

=head1 NAME
};

$string = q{
/*
** pseudo-string.ops
*/

=head1 NAME

pseudo-string.ops - String Operations

=head1 DESCRIPTION

Operations that work on strings, whether constructing, modifying
or examining them.

=over 4

=cut


=item B<concat>(inout STR, in STR)

=item B<concat>(in PMC, in STR)

=item B<concat>(in PMC, in PMC)

Modify string $1 in place, appending string $2.
The C<PMC> versions are MMD operations.

=item B<concat>(out STR, in STR, in STR)

=item B<concat>(in PMC, in PMC, in STR)

=item B<concat>(in PMC, in PMC, in PMC)

=item B<n_concat>(out PMC, in PMC, in STR)

=item B<n_concat>(out PMC, in PMC, in PMC)

Append strings $3 to string $2 and place the result into string $1.
The C<PMC> versions are MMD operations.
The C<n_> variants create a new PMC $1 to store the result.
See F<src/ops/math.ops> for the general C<infix> and C<n_infix> syntax.

=cut


=back

=head1 COPYRIGHT

Copyright (C) 2001-2008, Parrot Foundation.

=head1 LICENSE

This program is free software. It is subject to the same license
as the Parrot interpreter itself.

=cut

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

=item B<n_concat>(foobar, in PMC, in PMC)

};

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
