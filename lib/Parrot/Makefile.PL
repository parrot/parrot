use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my $objects = join ' ', map { "../../$_" } split /\s+/,'byteorder.o string.o encoding.o encodings/singlebyte.o encodings/utf16.o encodings/utf32.o encodings/utf8.o chartype.o chartypes/unicode.o chartypes/usascii.o exceptions.o resources.o memory.o packfile.o packout.o';
$objects .= ' $(BASEEXT)$(OBJ_EXT)';

WriteMakefile(
    'NAME'		=> 'Parrot::PakFile2',
    'VERSION_FROM'	=> 'PakFile2.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    'LIBS'		=> [''], # e.g., '-lm'
    'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
    'INC'		=> '-I../../include', # e.g., '-I/usr/include/other'
    'LDFROM'    => 
$objects,
#'$(BASEEXT)$(OBJ_EXT) byteorder.o string.o encoding.o encodings/singlebyte.o encodings/utf16.o encodings/utf32.o encodings/utf8.o chartype.o chartypes/unicode.o chartypes/usascii.o exceptions.o resources.o memory.o packout.o packfile.o'
);

