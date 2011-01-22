.sub main
    $P0 = get_class ["ExceptionHandler"]
    $P1 = subclass $P0, ["MyHandler"]
    $P2 = new $P1
    set_label $P2, _my_handler_label
    push_eh $P2

    $P4 = new ["Exception"]
    throw $P4
    die "damnit"
  _my_handler_label:
    .get_results($P4)
    finalize $P4
    pop_eh
    say "all is well"
    .return()
.end
