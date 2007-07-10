.sub main :main

    say "before if"
    $I0 = 1

    if $I0 goto branch_to_here
      say "never printed"
  branch_to_here:

    say "after if\n"

    say "before unless"

    unless $I0 goto dont_branch_to_here
      say "is printed"
  dont_branch_to_here:

    say "after unless"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

