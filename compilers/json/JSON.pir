      .sub '__onload' :load
          .local pmc optable
          ## namespace JSON
          $I0 = find_type 'JSON'
          if $I0 != 0 goto onload_287
          $P0 = subclass 'PGE::Grammar', 'JSON'
        onload_287:
          .return ()
      .end

## <JSON::object>
.namespace [ 'JSON' ]
      .sub 'object'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc gpad :unique_reg
          gpad = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R149: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R149_1
          $P0 = find_method mob, 'ws'
          goto R149_2
        R149_1:
          $P0 = find_name 'ws'
        R149_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R149_3
          
          goto fail
        R149_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R150
          push ustack, captob
          bsr R150
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R149_3
          if $P1 <= -3 goto fail_match
          goto fail

        R150: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "{" goto fail
          pos += 1
          goto R151

        R151: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R151_1
          $P0 = find_method mob, 'ws'
          goto R151_2
        R151_1:
          $P0 = find_name 'ws'
        R151_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R151_3
          
          goto fail
        R151_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R152
          push ustack, captob
          bsr R152
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R151_3
          if $P1 <= -3 goto fail_match
          goto fail

        R152:  # quant 0..1 (3) greedy/none
          push gpad, 0
          bsr R152_repeat
          $I0 = pop gpad
          if cutmark != 155 goto fail
          cutmark = 0
          goto fail
        R152_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R152_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R154
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R152_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R153
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 155
          goto fail

        R154: # subrule members
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'members'
          if $I0 == 0 goto R154_1
          $P0 = find_method mob, 'members'
          goto R154_2
        R154_1:
          $P0 = find_name 'members'
        R154_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["members"]
          if $I0 goto R154_cgen
          $P0 = new .ResizablePMCArray
          captscope["members"] = $P0
          bsr R154_cgen
          delete captscope["members"]
          goto fail
        R154_cgen:

          $P2 = captscope["members"]
          push $P2, captob

          pos = $P1
          bsr R154_3
          $P2 = captscope["members"]
          $P2 = pop $P2

          goto fail
        R154_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R152_repeat
          push ustack, captob
          bsr R152_repeat
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R154_3
          if $P1 <= -3 goto fail_match
          goto fail

        R153: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R153_1
          $P0 = find_method mob, 'ws'
          goto R153_2
        R153_1:
          $P0 = find_name 'ws'
        R153_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R153_3
          
          goto fail
        R153_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R156
          push ustack, captob
          bsr R156
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R153_3
          if $P1 <= -3 goto fail_match
          goto fail

        R156: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "}" goto fail
          pos += 1
          goto R157

        R157: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R157_1
          $P0 = find_method mob, 'ws'
          goto R157_2
        R157_1:
          $P0 = find_name 'ws'
        R157_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R157_3
          
          goto fail
        R157_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R157_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::array>
.namespace [ 'JSON' ]
      .sub 'array'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc gpad :unique_reg
          gpad = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R158: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R158_1
          $P0 = find_method mob, 'ws'
          goto R158_2
        R158_1:
          $P0 = find_name 'ws'
        R158_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R158_3
          
          goto fail
        R158_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R159
          push ustack, captob
          bsr R159
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R158_3
          if $P1 <= -3 goto fail_match
          goto fail

        R159: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "[" goto fail
          pos += 1
          goto R160

        R160: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R160_1
          $P0 = find_method mob, 'ws'
          goto R160_2
        R160_1:
          $P0 = find_name 'ws'
        R160_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R160_3
          
          goto fail
        R160_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R161
          push ustack, captob
          bsr R161
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R160_3
          if $P1 <= -3 goto fail_match
          goto fail

        R161:  # quant 0..1 (3) greedy/none
          push gpad, 0
          bsr R161_repeat
          $I0 = pop gpad
          if cutmark != 164 goto fail
          cutmark = 0
          goto fail
        R161_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R161_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R163
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R161_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R162
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 164
          goto fail

        R163: # subrule elements
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'elements'
          if $I0 == 0 goto R163_1
          $P0 = find_method mob, 'elements'
          goto R163_2
        R163_1:
          $P0 = find_name 'elements'
        R163_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["elements"]
          if $I0 goto R163_cgen
          $P0 = new .ResizablePMCArray
          captscope["elements"] = $P0
          bsr R163_cgen
          delete captscope["elements"]
          goto fail
        R163_cgen:

          $P2 = captscope["elements"]
          push $P2, captob

          pos = $P1
          bsr R163_3
          $P2 = captscope["elements"]
          $P2 = pop $P2

          goto fail
        R163_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R161_repeat
          push ustack, captob
          bsr R161_repeat
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R163_3
          if $P1 <= -3 goto fail_match
          goto fail

        R162: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R162_1
          $P0 = find_method mob, 'ws'
          goto R162_2
        R162_1:
          $P0 = find_name 'ws'
        R162_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R162_3
          
          goto fail
        R162_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R165
          push ustack, captob
          bsr R165
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R162_3
          if $P1 <= -3 goto fail_match
          goto fail

        R165: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "]" goto fail
          pos += 1
          goto R166

        R166: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R166_1
          $P0 = find_method mob, 'ws'
          goto R166_2
        R166_1:
          $P0 = find_name 'ws'
        R166_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R166_3
          
          goto fail
        R166_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R166_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::string>
