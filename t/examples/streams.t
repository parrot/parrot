#!perl
# Copyright (C) 2005-2006, Parrot Foundation.
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

# map examples to expected output, organized by io type (file|stream)
# NOTE: examples using file io must have 'svn:eol-style' set to 'LF'
#       to work properly on all platforms.
my %expected = (
    stream => {
        'Combiner.pir' => <<'EXP_COMBINER',
read:[1 hello]
read:[2 world!]
read:[3 parrot]
read:[4 is cool]
EXP_COMBINER

        'Coroutine.pir' => <<'EXP_COROUTINE',
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
EXP_COROUTINE

        'Filter.pir' => <<'EXP_FILTER',
read:[0 * 2 = 0]
read:[1 * 2 = 2]
read:[2 * 2 = 4]
read:[3 * 2 = 6]
read:[5 * 2 = 10]
read:[6 * 2 = 12]
read:[7 * 2 = 14]
read:[8 * 2 = 16]
read:[9 * 2 = 18]
EXP_FILTER

        'Include.pir' => <<'EXP_INCLUDE',
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
EXP_INCLUDE

        'Lines.pir' => <<'EXP_LINES',
read:[this]
read:[is a]
read:[Stream::Lines]
read:[testcase]
EXP_LINES

        'SubCounter.pir' => <<'EXP_SUBCOUNTER',
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
EXP_SUBCOUNTER

        'SubHello.pir' => <<'EXP_SUBHELLO',
read:[hello]
read:[world!]
read:[parrot]
read:[is cool]
EXP_SUBHELLO
    },

    file => {
        'FileLines.pir' => <<'EXP_FILELINES',
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
read:[   42     file = new "Stream::ParrotIO"]
read:[   43     file."open"( name, 'r' )]
read:[   44 ]
read:[   45     # process it one line per read]
read:[   46     lines = new "Stream::Lines"]
read:[   47     assign lines, file]
read:[   48 ]
read:[   49     # endless counter]
read:[   50     counter = new "Stream::Sub"]
read:[   51     .const 'Sub' temp = "_counter"]
read:[   52     assign counter, temp]
read:[   53 ]
read:[   54     # combine the counter and the file's lines]
read:[   55     combiner = new "Stream::Combiner"]
read:[   56     assign combiner, counter]
read:[   57     assign combiner, lines]
read:[   58 ]
read:[   59     # dump the stream]
read:[   60     combiner."dump"()]
read:[   61 ]
read:[   62     end]
read:[   63 .end]
read:[   64 ]
read:[   65 =item _counter]
read:[   66 ]
read:[   67 This sub is the source of the counter stream. It just endlessly writes]
read:[   68 line numbers followed by a space to its stream.]
read:[   69 ]
read:[   70 =cut]
read:[   71 ]
read:[   72 .sub _counter]
read:[   73     .param pmc stream]
read:[   74     .local int i]
read:[   75     .local string str]
read:[   76     .local pmc array]
read:[   77 ]
read:[   78     i = 0]
read:[   79     array = new 'ResizablePMCArray']
read:[   80 ]
read:[   81 LOOP:]
read:[   82     inc i]
read:[   83     array[0] = i]
read:[   84     sprintf str, "%5d ", array]
read:[   85     stream."write"( str )]
read:[   86     branch LOOP]
read:[   87 .end]
read:[   88 ]
read:[   89 =back]
read:[   90 ]
read:[   91 =head1 AUTHOR]
read:[   92 ]
read:[   93 Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author]
read:[   94 and maintainer.]
read:[   95 Please send patches and suggestions to the Perl 6 Internals mailing list.]
read:[   96 ]
read:[   97 =head1 COPYRIGHT]
read:[   98 ]
read:[   99 Copyright (C) 2004-2008, Parrot Foundation.]
read:[  100 ]
read:[  101 =cut]
read:[  102 ]
read:[  103 # Local Variables:]
read:[  104 #   mode: pir]
read:[  105 #   fill-column: 100]
read:[  106 # End:]
read:[  107 # vim: expandtab shiftwidth=4 ft=pir:]
EXP_FILELINES

        'ParrotIO.pir' => <<'EXP_PARROTIO',
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
read:[ ParrotIO stream\n    stream = new "Stream::ParrotI]
read:[O"\n\n    # open this file\n    stream."open"( "examp]
read:[les/streams/ParrotIO.pir", 'r' )\n\n    # you can sp]
read:[ecifiy a custom block size with\n    # stream."bloc]
read:[kSize"( 10 )\n\n    # dump the stream\n    stream."du]
read:[mp"()\n\n    end\n.end\n\n=head1 AUTHOR\n\nJens Rieks E<l]
read:[t>parrot at jensbeimsurfen dot deE<gt> is the auth]
read:[or\nand maintainer.\nPlease send patches and suggest]
read:[ions to the Perl 6 Internals mailing list.\n\n=head1]
read:[ COPYRIGHT\n\nCopyright (C) 2004-2008, The Perl Foun]
read:[dation.\n\n=cut\n\n# Local Variables:\n#   mode: pir\n# ]
read:[  fill-column: 100\n# End:\n# vim: expandtab shiftwi]
read:[dth=4 ft=pir:\n]
EXP_PARROTIO
    },
);

#=for comment
#        'ParrotIO.pir t/examples/test.txt' => do{
#            local $/ = 60;
#            my $file =
#            @lines=map {} <>;
#        },
#=cut

for my $io ( sort keys %expected ) {
    while ( my ( $example, $expected ) = each %{ $expected{$io} } ) {
        if ( $^O eq 'MSWin32' ) {
            if ( grep { $_ eq $example } qw/ParrotIO.pir FileLines.pir/ ) {
                local $TODO = 'not testable on windows yet';
                fail($example);
                next;
            }
        }
        example_output_is( "examples/streams/$example", $expected );
    }
}

TODO:
{
    local $TODO = 'some examples not testable yet';
    fail('Bytes.pir');
    fail('Replay.pir');
    fail('Writer.pir');
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
