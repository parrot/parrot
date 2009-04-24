# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Grammar::Actions;

method TOP($/) {
    #say("TOP");
    make $( $<pmc> );
}

method pmc($/) {
    #say("pmc");
    my $pmc := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $pmc;
}

method c_header($/) {
    say("c_header");
    say(~$/);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method pmc_class($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method vtable($/) {
    #say('VABLE ' ~$<c_signature>);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method method($/) {
    #say('METHOD ' ~$<identifier>);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method multi($/) {
    #say('MULTI ' ~$<identifier>);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method body($/) {
    #say("body");
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

method c_body($/) {
    #say("c_body: " ~ $/);
    my $past := PAST::Block.new( :blocktype('declaration'), :node($/) );
    make $past;
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
