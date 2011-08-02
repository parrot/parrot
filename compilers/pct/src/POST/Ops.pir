
.namespace []
.sub "_block1000"  :anon :subid("10_1312323133.96919")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312323133.96919" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 4
    .const 'Sub' $P1003 = "11_1312323133.96919" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1008 = "13_1312323133.96919" 
    .return ($P1008)
.end


.namespace []
.sub "" :load :init :subid("post14") :outer("10_1312323133.96919")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312323133.96919" 
    .local pmc block
    set block, $P1001
    $P1010 = get_root_global ["parrot"], "P6metaclass"
    $P1010."new_class"("POST::Ops", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Ops"]
.sub "_block1002"  :subid("11_1312323133.96919") :outer("10_1312323133.96919")
.annotate 'file', ''
.annotate 'line', 4
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .return ()
    .const 'Sub' $P1005 = "12_1312323133.96919" 
    .return ($P1005)
.end


.namespace ["POST";"Ops"]
.sub "_block1004" :load :anon :subid("12_1312323133.96919")
.annotate 'file', ''
.annotate 'line', 4
    .const 'Sub' $P1006 = "11_1312323133.96919" 
    $P101 = $P1006()
    .return ($P101)
.end


.namespace []
.sub "_block1007" :load :anon :subid("13_1312323133.96919")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1009 = "10_1312323133.96919" 
    $P101 = $P1009()
    .return ($P101)
.end

