package Parrot::Jit;

$Push_Inmediate = '\\x68';
$Push = '\\xff\\x35';
$Call = '\\xe8';

my %syscall_number = (
    "WRITE"         => 4,
    "GETTIMEOFDAY"  => 116
);

sub system_call($$$) {
    my ($arg_c,$arg_v,$sys_n) = @_;

    my ($t,$sc,$k,$j);

    for($k = 0; $k < $arg_c; $k++) {
        $arg_v =~ s/([VA])([\&\*][a-zA-Z_]+\[\d+\])$//; 
        $t = $1;
        $j = $2;
        if ($t eq 'V') {
            $sc .= $Push_Inmediate . $j;
        } elsif ($t eq 'A') { 
            $sc .= $Push . $j;
        }
    }

    $sc .= "\\x50\\xb8";

    $sys_n = $syscall_number{$sys_n};

    $sys_n = sprintf("%x",$sys_n);
    for ($k = 1; $k <= 4; $k++) {
        if ($sys_n) {
            $sys_n =~ s/(.?.)$//;
            $j = $1;
            $j = "0" . $j if length($j) == 1;
         } else {
            $j = "00";
         }
         $sc .= "\\x" . $j; 
    }

    $sc .= "\\xcd\\x80\\x72\\x00";
    return $sc;
}

1;