.namespace [ 'JSON' ]
      .sub 'string'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R167: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R167_1
          $P0 = find_method mob, 'ws'
          goto R167_2
        R167_1:
          $P0 = find_name 'ws'
        R167_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R167_3
          
          goto fail
        R167_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R168
          push ustack, captob
          bsr R168
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R167_3
          if $P1 <= -3 goto fail_match
          goto fail

        R168: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "\"" goto fail
          pos += 1
          goto R169

        R169: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R169_1
          $P0 = find_method mob, 'ws'
          goto R169_2
        R169_1:
          $P0 = find_name 'ws'
        R169_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R169_3
          
          goto fail
        R169_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R170
          push ustack, captob
          bsr R170
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R169_3
          if $P1 <= -3 goto fail_match
          goto fail

        R170:  # quant 0..Inf none
          bsr R170_repeat
          if cutmark != 173 goto fail
          cutmark = 0
          goto fail
        R170_repeat:
          push ustack, pos
          bsr R172
          pos = pop ustack
          if cutmark != 0 goto fail
          bsr R171
          if cutmark != 0 goto fail
          cutmark = 173
          goto fail
        R172: # subrule char
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'char'
          if $I0 == 0 goto R172_1
          $P0 = find_method mob, 'char'
          goto R172_2
        R172_1:
          $P0 = find_name 'char'
        R172_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["char"]
          if $I0 goto R172_cgen
          $P0 = new .ResizablePMCArray
          captscope["char"] = $P0
          bsr R172_cgen
          delete captscope["char"]
          goto fail
        R172_cgen:

          $P2 = captscope["char"]
          push $P2, captob

          pos = $P1
          bsr R172_3
          $P2 = captscope["char"]
          $P2 = pop $P2

          goto fail
        R172_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R170_repeat
          push ustack, captob
          bsr R170_repeat
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R172_3
          if $P1 <= -3 goto fail_match
          goto fail

        R171: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R171_1
          $P0 = find_method mob, 'ws'
          goto R171_2
        R171_1:
          $P0 = find_name 'ws'
        R171_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R171_3
          
          goto fail
        R171_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R174
          push ustack, captob
          bsr R174
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R171_3
          if $P1 <= -3 goto fail_match
          goto fail

        R174: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "\"" goto fail
          pos += 1
          goto R175

        R175: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R175_1
          $P0 = find_method mob, 'ws'
          goto R175_2
        R175_1:
          $P0 = find_name 'ws'
        R175_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R175_3
          
          goto fail
        R175_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R175_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::members>
