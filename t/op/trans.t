#!/usr/local/bin/perl -w

use Parrot::Test tests => 18;
use Math::Trig qw( tan sec atan asin acos asec cosh sinh tanh sech );

my %trans_functions = ( sin => sub { sin($_[0]) },   cos => sub { cos($_[0]) },   tan => \&tan,
                        sec => \&sec,   atan => \&atan, asin => \&asin,
                        acos => \&acos, asec => \&asec, cosh => \&cosh,
                        sinh => \&sinh, tanh => \&tanh, sech => \&sech );
my %other_functions = ( log2 => sub { log($_[0]) / log(2) } , log10 => sub { log($_[0]) / log(10) },
                        ln => sub { log($_[0]) } , exp => sub { exp($_[0]) } );

my ($key, $value) = ('','');

while( ($key, $value) = each( %trans_functions ) ) {
  output_is( <<"CODE", sprintf( "%f%f", &$value(1), &$value(1) ), $key );
        set N1, 1.0
        ${key}_n_n N2, N1
        print N2
        set I1, 1
        ${key}_n_i N2, I1
        print N2
        end
CODE
}


output_is( <<'CODE', sprintf( "%f%f%f%f", atan2(1,1), atan2(1,1), atan2(1,1), atan2(1,1) ), "atan2" );
   set N1, 1.0
   set I1, 1
   set N2, 1.0
   set I2, 1
   atan2_n_n_n N3, N1, N2
   print_n N3
   atan2_n_n_i N3, N1, I2
   print_n N3
   atan2_n_i_n N3, I1, N2
   print_n N3
   atan2_n_i_i N3, I1, I2
   print_n N3
   end
CODE
  
while( ($key,$value) = each( %other_functions ) ) {
  output_is( <<"CODE", sprintf( "%f%f", &$value(10), &$value(10) ), $key );
        set N1, 10.0
        ${key}_n_n N2, N1
        print N2
        set I1, 10
        ${key}_n_i N2, I1
        print N2
        end
CODE
}

output_is( <<'CODE', sprintf( "%f%f%f%f", 3 ** 5, 3 ** 5, 3 ** 5, 3 ** 5 ), "pow" );
   set N1, 3.0
   set I1, 3
   set N2, 5.0
   set I2, 5
   pow_n_n_n N3, N1, N2
   print_n N3
   pow_n_n_i N3, N1, I2
   print_n N3
   pow_n_i_n N3, I1, N2
   print_n N3
   pow_n_i_i N3, I1, I2
   print_n N3
   end
CODE
