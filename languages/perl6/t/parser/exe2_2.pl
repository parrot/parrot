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
    if (my $node = search2($root, $_)) {
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

# XXX: had to rename search to search2 due to search in exe2_1.pl
sub search2 {
    return unless @_[0];
    return search2(@_[0]{@_[1]<@_[0]{VALUE} && "LEFT" || "RIGHT"}, @_[1])
        unless @_[0]{VALUE} == @_[1];
    @_[0]{FOUND}++;
    return @_[0];
}
