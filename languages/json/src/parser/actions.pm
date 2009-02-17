# Copyright (C) 2008, Parrot Foundation.
# $Id$

=begin comments

json::Grammar::Actions - ast transformations for json

This file contains the methods that are used by the parse grammar
to build the PAST representation of an json program.
Each method below corresponds to a rule in F<src/parser/grammar.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class json::Grammar::Actions;

method TOP($/) {
    my $past := PAST::Block.new( :blocktype('declaration'), :node( $/ ) );
    for $<value> {
        ## call _dumper for each value, and the string "JSON" as 2nd argument.
        my $dumpcall := PAST::Op.new( :pasttype('call'), :name('_dumper'), :node($/));
        $dumpcall.push( $( $_ ) );
        $dumpcall.push( PAST::Val.new( :value("JSON")) );

        $past.push( $dumpcall );
    }
    make $past;
}

method object($/) {
    if $<members> {
        make $( $<members>[0] );
    }
    else {
        make PAST::Op.new( :name('!hash'), :pasttype('call'), :node($/) );
    }
}

method array($/) {
    if $<elements> {
        make $( $<elements>[0] );
    }
    else {
        make PAST::Op.new( :name('!array'), :pasttype('call'), :node($/) );
    }
}

method elements($/) {
    ## make use of the Parrot Calling Conventions, using a PIR sub that
    ## takes a :slurpy parameter, which is in fact a (ResizablePMC)Array object.
    ## This array constructor is called '!array'.
    my $past := PAST::Op.new( :name('!array'), :pasttype('call'), :node($/) );
    for $<value> {
        $past.push( $( $_ ) );
    }
    make $past;
}

method members($/) {
    ## make use of the Parrot Calling Conventions, using a PIR sub that
    ## takes a :slurpy :named parameter, which is in fact a Hash object.
    ## This hash constructor is called '!hash'.
    my $past := PAST::Op.new( :name('!hash'), :pasttype('call'), :node($/) );
    for $<string> {
        my $key := $( $_ );
        ## get the value node for the current string:
        my $val := $( $<value>.shift() );
        ## set the key as the name for the $val argument to the hash constructor.
        $val.named($key);
        $past.push($val);
    }
    make $past;
}

method value($/, $key) {
    make $( $/{$key} );
}

method constant($/, $key) {
    my $past;
    if $key eq 'null' {
        $past := PAST::Op.new( :inline('    %r = null') );
    }
    elsif $key eq 'false' {
        $past := PAST::Val.new( :value(0), :returns('Boolean') );
    }
    elsif $key eq 'true' {
        $past := PAST::Val.new( :value(1), :returns('Boolean') );
    }
    make $past;
}

method number($/) {
    make PAST::Val.new( :value( ~$/ ), :node($/) );
}

method string($/) {
    make PAST::Val.new( :value( ~$<characters> ), :node($/) );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:





