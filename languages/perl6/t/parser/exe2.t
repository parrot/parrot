#!/usr/bin/perl -w

###############################################
# This are the examples given in Exegesis 2.
# Modifications are marked with XXX.
###############################################

use strict;

use FindBin;
use lib $FindBin::Bin;

use P6CTest tests => 2;

check_parse {
    name => "Exegesis 2",
    pgm_data => *DATA,
};

__DATA__

==================================================
# bintree - binary tree demo program 
# adapted from "Perl Cookbook", Recipe 11.15

use strict;
use warnings;
my ($root, $n);

while ($n++ < 20) { insert($root, int rand 1000) }

# XXX: is constant
# my int ($pre, $in, $post) is constant = (0..2);

print "Pre order:  "; show($root,$pre);  print "\n";
print "In order:   "; show($root,$in);   print "\n";
print "Post order: "; show($root,$post); print "\n";

# XXX: is chomped
# $*ARGS is chomped;
# XXX: prompts
# $ARGS prompts("Search? ");
while (<$ARGS>) {
    if (my $node = search($root, $_)) {
        print "Found $_ at $node: $node{VALUE}\n";
        print "(again!)\n" if $node{VALUE}.Found > 1;
    }
    else {
        print "No $_ in tree\n";
    }
}

# XXX:
# exit;

#########################################

sub insert (HASH $tree is rw, int $val) {
    unless ($tree) {
        my %node;
# XXX: undef
#        %node{LEFT}   = undef;
#        %node{RIGHT}  = undef;
# XXX: is Found
#        %node{VALUE}  = $val is Found(0);
        $tree = %node;
        return;
    }
    if    ($tree{VALUE} > $val) { insert($tree{LEFT},  $val) }
    elsif ($tree{VALUE} < $val) { insert($tree{RIGHT}, $val) }
    else                        { warn "dup insert of $val\n" }
}

sub show {
    return unless @_[0];
    show(@_[0]{LEFT}, @_[1]) unless @_[1] == $post;
    show(@_[0]{RIGHT},@_[1])     if @_[1] == $pre;
    print @_[0]{VALUE};
    show(@_[0]{LEFT}, @_[1])     if @_[1] == $post;
    show(@_[0]{RIGHT},@_[1]) unless @_[1] == $pre;
}

sub search (HASH $tree is rw, *@_) {
    return unless $tree;
    return search($tree{@_[0]<$tree{VALUE} && "LEFT" || "RIGHT"}, @_[0])
        unless $tree{VALUE} == @_[0];
# XXX: is Found
#    $tree{VALUE} is Found($tree{VALUE}.Found+1);
    return $tree;
}

==================================================
use strict;
use warnings;
my ($root, $n);

while ($n++ < 20) { insert($root, int rand 1000) }

my ($pre, $in, $post) = (0..2);

print "Pre order:  "; show($root,$pre);  print " \n";
print "In order:   "; show($root,$in);   print " \n";
print "Post order: "; show($root,$post); print " \n";

for (print "Search? "; <$ARGS>; print "Search? ") {
# XXX
#    chomp;
    if (my $node = search($root, $_)) {
        print "Found $_ at $node: $node{VALUE}\n";
        print "(again!)\n" if $node{FOUND} > 1;
    }
    else {
        print "No $_ in tree\n";
    }
}

# XXX
# exit;

#########################################

sub insert {
    unless (@_[0]) {
# XXX: undef
#         @_[0] = { LEFT  => undef, RIGHT => undef,
#                   VALUE => @_[1], FOUND => 0,
#                 };
        return;
    }
    if    (@_[0]{VALUE} > @_[1]) { insert(@_[0]{LEFT},  @_[1]) }
    elsif (@_[0]{VALUE} < @_[1]) { insert(@_[0]{RIGHT}, @_[1]) }
    else                         { warn "dup insert of @_[1]\n"  }
}

sub show  {
    return unless @_[0];
    show(@_[0]{LEFT}, @_[1]) unless @_[1] == $post;
    show(@_[0]{RIGHT},@_[1])     if @_[1] == $pre;
    print @_[0]{VALUE};
    show(@_[0]{LEFT}, @_[1])     if @_[1] == $post;
    show(@_[0]{RIGHT},@_[1]) unless @_[1] == $pre;
}

sub search {
    return unless @_[0];
    return search(@_[0]{@_[1]<@_[0]{VALUE} && "LEFT" || "RIGHT"}, @_[1])
        unless @_[0]{VALUE} == @_[1];
    @_[0]{FOUND}++;
    return @_[0];
}
