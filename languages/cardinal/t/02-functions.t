print "1..5\n"

def first
    print "ok 1"
end

def second(n)
    print "ok ", n
end

def third(a,b)
    second(a)
    second(b)
end

def fib(n)
  if n<2
    n
  else
    fib(n-2)+fib(n-1)
  end
end

first()
second(2)
third(3,4)
second fib(6) - 3;
