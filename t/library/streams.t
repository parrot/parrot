#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/library/streams.t - Stream tests

=head1 SYNOPSIS

        % perl -Ilib t/library/streams.t

=head1 DESCRIPTION

Tests string streams.

=cut

use strict;

my @streams = qw[Combiner Coroutine Filter Lines ParrotIO Replay Sub Writer];

use Parrot::Test tests => 20;
use Test::More;

for my $a ( @streams ) {

#
# 1..8
#
output_is(<<"CODE", <<"OUT", "load and create a Stream::$a");
##PIR##
.sub _main
    print "loading '$a'...\\n"
    load_bytecode "library/Stream/$a.imc"
    print "loaded\\n"

    find_type \$I0, "Stream::$a"
    \$P0 = new \$I0

    \$S0 = classname \$P0
    print "classname: '"
    print \$S0
    print "'\\ndone\\n"
    end
.end
CODE
loading '$a'...
loaded
classname: 'Stream::$a'
done
OUT

}

#
# 9
#
output_is(<<'CODE', <<'OUT', "Stream::Sub");
##PIR##
.sub _main @MAIN
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/Sub.imc"

    find_type I0, "Stream::Sub"
    new stream, I0

    # set the stream's source sub
    newsub temp, .Sub, _hello
    assign stream, temp

    # dump the stream
    stream."dump"()
    # read again to see if read returns null
    $S0 = stream."read"()
    isnull $S0, OK
    print "error: read returned '"
    print $S0
    print "' instead of (null)\n"
OK:
    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end
.sub _hello method
    self."write"( "hello" )
    self."write"( "world!" )
    self."write"( "parrot" )
    self."write"( "is cool" )
.end
CODE
read:[hello]
read:[world!]
read:[parrot]
read:[is cool]
done
finished
OUT

#
# 10
#
output_is(<<'CODE', <<'OUT', "Stream::read_bytes");
##PIR##
.sub _main @MAIN
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/Sub.imc"
    load_bytecode "library/Stream/Replay.imc"

    find_type $I0, "Stream::Sub"
    new $P0, $I0
    # set the stream's source sub
    newsub $P1, .Sub, _hello
    assign $P0, $P1

    find_type $I0, "Stream::Replay"
    stream = new $I0
    assign stream, $P0

    $S0 = stream."read_bytes"( 3 )
    print "1: ["
    print $S0
    print "]\n"

    stream = clone stream
    $P0 = clone stream

    $S0 = stream."read_bytes"( 4 )
    print "2: ["
    print $S0
    print "] = "

    $S0 = $P0."read_bytes"( 4 )
    print "3: ["
    print $S0
    print "]\n"

    $S0 = stream."read"()
    print "4: ["
    print $S0
    print "]\n"

    print "# _hello ends now:\n"    
    $S0 = stream."read_bytes"( 100 )
    print "5: ["
    print $S0
    print "]\n"

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _hello method
    print "_hello start!\n"
    self."write"( "hello" )
    self."write"( "world!" )
    self."write"( "parrot" )
    self."write"( "is cool" )
    print "_hello end!\n"
.end
CODE
_hello start!
1: [hel]
2: [lowo] = 3: [lowo]
4: [rld!]
# _hello ends now:
_hello end!
5: [parrotis cool]
done
finished
OUT

#
# 11
#
output_is(<<'CODE', <<'OUT', "Stream::Combiner");
##PIR##
.sub _main
    .local pmc counter
    .local pmc text
    .local pmc combined
    .local pmc temp

    load_bytecode "library/Stream/Base.imc"
    load_bytecode "library/Stream/Combiner.imc"
    load_bytecode "library/Stream/Sub.imc"

    # create the counter stream
    find_type I0, "Stream::Sub"
    new counter, I0
    newsub temp, .Sub, _counter
    assign counter, temp

    # create the text stream
    find_type I0, "Stream::Sub"
    new text, I0
    # set its source
    newsub temp, .Sub, _text
    assign text, temp

    # create a combiner stream
    find_type I0, "Stream::Combiner"
    new combined, I0
    # add the streams
    assign combined, counter
    assign combined, text

    # specify our own combiner sub
    newsub temp, .Sub, _combiner
    combined."combiner"( temp )

    # dump the combined stream
    combined."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _counter
    .param pmc stream
    .local int i
    .local string str

    i = 0
LOOP:
    inc i
    str = i
    stream."write"( str )
    branch LOOP
.end

.sub _text
    .param pmc stream

    stream."write"( "hello" )
    stream."write"( "world!" )
    stream."write"( "parrot" )
    stream."write"( "is cool" )
.end

.sub _combiner
    .param pmc strings
    .param string str
    .local string ret

    ret = strings[0]
    concat ret, " "
    str = strings[1]
    concat ret, str

    .return(ret)
.end
CODE
read:[1 hello]
read:[2 world!]
read:[3 parrot]
read:[4 is cool]
done
finished
OUT

#
# 12
#
output_is(<<'CODE', <<'OUT', "Stream::Coroutine");
##PIR##
.sub _main
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/Base.imc"
    load_bytecode "library/Stream/Coroutine.imc"

    # create the coroutine stream
    find_type I0, "Stream::Coroutine"
    new stream, I0

    # set the stream's source coroutine
    newsub temp, .Coroutine, _coro
    assign stream, temp
    #stream."source"( temp )

    # dump the stream
    stream."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _coro
    .param pmc stream
    .local int i
    .local string str

    i = 0
LOOP:
    str = i

    .yield(str)

    inc i
    if i < 10 goto LOOP

    # the stream is automatically closed if you return a null string
    # you can also close it explicitly with
    # stream."close"()
    # in which case it doesn't matter what you are returning.

    null str
    .return(str)
.end
CODE
read:[0]
read:[1]
read:[2]
read:[3]
read:[4]
read:[5]
read:[6]
read:[7]
read:[8]
read:[9]
done
finished
OUT

#
# 13
#
output_is(<<'CODE', <<'OUT', "Stream::ParrotIO");
##PIR##
.sub _main
    .local pmc file
    .local pmc lines
    .local pmc counter
    .local pmc combiner
    .local pmc temp
    .local string name

    name = "t/library/perlhist.txt"

    load_bytecode "library/Stream/ParrotIO.imc"
    load_bytecode "library/Stream/Lines.imc"
    load_bytecode "library/Stream/Sub.imc"
    load_bytecode "library/Stream/Combiner.imc"

    # create a file stream
    find_type I0, "Stream::ParrotIO"
    new file, I0
    file."open"( name, "<" )

    # process it one line per read
    find_type I0, "Stream::Lines"
    new lines, I0
    assign lines, file

    # endless counter
    find_type I0, "Stream::Sub"
    new counter, I0
    newsub temp, .Sub, _counter
    assign counter, temp

    # combine the counter and the file's lines
    find_type I0, "Stream::Combiner"
    new combiner, I0
    assign combiner, counter
    assign combiner, lines

    # dump the stream
    combiner."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _counter
    .param pmc stream
    .local int i
    .local string str
    .local pmc array

    i = 0
    array = new .PerlArray

