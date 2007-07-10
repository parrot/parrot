.sub main :main

    say "before branch"

    goto branch_to_here
      say "never printed"
  branch_to_here:

    say "after branch"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

