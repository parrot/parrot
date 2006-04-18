grammar Pheme::Grammar;

rule prog { [ <list> \s* ]+ }

rule list { \( <list_items>+ \s* \) }

rule list_items { [ <atom> | <list> | <empty_list> ] \s* }

rule empty_list { '\(\) }

rule atom { <symbol_tag>? [ <-[ \n\r\(\)]> ]+ }

rule symbol_tag { \# }
