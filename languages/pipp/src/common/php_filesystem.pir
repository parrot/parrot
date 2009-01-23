# Copyright (C) 2009, The Perl Foundation.
# $Id$

=head1 NAME

php_filesystem.pir - PHP filesystem extension

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string dirname(string path)>

Returns the directory name component of the path.
Under Windows the forward and backward slash are tried for directory separators.
Under Windows forward slashes are replaced by backslashes.
For the root dir a slash is appended.

=cut

.sub 'dirname'
    .param pmc path

    .local pmc slash
    slash = get_hll_global 'DIRECTORY_SEPARATOR'
    .local string slash_str
    slash_str = slash

    ne slash_str, '\\', L1
        # TODO: fix the DOS case
        .local pmc split_sub, p6rule, regex
        split_sub  = get_root_global ['parrot';'PGE';'Util'], 'split'
        p6rule = compreg 'PGE::Perl6Regex'
        regex  = p6rule('[\\|/]')
        $P0 = split_sub(regex, path)
        goto L2
  L1:
        $S0 = path
        $P0 = split '/', $S0
  L2:

    $S0 = pop $P0
    $S0 = join slash_str, $P0
    ne $S0, '', L3
        $S0 = slash
  L3:
    .RETURN_STRING($S0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
