# XXX This file will eventually be generated. - Used to pull in precompiled tge

.namespace [ 'OSTGrammar' ]

.sub _load :load
    $P0 = getclass 'TGE'
    $P1 = subclass $P0, 'OSTGrammar'
.end

.include 'languages/APL/lib/past2post.pir'
