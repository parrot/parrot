#!../../parrot test.pir

# .S
4 5 .S
<2> 4 5 

# . (make sure it removes the top element too)
. .S
5 <1> 4 

." Hello, World!".S
Hello, World!<1> 4 
