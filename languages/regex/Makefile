YAPP = yapp
PARROT = ../../parrot

all : lib/Regex/Grammar.pm regex-compiler.pbc

lib/Regex/Grammar.pm : lib/Regex/Grammar.y
	$(YAPP) -s -m Regex::Grammar -o $@ lib/Regex/Grammar.y

regex-compiler.pbc : regex-compiler.imc
	$(PARROT) -o regex-compiler.pbc regex-compiler.imc

# Note: These tend to be in the order of the latest thing I've been
# working on to the oldest, so that I see the failures quicker.
.PHONY: test
test :
	perl test.pl t/basic/backopt.t
	perl test.pl t/basic/quantindex.t
	perl test.pl t/basic/literal.t
	perl test.pl t/basic/optional.t
	perl test.pl t/basic/group.t
	perl test.pl t/basic/a.t
	perl test.pl t/basic/star.t
	perl test.pl t/basic/scanstar.t
	perl test.pl t/basic/alt.t
	perl test.pl t/basic/scanalt.t
	perl test.pl t/basic/staralt.t
	perl test.pl t/basic/plus.t
	perl test.pl t/basic/example.t

# This is a TODO test -- currently, it loops forever. It will require
# adding a check to the matcher that it is making progress. Or
# something. I need to look at this again.
#
#	perl test.pl t/basic/infinite.t
