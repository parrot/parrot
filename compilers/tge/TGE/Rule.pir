# Copyright 2005, The Perl Foundation.

=head1 NAME

TGE::Rule - a single rule in the attribute grammar

=head1 DESCRIPTION

A basic class to hold defined attribute grammar rules.

=cut

.namespace [ "TGE::Rule" ]

# Possibly better named "type", "name", "parent", "action/exec",
# "copy/value"

.sub "__onload" :load
    .local pmc base
    newclass base, "TGE::Rule"
    addattribute base, "type"   # node type that this rule applies to
    addattribute base, "name"   # name of attribute being defined
    addattribute base, "parent" # where the attribute is applied
			        # (current node or child node)
    addattribute base, "action" # a compiled subroutine
    addattribute base, "line"   # line number in the grammar source file
    .return ()
.end

=head2 new

Create a new rule object. A rule object holds the semantics for a single
attribute grammar rule.

=cut

.sub __init method
    $P0 = new PerlUndef
    $P1 = new PerlUndef
    $P2 = new PerlUndef
    $P3 = new PerlUndef
    $P4 = new PerlUndef
    $P5 = new Sub
    setattribute self, "type", $P0
    setattribute self, "name", $P1
    setattribute self, "parent", $P2
    setattribute self, "line", $P4
    setattribute self, "action", $P5
.end

=head2 dump

Produce a data dump of the current contents of the rule object.

=cut

.sub "dump" method
    $P0 = getattribute self, "type"
    print "\t\t\t'type' => '"
    print $P0
    print "',\n"
    $P1 = getattribute self, "name"
    print "\t\t\t'name' => '"
    print $P1
    print "',\n"
    $P2 = getattribute self, "parent"
    print "\t\t\t'parent' => '"
    print $P2
    print "',\n"
.end
