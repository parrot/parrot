Parakeet

  Parakeet is a Forth-like stack language for the Parrot VM.  It is
  written in PIR and compiles its code directly to PIR.

  By "Forth-like" I mean that it is not "Standard Forth".  Parrot has
  no intention of following the Forth standard, which is very specific
  to small, concrete micro-processors.  Parakeet is a Forth VM that
  fits naturally on top of the object oriented architecture of the
  Parrot VM.

  Parakeet comes with a small 'test.pk' file that flexes most of the
  features implemeted so far.  If you want to go right to the code,
  take a look at that.  If you want to use some kind of editor mode to
  highlight it, I suggest a shell mode.

  Parakeet can be used and learned through an interactive interpreter.
  To run the interpretor, point your Parrot interpreter to the
  parakeet.imc file, like:

    ./parrot language/parakeet/parakeet.imc
    0>

  The '0>' is the interactive prompt.  The number represents the
  number of objects on the "data stack".  Currently there are zero.
  Objects get "pushed" onto the stack depending on what you type here,
  for example, to push two numbers onto the stack, just type them in:

    0> 33 44
    2>

  The numbers '33' and '44' are now pushed onto the stack from left to
  right, '44' sits atop '33'.  Now to add the two numbers together,
  use the word '+' and print out the result with 'println':

    2> + println
    77
    0>

  Due to Parakeet's Forth syntax, the mathematical notiation is
  postfix, where the operator follows the operands.  The Python
  expression:

    print 3 * (4 + 2)

  in Parakeet is:

    4 2 + 3 * println

Words

  Like in Forth, everything in Parakeet is a word.  Words are
  seperated by whitespace.  While in other languages the equivalent to
  '*' might be called an operator, and the equivalent to 'println'
  might be called a builtin, or a function, in Parakeet they are all
  just words.

  Some words like numbers, string, and certain primitive "core" words
  are built into Parakeet.  Other words you can define yourself as
  variable functions, classes, and methods.

  A variable is defined wit the word 'var'

   0> 3 var x
   0> x println
   3
   0>

  Var is the equivalent to a Python assignment.  You can call var many
  times with different values on the same variable.  The old reference
  will be replaced with the new:

   0> 4 var x x println
   4
   0>

  "Functions" are words that execute a block of Parakeet code.  They
  are defined with the words 'func' and 'end':

   0> func hello "hi!" println end
   0> hello
   hi!
   0>

  "Classes" are defined with the words 'class' and 'end', and their
  methods are defined with the words 'meth' and 'end':

    0> class Foo meth bar "hi!" println end end
    0>

  New instances of classes can be created with 'new':

    0> Foo new var f

  And methods can be called with '->' ("bind"):

    0> f -> bar
    hi!

  Words try to be a little helpful by allowing you to see their PIR
  code:

    0> see hello
    .sub _hello
    .TOS = new .PerlString
    .TOS = "hi!"
    .PUSH
    .POP
    print .TOS
    print "\n"
    #invoke P1
    .end
    0> 

  The word 'see' shows you the PIR code that was compiled to create
  the word 'hello'.  Classes can also be seen:

    0> see Foo
    .namespace["Foo"]
    .sub _bar method
    inc .LEVEL
    new_pad .LEVEL
    .TOS = new .PerlString
    .TOS = "hi!"
    .PUSH
    .POP
    print .TOS
    print "\n"
    pop_pad
    dec .LEVEL
    .pcc_begin_return
    .pcc_end_return
    .end
    0> 

  Seeing a core word shows you a small description of that word:

    0> see println
    Core Word: Pop stack item and print it on own line.
    0> 

  Since the core words are still pretty flexible right now, please see
  the source file parakeet.imc for a list of all the current words.

Control

  If blocks:

    0> 1 if "true" println then
    true
    0> 0 if "false" println then
    0>

  'else' is not yet implemented.

  Do loops in parakeet have a following named index variable.  So the
  Forth:

    10 0 do 
      i . 
    loop

  In Parakeet becomes:

    10 0 do i 
      i println 
    loop

  Notice that the 'i' follows the 'do'.  This is the variable name that
  Parakeet will assign the index value every time through the loop.
  Slightly more verbose, but removes Forth's terrible hardwired 'I' and
  'J' words and allows creative index var names like:

    xaxis do xpoint
      yaxis do ypoint
	zaxis do zpoint
	   # use xpoint, ypoint, and zpoint
	loop
      loop
    loop

  Parakeet will also support interators with the words 'for' and
  'next', but this has not been implemented yet.
