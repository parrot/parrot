package Parrot::Jit;

$Push_Inmediate = '\\x00';
$Push = '\\x00';
$Call = '\\x00';

sub system_call($$$) { 
  return "\\x00\\x00\\x00\\x00";
}

sub Assemble($) { 
  return "\\x00\\x00\\x00\\x00";
}

1;
