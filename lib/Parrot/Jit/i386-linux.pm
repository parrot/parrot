package Jit;

my %syscall_number = (
    "WRITE"         => 4,
    "GETTIMEOFDAY"  => 78
);

sub system_call($$$) {
    my ($arg_c,$arg_v,$sys_n) = @_;

    my ($t,$sc,$k,$j);

    my @mov_v = (
                 "\\xbb",
                 "\\xb9",
                 "\\xba",
                 "\\xbe",
                 "\\xbf",
                 "\\xbd"
                );

    my @mov_a = (
                 "\\x1d",
                 "\\x0d",
                 "\\x15",
                 "\\x35",
                 "\\x3d",
                 "\\x2d"
                );

    $sys_n = $syscall_number{$sys_n};

    for ($k = 0; $k < $arg_c; $k++) {
        $arg_v =~ s/([VA])([\&\*][a-zA-Z]+\d+)//; 
        $t = $1;
        $j = $2;
        if ($t eq 'V') {
            $sc .= $mov_v[$k] . $j;
        } elsif ($t eq 'A') { 
            $sc .= "\\x8b" . $mov_a[$k] . $j;
        }
    }
        
    $sc .= "\\xb8";

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
