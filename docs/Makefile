
all: packfile-c.pod packfile-perl.pod

packfile-c.pod: ../packfile.c
	perldoc -u ../packfile.c > packfile-c.pod

packfile-perl.pod: ../Parrot/PackFile.pm
	perldoc -u ../Parrot/PackFile.pm > packfile-perl.pod

clean:
	rm -f packfile-c.pod packfile-perl.pod

