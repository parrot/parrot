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
sub Generate(@input, @output) {
    my ($cell, $neighbours, $i);
    my $len = 256; #@input;
    my ($pos, $offset);
    #my str $birth = "   *     ";
    #my str $death = "  **     ";
    my @death = (0,0,1,1,0,0,0,0,0);
    # string output = input;
    # ^= unimp
    #for $i (0 .. $len) {
    loop ($i = 0; $i < $len; $i++) {
	@output[$i] = @input[$i];
    }
    #for $cell (0..$len) {
    loop ($cell = 0; $cell < $len; $cell++) {
	$neighbours = 0;
	$i = $cell + $len;
	$neighbours++ if(@input[($i - 1) % $len]);
	$neighbours++ if(@input[($i + 1) % $len]);
	$neighbours++ if(@input[($i - 17) % $len]);
	$neighbours++ if(@input[($i + 17) % $len]);
	$neighbours++ if(@input[($i - 16) % $len]);
	$neighbours++ if(@input[($i + 16) % $len]);
	$neighbours++ if(@input[($i - 15) % $len]);
	$neighbours++ if(@input[($i + 15) % $len]);
	if(@input[$cell]) {
	    @output[$cell] = @death[$neighbours];
	}
	elsif($neighbours == 3) {
	    @output[$cell] = 1;
	}
    }
    #return output;
}

sub Print(@world) {
    my ($i, $j);
    # for $i (0 .. 15) => imcc error releated to closure?
    loop ($i = 0; $i < 16; $i++) {
	# same here ?
	loop ($j = 0; $j < 16; $j++) {
	    print( @world[$i * 16 + $j] ?? '*' :: ' ');
	}
	print "\n" ;
    }
    print "----------------\n";
}
#static void Main()

sub main() {
    my  @world = (
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
	1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
	0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    );

    my ($i, $j);
    my (@new);
    my $gen = 518;
    # for $j (0 .. 499) => imcc error releated to closure?
    print "Running " , $gen , " generations\n";
    Print(@world);
    my $ts = time;
    loop( $j= 0 ; $j < $gen; $j++) {
	Generate(@world, @new);
	# @world ^= @new; unimp
	loop ($i = 0; $i<256; $i++) {
	    @world[$i] = @new[$i];
	}

    }
    Print(@world);
}

