
set n 15

proc fact {n} {
  set i = 0
  set f = 1

  while { i <= n } {
    incr i
    set f [expr $f * i]
  }

  return f
}

puts "Factorial of $n is: [fact $n]"
