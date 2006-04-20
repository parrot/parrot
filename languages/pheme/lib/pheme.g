grammar Pheme::Grammar;

rule prog { [ <list> \s* ]+ }

rule list { \( <list_items>+ \s* \) }

# quoted_string has to come first
rule list_items { [ <quoted_string> | <atom> | <list> | <empty_list> ] \s* }

rule empty_list { '\(\) }

rule atom { <symbol_tag>? [ <-[ \n\r\(\)]> ]+ }

rule quoted_string { <PGE::Text::bracketed: '"> }

rule symbol_tag { \# }
