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
