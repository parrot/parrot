#!perl
# Copyright (C) 2005-2006, Parrot Foundation.

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
read:[    1 =head1 Advanced Lines Example]
read:[    2 ]
read:[    3 This is an advanced example.]
read:[    4 ]
read:[    5 It uses a file stream (Stream::ParrotIO) that is processed linewise with]
read:[    6 Stream::Lines. A counter stream creates line numbers, both are combined to]
read:[    7 one stream and then dumped.]
read:[    8 ]
read:[    9 =head1 NOTE]
read:[   10 ]
read:[   11 When updating this file, be sure to verify L<t/examples/streams.t>, as its]
read:[   12 tests rely on the content of this file.]
read:[   13 ]
read:[   14 =head1 FUNCTIONS]
read:[   15 ]
read:[   16 =over 4]
read:[   17 ]
read:[   18 =item _main]
read:[   19 ]
read:[   20 Opens this file (or the one specified at the command line) and creates a lines]
read:[   21 stream for it. Then it combines the stream with a stream providing line numbers.]
read:[   22 ]
read:[   23 =cut]
read:[   24 ]
read:[   25 .sub _main :main]
read:[   26     .param pmc argv]
read:[   27     .local int argc]
read:[   28     .local pmc file]
read:[   29     .local pmc lines]
read:[   30     .local pmc counter]
read:[   31     .local pmc combiner]
read:[   32     .local string name]
read:[   33 ]
read:[   34     # get the name of the file to open]
read:[   35     name = \"examples/streams/FileLines.pir\"]
read:[   36     argc = argv]
read:[   37     if argc < 2 goto NO_NAME]
read:[   38     name = argv[1]]
read:[   39 NO_NAME:]
read:[   40 ]
read:[   41     load_bytecode 'Stream/ParrotIO.pbc']
read:[   42     load_bytecode 'Stream/Lines.pbc']
read:[   43     load_bytecode 'Stream/Sub.pbc']
read:[   44     load_bytecode 'Stream/Combiner.pbc']
read:[   45 ]
read:[   46     # create a file stream]
read:[   47     file = new ['Stream'; 'ParrotIO']]
read:[   48     file.\"open\"( name, 'r' )]
read:[   49 ]
read:[   50     # process it one line per read]
read:[   51     lines = new ['Stream'; 'Lines']]
read:[   52     assign lines, file]
read:[   53 ]
read:[   54     # endless counter]
read:[   55     counter = new ['Stream'; 'Sub']]
read:[   56     .const 'Sub' temp = \"_counter\"]
read:[   57     assign counter, temp]
read:[   58 ]
read:[   59     # combine the counter and the file's lines]
read:[   60     combiner = new ['Stream'; 'Combiner']]
read:[   61     assign combiner, counter]
read:[   62     assign combiner, lines]
read:[   63 ]
read:[   64     # dump the stream]
read:[   65     combiner.\"dump\"()]
read:[   66 ]
read:[   67     end]
read:[   68 .end]
read:[   69 ]
read:[   70 =item _counter]
read:[   71 ]
read:[   72 This sub is the source of the counter stream. It just endlessly writes]
read:[   73 line numbers followed by a space to its stream.]
read:[   74 ]
read:[   75 =cut]
read:[   76 ]
read:[   77 .sub _counter]
read:[   78     .param pmc stream]
read:[   79     .local int i]
read:[   80     .local string str]
read:[   81     .local pmc array]
read:[   82 ]
read:[   83     i = 0]
read:[   84     array = new 'ResizablePMCArray']
read:[   85 ]
read:[   86 LOOP:]
read:[   87     inc i]
read:[   88     array[0] = i]
read:[   89     sprintf str, \"%5d \", array]
read:[   90     stream.\"write\"( str )]
read:[   91     branch LOOP]
read:[   92 .end]
read:[   93 ]
read:[   94 =back]
read:[   95 ]
read:[   96 =head1 AUTHOR]
read:[   97 ]
read:[   98 Jens Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is the author]
read:[   99 and maintainer.]
read:[  100 Please send patches and suggestions to the Perl 6 Internals mailing list.]
read:[  101 ]
read:[  102 =head1 COPYRIGHT]
read:[  103 ]
read:[  104 Copyright (C) 2004-2009, Parrot Foundation.]
read:[  105 ]
read:[  106 =cut]
read:[  107 ]
read:[  108 # Local Variables:]
read:[  109 #   mode: pir]
read:[  110 #   fill-column: 100]
read:[  111 # End:]
read:[  112 # vim: expandtab shiftwidth=4 ft=pir:]
EXP_FILELINES

        'ParrotIO.pir' => <<'EXP_PARROTIO',
read:[=head1 Filehandle Object Example\n\nThis small examp]
read:[le shows the usage of C<Stream::ParrotIO>.\n\nIt rea]
read:[ds this file with a default block size.\n\nYou can s]
read:[pecify another block size with the C<blockSize> me]
read:[thod.\nC<blockSize> called without an integer param]
read:[eter will return the\ncurrent block size.\n\nEach tim]
read:[e the C<read> method is called, the next block is ]
read:[read from\nthe underlying ParrotIO, until EOF, wher]
read:[e the stream will be disconnected.\n\nInstead of usi]
read:[ng the C<open> method, you can also assign your ow]
read:[n ParrotIO\nPMC to the stream with the C<assign> op]
read:[.\n\n=cut\n\n.sub _main :main\n    .local pmc stream\n\n ]
read:[   load_bytecode 'Stream/ParrotIO.pbc'\n\n    # crea]
read:[te the ParrotIO stream\n    stream = new ['Stream';]
read:[ 'ParrotIO']\n\n    # open this file\n    stream.\"ope]
read:[n\"( \"examples/streams/ParrotIO.pir\", 'r' )\n\n    # ]
read:[you can specify a custom block size with\n    # str]
read:[eam.\"blockSize\"( 10 )\n\n    # dump the stream\n    s]
read:[tream.\"dump\"()\n\n    end\n.end\n\n=head1 AUTHOR\n\nJens ]
read:[Rieks E<lt>parrot at jensbeimsurfen dot deE<gt> is]
read:[ the author\nand maintainer.\nPlease send patches an]
read:[d suggestions to the Perl 6 Internals mailing list]
read:[.\n\n=head1 COPYRIGHT\n\nCopyright (C) 2004-2009, Parr]
read:[ot Foundation.\n\n=cut\n\n# Local Variables:\n#   mode:]
read:[ pir\n#   fill-column: 100\n# End:\n# vim: expandtab ]
read:[shiftwidth=4 ft=pir:\n]
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
