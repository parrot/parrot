#! perl
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 12;
use Parrot::Config;


=head1 NAME

t/examples/streams.t - Test examples in F<examples/streams>

=head1 SYNOPSIS

	% prove t/examples/streams.t

=head1 DESCRIPTION

Test the examples in F<examples/streams>.

=head1 SEE ALSO

F<t/examples/pasm.t>

=head1 AUTHOR

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut


# Set up expected output for examples
my %expected
    = ( 'Combiner.pir' => <<'END_EXPECTED',
read:[1 hello]
read:[2 world!]
read:[3 parrot]
read:[4 is cool]
END_EXPECTED

        'Coroutine.pir' => <<'END_EXPECTED',
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
END_EXPECTED
        
        'FileLines.pir' => <<'END_EXPECTED',
read:[    1 =head1 INFORMATION]
read:[    2 ]
read:[    3 This is an advanced example.]
read:[    4 ]
read:[    5 It uses a file stream (Stream::ParrotIO) that is processed linewise with]
read:[    6 Stream::Lines. A counter stream creates line numbers, both are combined to]
read:[    7 one stream and then dumped.]
read:[    8 ]
read:[    9 =head1 FUNCTIONS]
read:[   10 ]
read:[   11 =over 4]
read:[   12 ]
read:[   13 =item _main]
read:[   14 ]
read:[   15 Opens this file (or the one specified at the command line) and creates a lines]
read:[   16 stream for it. Then it combines the stream with a stream providing line numbers.]
read:[   17 ]
read:[   18 =cut]
read:[   19 ]
read:[   20 .sub _main]
read:[   21     .param pmc argv]
read:[   22     .local int argc]
read:[   23     .local pmc file]
read:[   24     .local pmc lines]
read:[   25     .local pmc counter]
read:[   26     .local pmc combiner]
read:[   27     .local string name]
read:[   28 ]
read:[   29     # get the name of the file to open]
read:[   30     name = "examples/streams/FileLines.pir"]
read:[   31     argc = argv]
read:[   32     if argc < 2 goto NO_NAME]
read:[   33     name = argv[1]]
read:[   34 NO_NAME:]
read:[   35 ]
read:[   36     load_bytecode "library/Stream/ParrotIO.pir"]
read:[   37     load_bytecode "library/Stream/Lines.pir"]
read:[   38     load_bytecode "library/Stream/Sub.pir"]
read:[   39     load_bytecode "library/Stream/Combiner.pir"]
read:[   40 ]
read:[   41     # create a file stream]
read:[   42     find_type $I0, "Stream::ParrotIO"]
read:[   43     new file, $I0]
read:[   44     file."open"( name, "<" )]
read:[   45 ]
read:[   46     # process it one line per read]
read:[   47     find_type $I0, "Stream::Lines"]
read:[   48     new lines, $I0]
read:[   49     assign lines, file]
read:[   50 ]
read:[   51     # endless counter]
read:[   52     find_type $I0, "Stream::Sub"]
read:[   53     new counter, $I0]
read:[   54     .const .Sub temp = "_counter"]
read:[   55     assign counter, temp]
read:[   56 ]
read:[   57     # combine the counter and the file's lines]
read:[   58     find_type $I0, "Stream::Combiner"]
read:[   59     new combiner, $I0]
read:[   60     assign combiner, counter]
read:[   61     assign combiner, lines]
read:[   62 ]
read:[   63     # dump the stream]
read:[   64     combiner."dump"()]
read:[   65 ]
read:[   66     end]
read:[   67 .end]
read:[   68 ]
read:[   69 =item _counter]
read:[   70 ]
read:[   71 This sub is the source of the counter stream. It just endlessly writes]
read:[   72 line numbers followed by a space to its stream.]
read:[   73 ]
read:[   74 =cut]
read:[   75 ]
read:[   76 .sub _counter]
read:[   77     .param pmc stream]
read:[   78     .local int i]
read:[   79     .local string str]
read:[   80     .local pmc array]
read:[   81 ]
read:[   82     i = 0]
read:[   83     array = new .PerlArray]
read:[   84 ]
read:[   85 LOOP:]
read:[   86     inc i]
read:[   87     array[0] = i]
read:[   88     sprintf str, "%5d ", array]
read:[   89     stream."write"( str )]
read:[   90     branch LOOP]
read:[   91 .end]
read:[   92 ]
read:[   93 =back]
read:[   94 ]
read:[   95 =head1 AUTHOR]
read:[   96 ]
read:[   97 Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author]
read:[   98 and maintainer.]
read:[   99 Please send patches and suggestions to the Perl 6 Internals mailing list.]
read:[  100 ]
read:[  101 =head1 COPYRIGHT]
read:[  102 ]
read:[  103 Copyright (c) 2004, the Perl Foundation.]
read:[  104 ]
read:[  105 =cut]
END_EXPECTED

        'Filter.pir' => <<'END_EXPECTED',
read:[0 * 2 = 0]
read:[1 * 2 = 2]
read:[2 * 2 = 4]
read:[3 * 2 = 6]
read:[5 * 2 = 10]
read:[6 * 2 = 12]
read:[7 * 2 = 14]
read:[8 * 2 = 16]
read:[9 * 2 = 18]
END_EXPECTED

        'Include.pir' => <<'END_EXPECTED',
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
END_EXPECTED

        'Lines.pir' => <<'END_EXPECTED',
read:[this]
read:[is a]
read:[Stream::Lines]
read:[testcase]
END_EXPECTED

        'ParrotIO.pir' => <<'END_EXPECTED',
read:[=head1 INFORMATION\n\nThis small example shows the u]
read:[sage of C<Stream::ParrotIO>.\n\nIt reads this file w]
read:[ith a default block size.\n\nYou can specify another]
read:[ block size with the C<blockSize> method.\nC<blockS]
read:[ize> called without an integer parameter will retu]
read:[rn the\ncurrent block size.\n\nEach time the C<read> ]
read:[method is called, the next block is read from\nthe ]
read:[underlying ParrotIO, until EOF, where the stream w]
read:[ill be disconnected.\n\nInstead of using the C<open>]
read:[ method, you can also assign your own ParrotIO\nPMC]
read:[ to the stream with the C<assign> op.\n\n=cut\n\n.sub ]
read:[_main :main\n    .local pmc stream\n\n    load_byteco]
read:[de "library/Stream/ParrotIO.pir"\n\n    # create the]
read:[ ParrotIO stream    \n    find_type $I0, "Stream::P]
read:[arrotIO"\n    new stream, $I0\n\n    # open this file]
read:[\n    stream."open"( "examples/streams/ParrotIO.pir]
read:[", "<" )\n    \n    # you can specifiy a custom bloc]
read:[k size with\n    # stream."blockSize"( 10 )\n    \n  ]
read:[  # dump the stream\n    stream."dump"()\n    \n    e]
read:[nd\n.end\n\n=head1 AUTHOR\n\nJens Rieks E<lt>parrot at ]
read:[jensbeimsurfen dot deE<gt> is the author\nand maint]
read:[ainer.\nPlease send patches and suggestions to the ]
read:[Perl 6 Internals mailing list.\n\n=head1 COPYRIGHT\n\n]
read:[Copyright (c) 2004, the Perl Foundation.\n\n=cut\n]
END_EXPECTED

        'SubCounter.pir' => <<'END_EXPECTED',
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
END_EXPECTED

        'SubHello.pir' => <<'END_EXPECTED',
read:[hello]
read:[world!]
read:[parrot]
read:[is cool]
END_EXPECTED

      );

while ( my ( $example, $expected ) = each %expected ) {
    example_output_is( "examples/streams/$example", $expected );
}

TODO:
{
    local $TODO = 'some examples not testable yet';
    fail( 'Bytes.pir' );
    fail( 'Replay.pir' );
    fail( 'Writer.pir' );
};
