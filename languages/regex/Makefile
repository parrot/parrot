YAPP = yapp

all : lib/Regex/Grammar.pm

lib/Regex/Grammar.pm : lib/Regex/Grammar.y
	$(YAPP) -s -m Regex::Grammar -o $@ lib/Regex/Grammar.y

.PHONY: test
test :
	perl test.pl t/group.t
	perl test.pl t/a.t
	perl test.pl t/star.t
	perl test.pl t/scanstar.t
	perl test.pl t/alt.t
	perl test.pl t/scanalt.t
	perl test.pl t/staralt.t
	perl test.pl t/plus.t
	perl test.pl t/example.t