LOOP:
    inc i
    array[0] = i
    sprintf str, "%5d ", array
    stream."write"( str )
    branch LOOP
.end
CODE
read:[    1 ]
read:[    2 This file is used as a source for ParrotIO streams in t/library/streams.t]
read:[    3 ]
read:[    4         Larry   0              Classified.     Don't ask.]
read:[    5         Larry   1.000          1987-Dec-18]
read:[    6                  1.001..10     1988-Jan-30]
read:[    7                  1.011..14     1988-Feb-02]
read:[    8         Schwern  1.0.15        2002-Dec-18     Modernization]
read:[    9         Richard  1.0.16        2003-Dec-18]
read:[   10         Larry   2.000          1988-Jun-05]
read:[   11                  2.001         1988-Jun-28]
read:[   12         Larry   3.000          1989-Oct-18]
read:[   13                  3.001         1989-Oct-26]
read:[   14                  3.002..4      1989-Nov-11]
read:[   15                  3.005         1989-Nov-18]
read:[   16                  3.006..8      1989-Dec-22]
read:[   17                  3.009..13     1990-Mar-02]
read:[   18                  3.014         1990-Mar-13]
read:[   19                  3.015         1990-Mar-14]
read:[   20                  3.016..18     1990-Mar-28]
read:[   21                  3.019..27     1990-Aug-10     User subs.]
read:[   22                  3.028         1990-Aug-14]
read:[   23                  3.029..36     1990-Oct-17]
read:[   24                  3.037         1990-Oct-20]
read:[   25                  3.040         1990-Nov-10]
read:[   26                  3.041         1990-Nov-13]
read:[   27                  3.042..43     1991-Jan-??]
read:[   28                  3.044         1991-Jan-12]
read:[   29         Larry   4.000          1991-Mar-21]
read:[   30                  4.001..3      1991-Apr-12]
read:[   31                  4.004..9      1991-Jun-07]
read:[   32                  4.010         1991-Jun-10]
read:[   33                  4.011..18     1991-Nov-05]
read:[   34                  4.019         1991-Nov-11     Stable.]
read:[   35                  4.020..33     1992-Jun-08]
read:[   36                  4.034         1992-Jun-11]
read:[   37                  4.035         1992-Jun-23]
read:[   38         Larry    4.036         1993-Feb-05     Very stable.]
read:[   39                  5.000alpha1   1993-Jul-31]
read:[   40                  5.000alpha2   1993-Aug-16]
read:[   41                  5.000alpha3   1993-Oct-10]
read:[   42                  5.000alpha4   1993-???-??]
read:[   43                  5.000alpha5   1993-???-??]
read:[   44                  5.000alpha6   1994-Mar-18]
read:[   45                  5.000alpha7   1994-Mar-25]
read:[   46         Andy     5.000alpha8   1994-Apr-04]
read:[   47         Larry    5.000alpha9   1994-May-05     ext appears.]
read:[   48                  5.000alpha10  1994-Jun-11]
read:[   49                  5.000alpha11  1994-Jul-01]
read:[   50         Andy     5.000a11a     1994-Jul-07     To fit 14.]
read:[   51                  5.000a11b     1994-Jul-14]
read:[   52                  5.000a11c     1994-Jul-19]
read:[   53                  5.000a11d     1994-Jul-22]
read:[   54         Larry    5.000alpha12  1994-Aug-04]
read:[   55         Andy     5.000a12a     1994-Aug-08]
read:[   56                  5.000a12b     1994-Aug-15]
read:[   57                  5.000a12c     1994-Aug-22]
read:[   58                  5.000a12d     1994-Aug-22]
read:[   59                  5.000a12e     1994-Aug-22]
read:[   60                  5.000a12f     1994-Aug-24]
read:[   61                  5.000a12g     1994-Aug-24]
read:[   62                  5.000a12h     1994-Aug-24]
read:[   63         Larry    5.000beta1    1994-Aug-30]
read:[   64         Andy     5.000b1a      1994-Sep-06]
read:[   65         Larry    5.000beta2    1994-Sep-14     Core slushified.]
read:[   66         Andy     5.000b2a      1994-Sep-14]
read:[   67                  5.000b2b      1994-Sep-17]
read:[   68                  5.000b2c      1994-Sep-17]
read:[   69         Larry    5.000beta3    1994-Sep-??]
read:[   70         Andy     5.000b3a      1994-Sep-18]
read:[   71                  5.000b3b      1994-Sep-22]
read:[   72                  5.000b3c      1994-Sep-23]
read:[   73                  5.000b3d      1994-Sep-27]
read:[   74                  5.000b3e      1994-Sep-28]
read:[   75                  5.000b3f      1994-Sep-30]
read:[   76                  5.000b3g      1994-Oct-04]
read:[   77         Andy     5.000b3h      1994-Oct-07]
read:[   78         Larry?   5.000gamma    1994-Oct-13?]
read:[   79         Larry   5.000          1994-Oct-17]
read:[   80         Andy     5.000a        1994-Dec-19]
read:[   81                  5.000b        1995-Jan-18]
read:[   82                  5.000c        1995-Jan-18]
read:[   83                  5.000d        1995-Jan-18]
read:[   84                  5.000e        1995-Jan-18]
read:[   85                  5.000f        1995-Jan-18]
read:[   86                  5.000g        1995-Jan-18]
read:[   87                  5.000h        1995-Jan-18]
read:[   88                  5.000i        1995-Jan-26]
read:[   89                  5.000j        1995-Feb-07]
read:[   90                  5.000k        1995-Feb-11]
read:[   91                  5.000l        1995-Feb-21]
read:[   92                  5.000m        1995-Feb-28]
read:[   93                  5.000n        1995-Mar-07]
read:[   94                  5.000o        1995-Mar-13?]
read:[   95         Larry   5.001          1995-Mar-13]
read:[   96         Andy     5.001a        1995-Mar-15]
read:[   97                  5.001b        1995-Mar-31]
read:[   98                  5.001c        1995-Apr-07]
read:[   99                  5.001d        1995-Apr-14]
read:[  100                  5.001e        1995-Apr-18     Stable.]
read:[  101                  5.001f        1995-May-31]
read:[  102                  5.001g        1995-May-25]
read:[  103                  5.001h        1995-May-25]
read:[  104                  5.001i        1995-May-30]
read:[  105                  5.001j        1995-Jun-05]
read:[  106                  5.001k        1995-Jun-06]
read:[  107                  5.001l        1995-Jun-06     Stable.]
read:[  108                  5.001m        1995-Jul-02     Very stable.]
read:[  109                  5.001n        1995-Oct-31     Very unstable.]
read:[  110                  5.002beta1    1995-Nov-21]
read:[  111                  5.002b1a      1995-Dec-04]
read:[  112                  5.002b1b      1995-Dec-04]
read:[  113                  5.002b1c      1995-Dec-04]
read:[  114                  5.002b1d      1995-Dec-04]
read:[  115                  5.002b1e      1995-Dec-08]
read:[  116                  5.002b1f      1995-Dec-08]
read:[  117         Tom      5.002b1g      1995-Dec-21     Doc release.]
read:[  118         Andy     5.002b1h      1996-Jan-05]
read:[  119                  5.002b2       1996-Jan-14]
read:[  120         Larry    5.002b3       1996-Feb-02]
read:[  121         Andy     5.002gamma    1996-Feb-11]
read:[  122         Larry    5.002delta    1996-Feb-27]
read:[  123         Larry   5.002          1996-Feb-29     Prototypes.]
read:[  124         Charles  5.002_01      1996-Mar-25]
read:[  125                 5.003          1996-Jun-25     Security release.]
read:[  126                  5.003_01      1996-Jul-31]
read:[  127         Nick     5.003_02      1996-Aug-10]
read:[  128         Andy     5.003_03      1996-Aug-28]
read:[  129                  5.003_04      1996-Sep-02]
read:[  130                  5.003_05      1996-Sep-12]
read:[  131                  5.003_06      1996-Oct-07]
read:[  132                  5.003_07      1996-Oct-10]
read:[  133         Chip     5.003_08      1996-Nov-19]
read:[  134                  5.003_09      1996-Nov-26]
read:[  135                  5.003_10      1996-Nov-29]
read:[  136                  5.003_11      1996-Dec-06]
read:[  137                  5.003_12      1996-Dec-19]
read:[  138                  5.003_13      1996-Dec-20]
read:[  139                  5.003_14      1996-Dec-23]
read:[  140                  5.003_15      1996-Dec-23]
read:[  141                  5.003_16      1996-Dec-24]
read:[  142                  5.003_17      1996-Dec-27]
read:[  143                  5.003_18      1996-Dec-31]
read:[  144                  5.003_19      1997-Jan-04]
read:[  145                  5.003_20      1997-Jan-07]
read:[  146                  5.003_21      1997-Jan-15]
read:[  147                  5.003_22      1997-Jan-16]
read:[  148                  5.003_23      1997-Jan-25]
read:[  149                  5.003_24      1997-Jan-29]
read:[  150                  5.003_25      1997-Feb-04]
read:[  151                  5.003_26      1997-Feb-10]
read:[  152                  5.003_27      1997-Feb-18]
read:[  153                  5.003_28      1997-Feb-21]
read:[  154                  5.003_90      1997-Feb-25     Ramping up to the 5.004 release.]
read:[  155                  5.003_91      1997-Mar-01]
read:[  156                  5.003_92      1997-Mar-06]
read:[  157                  5.003_93      1997-Mar-10]
read:[  158                  5.003_94      1997-Mar-22]
read:[  159                  5.003_95      1997-Mar-25]
read:[  160                  5.003_96      1997-Apr-01]
read:[  161                  5.003_97      1997-Apr-03     Fairly widely used.]
read:[  162                  5.003_97a     1997-Apr-05]
read:[  163                  5.003_97b     1997-Apr-08]
read:[  164                  5.003_97c     1997-Apr-10]
read:[  165                  5.003_97d     1997-Apr-13]
read:[  166                  5.003_97e     1997-Apr-15]
read:[  167                  5.003_97f     1997-Apr-17]
read:[  168                  5.003_97g     1997-Apr-18]
read:[  169                  5.003_97h     1997-Apr-24]
read:[  170                  5.003_97i     1997-Apr-25]
read:[  171                  5.003_97j     1997-Apr-28]
read:[  172                  5.003_98      1997-Apr-30]
read:[  173                  5.003_99      1997-May-01]
read:[  174                  5.003_99a     1997-May-09]
read:[  175                  p54rc1        1997-May-12     Release Candidates.]
read:[  176                  p54rc2        1997-May-14]
read:[  177         Chip    5.004          1997-May-15     A major maintenance release.]
read:[  178         Tim      5.004_01-t1   1997-???-??     The 5.004 maintenance track.]
read:[  179                  5.004_01-t2   1997-Jun-11     aka perl5.004m1t2]
read:[  180                  5.004_01      1997-Jun-13]
read:[  181                  5.004_01_01   1997-Jul-29     aka perl5.004m2t1]
read:[  182                  5.004_01_02   1997-Aug-01     aka perl5.004m2t2]
read:[  183                  5.004_01_03   1997-Aug-05     aka perl5.004m2t3]
read:[  184                  5.004_02      1997-Aug-07]
read:[  185                  5.004_02_01   1997-Aug-12     aka perl5.004m3t1]
read:[  186                  5.004_03-t2   1997-Aug-13     aka perl5.004m3t2]
read:[  187                  5.004_03      1997-Sep-05]
read:[  188                  5.004_04-t1   1997-Sep-19     aka perl5.004m4t1]
read:[  189                  5.004_04-t2   1997-Sep-23     aka perl5.004m4t2]
read:[  190                  5.004_04-t3   1997-Oct-10     aka perl5.004m4t3]
read:[  191                  5.004_04-t4   1997-Oct-14     aka perl5.004m4t4]
read:[  192                  5.004_04      1997-Oct-15]
read:[  193                  5.004_04-m1   1998-Mar-04     (5.004m5t1) Maint. trials for 5.004_05.]
read:[  194                  5.004_04-m2   1998-May-01]
read:[  195                  5.004_04-m3   1998-May-15]
read:[  196                  5.004_04-m4   1998-May-19]
read:[  197                  5.004_05-MT5  1998-Jul-21]
read:[  198                  5.004_05-MT6  1998-Oct-09]
read:[  199                  5.004_05-MT7  1998-Nov-22]
read:[  200                  5.004_05-MT8  1998-Dec-03]
read:[  201         Chip     5.004_05-MT9  1999-Apr-26]
read:[  202                  5.004_05      1999-Apr-29]
read:[  203         Malcolm  5.004_50      1997-Sep-09     The 5.005 development track.]
read:[  204                  5.004_51      1997-Oct-02]
read:[  205                  5.004_52      1997-Oct-15]
read:[  206                  5.004_53      1997-Oct-16]
read:[  207                  5.004_54      1997-Nov-14]
read:[  208                  5.004_55      1997-Nov-25]
read:[  209                  5.004_56      1997-Dec-18]
read:[  210                  5.004_57      1998-Feb-03]
read:[  211                  5.004_58      1998-Feb-06]
read:[  212                  5.004_59      1998-Feb-13]
read:[  213                  5.004_60      1998-Feb-20]
read:[  214                  5.004_61      1998-Feb-27]
read:[  215                  5.004_62      1998-Mar-06]
read:[  216                  5.004_63      1998-Mar-17]
read:[  217                  5.004_64      1998-Apr-03]
read:[  218                  5.004_65      1998-May-15]
read:[  219                  5.004_66      1998-May-29]
read:[  220         Sarathy  5.004_67      1998-Jun-15]
read:[  221                  5.004_68      1998-Jun-23]
read:[  222                  5.004_69      1998-Jun-29]
read:[  223                  5.004_70      1998-Jul-06]
read:[  224                  5.004_71      1998-Jul-09]
read:[  225                  5.004_72      1998-Jul-12]
read:[  226                  5.004_73      1998-Jul-13]
read:[  227                  5.004_74      1998-Jul-14     5.005 beta candidate.]
read:[  228                  5.004_75      1998-Jul-15     5.005 beta1.]
read:[  229                  5.004_76      1998-Jul-21     5.005 beta2.]
read:[  230                  5.005         1998-Jul-22     Oneperl.]
read:[  231         Sarathy  5.005_01      1998-Jul-27     The 5.005 maintenance track.]
read:[  232                  5.005_02-T1   1998-Aug-02]
read:[  233                  5.005_02-T2   1998-Aug-05]
read:[  234                  5.005_02      1998-Aug-08]
read:[  235         Graham   5.005_03-MT1  1998-Nov-30]
read:[  236                  5.005_03-MT2  1999-Jan-04]
read:[  237                  5.005_03-MT3  1999-Jan-17]
read:[  238                  5.005_03-MT4  1999-Jan-26]
read:[  239                  5.005_03-MT5  1999-Jan-28]
read:[  240                  5.005_03-MT6  1999-Mar-05]
read:[  241                  5.005_03      1999-Mar-28]
read:[  242         Sarathy  5.005_50      1998-Jul-26     The 5.6 development track.]
read:[  243                  5.005_51      1998-Aug-10]
read:[  244                  5.005_52      1998-Sep-25]
read:[  245                  5.005_53      1998-Oct-31]
read:[  246                  5.005_54      1998-Nov-30]
read:[  247                  5.005_55      1999-Feb-16]
read:[  248                  5.005_56      1999-Mar-01]
read:[  249                  5.005_57      1999-May-25]
read:[  250                  5.005_58      1999-Jul-27]
read:[  251                  5.005_59      1999-Aug-02]
read:[  252                  5.005_60      1999-Aug-02]
read:[  253                  5.005_61      1999-Aug-20]
read:[  254                  5.005_62      1999-Oct-15]
read:[  255                  5.005_63      1999-Dec-09]
read:[  256                  5.5.640       2000-Feb-02]
read:[  257                  5.5.650       2000-Feb-08     beta1]
read:[  258                  5.5.660       2000-Feb-22     beta2]
read:[  259                  5.5.670       2000-Feb-29     beta3]
read:[  260                  5.6.0-RC1     2000-Mar-09     Release candidate 1.]
read:[  261                  5.6.0-RC2     2000-Mar-14     Release candidate 2.]
read:[  262                  5.6.0-RC3     2000-Mar-21     Release candidate 3.]
read:[  263                  5.6.0         2000-Mar-22]
read:[  264         Sarathy  5.6.1-TRIAL1  2000-Dec-18     The 5.6 maintenance track.]
read:[  265                  5.6.1-TRIAL2  2001-Jan-31]
read:[  266                  5.6.1-TRIAL3  2001-Mar-19]
read:[  267                  5.6.1-foolish 2001-Apr-01     The "fools-gold" release.]
read:[  268                  5.6.1         2001-Apr-08]
read:[  269         Rafael   5.6.2-RC1     2003-Nov-08]
read:[  270                  5.6.2         2003-Nov-15     Fix new build issues]
read:[  271         Jarkko   5.7.0         2000-Sep-02     The 5.7 track: Development.]
read:[  272                  5.7.1         2001-Apr-09]
read:[  273                  5.7.2         2001-Jul-13     Virtual release candidate 0.]
read:[  274                  5.7.3         2002-Mar-05]
read:[  275                  5.8.0-RC1     2002-Jun-01]
read:[  276                  5.8.0-RC2     2002-Jun-21]
read:[  277                  5.8.0-RC3     2002-Jul-13]
read:[  278                  5.8.0         2002-Jul-18]
read:[  279                  5.8.1-RC1     2003-Jul-10]
read:[  280                  5.8.1-RC2     2003-Jul-11]
read:[  281                  5.8.1-RC3     2003-Jul-30]
read:[  282                  5.8.1-RC4     2003-Aug-01]
read:[  283                  5.8.1-RC5     2003-Sep-22]
read:[  284                  5.8.1         2003-Sep-25]
read:[  285         Nicholas 5.8.2-RC1     2003-Oct-27]
read:[  286                  5.8.2-RC2     2003-Nov-03]
read:[  287                  5.8.2         2003-Nov-05]
read:[  288                  5.8.3-RC1     2004-Jan-07]
read:[  289                  5.8.3         2004-Jan-14]
read:[  290                  5.8.4-RC1     2004-Apr-05]
read:[  291                  5.8.4-RC2     2004-Apr-15]
read:[  292                  5.8.4         2004-Apr-21]
read:[  293                  5.8.5-RC1     2004-Jul-06]
read:[  294                  5.8.5-RC2     2004-Jul-08]
read:[  295                  5.8.5         2004-Jul-19]
read:[  296 ]
read:[  297         Hugo     5.9.0         2003-Oct-27]
read:[  298         Rafael   5.9.1         2004-Mar-16]
done
finished
OUT

#
# 14
#
output_is(<<'CODE', <<'OUT', "Stream::Filter");
##PIR##
.sub _main
    .local pmc stream
    .local pmc filter
    .local pmc temp

    load_bytecode "library/Stream/Sub.imc"
    load_bytecode "library/Stream/Filter.imc"

    # create the counter stream
    find_type I0, "Stream::Sub"
    new stream, I0
    # assign its source
    newsub temp, .Sub, _counter
    assign stream, temp

    # create the filter stream
    find_type I0, "Stream::Filter"
    new filter, I0
    # assign its source
    assign filter, stream
    # set the filter sub
    newsub temp, .Sub, _filter
    filter."filter"( temp )

    # dump the stream
    filter."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _counter
    .param pmc stream
    .local string str
    .local int i

    i = 0

LOOP:
    str = i
    stream."write"( str )

    inc i
    if i < 10 goto LOOP
.end

.sub _filter
    .param string str
    .local string tmp
    .local int i

    i = str

    # skip 4 * 2
    if i == 4 goto SKIP

    mul i, 2
    set tmp, i
    concat str, " * 2 = "
    concat str, tmp

    .return(str)

SKIP:
    null str
    .return(str)
.end
CODE
read:[0 * 2 = 0]
read:[1 * 2 = 2]
read:[2 * 2 = 4]
read:[3 * 2 = 6]
read:[5 * 2 = 10]
read:[6 * 2 = 12]
read:[7 * 2 = 14]
read:[8 * 2 = 16]
read:[9 * 2 = 18]
done
finished
OUT

#
# 15
#
output_is(<<'CODE', <<'OUT', "Stream::include");
##PIR##
.sub _main
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/Sub.imc"

    find_type I0, "Stream::Sub"
    new stream, I0

    # set the stream's source sub
    newsub temp, .Sub, _counter
    assign stream, temp

    # dump the stream
    stream."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _counter method
    .local string str
    .local int i

    i = 0

LOOP:
    str = i

    self."write"( str )

    # include another stream after '4'
    if i != 4 goto SKIP
    .local pmc temp
    .local pmc func

    find_type I0, "Stream::Sub"
    new temp, I0

    newsub func, .Sub, _included
    assign temp, func

    # include it
    self."include"( temp )
SKIP:

    inc i
    if i < 10 goto LOOP
.end

.sub _included method
    .local pmc temp
    .local pmc func

    self."write"( "hello" )

    # create another stream
    find_type I0, "Stream::Sub"
    new temp, I0
    newsub func, .Sub, _counter2
    assign temp, func

    # include it
    self."include"( temp )

    self."write"( "world" )
.end

.sub _counter2 method
    .local string str

    str = 'A'
LOOP:
    self."write"( str )

    ord I0, str
    inc I0
    chr str, I0

    if str != "G" goto LOOP
.end
CODE
read:[0]
read:[1]
read:[2]
read:[3]
read:[4]
read:[hello]
read:[A]
read:[B]
read:[C]
read:[D]
read:[E]
read:[F]
read:[world]
read:[5]
read:[6]
read:[7]
read:[8]
read:[9]
done
finished
OUT

#
# 16
#
output_is(<<'CODE', <<'OUT', "Stream::Lines");
##PIR##
.sub _main
    .local pmc stream
    .local pmc lines
    .local pmc temp

    load_bytecode "library/Stream/Sub.imc"
    load_bytecode "library/Stream/Lines.imc"

    # create a text stream
    find_type I0, "Stream::Sub"
    new stream, I0
    # set the source
    newsub temp, .Sub, _text
    assign stream, temp

    # create a lines stream
    find_type I0, "Stream::Lines"
    new lines, I0
    # set the source
    assign lines, stream

    # dump the stream
    lines."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _text method
    self."write"( "this\nis a\n" )
    self."write"( "Stream::Lines\ntest" )
    self."write"( "case\nhello world" )
.end
CODE
read:[this]
read:[is a]
read:[Stream::Lines]
read:[testcase]
done
finished
OUT

#
# 17
#
output_is(<<'CODE', <<'OUT', "Stream::ParrotIO");
##PIR##
.sub _main @MAIN
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/ParrotIO.imc"

    # create the ParrotIO stream
    find_type I0, "Stream::ParrotIO"
    new stream, I0

    # open this file
    stream."open"( "t/library/perlhist.txt", "<" )

    # you can specifiy a custom block size with
    # stream."blockSize"( 10 )

    # dump the stream
    stream."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end
CODE
read:[\nThis file is used as a source for ParrotIO stream]
read:[s in t/library/streams.t\n\n        Larry   0       ]
read:[       Classified.     Don't ask.\n        Larry   ]
read:[1.000          1987-Dec-18\n                 1.001.]
read:[.10     1988-Jan-30\n                 1.011..14    ]
read:[ 1988-Feb-02\n        Schwern  1.0.15        2002-D]
read:[ec-18     Modernization\n        Richard  1.0.16   ]
read:[     2003-Dec-18\n        Larry   2.000          19]
read:[88-Jun-05\n                 2.001         1988-Jun-]
read:[28\n        Larry   3.000          1989-Oct-18\n    ]
read:[             3.001         1989-Oct-26\n           ]
read:[      3.002..4      1989-Nov-11\n                 3]
read:[.005         1989-Nov-18\n                 3.006..8]
read:[      1989-Dec-22\n                 3.009..13     1]
read:[990-Mar-02\n                 3.014         1990-Mar]
read:[-13\n                 3.015         1990-Mar-14\n   ]
read:[              3.016..18     1990-Mar-28\n          ]
read:[       3.019..27     1990-Aug-10     User subs.\n  ]
read:[               3.028         1990-Aug-14\n         ]
read:[        3.029..36     1990-Oct-17\n                ]
read:[ 3.037         1990-Oct-20\n                 3.040 ]
read:[        1990-Nov-10\n                 3.041        ]
read:[ 1990-Nov-13\n                 3.042..43     1991-J]
read:[an-??\n                 3.044         1991-Jan-12\n ]
read:[       Larry   4.000          1991-Mar-21\n        ]
read:[         4.001..3      1991-Apr-12\n               ]
read:[  4.004..9      1991-Jun-07\n                 4.010]
read:[         1991-Jun-10\n                 4.011..18   ]
read:[  1991-Nov-05\n                 4.019         1991-]
read:[Nov-11     Stable.\n                 4.020..33     ]
read:[1992-Jun-08\n                 4.034         1992-Ju]
read:[n-11\n                 4.035         1992-Jun-23\n  ]
read:[      Larry    4.036         1993-Feb-05     Very ]
read:[stable.\n                 5.000alpha1   1993-Jul-31]
read:[\n                 5.000alpha2   1993-Aug-16\n      ]
read:[           5.000alpha3   1993-Oct-10\n             ]
read:[    5.000alpha4   1993-???-??\n                 5.0]
read:[00alpha5   1993-???-??\n                 5.000alpha]
read:[6   1994-Mar-18\n                 5.000alpha7   199]
read:[4-Mar-25\n        Andy     5.000alpha8   1994-Apr-0]
read:[4\n        Larry    5.000alpha9   1994-May-05     e]
read:[xt appears.\n                 5.000alpha10  1994-Ju]
read:[n-11\n                 5.000alpha11  1994-Jul-01\n  ]
read:[      Andy     5.000a11a     1994-Jul-07     To fi]
read:[t 14.\n                 5.000a11b     1994-Jul-14\n ]
read:[                5.000a11c     1994-Jul-19\n        ]
read:[         5.000a11d     1994-Jul-22\n        Larry  ]
read:[  5.000alpha12  1994-Aug-04\n        Andy     5.000]
read:[a12a     1994-Aug-08\n                 5.000a12b   ]
read:[  1994-Aug-15\n                 5.000a12c     1994-]
read:[Aug-22\n                 5.000a12d     1994-Aug-22\n]
read:[                 5.000a12e     1994-Aug-22\n       ]
read:[          5.000a12f     1994-Aug-24\n              ]
read:[   5.000a12g     1994-Aug-24\n                 5.00]
read:[0a12h     1994-Aug-24\n        Larry    5.000beta1 ]
read:[   1994-Aug-30\n        Andy     5.000b1a      1994]
read:[-Sep-06\n        Larry    5.000beta2    1994-Sep-14]
read:[     Core slushified.\n        Andy     5.000b2a   ]
read:[   1994-Sep-14\n                 5.000b2b      1994]
read:[-Sep-17\n                 5.000b2c      1994-Sep-17]
read:[\n        Larry    5.000beta3    1994-Sep-??\n      ]
read:[  Andy     5.000b3a      1994-Sep-18\n             ]
read:[    5.000b3b      1994-Sep-22\n                 5.0]
read:[00b3c      1994-Sep-23\n                 5.000b3d  ]
read:[    1994-Sep-27\n                 5.000b3e      199]
read:[4-Sep-28\n                 5.000b3f      1994-Sep-3]
read:[0\n                 5.000b3g      1994-Oct-04\n     ]
read:[   Andy     5.000b3h      1994-Oct-07\n        Larr]
read:[y?   5.000gamma    1994-Oct-13?\n        Larry   5.]
read:[000          1994-Oct-17\n        Andy     5.000a  ]
read:[      1994-Dec-19\n                 5.000b        1]
read:[995-Jan-18\n                 5.000c        1995-Jan]
read:[-18\n                 5.000d        1995-Jan-18\n   ]
read:[              5.000e        1995-Jan-18\n          ]
read:[       5.000f        1995-Jan-18\n                 ]
read:[5.000g        1995-Jan-18\n                 5.000h ]
read:[       1995-Jan-18\n                 5.000i        ]
read:[1995-Jan-26\n                 5.000j        1995-Fe]
read:[b-07\n                 5.000k        1995-Feb-11\n  ]
read:[               5.000l        1995-Feb-21\n         ]
read:[        5.000m        1995-Feb-28\n                ]
read:[ 5.000n        1995-Mar-07\n                 5.000o]
read:[        1995-Mar-13?\n        Larry   5.001        ]
read:[  1995-Mar-13\n        Andy     5.001a        1995-]
read:[Mar-15\n                 5.001b        1995-Mar-31\n]
read:[                 5.001c        1995-Apr-07\n       ]
read:[          5.001d        1995-Apr-14\n              ]
read:[   5.001e        1995-Apr-18     Stable.\n         ]
read:[        5.001f        1995-May-31\n                ]
read:[ 5.001g        1995-May-25\n                 5.001h]
read:[        1995-May-25\n                 5.001i       ]
read:[ 1995-May-30\n                 5.001j        1995-J]
read:[un-05\n                 5.001k        1995-Jun-06\n ]
read:[                5.001l        1995-Jun-06     Stab]
read:[le.\n                 5.001m        1995-Jul-02    ]
read:[ Very stable.\n                 5.001n        1995-]
read:[Oct-31     Very unstable.\n                 5.002be]
read:[ta1    1995-Nov-21\n                 5.002b1a      ]
read:[1995-Dec-04\n                 5.002b1b      1995-De]
read:[c-04\n                 5.002b1c      1995-Dec-04\n  ]
read:[               5.002b1d      1995-Dec-04\n         ]
read:[        5.002b1e      1995-Dec-08\n                ]
read:[ 5.002b1f      1995-Dec-08\n        Tom      5.002b]
read:[1g      1995-Dec-21     Doc release.\n        Andy ]
read:[    5.002b1h      1996-Jan-05\n                 5.0]
read:[02b2       1996-Jan-14\n        Larry    5.002b3   ]
read:[    1996-Feb-02\n        Andy     5.002gamma    199]
read:[6-Feb-11\n        Larry    5.002delta    1996-Feb-2]
read:[7\n        Larry   5.002          1996-Feb-29     P]
read:[rototypes.\n        Charles  5.002_01      1996-Mar]
read:[-25\n                5.003          1996-Jun-25    ]
read:[ Security release.\n                 5.003_01      ]
read:[1996-Jul-31\n        Nick     5.003_02      1996-Au]
read:[g-10\n        Andy     5.003_03      1996-Aug-28\n  ]
read:[               5.003_04      1996-Sep-02\n         ]
read:[        5.003_05      1996-Sep-12\n                ]
read:[ 5.003_06      1996-Oct-07\n                 5.003_]
read:[07      1996-Oct-10\n        Chip     5.003_08     ]
read:[ 1996-Nov-19\n                 5.003_09      1996-N]
read:[ov-26\n                 5.003_10      1996-Nov-29\n ]
read:[                5.003_11      1996-Dec-06\n        ]
read:[         5.003_12      1996-Dec-19\n               ]
read:[  5.003_13      1996-Dec-20\n                 5.003]
read:[_14      1996-Dec-23\n                 5.003_15    ]
read:[  1996-Dec-23\n                 5.003_16      1996-]
read:[Dec-24\n                 5.003_17      1996-Dec-27\n]
read:[                 5.003_18      1996-Dec-31\n       ]
read:[          5.003_19      1997-Jan-04\n              ]
read:[   5.003_20      1997-Jan-07\n                 5.00]
read:[3_21      1997-Jan-15\n                 5.003_22   ]
read:[   1997-Jan-16\n                 5.003_23      1997]
read:[-Jan-25\n                 5.003_24      1997-Jan-29]
read:[\n                 5.003_25      1997-Feb-04\n      ]
read:[           5.003_26      1997-Feb-10\n             ]
read:[    5.003_27      1997-Feb-18\n                 5.0]
read:[03_28      1997-Feb-21\n                 5.003_90  ]
read:[    1997-Feb-25     Ramping up to the 5.004 releas]
read:[e.\n                 5.003_91      1997-Mar-01\n    ]
read:[             5.003_92      1997-Mar-06\n           ]
read:[      5.003_93      1997-Mar-10\n                 5]
read:[.003_94      1997-Mar-22\n                 5.003_95]
read:[      1997-Mar-25\n                 5.003_96      1]
read:[997-Apr-01\n                 5.003_97      1997-Apr]
read:[-03     Fairly widely used.\n                 5.003]
read:[_97a     1997-Apr-05\n                 5.003_97b   ]
read:[  1997-Apr-08\n                 5.003_97c     1997-]
read:[Apr-10\n                 5.003_97d     1997-Apr-13\n]
read:[                 5.003_97e     1997-Apr-15\n       ]
read:[          5.003_97f     1997-Apr-17\n              ]
read:[   5.003_97g     1997-Apr-18\n                 5.00]
read:[3_97h     1997-Apr-24\n                 5.003_97i  ]
read:[   1997-Apr-25\n                 5.003_97j     1997]
read:[-Apr-28\n                 5.003_98      1997-Apr-30]
read:[\n                 5.003_99      1997-May-01\n      ]
read:[           5.003_99a     1997-May-09\n             ]
read:[    p54rc1        1997-May-12     Release Candidat]
read:[es.\n                 p54rc2        1997-May-14\n   ]
read:[     Chip    5.004          1997-May-15     A majo]
read:[r maintenance release.\n        Tim      5.004_01-t]
read:[1   1997-???-??     The 5.004 maintenance track.\n ]
read:[                5.004_01-t2   1997-Jun-11     aka ]
read:[perl5.004m1t2\n                 5.004_01      1997-]
read:[Jun-13\n                 5.004_01_01   1997-Jul-29 ]
read:[    aka perl5.004m2t1\n                 5.004_01_02]
read:[   1997-Aug-01     aka perl5.004m2t2\n             ]
read:[    5.004_01_03   1997-Aug-05     aka perl5.004m2t]
read:[3\n                 5.004_02      1997-Aug-07\n     ]
read:[            5.004_02_01   1997-Aug-12     aka perl]
read:[5.004m3t1\n                 5.004_03-t2   1997-Aug-]
read:[13     aka perl5.004m3t2\n                 5.004_03]
read:[      1997-Sep-05\n                 5.004_04-t1   1]
read:[997-Sep-19     aka perl5.004m4t1\n                 ]
read:[5.004_04-t2   1997-Sep-23     aka perl5.004m4t2\n  ]
read:[               5.004_04-t3   1997-Oct-10     aka p]
read:[erl5.004m4t3\n                 5.004_04-t4   1997-O]
read:[ct-14     aka perl5.004m4t4\n                 5.004]
read:[_04      1997-Oct-15\n                 5.004_04-m1 ]
read:[  1998-Mar-04     (5.004m5t1) Maint. trials for 5.]
read:[004_05.\n                 5.004_04-m2   1998-May-01]
read:[\n                 5.004_04-m3   1998-May-15\n      ]
read:[           5.004_04-m4   1998-May-19\n             ]
read:[    5.004_05-MT5  1998-Jul-21\n                 5.0]
read:[04_05-MT6  1998-Oct-09\n                 5.004_05-M]
read:[T7  1998-Nov-22\n                 5.004_05-MT8  199]
read:[8-Dec-03\n        Chip     5.004_05-MT9  1999-Apr-2]
read:[6\n                 5.004_05      1999-Apr-29\n     ]
read:[   Malcolm  5.004_50      1997-Sep-09     The 5.00]
read:[5 development track.\n                 5.004_51    ]
read:[  1997-Oct-02\n                 5.004_52      1997-]
read:[Oct-15\n                 5.004_53      1997-Oct-16\n]
read:[                 5.004_54      1997-Nov-14\n       ]
read:[          5.004_55      1997-Nov-25\n              ]
read:[   5.004_56      1997-Dec-18\n                 5.00]
read:[4_57      1998-Feb-03\n                 5.004_58   ]
read:[   1998-Feb-06\n                 5.004_59      1998]
read:[-Feb-13\n                 5.004_60      1998-Feb-20]
read:[\n                 5.004_61      1998-Feb-27\n      ]
read:[           5.004_62      1998-Mar-06\n             ]
read:[    5.004_63      1998-Mar-17\n                 5.0]
read:[04_64      1998-Apr-03\n                 5.004_65  ]
read:[    1998-May-15\n                 5.004_66      199]
read:[8-May-29\n        Sarathy  5.004_67      1998-Jun-1]
read:[5\n                 5.004_68      1998-Jun-23\n     ]
read:[            5.004_69      1998-Jun-29\n            ]
read:[     5.004_70      1998-Jul-06\n                 5.]
read:[004_71      1998-Jul-09\n                 5.004_72 ]
read:[     1998-Jul-12\n                 5.004_73      19]
read:[98-Jul-13\n                 5.004_74      1998-Jul-]
read:[14     5.005 beta candidate.\n                 5.00]
read:[4_75      1998-Jul-15     5.005 beta1.\n           ]
read:[      5.004_76      1998-Jul-21     5.005 beta2.\n ]
read:[                5.005         1998-Jul-22     Onep]
read:[erl.\n        Sarathy  5.005_01      1998-Jul-27   ]
read:[  The 5.005 maintenance track.\n                 5.]
read:[005_02-T1   1998-Aug-02\n                 5.005_02-]
read:[T2   1998-Aug-05\n                 5.005_02      19]
read:[98-Aug-08\n        Graham   5.005_03-MT1  1998-Nov-]
read:[30\n                 5.005_03-MT2  1999-Jan-04\n    ]
read:[             5.005_03-MT3  1999-Jan-17\n           ]
read:[      5.005_03-MT4  1999-Jan-26\n                 5]
read:[.005_03-MT5  1999-Jan-28\n                 5.005_03]
read:[-MT6  1999-Mar-05\n                 5.005_03      1]
read:[999-Mar-28\n        Sarathy  5.005_50      1998-Jul]
read:[-26     The 5.6 development track.\n               ]
read:[  5.005_51      1998-Aug-10\n                 5.005]
read:[_52      1998-Sep-25\n                 5.005_53    ]
read:[  1998-Oct-31\n                 5.005_54      1998-]
read:[Nov-30\n                 5.005_55      1999-Feb-16\n]
read:[                 5.005_56      1999-Mar-01\n       ]
read:[          5.005_57      1999-May-25\n              ]
read:[   5.005_58      1999-Jul-27\n                 5.00]
read:[5_59      1999-Aug-02\n                 5.005_60   ]
read:[   1999-Aug-02\n                 5.005_61      1999]
read:[-Aug-20\n                 5.005_62      1999-Oct-15]
read:[\n                 5.005_63      1999-Dec-09\n      ]
read:[           5.5.640       2000-Feb-02\n             ]
read:[    5.5.650       2000-Feb-08     beta1\n          ]
read:[       5.5.660       2000-Feb-22     beta2\n       ]
read:[          5.5.670       2000-Feb-29     beta3\n    ]
read:[             5.6.0-RC1     2000-Mar-09     Release]
read:[ candidate 1.\n                 5.6.0-RC2     2000-]
read:[Mar-14     Release candidate 2.\n                 5]
read:[.6.0-RC3     2000-Mar-21     Release candidate 3.\n]
read:[                 5.6.0         2000-Mar-22\n       ]
read:[ Sarathy  5.6.1-TRIAL1  2000-Dec-18     The 5.6 ma]
read:[intenance track.\n                 5.6.1-TRIAL2  20]
read:[01-Jan-31\n                 5.6.1-TRIAL3  2001-Mar-]
read:[19\n                 5.6.1-foolish 2001-Apr-01     ]
read:[The "fools-gold" release.\n                 5.6.1  ]
read:[       2001-Apr-08\n        Rafael   5.6.2-RC1     ]
read:[2003-Nov-08\n                 5.6.2         2003-No]
read:[v-15     Fix new build issues\n        Jarkko   5.7]
read:[.0         2000-Sep-02     The 5.7 track: Developm]
read:[ent.\n                 5.7.1         2001-Apr-09\n  ]
read:[               5.7.2         2001-Jul-13     Virtu]
read:[al release candidate 0.\n                 5.7.3    ]
read:[     2002-Mar-05\n                 5.8.0-RC1     20]
read:[02-Jun-01\n                 5.8.0-RC2     2002-Jun-]
read:[21\n                 5.8.0-RC3     2002-Jul-13\n    ]
read:[             5.8.0         2002-Jul-18\n           ]
read:[      5.8.1-RC1     2003-Jul-10\n                 5]
read:[.8.1-RC2     2003-Jul-11\n                 5.8.1-RC]
read:[3     2003-Jul-30\n                 5.8.1-RC4     2]
read:[003-Aug-01\n                 5.8.1-RC5     2003-Sep]
read:[-22\n                 5.8.1         2003-Sep-25\n   ]
read:[     Nicholas 5.8.2-RC1     2003-Oct-27\n          ]
read:[       5.8.2-RC2     2003-Nov-03\n                 ]
read:[5.8.2         2003-Nov-05\n                 5.8.3-R]
read:[C1     2004-Jan-07\n                 5.8.3         ]
read:[2004-Jan-14\n                 5.8.4-RC1     2004-Ap]
read:[r-05\n                 5.8.4-RC2     2004-Apr-15\n  ]
read:[               5.8.4         2004-Apr-21\n         ]
read:[        5.8.5-RC1     2004-Jul-06\n                ]
read:[ 5.8.5-RC2     2004-Jul-08\n                 5.8.5 ]
read:[        2004-Jul-19\n\n        Hugo     5.9.0       ]
read:[  2003-Oct-27\n        Rafael   5.9.1         2004-]
read:[Mar-16\n]
done
finished
OUT

#
# 18
#
output_is(<<'CODE', <<'OUT', "Stream::Replay");
##PIR##
.sub _main @MAIN
    .local pmc stream

    load_bytecode "library/Stream/Writer.imc"
    load_bytecode "library/Stream/Replay.imc"

    find_type I0, "Stream::Writer"
    new stream, I0
    P0 = global "_reader"
    assign stream, P0

    stream."write"( "1" )
    stream."write"( "2" )
    stream."write"( "A" )
    stream."write"( "B" )
    stream."write"( "4" )
    stream."write"( "5" )
    stream."write"( "*" )
    stream."close"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _reader method
    .local pmc stream1
    .local pmc stream2
    .local pmc stream3
    .local string str

    find_type I0, "Stream::Replay"
    new stream1, I0
    assign stream1, self

    print "reader start\n"

    print "1:'"
    str = stream1."read"()
    print str
    str = stream1."read"()
    print str
    print "'\n"

    stream2 = clone stream1
    stream3 = clone stream1

    print "2:'"
    str = stream2."read"()
    print str
    str = stream2."read"()
    print str
    stream2."close"()
    print "'\n1:'"

    str = stream1."read"()
    print str
    str = stream1."read"()
    print str

    str = stream1."read"()
    print str
    str = stream1."read"()
    print str

    print "\n3:'"

    str = stream3."read"()
    print str
    str = stream3."read"()
    print str
    str = stream3."read"()
    print str
    str = stream3."read"()
    print str

    str = stream3."read"()
    print str

    print "'\n"

    print "reader done\n"
.end
CODE
reader start
1:'12'
2:'AB'
1:'AB45
3:'AB45*'
reader done
done
finished
OUT


#
# 19
#
output_is(<<'CODE', <<'OUT', "Stream::Sub");
##PIR##
.sub _main
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/Base.imc"
    load_bytecode "library/Stream/Sub.imc"

    find_type I0, "Stream::Sub"
    new stream, I0

    # set the stream's source sub
    newsub temp, .Sub, _counter
    assign stream, temp

    # dump the stream
    stream."dump"()

    print "done\n"
    sweep 1
    collect
    print "finished\n"
    end
.end

.sub _counter method
    .local string str
    .local int i

    i = 0

LOOP:
    # streams are using strings,
    # so we have to convert the number into a string
    str = i

    # write the string
    self."write"( str )

    inc i
    if i < 10 goto LOOP
.end
CODE
read:[0]
read:[1]
read:[2]
read:[3]
read:[4]
read:[5]
read:[6]
read:[7]
read:[8]
read:[9]
done
finished
OUT

#
# 20
#
output_is(<<'CODE', <<'OUT', "Stream::Write");
##PIR##
.sub _main @MAIN
    .local pmc stream
    .local pmc temp

    load_bytecode "library/Stream/Writer.imc"

    find_type I0, "Stream::Writer"
    new stream, I0

    # set the stream's source sub
    newsub temp, .Sub, _reader
    assign stream, temp

    print "main start\n"
    stream."write"( "hello" )
    stream."write"( "world!" )
    stream."write"( "parrot" )
    stream."write"( "is cool" )
    stream."close"()
    print "main done\n"
    sweep 1
    collect
    print "finished\n"

    end
.end

.sub _reader method
    print "reader start\n"
    self."dump"()
    print "reader done\n"
.end
CODE
main start
reader start
read:[hello]
read:[world!]
read:[parrot]
read:[is cool]
reader done
main done
finished
OUT
