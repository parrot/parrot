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

    .local int last_nonempty_has_been_popped
    last_nonempty_has_been_popped = 0

    # _dumper(path)
    # _dumper($P0)
    # an absolute path gives at least two components
    $I0 = elements $P0
    if $I0 <= 1 goto return_pwd

    # check for an absolute path
    .local int    is_abs_path
    is_abs_path = 0
    $S0 = $P0[0]
    ne $S0, '', abs_path
        is_abs_path = 1
  abs_path:
  
  pop_empty:
    # pop empty path components
    $I0 = elements $P0
    if $I0 == 0 goto return_root_or_pwd
        $S0 = $P0[-1]
        ne $S0, '', check_already_popped
        $S0 = pop $P0
        goto pop_empty

  check_already_popped:
    if last_nonempty_has_been_popped goto return_join
        $S0 = pop $P0   
        last_nonempty_has_been_popped = 1
        goto pop_empty

  return_root_or_pwd:
    if is_abs_path goto return_root
    goto return_pwd

  return_root:
    .RETURN_STRING(slash)

  return_pwd:
    .RETURN_STRING('.')

  return_join:
    $S0 = join slash_str, $P0
    eq $S0, '', return_root_or_pwd 
    .RETURN_STRING($S0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
