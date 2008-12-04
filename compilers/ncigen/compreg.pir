.namespace []
.sub 'onload' :anon :init :load
    $P0 = get_hll_namespace ['Any']
    '!EXPORT'('compreg', 'from'=>$P0)
.end

.namespace ['Any']
.sub 'compreg' :method
    .local string lang
    lang = self
    .local pmc compiler
    compiler = compreg lang
    .return (compiler)
.end
