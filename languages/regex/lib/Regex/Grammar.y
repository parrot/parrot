%{

use constant TRUE => "TRUE";
use constant FALSE => 0;

sub tokenize {
    my $data = shift;
    my @tokens = split(//, $data);
    my @types = map { /[a-zA-Z_]/ ? 'CHAR' : (/\d/ ? 'NUM' : $_) } @tokens;
    return \@tokens, \@types;
}

sub op {
    Regex::Ops::Tree->op(@_);
}

%}

%left '|'
%left SEQUENCE
%nonassoc '(' '[' '{' CHAR '.' RANGE '*' '+'
%nonassoc '?'

%%

regex : regex1
   { return $_[1]; }
      | regex1 '$'
   { return op('seq' => [ $_[1], op('atend') ]); }
;

regex1 : '^' expr
   { return $_[2]; }
      | expr
   { return op('scan' => [ $_[1] ]); }
;

expr : expr '|' expr
   { return op('alternate' => [ $_[1], $_[3] ]); }
     | expr expr %prec SEQUENCE
   { return op('seq' => [ $_[1], $_[2] ]); }
     | CHAR
   { return op('match' => [ ord($_[1]) ]); }
     | charclass
   { return op('classmatch' => [ $_[1] ]); }
     | expr '*'
   { return op('multi_match' => [ 0, -1, TRUE, $_[1] ]); }
     | expr '*' '?'
   { return op('multi_match' => [ 0, -1, FALSE, $_[1] ]); }
     | expr '+'
   { return op('multi_match' => [ 1, -1, TRUE, $_[1] ]); }
     | expr '+' '?'
   { return op('multi_match' => [ 1, -1, FALSE, $_[1] ]); }
     | expr '?'
   { return op('multi_match' => [ 0, 1, TRUE, $_[1] ]); }
     | expr '?' '?'
   { return op('multi_match' => [ 0, 1, FALSE, $_[1] ]); }
     | expr range %prec RANGE
   { return op('multi_match' => [ $_[2]->{min}, $_[2]->{max}, TRUE, $_[1] ]); }
     | expr range '?'
   { return op('multi_match' => [ $_[2]->{min}, $_[2]->{max}, FALSE, $_[1] ]); }
     | '(' { ++$::paren } expr ')'
   { return op('group' => [ $_[3], $_[2] ]) }
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
