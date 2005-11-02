
use Parrot::Test tests => 3;
use Parrot::Test::PGE;

p6rule_like("abcd",  "<alpha>**{3} {{ print match }}",
    qr/abcmatched/, "PIR closure");

p6rule_like("123 any",  
    ":lang(PIR) <digit>+ {{ I0 = match \n I0 *= 2 \n print I0 }}",
    qr/246/, "multi-line PIR closure");

p6rule_like("123 any",
    ":lang(PASM) <digit>+ {{{{
        .pcc_sub _foo:
        print \"foo\\n\"
        set_returns \"()\"
        returncc
     }}}}",
     qr/foo/, "multi-line PASM closure");
           
