# https://github.com/parrot/parrot/issues/861
# various Rakudo users have noticed that single-line reads 
# often keep reading to EOF instead of stopping after a single line.

.sub 'main' :main
    .local pmc stdin
    stdin = getstdin
    stdin.'encoding'('utf8')
    sweep 1
    $I0 = 1000
  loop:
    unless $I0 > 0 goto done
    $S0 = $I0
    dec $I0
    goto loop
  done:
    print "Enter a line of text: "
    $S1 = stdin.'readline'()
    print "Your line is: "
    say $S1
.end

# Notice how only a single line of text is requested, but I 
# entered several lines and ultimately had to send EOF (Ctrl-D on Linux) 
# after the "I already entered a line of text" input in order to get the 
# program to proceed, at which point it returned all of my input lines in $S1.
