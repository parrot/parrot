grammar Pheme::Grammar;

regex prog { [ <list> <ws>* ]+ }

regex list { \( <list_items>+ <ws>* \) }

# quoted_string has to come first
regex list_items { [ <quoted_string> | <atom> | <list> | <empty_list> ] <ws>* }

regex empty_list { \(\) }

regex atom { [ <symbol_tag> | <quote> ]? [ <-[ \n\r\(\)]> ]+ }

regex quoted_string { <PGE::Text::bracketed: '"> }

regex quote { ' }

regex symbol_tag { \# }

regex ws { [ ; \N+ | \s ]+ }
