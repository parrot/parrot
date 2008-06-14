# Copyright (C) 2008, The Perl Foundation.
# $Id$

=begin comments

Plumhead::Grammar::Actions - ast transformations for Plumhead

This file contains the methods that are used by the parse grammar
to build the PAST representation of an Plumhead program.
Each method below corresponds to a rule in F<src/pct/Plumhead.pg>,
and is invoked at the point where C<{*}> appears in the rule,
with the current match object as the first argument.  If the
line containing C<{*}> also has a C<#= key> comment, then the
value of the comment is passed as the second argument to the method.

=end comments

class Plumhead::Grammar::Actions;

# The method TOP is invoked per default by the HLLCompiler
method TOP($/) {
    make PAST::Block.new(
             PAST::Stmts.new(
                 PAST::Op.new(
                     PAST::Val.new(
                         :value("Hello,\nWorld!\n"),
                         :returns('String') ),
                     :pasttype('call'),
                     :name('echo') ),
                 :name('dummy TOP') ) ); 
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

