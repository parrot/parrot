=head1 NAME

PunieOpLookup -- A lookup table for opcodes

=head1 SYNOPSYS

  .sub _main :main
      load_bytecode 'PunieOpLookup.pir'

      .local pmc oplookup
      .local string op
 
      # Retrieve the subroutine
      oplookup = find_global 'PunieOpLookup', 'lookup'

      # Translate operator name to PASM opcode name
      op = oplookup($S1)

      ... # Do something with the opcode name

      end
  .end

=head1 DESCRIPTION

PunieOpLookup is a module for looking up the translation between a Punie
operator name (as defined in the operator precedence parser), and the
equivalent PASM opcode name. Eventually this will be implemented as a
data file, possibly in YAML.

=cut

.namespace [ 'PunieOpLookup' ]

.sub _load :load
    .local pmc lookuptable
    lookuptable = new .Hash
    _add_entry(lookuptable, 'infix:+', 'add')
    _add_entry(lookuptable, 'infix:-', 'sub')
    _add_entry(lookuptable, 'infix:*', 'mul')
    _add_entry(lookuptable, 'infix:/', 'div')
    _add_entry(lookuptable, 'infix:%', 'mod')
    _add_entry(lookuptable, 'infix:x', 'repeat')
    _add_entry(lookuptable, 'infix:.', 'concat')

    _add_entry(lookuptable, 'infix:<<', 'shl')
    _add_entry(lookuptable, 'infix:>>', 'shr')
    _add_entry(lookuptable, 'infix:&', 'band')
    _add_entry(lookuptable, 'infix:|', 'bor')
    _add_entry(lookuptable, 'infix:^', 'bxor')

    store_global 'PunieOpLookup', 'lookuptable', lookuptable
.end

.sub lookup
    .param string opname
    .local pmc lookuptable
    lookuptable = find_global 'PunieOpLookup', 'lookuptable'
    $S1 = lookuptable[ opname ]
    .return ($S1)
.end

.sub _add_entry
    .param pmc lookuptable
    .param string key
    .param string value
    $P1 = new .String
    $P1 = value
    lookuptable[ key ] = $P1
.end


=head1 LICENSE

Copyright (c) 2006 The Perl Foundation

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Allison Randal <allison@perl.org>

=cut
