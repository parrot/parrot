YAPP = yapp

all : lib/Regex/Grammar.pm

lib/Regex/Grammar.pm : lib/Regex/Grammar.y
	$(YAPP) -s -m Regex::Grammar -o $@ lib/Regex/Grammar.y

.PHONY: test
test :
	perl test.pl t/example.t
