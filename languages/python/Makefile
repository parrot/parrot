all:

fulltest: testclass test testbench

test:
	perl t/harness t/basic/*.t

testbench:
	perl t/harness t/pie/b[12].t

testclass:
	cd ../.. ; perl -Ilib t/harness t/dynclass/py*.t

clean:
