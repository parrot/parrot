.sub "main"
    $I0 = 10
  loop:
    say $I0
    dec $I0
    eq $I0, 0, done
    goto loop

  done:
    end
.end
