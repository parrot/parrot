use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

#
# XXX This is probably not as portable as it should be.
#
my $ext = $^O =~ /Win/ ? 'obj' : 'o';
my $objects = join ' ',
              map { "../../$_.$ext" }
              qw(byteorder string encoding encodings/singlebyte encodings/utf16 encodings/utf32 encodings/utf8 chartype chartypes/unicode chartypes/usascii exceptions resources memory packfile packout dod headers smallobject);
$objects .= ' $(BASEEXT)$(OBJ_EXT)';

WriteMakefile(
    'NAME'		=> 'Parrot::PakFile2',
    'VERSION_FROM'	=> 'PakFile2.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '-I../../include', # e.g., '-I/usr/include/other'
    'LDFROM'		=> $objects,
);

