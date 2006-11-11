#!../../parrot test.pir

# function to add 2
: add2 2 + ;  15 add2
17

# function within a function
: add3 add2 1 + ; add3
20

# change definition of add2 and make sure add3 doesn't change
: add2 2 - ; add3
23

# make sure parsing happens correctly in new words
: GREET ." Hello, World!" ; GREET
Hello, World!