.namespace [ 'JSON' ]
      .sub 'members'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R176: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R176_1
          $P0 = find_method mob, 'ws'
          goto R176_2
        R176_1:
          $P0 = find_name 'ws'
        R176_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R176_3
          
          goto fail
        R176_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R177
          push ustack, captob
          bsr R177
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R176_3
          if $P1 <= -3 goto fail_match
          goto fail

        R177: # subrule string
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'string'
          if $I0 == 0 goto R177_1
          $P0 = find_method mob, 'string'
          goto R177_2
        R177_1:
          $P0 = find_name 'string'
        R177_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["string"]
          if $I0 goto R177_cgen
          $P0 = new .ResizablePMCArray
          captscope["string"] = $P0
          bsr R177_cgen
          delete captscope["string"]
          goto fail
        R177_cgen:

          $P2 = captscope["string"]
          push $P2, captob

          pos = $P1
          bsr R178
          $P2 = captscope["string"]
          $P2 = pop $P2

          goto fail
        R178: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R178_1
          $P0 = find_method mob, 'ws'
          goto R178_2
        R178_1:
          $P0 = find_name 'ws'
        R178_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R178_3
          
          goto fail
        R178_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R179
          push ustack, captob
          bsr R179
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R178_3
          if $P1 <= -3 goto fail_match
          goto fail

        R179: # subrule thing
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'thing'
          if $I0 == 0 goto R179_1
          $P0 = find_method mob, 'thing'
          goto R179_2
        R179_1:
          $P0 = find_name 'thing'
        R179_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["thing"]
          if $I0 goto R179_cgen
          $P0 = new .ResizablePMCArray
          captscope["thing"] = $P0
          bsr R179_cgen
          delete captscope["thing"]
          goto fail
        R179_cgen:

          $P2 = captscope["thing"]
          push $P2, captob

          pos = $P1
          bsr R180
          $P2 = captscope["thing"]
          $P2 = pop $P2

          goto fail
        R180: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R180_1
          $P0 = find_method mob, 'ws'
          goto R180_2
        R180_1:
          $P0 = find_name 'ws'
        R180_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R180_3
          
          goto fail
        R180_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R181
          push ustack, captob
          bsr R181
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R180_3
          if $P1 <= -3 goto fail_match
          goto fail

        R181:  # quant 0..Inf none
          bsr R181_repeat
          if cutmark != 184 goto fail
          cutmark = 0
          goto fail
        R181_repeat:
          push ustack, pos
          bsr R183
          pos = pop ustack
          if cutmark != 0 goto fail
          bsr R182
          if cutmark != 0 goto fail
          cutmark = 184
          goto fail
        R183: # concat
        R185: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "," goto fail
          pos += 1
          goto R186

        R186: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R186_1
          $P0 = find_method mob, 'ws'
          goto R186_2
        R186_1:
          $P0 = find_name 'ws'
        R186_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R186_3
          
          goto fail
        R186_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R187
          push ustack, captob
          bsr R187
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R186_3
          if $P1 <= -3 goto fail_match
          goto fail

        R187: # subrule string
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'string'
          if $I0 == 0 goto R187_1
          $P0 = find_method mob, 'string'
          goto R187_2
        R187_1:
          $P0 = find_name 'string'
        R187_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["string"]
          if $I0 goto R187_cgen
          $P0 = new .ResizablePMCArray
          captscope["string"] = $P0
          bsr R187_cgen
          delete captscope["string"]
          goto fail
        R187_cgen:

          $P2 = captscope["string"]
          push $P2, captob

          pos = $P1
          bsr R188
          $P2 = captscope["string"]
          $P2 = pop $P2

          goto fail
        R188: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R188_1
          $P0 = find_method mob, 'ws'
          goto R188_2
        R188_1:
          $P0 = find_name 'ws'
        R188_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R188_3
          
          goto fail
        R188_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R189
          push ustack, captob
          bsr R189
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R188_3
          if $P1 <= -3 goto fail_match
          goto fail

        R189: # subrule thing
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'thing'
          if $I0 == 0 goto R189_1
          $P0 = find_method mob, 'thing'
          goto R189_2
        R189_1:
          $P0 = find_name 'thing'
        R189_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["thing"]
          if $I0 goto R189_cgen
          $P0 = new .ResizablePMCArray
          captscope["thing"] = $P0
          bsr R189_cgen
          delete captscope["thing"]
          goto fail
        R189_cgen:

          $P2 = captscope["thing"]
          push $P2, captob

          pos = $P1
          bsr R181_repeat
          $P2 = captscope["thing"]
          $P2 = pop $P2

          goto fail
        R182: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R182_1
          $P0 = find_method mob, 'ws'
          goto R182_2
        R182_1:
          $P0 = find_name 'ws'
        R182_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R182_3
          
          goto fail
        R182_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R182_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::elements>
