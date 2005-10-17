use Parrot::Test tests => 5;
use Parrot::Test::PGE;

## First, test direct calls to PGE::Text::bracketed
##
pir_output_is(<<'CODE', <<'OUT', "bracketed");
.sub main :main
    .local pmc bracketed
    
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Text.pir'
    
    bracketed = find_global "PGE::Text", "bracketed"
    
    $S0 = "{ nested { and } okay, () and <>,  escaped \\}'s } okay"
    $P0 = bracketed($S0)
    bsr result
    $S0 = "{ nested \n{ and } okay, \n() and <>, escaped \\}'s } okay"
    $P0 = bracketed($S0) 
    bsr result
    $S0 = "{ nested { and } okay,  unbalanced ( and < , escaped \\}'s } okay"
    $P0 = bracketed($S0, "{}")
    bsr result
    $S0 = "{ unmatched nested { not okay, nor ( and < } not okay"
    $P0 = bracketed($S0, "{}")
    bsr result
    $S0 = "{ unbalanced nested [ even with } and ] to match not okay"
    $P0 = bracketed($S0, "{}[]")
    bsr result
    $S0 = "<a quoted \">\" unbalanced right bracket> okay"
    $P0 = bracketed($S0, "<\">")
    bsr result
    $S0 = "<quoted \">\" unbalanced of two quotes (`>>>\"\"\">>>>`)> okay"
    $P0 = bracketed($S0, "<\"`>")
    bsr result
    $S0 = "<a misquoted '>' bracket ends string>"
    $P0 = bracketed($S0, "<\"`>")
    bsr result
    .return ()

  result:
    if $P0 goto succeed
    print "failed\n"
    ret
  succeed:
    $I0 = $P0."to"()
    $S1 = substr $S0, $I0
    print $S1
    print "\n"
    ret
.end
CODE
 okay
 okay
 okay
failed
failed
 okay
 okay
' bracket ends string>
OUT

## Now, test calls as subrules
##
$PTB = "^<PGE::Text::bracketed>\$";
p6rule_is  ("{ nested { and } okay, () and <> pairs okay }", $PTB);
p6rule_is  ("{ nested { and } okay, escaped \\}'s okay }", $PTB);
p6rule_isnt("{ unmatched nested { not okay }", $PTB);
p6rule_isnt("{ unmatched nested ( not okay }", $PTB);

# Don't forget to change the number of tests!
