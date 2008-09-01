require 'test'

plan 7

def first
    ok 1
end

def second(n)
    is n%3, 2
end

def third(a,b)
    ok a == 3
    is b, 4
end

def fib(n)
  if n<2
    n
  else
    fib(n - 2)+fib(n - 1)
  end
end

def blocks(n,&f)
    f(n)
end

def defaults(n=7)
    is n, 7
end

first
second(2)
third(3,4)
second fib(6) - 3;
blocks('foo') do |i|
    is i, 'foo'
end
defaults()
