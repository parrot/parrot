%{

use constant TRUE => "TRUE";
use constant FALSE => 0;

sub tokenize {
    my $data = shift;
    my @tokens = split(//, $data);
    my @types = map { /[a-zA-Z_]/ ? 'CHAR' : (/\d/ ? 'NUM' : $_) } @tokens;
    return \@tokens, \@types;
}

# (accept, R) : try R, accept immediately if it matches
# (atend) : return whether at end of input string
# (seq, R, S, ...) : return R && S && ...
# (advance, n, R) : advance input <n> chars, return R
# (fork, R, S) : if R fails, try S
# (bytematch, b) : return if start of input is b, advance 1 char
# (classmatch, charclass) : return if start of input is charclass, advance 1
# (start, n) : mark start of n-th paren match
# (end, n) : mark end of n-th paren match
# (scan, R) : scan for R at every position

#  my @nodes;
#  sub register {
#      my $newnode = [ @_ ];
#      push @nodes, $newnode;
#      return @nodes - 1;
#  }

sub register {
    return bless [ @_ ], 'regex_op';
}

#  sub render {
#      my $node = $nodes[shift()];
#      return $node->[0] . "(" . join(", ", @$node[1..$#$node]) . ")";
#  }

#  sub dump {
#      use Data::Dumper;
#      for my $i (reverse(0 .. $#nodes)) {
#  #	print "$i: ".Dumper($nodes[$i])."\n";
#  	print "$i: ".render($i)."\n";
#      }
#  }

%}

%left '|'
%left SEQUENCE
%nonassoc '(' '[' '{' CHAR '.' RANGE '*' '+'
%nonassoc '?'

%%

regex : regex0 { return register('accept', $_[1]); }
;

regex0 : regex1
   { return $_[1]; }
      | regex1 '$'
   { return register('seq', $_[1], register('atend')); }
;

regex1 : '^' expr
   { return $_[2]; }
      | expr
   { return register('scan', $_[1]); }
;

expr : expr '|' expr
   { return register('alternate', $_[1], $_[3]); }
     | expr expr %prec SEQUENCE
   { return register('seq', $_[1], $_[2]); }
     | CHAR
   { return register('bytematch', $_[1]); }
     | charclass
   { return register('classmatch', $_[1]); }
     | expr '*'
   { return register('multi_match', 0, -1, TRUE, $_[1]); }
     | expr '*' '?'
   { return register('multi_match', 0, -1, FALSE, $_[1]); }
     | expr '+'
   { return register('multi_match', 1, -1, TRUE, $_[1]); }
     | expr '+' '?'
   { return register('multi_match', 1, -1, FALSE, $_[1]); }
     | expr '?'
   { return register('multi_match', 0, 1, TRUE, $_[1]); }
     | expr '?' '?'
   { return register('multi_match', 0, 1, FALSE, $_[1]); }
     | expr range %prec RANGE
   { return register('multi_match', $_[2]->{min}, $_[2]->{max}, TRUE, $_[1]); }
     | expr range '?'
   { return register('multi_match', $_[2]->{min}, $_[2]->{max}, FALSE, $_[1]); }
     | '(' { ++$::paren } expr ')'
   { return register('seq', register('start', $_[2]),
                            $_[3],
                            register('end', $_[2]));
   }
     | '(' '?' ':' expr ')'
   { return $_[4]; }
;

range : '{' number ',' number '}'
   { return { min => $_[2], max => $_[4] }; }
      | '{' ',' number '}'
   { return { min => 0, max => $_[3] }; }
      | '{' number ',' '}'
   { return { min => $_[2], max => -1 }; }
;

number : number NUM { return $_[1] * 10 + $_[2]; }
       | NUM { return $_[1]; }
;

charclass : '[' '-' classpieces ']' { $_[3] .= '-'; return $_[3]; }
          | '[' classpieces ']' { return $_[2]; }
          | '.' { return 'ANY'; }
;

classpieces : classpieces classpiece { $_[1] .= $_[2]; return $_[1]; }
            | { return ''; }
;

classpiece : CHAR '-' CHAR
    { my $s = $_[1];
      my $p = $s;
      $s .= $p while ($p++ ne $_[3]);
      return $s;
    }
           | CHAR
    { return $_[1]; }
;

%%
