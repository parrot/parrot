use Parrot::Test;
use Test::More;
use Parrot::Config;

if ($PConfig{intvalsize} == 8) {
   plan tests => 1;
}
else {
   plan skip_all => "64bit INTVAL platforms only";
}

output_is(<<'CODE', <<'OUTPUT', "bitops64");
	# check bitops for 8-byte ints
	set I0, 0xffffffffffffffff
	print I0 # -1
	print "\n"
	set I1, 0x00000000ffffffff
	print I1 # 4294967295
	print "\n"
	set I0, I1
	shl I0, I0, 32
	print I0 # -4294967296
	print "\n"
	band I2, I0, I1
	print I2 # 0
	print "\n"
	bor I2, I0, I1
	print I2 # -1
	print "\n"
	end

CODE
-1
4294967295
-4294967296
0
-1
OUTPUT

