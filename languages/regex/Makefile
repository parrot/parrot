YAPP = yapp

all : lib/Regex/Grammar.pm

lib/Regex/Grammar.pm : lib/Regex/Grammar.y
	$(YAPP) -s -m Regex::Grammar -o $@ lib/Regex/Grammar.y

# Note: These tend to be in the order of the latest thing I've been
# working on to the oldest, so that I see the failures quicker.
.PHONY: test
test :
	perl test.pl t/backopt.t
#	perl test.pl t/infinite.t
	perl test.pl t/quantindex.t
	perl test.pl t/literal.t
	perl test.pl t/optional.t
	perl test.pl t/group.t
	perl test.pl t/a.t
	perl test.pl t/star.t
	perl test.pl t/scanstar.t
	perl test.pl t/alt.t
	perl test.pl t/scanalt.t
	perl test.pl t/staralt.t
	perl test.pl t/plus.t
	perl test.pl t/example.t
