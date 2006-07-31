#!../../parrot tcl.pbc

source lib/test_more.tcl
plan 10

eval_is {
  catch {
    error dead
  }
  set a ""
} {} {discard error}

eval_is {
  catch {
    error dead
  } var
  set var
} {dead} {error messsage}

eval_is {
  catch {
    set b 0
  }
} 0 {error type: none}

eval_is {
  catch {
    error dead
  }
} 1 {error type: error}

eval_is {
  catch {
    return
  }
} 2 {error type: return}

eval_is {
  catch {
    break
  }
} 3 {error type: break}

eval_is {
  catch {
    continue
  }
} 4 {error type: continue}

eval_is {
  set a [catch blorg var]
  list $a $var
} {1 {invalid command name "blorg"}} {error, invalid command}

eval_is {catch} \
  {wrong # args: should be "catch script ?resultVarName? ?optionVarName?"} \
  {too few args}

eval_is {
  list [catch {incr} msg] $msg
} {1 {wrong # args: should be "incr varName ?increment?"}} \
  {catch {incr} msg}
