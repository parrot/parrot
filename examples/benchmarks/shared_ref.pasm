      set I0, 100000
      set I1, 0
lp:
      new P0, .PerlInt
      new P1, .SharedRef, P0  # or .Ref
      set P1, I1
      inc I1
      lt I1, I0, lp
      end
