proc fact { number } {
  set val 1
  while {$number}  {
    set val [expr $val * $number]
    incr number -1
  } 
  return $val
}

set a [fact 10]
puts "Factorial of 10 is $a"
