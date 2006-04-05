# XXX This file will eventually be generated. - Used to pull in precompiled tge

.namespace [ 'ASTGrammar' ]

.sub _load :load
    $P0 = getclass 'TGE'
    $P1 = subclass $P0, 'ASTGrammar'
.end

.include 'languages/APL/lib/pge2past.pir'
