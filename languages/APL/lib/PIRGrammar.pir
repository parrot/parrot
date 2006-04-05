# XXX This file will eventually be generated. - Used to pull in precompiled tge

.namespace [ 'PIRGrammar' ]

.sub _load :load
    $P0 = getclass 'TGE'
    $P1 = subclass $P0, 'PIRGrammar'
.end

.include 'languages/APL/lib/post2pir.pir'
