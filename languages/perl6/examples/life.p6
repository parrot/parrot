#!perl6

# life.p6 adopted for perl6 after:
#
# // life.cola
# //
# // Game of life
# //
# // Copyright (C) 2002 Melvin Smith
# //
#
# (c) 2002 by Leopold Toetsch

# we don't have »is rw« or call string by refs, so
# input / output are int arrays - slooow
#
sub Generate($input) {
    my ($cell, $neighbours, $i);
    my $len = 256; #@input;
    my ($pos, $offset);
    #my str $birth = "   *     ";
    #my str $death = "  **     ";
    my $death = "  **     ";
    # string output = input;
    my $output = $input;
    #for $cell (0..$len) {
    loop ($cell = 0; $cell < $len; $cell++) {
	$neighbours = 0;
	$i = $cell + $len;
	$neighbours++ if(substr($input, ($i - 1) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i + 1) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i - 17) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i + 17) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i - 16) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i + 16) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i - 15) % $len, 1) eq "*");
	$neighbours++ if(substr($input, ($i + 15) % $len, 1) eq "*");
	if(substr($input, $cell, 1) eq "*") {
	    my $n = substr($death, $neighbours, 1);
	    substr($output, $cell, 1, $n);
	}
	elsif($neighbours == 3) {
	    substr($output, $cell, 1, "*");
	}
    }
    return $output;
}

sub Print($world) {
    my ($i);
    loop ($i = 0; $i < 16; $i++) {
	print1( substr($world, $i * 16 , 16) );
    }
    print "----------------\n";
}
#static void Main()

sub main() {
    my  $world =
       "                " ~
       " *              " ~
       "  *             " ~
       "***             " ~
       "                " ~
       "                " ~
       "                " ~
       "                " ~
       "                " ~
       "                " ~
       "                " ~
       "                " ~
       "   *            " ~
       "    *           " ~
       "  ***           " ~
       "                "
    ;

    my $j;
    my $gen = @ARGS[0] || 100;
    print "Running " , $gen , " generations\n";
    Print($world);
    my $ts = time();
    loop( $j= 0 ; $j < $gen; $j++) {
	$world = Generate($world)[0];
    }
    my $te = time();
    Print($world);
    print "Gens/s ", $gen/($te-$ts), "\n";
}

