#!/usr/local/bin/perl -w

use Parrot::Test tests => 18;
use Math::Trig qw( tan sec atan asin acos asec cosh sinh tanh sech );

output_is( <<"CODE", sprintf( "%f%f", sin(1.0), sin(1.0) ), "sin" );
    set N1, 1.0
    sin N2, N1
    print N2
    set I1, 1
    sin N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", cos(1.0), cos(1.0) ), "cos" );
    set N1, 1.0
    cos N2, N1
    print N2
    set I1, 1
    cos N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", tan(1.0), tan(1.0) ), "tan" );
    set N1, 1.0
    tan N2, N1
    print N2
    set I1, 1
    tan N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", sec(1.0), sec(1.0) ), "sec" );
    set N1, 1.0
    sec N2, N1
    print N2
    set I1, 1
    sec N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", atan(1.0), atan(1.0) ), "atan" );
    set N1, 1.0
    atan N2, N1
    print N2
    set I1, 1
    atan N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", asin(1.0), asin(1.0) ), "asin" );
    set N1, 1.0
    asin N2, N1
    print N2
    set I1, 1
    asin N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", acos(1.0), acos(1.0) ), "acos" );
    set N1, 1.0
    acos N2, N1
    print N2
    set I1, 1
    acos N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", asec(1.0), asec(1.0) ), "asec" );
    set N1, 1.0
    asec N2, N1
    print N2
    set I1, 1
    asec N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", cosh(1.0), cosh(1.0) ), "cosh" );
    set N1, 1.0
    cosh N2, N1
    print N2
    set I1, 1
    cosh N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", sinh(1.0), sinh(1.0) ), "sinh" );
    set N1, 1.0
    sinh N2, N1
    print N2
    set I1, 1
    sinh N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", tanh(1.0), tanh(1.0) ), "tanh" );
    set N1, 1.0
    tanh N2, N1
    print N2
    set I1, 1
    tanh N2, I1
    print N2
    end
CODE

output_is( <<"CODE", sprintf( "%f%f", sech(1.0), sech(1.0) ), "sech" );
    set N1, 1.0
    sech N2, N1
    print N2
    set I1, 1
    sech N2, I1
    print N2
    end
CODE

output_is( <<'CODE', sprintf( "%f%f%f%f", atan2(1.0,1.0), atan2(1.0,1.0), atan2(1.0,1.0), atan2(1.0,1.0) ), "atan" );
   set N1, 1.0
   set I1, 1
   set N2, 1.0
   set I2, 1
   atan N3, N1, N2
   print_n N3
   atan N3, N1, I2
   print_n N3
   atan N3, I1, N2
   print_n N3
   atan N3, I1, I2
   print_n N3
   end
CODE

output_is( <<"CODE", sprintf( "%f%f", log(10.0) / log(2.0), log(10.0) / log(2.0) ), "log2" );
        set N1, 10.0
        log2 N2, N1
        print N2
        set I1, 10
        log2 N2, I1
        print N2
        end
CODE

output_is( <<"CODE", sprintf( "%f%f", log(10.0) / log(10.0), log(10.0) / log(10.0) ), "log10" );
        set N1, 10.0
        log10 N2, N1
        print N2
        set I1, 10
        log10 N2, I1
        print N2
        end
CODE

output_is( <<"CODE", sprintf( "%f%f", log(10.0), log(10.0) ), "ln" );
        set N1, 10.0
        ln N2, N1
        print N2
        set I1, 10
        ln N2, I1
        print N2
        end
CODE

output_is( <<"CODE", sprintf( "%f%f", exp(10.0), exp(10.0) ), "exp" );
        set N1, 10.0
        exp N2, N1
        print N2
        set I1, 10
        exp N2, I1
        print N2
        end
CODE

output_is( <<'CODE', sprintf( "%f%f%f%f", 3.0 ** 5.0, 3.0 ** 5.0, 3.0 ** 5.0, 3.0 ** 5.0 ), "pow" );
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