.namespace [ 'JSON' ]
      .sub 'elements'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R190: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R190_1
          $P0 = find_method mob, 'ws'
          goto R190_2
        R190_1:
          $P0 = find_name 'ws'
        R190_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R190_3
          
          goto fail
        R190_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R191
          push ustack, captob
          bsr R191
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R190_3
          if $P1 <= -3 goto fail_match
          goto fail

        R191: # subrule thing
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'thing'
          if $I0 == 0 goto R191_1
          $P0 = find_method mob, 'thing'
          goto R191_2
        R191_1:
          $P0 = find_name 'thing'
        R191_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["thing"]
          if $I0 goto R191_cgen
          $P0 = new .ResizablePMCArray
          captscope["thing"] = $P0
          bsr R191_cgen
          delete captscope["thing"]
          goto fail
        R191_cgen:

          $P2 = captscope["thing"]
          push $P2, captob

          pos = $P1
          bsr R192
          $P2 = captscope["thing"]
          $P2 = pop $P2

          goto fail
        R192: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R192_1
          $P0 = find_method mob, 'ws'
          goto R192_2
        R192_1:
          $P0 = find_name 'ws'
        R192_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R192_3
          
          goto fail
        R192_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R193
          push ustack, captob
          bsr R193
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R192_3
          if $P1 <= -3 goto fail_match
          goto fail

        R193:  # quant 0..Inf none
          bsr R193_repeat
          if cutmark != 196 goto fail
          cutmark = 0
          goto fail
        R193_repeat:
          push ustack, pos
          bsr R195
          pos = pop ustack
          if cutmark != 0 goto fail
          bsr R194
          if cutmark != 0 goto fail
          cutmark = 196
          goto fail
        R195: # concat
        R197: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "," goto fail
          pos += 1
          goto R198

        R198: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R198_1
          $P0 = find_method mob, 'ws'
          goto R198_2
        R198_1:
          $P0 = find_name 'ws'
        R198_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R198_3
          
          goto fail
        R198_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R199
          push ustack, captob
          bsr R199
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R198_3
          if $P1 <= -3 goto fail_match
          goto fail

        R199: # subrule thing
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'thing'
          if $I0 == 0 goto R199_1
          $P0 = find_method mob, 'thing'
          goto R199_2
        R199_1:
          $P0 = find_name 'thing'
        R199_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
                    $I0 = defined captscope["thing"]
          if $I0 goto R199_cgen
          $P0 = new .ResizablePMCArray
          captscope["thing"] = $P0
          bsr R199_cgen
          delete captscope["thing"]
          goto fail
        R199_cgen:

          $P2 = captscope["thing"]
          push $P2, captob

          pos = $P1
          bsr R193_repeat
          $P2 = captscope["thing"]
          $P2 = pop $P2

          goto fail
        R194: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R194_1
          $P0 = find_method mob, 'ws'
          goto R194_2
        R194_1:
          $P0 = find_name 'ws'
        R194_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R194_3
          
          goto fail
        R194_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R194_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::thing>
