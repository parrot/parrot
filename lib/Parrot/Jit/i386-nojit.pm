package Parrot::Jit;

sub system_call($$$) { 
  return "\\x00\\x00\\x00\\x00";
}

1;
