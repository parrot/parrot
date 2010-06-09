# Copyright (C) 2010, Parrot Foundation.
# $Id$

.namespace ['PAST'; 'Node']

.sub 'match' :method
    .param pmc pattern
    .param int global :named('g') :optional
    .param int has_global :opt_flag
    if has_global goto have_global
    .tailcall pattern.'ACCEPTS'(self)
have_global:
    .tailcall pattern.'ACCEPTS'(self, 'g' => 1)
.end

.sub 'subst' :method
    .param pmc pattern
    .param int global :named('g') :optional
    .param int has_global :opt_flag
    if has_global goto have_global
    .tailcall pattern.'transform'(self)
have_global:
    .tailcall pattern.'transform'(self, 'g' => 1)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