.namespace [ 'JSON' ]
      .sub 'thing'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R:  # alt R200, R201
          push ustack, pos
          bsr R200
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R201

        R200:  # alt R202, R203
          push ustack, pos
          bsr R202
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R203

        R202:  # alt R204, R205
          push ustack, pos
          bsr R204
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R205

        R204:  # alt R206, R207
          push ustack, pos
          bsr R206
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R207

        R206:  # alt R208, R209
          push ustack, pos
          bsr R208
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R209

        R208:  # alt R210, R211
          push ustack, pos
          bsr R210
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R211

        R210:  # alt R212, R213
          push ustack, pos
          bsr R212
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R213

        R212: # concat
        R214: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R214_1
          $P0 = find_method mob, 'ws'
          goto R214_2
        R214_1:
          $P0 = find_name 'ws'
        R214_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R214_3
          
          goto fail
        R214_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R215
          push ustack, captob
          bsr R215
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R214_3
          if $P1 <= -3 goto fail_match
          goto fail

        R215: # subrule string
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'string'
          if $I0 == 0 goto R215_1
          $P0 = find_method mob, 'string'
          goto R215_2
        R215_1:
          $P0 = find_name 'string'
        R215_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["string"] = captob

          pos = $P1
          bsr R216
          delete captscope["string"]

          goto fail
        R216: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R216_1
          $P0 = find_method mob, 'ws'
          goto R216_2
        R216_1:
          $P0 = find_name 'ws'
        R216_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R216_3
          
          goto fail
        R216_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R216_3
          if $P1 <= -3 goto fail_match
          goto fail

        R213: # concat
        R217: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R217_1
          $P0 = find_method mob, 'ws'
          goto R217_2
        R217_1:
          $P0 = find_name 'ws'
        R217_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R217_3
          
          goto fail
        R217_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R218
          push ustack, captob
          bsr R218
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R217_3
          if $P1 <= -3 goto fail_match
          goto fail

        R218: # subrule number
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'number'
          if $I0 == 0 goto R218_1
          $P0 = find_method mob, 'number'
          goto R218_2
        R218_1:
          $P0 = find_name 'number'
        R218_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["number"] = captob

          pos = $P1
          bsr R219
          delete captscope["number"]

          goto fail
        R219: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R219_1
          $P0 = find_method mob, 'ws'
          goto R219_2
        R219_1:
          $P0 = find_name 'ws'
        R219_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R219_3
          
          goto fail
        R219_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R219_3
          if $P1 <= -3 goto fail_match
          goto fail

        R211: # concat
        R220: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R220_1
          $P0 = find_method mob, 'ws'
          goto R220_2
        R220_1:
          $P0 = find_name 'ws'
        R220_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R220_3
          
          goto fail
        R220_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R221
          push ustack, captob
          bsr R221
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R220_3
          if $P1 <= -3 goto fail_match
          goto fail

        R221: # subrule object
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'object'
          if $I0 == 0 goto R221_1
          $P0 = find_method mob, 'object'
          goto R221_2
        R221_1:
          $P0 = find_name 'object'
        R221_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["object"] = captob

          pos = $P1
          bsr R222
          delete captscope["object"]

          goto fail
        R222: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R222_1
          $P0 = find_method mob, 'ws'
          goto R222_2
        R222_1:
          $P0 = find_name 'ws'
        R222_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R222_3
          
          goto fail
        R222_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R222_3
          if $P1 <= -3 goto fail_match
          goto fail

        R209: # concat
        R223: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R223_1
          $P0 = find_method mob, 'ws'
          goto R223_2
        R223_1:
          $P0 = find_name 'ws'
        R223_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R223_3
          
          goto fail
        R223_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R224
          push ustack, captob
          bsr R224
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R223_3
          if $P1 <= -3 goto fail_match
          goto fail

        R224: # subrule array
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'array'
          if $I0 == 0 goto R224_1
          $P0 = find_method mob, 'array'
          goto R224_2
        R224_1:
          $P0 = find_name 'array'
        R224_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["array"] = captob

          pos = $P1
          bsr R225
          delete captscope["array"]

          goto fail
        R225: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R225_1
          $P0 = find_method mob, 'ws'
          goto R225_2
        R225_1:
          $P0 = find_name 'ws'
        R225_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R225_3
          
          goto fail
        R225_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R225_3
          if $P1 <= -3 goto fail_match
          goto fail

        R207: # concat
        R226: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R226_1
          $P0 = find_method mob, 'ws'
          goto R226_2
        R226_1:
          $P0 = find_name 'ws'
        R226_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R226_3
          
          goto fail
        R226_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R227
          push ustack, captob
          bsr R227
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R226_3
          if $P1 <= -3 goto fail_match
          goto fail

        R227: # literal
          $I0 = pos + 4
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 4
          
          if $S0 != "true" goto fail
          pos += 4
          goto R228

        R228: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R228_1
          $P0 = find_method mob, 'ws'
          goto R228_2
        R228_1:
          $P0 = find_name 'ws'
        R228_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R228_3
          
          goto fail
        R228_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R228_3
          if $P1 <= -3 goto fail_match
          goto fail

        R205: # concat
        R229: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R229_1
          $P0 = find_method mob, 'ws'
          goto R229_2
        R229_1:
          $P0 = find_name 'ws'
        R229_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R229_3
          
          goto fail
        R229_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R230
          push ustack, captob
          bsr R230
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R229_3
          if $P1 <= -3 goto fail_match
          goto fail

        R230: # literal
          $I0 = pos + 5
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 5
          
          if $S0 != "false" goto fail
          pos += 5
          goto R231

        R231: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R231_1
          $P0 = find_method mob, 'ws'
          goto R231_2
        R231_1:
          $P0 = find_name 'ws'
        R231_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R231_3
          
          goto fail
        R231_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R231_3
          if $P1 <= -3 goto fail_match
          goto fail

        R203: # concat
        R232: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R232_1
          $P0 = find_method mob, 'ws'
          goto R232_2
        R232_1:
          $P0 = find_name 'ws'
        R232_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R232_3
          
          goto fail
        R232_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R233
          push ustack, captob
          bsr R233
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R232_3
          if $P1 <= -3 goto fail_match
          goto fail

        R233: # literal
          $I0 = pos + 4
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 4
          
          if $S0 != "null" goto fail
          pos += 4
          goto R234

        R234: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R234_1
          $P0 = find_method mob, 'ws'
          goto R234_2
        R234_1:
          $P0 = find_name 'ws'
        R234_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R234_3
          
          goto fail
        R234_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R234_3
          if $P1 <= -3 goto fail_match
          goto fail

        R201: # concat
        R235: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R235_1
          $P0 = find_method mob, 'ws'
          goto R235_2
        R235_1:
          $P0 = find_name 'ws'
        R235_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R235_3
          
          goto fail
        R235_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R236
          push ustack, captob
          bsr R236
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R235_3
          if $P1 <= -3 goto fail_match
          goto fail

        R236: # grammar subrule PGE::Util::die
          (captob, $P9, $P9, $P0) = captscope.'newfrom'(pos, 'PGE::Util')
          $P0 = pos
          $P0 = get_hll_global ['PGE::Util'], 'die'
          captob = $P0(captob, "'not a valid JSON value'")
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          captscope["PGE::Util::die"] = captob

          pos = $P1
          bsr R237
          delete captscope["PGE::Util::die"]

          goto fail
        R237: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R237_1
          $P0 = find_method mob, 'ws'
          goto R237_2
        R237_1:
          $P0 = find_name 'ws'
        R237_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R237_3
          
          goto fail
        R237_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R237_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::char>
