=head1 TITLE

PGE::TokenHash - hash implementation to speed up Token lookups

=cut

.namespace [ "PGE::TokenHash" ]

.sub "__onload" 
    .local pmc class
    class = newclass "PGE::TokenHash"
    addattribute class, ".ihash"
    addattribute class, ".vhash"
.end

.sub "__init" method
    .local pmc ihash, vhash
    ihash = new Hash
    vhash = new Hash
    setattribute self, "PGE::TokenHash\x0.ihash", ihash
    setattribute self, "PGE::TokenHash\x0.vhash", vhash
.end

.sub "__get_pmc_keyed" method
    .param pmc key_p
    .local pmc vhash
    vhash = getattribute self, "PGE::TokenHash\x0.vhash"
    $P0 = vhash[key_p]
    .return ($P0)
.end

.sub "__set_pmc_keyed" method
    .param pmc key_p
    .param pmc value
    .local string key
    .local pmc ihash, vhash
    .local int len
    .local string c

    key = key_p
    vhash = getattribute self, "PGE::TokenHash\x0.vhash"
    ihash = getattribute self, "PGE::TokenHash\x0.ihash"
    vhash[key_p] = value

    c = substr key, 0, 1
    len = length key
    $I0 = ihash[c]
    if $I0 >= len goto end
    ihash[c] = len
  end:
.end

.sub "__exists_keyed" method
    .param pmc key_p
    .local pmc vhash
    vhash = getattribute self, "PGE::TokenHash\x0.vhash"
    $I0 = exists vhash[key_p]
    .return ($I0)
.end

.sub "lkey" method
    .param string key
    .param int pos
    .local string c
    .local pmc ihash, vhash
    .local int len
    ihash = getattribute self, "PGE::TokenHash\x0.ihash"
    vhash = getattribute self, "PGE::TokenHash\x0.vhash"
    c = substr key, pos, 1
    len = ihash[c]
    c = substr key, pos, len
  lkm_1:
    unless c > '' goto end
    $I0 = exists vhash[c]
    if $I0 goto end
    chopn c, 1
    goto lkm_1
  end:
    .return (c)
.end 
