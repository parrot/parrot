# Copyright (C) 2007, The Perl Foundation.
# $Id$

.namespace ['String';'Utils']

=head1 NAME

['String';'Utils'] - Utilities for string processing

=head1 SYNOPSIS

    load_bytecode 'String/Utils.pbc'

    .local pmc chomp
               chomp = get_global ['String';'Utils'], 'chomp'

    $S0 = chomp($S0)      # use default record separator ("\n")
    $S0 = chomp($S0, $S1) # use custom record separator

=head1 Functions

=over

=item chomp

    $S0 = chomp( $S1 )
    $S0 = chomp( $S1, $S2 )

Remove all trailing record separator C<$S2> from tail of input string C<$S1>
and return in C<$S0>. If C<$S2> is not specified, the default C<\n> is used.

=cut

.sub 'chomp'
    .param string str     # read-only
    .param string sep     :optional
    .param int    has_sep :opt_flag

    .local string res
                  res = str

    if has_sep goto chomp
    sep = "\n"

    .local int strl
    .local int sepl

  chomp:
    strl = length res
    sepl = length sep

    if sep > res goto return
    $I0 = strl - sepl
    $I1 = index res, sep, $I0
    unless $I1 == $I0 goto return
    chopn res, sepl
    goto chomp

  return:
    .return ( res )
.end


=back

=head1 AUTHOR

Jerry Gay a.k.a. particle

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
