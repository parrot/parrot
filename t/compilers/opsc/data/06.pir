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

# BEGIN_RESULTS
# 10
# 9
# 8
# 7
# 6
# 5
# 4
# 3
# 2
# 1
# END_RESULTS