.namespace [ 'JSON' ]
      .sub 'char'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R238: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R238_1
          $P0 = find_method mob, 'ws'
          goto R238_2
        R238_1:
          $P0 = find_name 'ws'
        R238_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R238_3
          
          goto fail
        R238_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R239
          push ustack, captob
          bsr R239
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R238_3
          if $P1 <= -3 goto fail_match
          goto fail

        R239: # enumcharlist "\\\""
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "\\\"", $S0
          if $I0 >= 0 goto fail
          inc pos
          goto R240
        R240: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R240_1
          $P0 = find_method mob, 'ws'
          goto R240_2
        R240_1:
          $P0 = find_name 'ws'
        R240_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R240_3
          
          goto fail
        R240_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R240_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end

## <JSON::number>
.namespace [ 'JSON' ]
      .sub 'number'
          .param pmc mob          :unique_reg
          .param pmc adverbs      :unique_reg :slurpy :named
          .local pmc newfrom      :unique_reg
          .local string target    :unique_reg
          .local pmc mfrom, mpos  :unique_reg
          .local int cpos, iscont :unique_reg
          $P0 = getclass 'PGE::Match'
          (mob, cpos, target, mfrom, mpos, iscont) = $P0.'new'(mob, adverbs :flat :named)
          .local pmc ustack :unique_reg
          ustack = new .ResizablePMCArray
          .local pmc gpad :unique_reg
          gpad = new .ResizablePMCArray
          .local pmc captscope, captob :unique_reg
          captscope = mob
          .local int pos, lastpos, rep, cutmark :unique_reg
          lastpos = length target
        try_match:
          if cpos > lastpos goto fail_rule
          mfrom = cpos
          pos = cpos
          cutmark = 0
          bsr R
          if cutmark <= -2 goto fail_cut
          inc cpos
          if iscont goto try_match
        fail_rule:
          cutmark = -2
        fail_cut:
          mob.'_failcut'(cutmark)
          .return (mob)
          goto fail_cut
        succeed:
          mpos = pos
          .return (mob)
        fail:
          ret
        fail_match:
          cutmark = -3
          goto fail_cut
        R: # concat
        R242: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R242_1
          $P0 = find_method mob, 'ws'
          goto R242_2
        R242_1:
          $P0 = find_name 'ws'
        R242_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R242_3
          
          goto fail
        R242_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R243
          push ustack, captob
          bsr R243
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R242_3
          if $P1 <= -3 goto fail_match
          goto fail

        R243:  # quant 0..1 (3) greedy/none
          push gpad, 0
          bsr R243_repeat
          $I0 = pop gpad
          if cutmark != 246 goto fail
          cutmark = 0
          goto fail
        R243_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R243_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R245
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R243_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R244
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 246
          goto fail

        R245: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "-" goto fail
          pos += 1
          goto R243_repeat

        R244: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R244_1
          $P0 = find_method mob, 'ws'
          goto R244_2
        R244_1:
          $P0 = find_name 'ws'
        R244_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R244_3
          
          goto fail
        R244_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R247
          push ustack, captob
          bsr R247
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R244_3
          if $P1 <= -3 goto fail_match
          goto fail

        R247:  # group 241
          bsr R249
          if cutmark != 241 goto fail
          cutmark = 0
          goto fail

        R249: # concat
        R250:  # alt R252, R253
          push ustack, pos
          bsr R252
          pos = pop ustack
          if cutmark != 0 goto fail
          goto R253

        R252: # concat
        R254: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R254_1
          $P0 = find_method mob, 'ws'
          goto R254_2
        R254_1:
          $P0 = find_name 'ws'
        R254_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R254_3
          
          goto fail
        R254_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R255
          push ustack, captob
          bsr R255
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R254_3
          if $P1 <= -3 goto fail_match
          goto fail

        R255: # enumcharlist "0123456789"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "0123456789", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R256
        R256: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R256_1
          $P0 = find_method mob, 'ws'
          goto R256_2
        R256_1:
          $P0 = find_name 'ws'
        R256_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R256_3
          
          goto fail
        R256_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R251
          push ustack, captob
          bsr R251
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R256_3
          if $P1 <= -3 goto fail_match
          goto fail

        R253: # concat
        R257: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R257_1
          $P0 = find_method mob, 'ws'
          goto R257_2
        R257_1:
          $P0 = find_name 'ws'
        R257_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R257_3
          
          goto fail
        R257_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R258
          push ustack, captob
          bsr R258
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R257_3
          if $P1 <= -3 goto fail_match
          goto fail

        R258: # enumcharlist "123456789"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "123456789", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R259
        R259: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R259_1
          $P0 = find_method mob, 'ws'
          goto R259_2
        R259_1:
          $P0 = find_name 'ws'
        R259_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R259_3
          
          goto fail
        R259_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R260
          push ustack, captob
          bsr R260
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R259_3
          if $P1 <= -3 goto fail_match
          goto fail

        R260:  # quant 1..2147483647 (3) greedy/none
          push gpad, 0
          bsr R260_repeat
          $I0 = pop gpad
          if cutmark != 262 goto fail
          cutmark = 0
          goto fail
        R260_repeat:
          rep = gpad[-1]
          ### if rep >= 2147483647 goto R260_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R261
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R260_1:
          if rep < 1 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R251
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 262
          goto fail

        R261: # enumcharlist "0123456789"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "0123456789", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R260_repeat
        R251: # cut 241
          bsr R248
          cutmark = 241
          goto fail

        R248: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R248_1
          $P0 = find_method mob, 'ws'
          goto R248_2
        R248_1:
          $P0 = find_name 'ws'
        R248_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R248_3
          
          goto fail
        R248_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R263
          push ustack, captob
          bsr R263
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R248_3
          if $P1 <= -3 goto fail_match
          goto fail

        R263:  # quant 0..1 (3) greedy/none
          push gpad, 0
          bsr R263_repeat
          $I0 = pop gpad
          if cutmark != 266 goto fail
          cutmark = 0
          goto fail
        R263_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R263_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R265
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R263_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R264
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 266
          goto fail

        R265: # concat
        R267: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R267_1
          $P0 = find_method mob, 'ws'
          goto R267_2
        R267_1:
          $P0 = find_name 'ws'
        R267_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R267_3
          
          goto fail
        R267_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R268
          push ustack, captob
          bsr R268
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R267_3
          if $P1 <= -3 goto fail_match
          goto fail

        R268: # literal
          $I0 = pos + 1
          if $I0 > lastpos goto fail
          $S0 = substr target, pos, 1
          
          if $S0 != "." goto fail
          pos += 1
          goto R269

        R269: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R269_1
          $P0 = find_method mob, 'ws'
          goto R269_2
        R269_1:
          $P0 = find_name 'ws'
        R269_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R269_3
          
          goto fail
        R269_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R270
          push ustack, captob
          bsr R270
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R269_3
          if $P1 <= -3 goto fail_match
          goto fail

        R270:  # quant 1..2147483647 (3) greedy/none
          push gpad, 0
          bsr R270_repeat
          $I0 = pop gpad
          if cutmark != 272 goto fail
          cutmark = 0
          goto fail
        R270_repeat:
          rep = gpad[-1]
          ### if rep >= 2147483647 goto R270_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R271
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R270_1:
          if rep < 1 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R263_repeat
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 272
          goto fail

        R271: # enumcharlist "0123456789"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "0123456789", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R270_repeat
        R264: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R264_1
          $P0 = find_method mob, 'ws'
          goto R264_2
        R264_1:
          $P0 = find_name 'ws'
        R264_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R264_3
          
          goto fail
        R264_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R273
          push ustack, captob
          bsr R273
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R264_3
          if $P1 <= -3 goto fail_match
          goto fail

        R273:  # quant 0..1 (3) greedy/none
          push gpad, 0
          bsr R273_repeat
          $I0 = pop gpad
          if cutmark != 276 goto fail
          cutmark = 0
          goto fail
        R273_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R273_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R275
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R273_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R274
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 276
          goto fail

        R275: # concat
        R277: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R277_1
          $P0 = find_method mob, 'ws'
          goto R277_2
        R277_1:
          $P0 = find_name 'ws'
        R277_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R277_3
          
          goto fail
        R277_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R278
          push ustack, captob
          bsr R278
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R277_3
          if $P1 <= -3 goto fail_match
          goto fail

        R278: # enumcharlist "Ee"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "Ee", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R279
        R279: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R279_1
          $P0 = find_method mob, 'ws'
          goto R279_2
        R279_1:
          $P0 = find_name 'ws'
        R279_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R279_3
          
          goto fail
        R279_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R280
          push ustack, captob
          bsr R280
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R279_3
          if $P1 <= -3 goto fail_match
          goto fail

        R280:  # quant 0..1 (3) greedy/none
          push gpad, 0
          bsr R280_repeat
          $I0 = pop gpad
          if cutmark != 283 goto fail
          cutmark = 0
          goto fail
        R280_repeat:
          rep = gpad[-1]
          if rep >= 1 goto R280_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R282
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R280_1:
          ### if rep < 0 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R281
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 283
          goto fail

        R282: # enumcharlist "+-"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "+-", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R280_repeat
        R281: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R281_1
          $P0 = find_method mob, 'ws'
          goto R281_2
        R281_1:
          $P0 = find_name 'ws'
        R281_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R281_3
          
          goto fail
        R281_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto R284
          push ustack, captob
          bsr R284
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R281_3
          if $P1 <= -3 goto fail_match
          goto fail

        R284:  # quant 1..2147483647 (3) greedy/none
          push gpad, 0
          bsr R284_repeat
          $I0 = pop gpad
          if cutmark != 286 goto fail
          cutmark = 0
          goto fail
        R284_repeat:
          rep = gpad[-1]
          ### if rep >= 2147483647 goto R284_1
          inc rep
          gpad[-1] = rep
          push ustack, pos
          push ustack, rep
          bsr R285
          rep = pop ustack
          pos = pop ustack
          if cutmark != 0 goto fail
          dec rep
        R284_1:
          if rep < 1 goto fail
          $I0 = pop gpad
          push ustack, rep
          bsr R273_repeat
          rep = pop ustack
          push gpad, rep
          if cutmark != 0 goto fail
          cutmark = 286
          goto fail

        R285: # enumcharlist "0123456789"
          if pos >= lastpos goto fail
          $S0 = substr target, pos, 1
          $I0 = index "0123456789", $S0
          if $I0 < 0 goto fail
          inc pos
          goto R284_repeat
        R274: # subrule ws
          captob = captscope
          $P0 = getattribute captob, '$.pos'
          $P0 = pos
          $I0 = can mob, 'ws'
          if $I0 == 0 goto R274_1
          $P0 = find_method mob, 'ws'
          goto R274_2
        R274_1:
          $P0 = find_name 'ws'
        R274_2:
          captob = $P0(captob)
          $P1 = getattribute captob, '$.pos'
          if $P1 <= -3 goto fail_match
          if $P1 < 0 goto fail
          
          
          pos = $P1
          bsr R274_3
          
          goto fail
        R274_3:
          pos = $P1
          $P1 = getattribute captob, '&!corou'
          if null $P1 goto succeed
          push ustack, captob
          bsr succeed
          captob = pop ustack
          if cutmark != 0 goto fail
          captob.next()
          $P1 = getattribute captob, '$.pos'
          if $P1 >= 0 goto R274_3
          if $P1 <= -3 goto fail_match
          goto fail

      .end
