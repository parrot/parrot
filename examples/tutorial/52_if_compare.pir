.sub main :main

    say "before if"

    $I0 = 42
    $I1 = 43

    $I2 = islt $I0, $I1
    if $I2 goto branch_to_label
      say "never printed"
  branch_to_label:

    say "after if"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

