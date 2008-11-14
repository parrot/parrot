=head1 NAME

Capture_PIR - PIR-based Capture class

=head1 DESCRIPTION

This file implements a C<Capture> class of objects.
Ideally we'd like to use the Capture class that is written
in C, but unfortunately Parrot currently has a limitation in
handling subclasses of the built-in Capture.  So, this is a
temporary PIR-based version until the Capture PMC is working
properly.

=over 4

=cut

.namespace [ 'Capture_PIR' ]

.sub '__onload' :load :init
    $P0 = subclass 'Hash', 'Capture_PIR'
    addattribute $P0, '$!item'
    addattribute $P0, '@!list'
.end


.sub 'list' :method
    $P0 = getattribute self, '@!list'
    unless null $P0 goto end
    $P0 = new 'ResizablePMCArray'
    setattribute self, '@!list', $P0
  end:
    .return ($P0)
.end


.sub 'hash' :method
    .return (self)
.end


.sub 'unshift_pmc' :vtable :method
    .param pmc val
    $P0 = self.'list'()
    unshift $P0, val
    .return ()
.end


.sub 'shift_pmc' :vtable :method
    $P0 = self.'list'()
    $P0 = shift $P0
    .return ($P0)
.end


.sub 'push_pmc' :vtable :method
    .param pmc val
    $P0 = self.'list'()
    push $P0, val
    .return ()
.end


.sub 'pop_pmc' :vtable :method
    $P0 = self.'list'()
    $P0 = pop $P0
    .return ($P0)
.end

=item C<get_string_keyed_int(int key)>

Returns the portion of the target string matched by C<key>,
in string context. If the Match object contains an array of
matches, a space seperated list of matches is returned.

=cut

.sub 'get_string_keyed_int' :vtable :method
    .param int key
    $S0 = ''
    $P0 = getattribute self, '@!list'
    if null $P0 goto end
    $S0 = $P0[key]
  end:
    .return ($S0)
.end


=item C<get_pmc_keyed_int(int key)>

Returns the subpattern capture associated with C<key>.  This
returns either a single Match object or an array of match
objects depending on the rule.

=cut

.sub 'get_pmc_keyed_int' :vtable :method
    .param int key
    $P0 = getattribute self, '@!list'
    if null $P0 goto end
    $P0 = $P0[key]
  end:
    .return ($P0)
.end


.sub 'set_pmc_keyed_int' :vtable :method
    .param int key
    .param pmc val
    $P0 = self.'list'()
    $P0[key] = val
    .return ()
.end


.sub 'delete_keyed_int' :vtable :method
    .param int key
    .local pmc list
    list = getattribute self, '@!list'
    delete list[key]
.end


.sub 'defined_keyed_int' :vtable :method
    .param int key
    .local pmc list
    $I0 = 0
    list = getattribute self, '@!list'
    if null list goto end
    $I0 = defined list[key]
  end:
    .return ($I0)
.end


.sub '__dump' :method
    .param pmc dumper
    .param string label
    .local int hasstuff
    hasstuff = 0

    .local string subindent, indent
    (subindent, indent) = dumper.'newIndent'()

    .local pmc hash, iter
    hash = self.'hash'()
    iter = new 'Iterator', hash
  dump_hash_loop:
    unless iter goto dump_hash_end
    if hasstuff goto dump_hash_1
    print " {"
    hasstuff = 1
  dump_hash_1:
    print "\n"
    print subindent
    .local string key
    .local pmc val
    key = shift iter
    val = hash[key]
    print "<"
    print key
    print "> => "
    dumper.'dump'(label, val)
    goto dump_hash_loop
  dump_hash_end:

    .local pmc array
    array = self.'list'()
    if null array goto dump_array_end
    $I1 = elements array
    $I0 = 0
  dump_array_loop:
    if $I0 >= $I1 goto dump_array_end
    if hasstuff goto dump_array_1
    print " {"
    hasstuff = 1
  dump_array_1:
    print "\n"
    print subindent
    val = array[$I0]
    print "["
    print $I0
    print "] => "
    dumper.'dump'(label, val)
    inc $I0
    goto dump_array_loop
  dump_array_end:
    unless hasstuff goto end
    print "\n"
    print indent
    print '}'
  end:
    dumper.'deleteIndent'()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
