#!/usr/bin/perl -w

use strict;
use FindBin;
use lib "$FindBin::Bin/lib";
use Make::Dependency qw(Object Shared_Object Executable);
use Make::Archive_Obj qw(Archive);
use Make::CC_Obj qw(CC);
use Make::Link_Obj qw(Link);
use Make::Link_Shared_Obj qw(Link_Shared);
use Make::Perl_Obj qw(Perl);
use Make::Target_Obj qw(Target);
use YAML qw(Store);

my $depends = {};
my $VERSION = "0.0.6";

#O = .o
#SO = .so
#A = .a
#RM_F = rm -f
#RM_RF = rm -rf
#AR_CRS = ar crs
#LD = cc
#LD_SHARED = -shared
#LD_OUT = -o 

# No translation required, hopefully.
# Handled by Link_Shared maybe?

#INC=include/parrot

my $INC = 'include/parrot';

###############################################################################
#
# "STICKY" GENERATED FILES:
#
# These files are created when Configure.pl runs.
#
# We don't delete these on 'clean' only on 'realclean'.
# That way, we don't have to re-Configure.pl after making
# clean.
#
###############################################################################

#GEN_MAKEFILES = Makefile classes/Makefile languages/Makefile docs/Makefile \
#languages/jako/Makefile languages/miniperl/Makefile languages/scheme/Makefile

my @GEN_MAKEFILES = qw(
  Makefile
  classes/Makefile languages/Makefile docs/Makefile
  languages/jako/Makefile languages/miniperl/Makefile languages/scheme/Makefile
);

#GEN_CONFIGS  = include/parrot/config.h include/parrot/platform.h \
#			   lib/Parrot/Config.pm lib/Parrot/Types.pm platform.c

my @GEN_CONFIGS = qw(
  include/parrot/config.h include/parrot/platform.h
  lib/Parrot/Config.pm lib/Parrot/Types.pm
  platform.c
);

#STICKY_FILES = $(GEN_CONFIGS) $(GEN_MAKEFILES) config.opt

my @STICKY_FILES = ( @GEN_CONFIGS, @GEN_MAKEFILES, 'config.opt' );

###############################################################################
#
# "FLUID" GENERATED FILES:
#
# These files are created during the build process.
#
# We *do* delete these on 'clean'.
#
###############################################################################

#GEN_OPSFILES = 

my @GEN_OPSFILES = undef;

#GEN_HEADERS = $(INC)/vtable.h $(INC)/oplib/core_ops.h \
#$(INC)/oplib/core_ops_prederef.h

my @GEN_HEADERS = ("$INC/vtable.h", "$INC/oplib/core_ops.h", # XXX
                   "$INC/oplib/core_ops_prederef.h");

#GEN_SOURCES = core_ops.c core_ops_prederef.c

my @GEN_SOURCES = qw(core_ops.c core_ops_prederef.c);

#GEN_MODULES = lib/Parrot/Jit.pm lib/Parrot/PMC.pm lib/Parrot/OpLib/core.pm

my @GEN_MODULES = qw(lib/Parrot/Jit.pm lib/Parrot/PMC.pm
                     lib/Parrot/OpLib/core.pm);

#FLUID_FILES = $(GEN_OPSFILES) $(GEN_HEADERS) $(GEN_SOURCES) $(GEN_MODULES)

my @FLUID_FILES = (@GEN_OPSFILES, @GEN_HEADERS, @GEN_SOURCES, @GEN_MODULES);

###############################################################################
#
# OTHER FILE GROUPS:
#
###############################################################################

#GENERAL_H_FILES = $(INC)/config.h $(INC)/exceptions.h $(INC)/io.h $(INC)/op.h \
#$(INC)/register.h $(INC)/string.h $(INC)/events.h $(INC)/interpreter.h \
#$(INC)/memory.h $(INC)/parrot.h $(INC)/stacks.h $(INC)/packfile.h \
#$(INC)/global_setup.h $(INC)/vtable.h $(INC)/oplib/core_ops.h \
#$(INC)/oplib/core_ops_prederef.h $(INC)/runops_cores.h $(INC)/trace.h \
#$(INC)/pmc.h $(INC)/key.h $(INC)/hash.h $(INC)/resources.h $(INC)/platform.h $(INC)/oplib/core_ops_cg.h \
#$(INC)/interp_guts.h  $(INC)/rx.h $(INC)/rxstacks.h \
#$(INC)/embed.h $(INC)/warnings.h $(INC)/misc.h $(INC)/debug.h

# Okay, doing this one quasiprogrammatically.

my @GENERAL_H_FILES = map {
  "$INC/${_}.h"
} qw(
  config exceptions io.op register string events interpreter memory parrot
  stacks packfile global_setup vtable oplib/core_ops oplib/core_ops_prederef
  runops_cores trace pmc key hash resources platform oplib/core_ops_cg
  interp_guts rx rxstacks embed warnings misc debug
);

#ALL_H_FILES = $(GENERAL_H_FILES)

my @ALL_H_FILES = @GENERAL_H_FILES;

#O_DIRS = classes

my @O_DIRS = qw(classes);

#CLASS_O_FILES =  classes/array$(O) classes/coroutine$(O) classes/default$(O) classes/intqueue$(O) classes/perlarray$(O) classes/perlhash$(O) classes/perlint$(O) classes/perlnum$(O) classes/perlstring$(O) classes/perlundef$(O) classes/pointer$(O) classes/sub$(O)

# XXX Doing this one programmatically as well

my @CLASS_O_FILES = map {
  Object(input=>"classes/$_")
} qw(
  array coroutine default intqueue
  perlarray perlhash perlint perlnum perlstring perlundef
  pointer sub
);

#ENCODING_O_FILES = encodings/singlebyte$(O) encodings/utf8$(O) \
#				   encodings/utf16$(O) \
#			       encodings/utf32$(O)

# XXX Same here...

my @ENCODING_O_FILES = map {
  Object(input=>"encodings/$_")
} qw(
  singlebyte utf8 utf16 utf32
);

#CHARTYPE_O_FILES = chartypes/unicode$(O) chartypes/usascii$(O)

# XXX Okay, tired of mentioning this.

my @CHARTYPE_O_FILES = map {
  Object(input=>"chartypes/$_")
} qw(
  unicode usascii
);

#IO_O_FILES = io/io$(O) io/io_buf$(O) io/io_unix$(O) io/io_win32$(O) \
#             io/io_stdio$(O)

# XXX See previous comment

my @IO_O_FILES = map {
  Object(input=>"io/$_")
} qw(
  io io_buf io_unix io_win32 io_stdio
);

#INTERP_O_FILES = exceptions$(O) global_setup$(O) interpreter$(O) parrot$(O) \
#				 register$(O) core_ops$(O) core_ops_prederef$(O) memory$(O) \
#				 packfile$(O) stacks$(O) string$(O) sub$(O) encoding$(O) \
#				 chartype$(O) runops_cores$(O) trace$(O) pmc$(O) key$(O) hash$(O) \
#				 platform$(O)  resources$(O) rx$(O) rxstacks$(O) \
#				 embed$(O) warnings$(O) misc$(O) core_ops_cg$(O) \
#				 packout$(O) byteorder$(O) debug$(O)

# XXX See previous XXX

my @INTERP_O_FILES = map {
  Object(input=>$_)
} qw(
  exceptions global_setup interpreter parrot register
  core_ops core_ops_prederef
  memory packfiles stacks string sub encoding chartype runops_cores trace pmc
  key hash platform resources rx rxstacks embed warnings misc core_ops_cg
  packout byteorder debug
);

#O_FILES = $(INTERP_O_FILES) \
#	      $(IO_O_FILES) \
#		  $(CLASS_O_FILES) \
#		  $(ENCODING_O_FILES) \
#		  $(CHARTYPE_O_FILES)

my @O_FILES = (
  @INTERP_O_FILES, @IO_O_FILES, @CLASS_O_FILES, @ENCODING_O_FILES,
  @CHARTYPE_O_FILES
);

#OPS_FILES = core.ops debug.ops io.ops math.ops rx.ops $(GEN_OPSFILES)

my @OPS_FILES = (
  'core.ops', 'debug.ops', 'io.ops', 'math.ops', 'rx.ops',
  @GEN_OPSFILES
);

###############################################################################
#
# BUILD TOOL CONFIGURATIONS:
#
# DO NOT ADD C COMPILER FLAGS HERE
# Add them in Configure.pl--look for the
# comment 'ADD C COMPILER FLAGS HERE'
#
###############################################################################

#CFLAGS = -fno-strict-aliasing -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64  -Wall -Wstrict-prototypes -Wmissing-prototypes -Winline -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Waggregate-return -Winline -W -Wno-unused -Wsign-compare   -I./include  -DHAVE_COMPUTED_GOTO

my @CFLAGS = qw(
  -fno-strict-aliasing -I/usr/local/include -D_LARGEFILE_SOURCE
  -D_FILE_OFFSET_BITS=64  -Wall -Wstrict-prototypes -Wmissing-prototypes
  -Winline -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings
  -Waggregate-return -Winline -W -Wno-unused -Wsign-compare -I./include
  -DHAVE_COMPUTED_GOTO
);
Make::CC_Obj::flags(@CFLAGS);

#LDFLAGS =  -L/usr/local/lib 

my @LDFLAGS = qw(
  -L/usr/local/lib
);
Make::Link_Obj::flags(@LDFLAGS);

#C_LIBS = -lnsl -ldl -lm -lcrypt -lutil

my @C_LIBS = qw(
  -lnsl -ldl -lm -lcrypt -lutil
);
Make::CC_Obj::libraries(@C_LIBS);

#CC = cc

# XXX Shouldn't need to be explicitly mentioned

###############################################################################
#
# BUILD TARGET CONFIGURATIONS:
#
###############################################################################

#TEST_PROG = parrot

my $TEST_PROG = Executable(input=>'parrot');

# XXX Not sure how to represent running arbitrary programs...

#TEST_PROG_SO = parrot_so

my $TEST_PROG_SO = Executable(input=>'parrot_so');

# XXX Not sure how to represent running arbitrary programs...

#PDUMP = pdump

# XXX Not sure how to represent running arbitrary programs...

#LINT = lclint

# XXX Shouldn't need to be set up

#
# XXX Note below that 'LINTFLAGS' and 'LINTFLAGS2' are two separate sets of
# XXX flags that have to be passed to the build system.
# XXX This needs to be decided upon.
#

# note: +distinctinternalnames with +externalnamelen at 8 characters
#       (the ANSI standard) is not going to fly for us.  
#LINTFLAGS = -weak +showscan +showsummary +posixstrictlib -abstract +aliasunique +ansireserved +ansireservedinternal +assignexpose +bitwisesigned +boolcompare +booltype BOOLVAL +casebreak -castfcnptr -charint +continuecomment +controlnestdepth 15 +cppnames +declundef +distinctinternalnames +evalorder +fielduse +forcehints -globs +imptype +includenest 8 +incondefs +incondefslib +linelen 9999 +longintegral +macroassign +macroempty +macroredef +matchanyintegral +nestedextern +noeffect +readonlystrings +realcompare +shadow -type

my @LINTFLAGS = qw(
  -weak +showscan +showsummary +posixstrictlib -abstract +aliasunique
  +ansireserved +ansireservedinternal +assignexpose +bitwisesigned
  +boolcompare +booltype BOOLVAL +casebreak -castfcnptr -charint
  +continuecomment +controlnestdepth 15 +cppnames +declundef
  +distinctinternalnames +evalorder +fielduse +forcehints -globs +imptype
  +includenest 8 +incondefs +incondefslib +linelen 9999 +longintegral
  +macroassign +macroempty +macroredef +matchanyintegral +nestedextern
  +noeffect +readonlystrings +realcompare +shadow -type
);

#LINTFLAGS2 = $(LINTFLAGS) -ansireserved -retvalother

my @LINTFLAGS2 = (@LINTFLAGS, '-ansireserved', '-retvalother');

###############################################################################
#
# MAKE CONFIGURATION:
#
###############################################################################

#
# This is set to  MAKE=$make if your $make command doesn't
# do it for you.
#

# XXX Shouldn't need to be done anymore

#

#.c$(O) :
#	$(CC) $(CFLAGS) -o $@ -c $<

#all : $(TEST_PROG) docs

$depends->{all} = Target(
  input => undef,
  dependsOn => [ $TEST_PROG, 'docs' ],
);

#mops : examples/assembly/mops examples/mops/mops

# XXX This needs to be properly phrased. I'm not sure how this will be
# XXX accomplished.

$depends->{mops} = Target(
  input => undef,
  dependsOn => [qw(examples/assembly/mops examples/mops/mops)],
);

## XXX Unix-only for now
#libparrot$(A) : $(O_DIRS) $(O_FILES)
#	$(AR_CRS) $@ $(O_FILES)

# XXX The Archive tool won't build unless we're under UNIX.

my $libparrot_A = Archive(
  input => [@O_FILES], # XXX Not sure what $@ is in make-speak
  dependsOn => [@O_DIRS, @O_FILES],
);

#$(TEST_PROG) : test_main$(O) $(GEN_HEADERS) $(O_DIRS) $(O_FILES) lib/Parrot/OpLib/core.pm lib/Parrot/PMC.pm lib/Parrot/.dummy
#	$(LD) -o $(TEST_PROG) $(LDFLAGS) $(O_FILES) test_main$(O) $(C_LIBS)

# XXX Includes LDFLAGS and C_LIBS automagically.
# XXX This may, of course, be the wrong behavior.

$TEST_PROG = Link(
  input => [@O_FILES, Object(input=>'test_main')],
  output => Executable(input=>'parrot'),
  dependsOn => [Object(input=>'test_main'),@GEN_HEADERS,@O_DIRS,@O_FILES,
    'lib/Parrot/OpLib/core.pm','lib/Parrot/PMC.pm','lib/Parrot/.dummy'
  ],
);

#lib_deps_object : $(O_DIRS) $(O_FILES)
#	$(PERL) tools/dev/lib_deps.pl object $(O_FILES)

my $lib_deps_object = Perl( # XXX
  input => 'tools/dev/lib_deps.pl',
  dependsOn => [ @O_DIRS, @O_FILES ],
  commandLine => "tools/dev/lib_deps.pl object @O_FILES",
);

#lib_deps_source : $(GENERAL_H_FILES)
#	$(PERL) tools/dev/lib_deps.pl source all_source

my $lib_deps_source = Perl( # XXX
  input => 'tools/dev/lib_deps.pl',
  dependsOn => [ @GENERAL_H_FILES ],
  commandLine => "tools/dev/lib_deps.pl source all_source",
);

#lib_deps : lib_deps_object lib_deps_source

# XXX The dependsOn will eventually be their own objects down below.
# XXX This forces a certain amount of linearity to the app that I really don't
# XXX like though.

$depends->{lib_deps} = Target(
  input => undef, # XXX
  dependsOn => ['lib_deps_object', 'lib_deps_source'], 
);

#check_source : $(GENERAL_H_FILES)
#	$(PERL) tools/dev/check_source_standards.pl all_source

my $check_source = Perl( # XXX
  input => undef, # XXX 
  dependsOn => [ @GENERAL_H_FILES ],
  commandLine => "tools/dev/check_source_standards.pl all_source",
);

###############################################################################
#
# Shared Library Targets:
#
# XXX This target is not portable to Win32
#
###############################################################################

# XXX New addition

my $libparrot_shared = Shared_Object(input=>'blib/lib/libparrot').$VERSION;

#blib :
#	mkdir -p blib

$depends->{blib} = Target(
  action => 'mkdir -p blib',
  input => undef,
  dependsOn => undef,
);

#blib_lib :
#	mkdir -p blib/lib

$depends->{blib_lib} = Target(
  action => 'mkdir -p blib/lib',
  input => undef,
  dependsOn => undef,
);

#shared : blib_lib blib/lib/libparrot$(SO) blib/lib/libcore_prederef$(SO) $(TEST_PROG_SO)

$depends->{shared} = Target(
  input => undef, # XXX
  dependsOn => [ 'blib_lib', $libparrot_shared,
                 Shared_Object(input=>'blib/lib/libcore_prederef'),
                 $TEST_PROG_SO
               ],
);

#blib/lib/libparrot$(SO).0.0.6 : blib_lib $(O_DIRS) $(O_FILES)
#	$(LD) $(LD_SHARED) -Wl,-soname,libparrot$(SO).0 $(LDFLAGS) $(LD_OUT)blib/lib/libparrot$(SO).0.0.6 $(O_FILES)

# XXX Note the introduction of the flags variable

my $shared_blib_lib_libparrot = Link_Shared(
  input => [@O_FILES],
  output => $libparrot_shared,
  flags => ['-Wl', "-soname,".Shared_Object(input=>'libparrot')],
  dependsOn => [$depends->{blib_lib}, @O_DIRS, @O_FILES],
);

#------------------------------------------------------------------------------
=pod

blib/lib/libparrot$(SO).0.0 : blib/lib/libparrot$(SO).0.0.6
	$(RM_F) $@
	cd blib/lib; ln -s libparrot$(SO).0.0.6 libparrot$(SO).0.0

blib/lib/libparrot$(SO).0 : blib/lib/libparrot$(SO).0.0
	$(RM_F) $@
	cd blib/lib; ln -s libparrot$(SO).0.0 libparrot$(SO).0

blib/lib/libparrot$(SO) : blib/lib/libparrot$(SO).0
	$(RM_F) $@
	cd blib/lib; ln -s libparrot$(SO).0 libparrot$(SO)

blib/lib/libcore_prederef$(SO).0.0.6 : blib_lib core_ops_prederef$(O)
	$(LD) $(LD_SHARED) -Wl,-soname,libparrot$(SO).0 $(LDFLAGS) $(LD_OUT)blib/lib/libcore_prederef$(SO).0.0.6 core_ops_prederef$(O)

blib/lib/libcore_prederef$(SO).0.0 : blib/lib/libcore_prederef$(SO).0.0.6
	$(RM_F) $@
	cd blib/lib; ln -s libcore_prederef$(SO).0.0.6 libcore_prederef$(SO).0.0

blib/lib/libcore_prederef$(SO).0 : blib/lib/libcore_prederef$(SO).0.0
	$(RM_F) $@
	cd blib/lib; ln -s libcore_prederef$(SO).0.0 libcore_prederef$(SO).0

blib/lib/libcore_prederef$(SO) : blib/lib/libcore_prederef$(SO).0
	$(RM_F) $@
	cd blib/lib; ln -s libcore_prederef$(SO).0 libcore_prederef$(SO)

=cut
#------------------------------------------------------------------------------

#$(TEST_PROG_SO) : test_main$(O) blib/lib/libparrot$(SO) lib/Parrot/OpLib/core.pm lib/Parrot/PMC.pm
#	$(LD) $(LD_OUT)$(TEST_PROG) test_main$(O) $(LDFLAGS) $(C_LIBS) -L blib/lib -lparrot

#
# XXX libraries and library_paths are appended to the global settings.
#

$TEST_PROG_SO = Link(
  input => [ Object(input=>'test_main'), ],

  libraries => ['parrot'],
  library_paths => ['blib/lib'],

  output => Executable(input=>'parrot'),
  dependsOn => [Object(input=>'test_main'),
                Shared_Object(input=>'blib/lib/libparrot'),
                'lib/Parrot/OpLib/core.pm',
                'lib/Parrot/PMC.pm'
               ],
);

#
# Parrot Debugger
#
#PDB=pdb

my $PDB = Executable(input=>'pdb');

#------------------------------------------------------------------------------
=pod

#pdb$(O) : $(GENERAL_H_FILES)

$(PDB) : pdb$(O) $(O_DIRS) $(O_FILES)
	$(LD) -o $(PDB) pdb$(O) $(O_FILES) $(C_LIBS) $(LDFLAGS)

#
# Parrot Disassembler
#
DIS=disassemble

disassemble$(O) : $(GENERAL_H_FILES)

$(DIS) : disassemble$(O) $(O_DIRS) $(O_FILES)
	$(LD) -o $(DIS) disassemble$(O) $(O_FILES) $(C_LIBS) $(LDFLAGS)

#
# Parrot Dump
#

#$(PDUMP) : pdump$(O) packfile$(O)
#	$(LD) -o $(PDUMP) pdump$(O) packfile$(O) string$(O) chartype$(O) memory$(O) $(C_LIBS) $(LDFLAGS)


###############################################################################
#
# Other Dependencies and Build Rules:
#
###############################################################################

test_main$(O) : test_main.c $(GENERAL_H_FILES)

#lib/Parrot/OpLib/core.pm : $(OPS_FILES) ops2pm.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm
#	$(PERL) ops2pm.pl $(OPS_FILES)

my $lib_Parrot_OpLib_core_pm = Perl( # XXX
  dependsOn => [ @OPS_FILES, 'ops2pm.pl', 'lib/Parrot/OpsFile.pm',
                 'lib/Parrot/Op.pm' ],
  commandLine => "ops2pm.pl @OPS_FILES",
);

#lib/Parrot/PMC.pm : include/parrot/pmc.h pmc_pm.pl
#	$(PERL) pmc_pm.pl 

my #lib_Parrot_PMC_pm = Perl( # XXX
  dependsOn => [ 'include/parrot/pmc.h', 'pmc_pm.pl' ],
  commandLine => "pmc_pm.pl",
);


###############################################################################
#
# Examples (Assembly):
#
###############################################################################

examples/assembly/mops.pbc : examples/assembly/mops.pasm assemble.pl
	cd examples && cd assembly && $(MAKE) mops.pbc PERL=$(PERL) && cd .. && cd ..

#examples/assembly/mops.c : examples/assembly/mops.pbc pbc2c.pl
#	$(PERL) pbc2c.pl examples/assembly/mops.pbc > examples/assembly/mops.c

my $examples_assembly_mops_c = Perl(
  dependsOn => [ 'examples/assembly/mops.pbc', 'pbc2c.pl' ],
  commandLine =>
    "pbc2c.pl examples/assembly/mops.pbc > examples/assembly/mops.c",
);

#examples/assembly/mops : examples/assembly/mops$(O) $(O_DIRS) $(O_FILES)
#	$(LD) $(LDFLAGS) -o examples/assembly/mops examples/assembly/mops$(O) $(O_FILES) $(C_LIBS)

my $examples_assembly_mops = Link( # XXX
  input => [ Object('examples/assembly/mops'), @O_FILES, @C_LIBS ],
  output => Executable('examples/assembly/mops'),
  dependsOn => [ Object('examples/assembly/mops'), @O_DIRS, @O_FILES ],
);

examples/assembly/life.pbc : examples/assembly/life.pasm assemble.pl
	cd examples && cd assembly && $(MAKE) life.pbc PERL=$(PERL) && cd .. && cd ..

#examples/assembly/life.c : examples/assembly/life.pbc pbc2c.pl
#	$(PERL) pbc2c.pl examples/assembly/life.pbc > examples/assembly/life.c

my $examples_assembly_life_c = Perl( # XXX
  dependsOn => [ 'examples/assembly/life.pbc', 'pbc2c.pl' ],
  commandLine =>
    "pbc2c.pl examples/assembly/life.pbc > examples/assembly/life.c",
);

#examples/assembly/life : examples/assembly/life$(O) $(O_DIRS) $(O_FILES)
#	$(LD) $(LDFLAGS) -o examples/assembly/life examples/assembly/life$(O) $(O_FILES) $(C_LIBS)

my $examples_assembly_life = Link( # XXX
  input => [ Object('examples/assembly/life'), @O_FILES, @C_LIBS ],
  output => Executable('examples/assembly/life'),
  dependsOn => [ Object('examples/assembly/life'), @O_DIRS, @O_FILES ],
);

###############################################################################
#
# Examples (MOPS) - Comparative:
#
###############################################################################

examples/mops/mops$(O) : examples/mops/mops.c

#examples/mops/mops : examples/mops/mops$(O) platform$(O)
#	$(LD) $(LDFLAGS) -o examples/mops/mops examples/mops/mops$(O) platform$(O) $(C_LIBS)

my $examples_mops_mops = Link( # XXX ?
  input => [ Object('examples/mops/mops'), Object('platform'), @C_LIBS ],
  output => Executable('examples/mops/mops'),
  dependsOn => [ Object('examples/mops/mops'), Object('platform') ],
);


###############################################################################
#
# Dependencies:
#
###############################################################################

global_setup$(O) : $(GENERAL_H_FILES)

pmc$(O) : $(GENERAL_H_FILES)

hash$(O) : $(GENERAL_H_FILES)

jit$(O) : $(GENERAL_H_FILES)

jit_cpu$(O): $(GENERAL_H_FILES) $(INC)/jit_emit.h

key$(O) : $(GENERAL_H_FILES)

resources$(O) : $(GENERAL_H_FILES)

platform$(O) : $(GENERAL_H_FILES)

debug$(O) : $(GENERAL_H_FILES)

string$(O) : $(GENERAL_H_FILES)

chartype$(O) : $(GENERAL_H_FILES)

encoding$(O) : $(GENERAL_H_FILES)

chartype/usascii$(O) : $(GENERAL_H_FILES)

chartype/unicode$(O) : $(GENERAL_H_FILES)

exceptions$(O) : $(GENERAL_H_FILES)

encoding/singlebyte$(O) : $(GENERAL_H_FILES)

encoding/utf8$(O) : $(GENERAL_H_FILES)

encoding/utf16$(O) : $(GENERAL_H_FILES)

encoding/utf32$(O) : $(GENERAL_H_FILES)

interpreter$(O) : interpreter.c $(GENERAL_H_FILES)

io/io$(O) : $(GENERAL_H_FILES)

io/io_buf$(O) : $(GENERAL_H_FILES)

io/io_unix$(O) : $(GENERAL_H_FILES)

io/io_win32$(O) : $(GENERAL_H_FILES)

io/io_stdio$(O) : $(GENERAL_H_FILES)

memory$(O) : $(GENERAL_H_FILES)

packfile$(O) : $(GENERAL_H_FILES)

packout$(O) : $(GENERAL_H_FILES)

parrot$(O) : $(GENERAL_H_FILES)

register$(O) : $(GENERAL_H_FILES)

rx$(O) : $(GENERAL_H_FILES)

rxstacks$(O) : $(GENERAL_H_FILES)

stacks$(O) : $(GENERAL_H_FILES)

embed$(O) : $(GENERAL_H_FILES)

core_ops$(O) : $(GENERAL_H_FILES) core_ops.c

core_ops.c $(INC)/oplib/core_ops.h : $(OPS_FILES) ops2c.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm
	$(PERL) ops2c.pl C $(OPS_FILES)

core_ops_prederef$(O) : $(GENERAL_H_FILES) core_ops_prederef.c

#core_ops_prederef.c $(INC)/oplib/core_ops_prederef.h : $(OPS_FILES) ops2c.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm
#	$(PERL) ops2c.pl CPrederef $(OPS_FILES)

my $core__ops__prederef_c = Perl( # XXX
  dependsOn => [ @OPS_FILES, 'ops2c.pl', 'lib/Parrot/OpsFile.pm',
                 'lib/Parrot/Op.pm' ],
  commandLine => "ops2c.pl CPrederef @OPS_FILES",
);

core_ops_cg$(O): $(GENERAL_H_FILES) core_ops_cg.c

#core_ops_cg.c $(INC)/oplib/core_ops_cg.h: $(OPS_FILES) ops2cgc.pl lib/Parrot/OpsFile.pm lib/Parrot/Op.pm
#	$(PERL) ops2cgc.pl CGoto $(OPS_FILES)

my $core__ops__cg_c = Perl( # XXX
  dependsOn => [ @OPS_FILES, 'ops2cgc.pl', 'lib/Parrot/OpsFile.pm',
                 'lib/Parrot/Op.pm' ],
  commandLine => "ops2cgc.pl CGoto @OPS_FILES",
);


warnings$(O) : $(H_FILES)

misc$(O) : $(H_FILES)

$(STICKY_FILES) : Configure.pl
	$(PERL) Configure.pl

$(INC)/vtable.h : vtable.tbl vtable_h.pl
	$(PERL) vtable_h.pl

$(INC)/jit_emit.h: jit/i386/jit_emit.h
	$(PERL) -MFile::Copy=cp -e 'cp q|jit/i386/jit_emit.h|, q|$(INC)/jit_emit.h|'
jit_cpu.c: lib/Parrot/OpLib/core.pm $(INC)/jit_emit.h jit/i386/core.jit
	$(PERL) jit2h.pl i386 jit_cpu.c

docs : docs/.dummy

#newasm : $(TEST_PROG) lib/Parrot/.dummy

lib/Parrot/.dummy :
	cd lib && cd Parrot && $(PERL) Makefile.PL && $(MAKE) && cd .. && cd ..

docs/.dummy :
	cd docs && $(MAKE) && cd ..

classes : classes/.dummy

classes/.dummy :
	cd classes && $(MAKE) && cd ..

languages : languages.dummy

languages.dummy :
	cd languages && $(MAKE) && cd ..


###############################################################################
#
# Testing Targets:
#
###############################################################################

test : $(TEST_PROG) assemble.pl test_dummy

test_dummy :
	$(PERL) t/harness $(TEST_PROG_ARGS)

testp : $(TEST_PROG) assemble.pl blib/lib/libcore_prederef$(SO) blib/lib/libparrot$(SO) $(TEST_PROG_SO) test_dummy_p

test_dummy_p :
	$(PERL) t/harness $(TEST_PROG_ARGS) -P

testj : $(TEST_PROG) assemble.pl test_dummy_j

test_dummy_j :
	$(PERL) t/harness $(TEST_PROG_ARGS) -j

quicktest : $(TEST_PROG) assemble.pl quicktest_dummy

quicktest_dummy :
	$(PERL) t/harness $(TEST_PROG_ARGS) quick

mopstest : $(TEST_PROG) examples/assembly/mops.pbc
	$(TEST_PROG) $(TEST_PROG_ARGS) examples/assembly/mops.pbc

lifetest : $(TEST_PROG) examples/assembly/life.pbc
	$(TEST_PROG) $(TEST_PROG_ARGS) examples/assembly/life.pbc


###############################################################################
#
# Cleaning Targets:
#
###############################################################################

clean : testclean
	$(RM_F) $(INC)/oplib/core_ops_cg.h core_ops_cg.c 
	$(RM_F) $(O_FILES)
	$(RM_F) *.s
	$(RM_F) $(FLUID_FILES)
	$(RM_F) $(TEST_PROG) test_main$(O) $(PDUMP) pdump$(O)
	$(RM_F) examples/assembly/mops examples/assembly/mops.c
	$(RM_F) examples/assembly/mops$(O) examples/assembly/mops.pbc
	$(RM_F) examples/mops/mops$(O) examples/mops/mops
	$(RM_RF) blib
	$(RM_F) *~
	cd docs && $(MAKE) clean && cd ..
	cd classes && $(MAKE) clean && cd ..
	cd languages && $(MAKE) clean && cd ..

testclean :
	$(RM_F) t/op/*.pasm t/op/*.pbc t/op/*.out

realclean : clean
	$(RM_F) $(STICKY_FILES)

distclean :
	$(PERL) "-MExtUtils::Manifest=filecheck" -le 'sub ExtUtils::Manifest::_maniskip{sub{0}};$$ExtUtils::Manifest::Quiet=1;unlink $$_ for filecheck()'

cvsclean :
	$(PERL) "-MExtUtils::Manifest=filecheck" -le 'sub ExtUtils::Manifest::_maniskip{sub{0}};$$ExtUtils::Manifest::Quiet=1; do { unlink $$_ unless $$_ =~ m!(?:CVS/|\.cvs)! } for filecheck()'

reconfig :
	$(MAKE) clean; $(PERL) Configure.pl --reconfig

manitest :
	$(PERL) "-MExtUtils::Manifest=fullcheck" -e fullcheck

###############################################################################
#
# CVS Targets:
#
###############################################################################

update :
	cvs -q update -dP

status :
	cvs -n -q upd -dP

lint : parrot
	$(LINT) -I./include  "-Iclasses" $(LINTFLAGS) `echo $(O_FILES) | sed 's/\.o/\.c/g'`
	$(LINT) -I./include $(LINTFLAGS) test_main.c

lint2 : parrot
	$(LINT) -I./include  "-Iclasses" $(LINTFLAGS2) `echo $(O_FILES) | sed 's/\.o/\.c/g'`
	$(LINT) -I./include $(LINTFLAGS2) test_main.c	

=cut
#------------------------------------------------------------------------------

#Make::Link_Obj::command("cc"); # Default
Make::Link_Obj::flags("-lm");

=head2 NAME

make.pl - Make replacement for Parrot.

=head2 SYNOPSIS

It was hoped that Parrot could get away from platform-dependent tools like gcc
and make, and rely solely on perl, or maybe even something like miniparrot. At
the moment, it relies heavily on several different varieties of make, each with
differing syntax and various subtleties, making it hard to write portable code.

Having make in perl means that we're no longer dependent on platforms where make
exists, don't have to deal with the vagaries of various implementations of make,
and and can work almost anywhere perl and a compiler can run. It'll also help
with portability of things such as platform-specific extensions and various
pathname issues.

=cut

#------------------------------------------------------------------------------

=item Object

Take a filename without the object extension (.o or .obj, commonly), and return
the filename with the proper extension for the platform. Unlike most of the
other Make targets, this doesn't return an object but a scalar.

=cut

=item Generic Notes

Excepting C<Object> and C<Executable>, all targets take a list of parameters
such as C<output>, C<input>, and C<dependsOn>. These parameters can either be
a scalar, another target, or a list of mixed scalars and targets. Generally a
scalar is assumed to be a filename, and targets are recursively evaluated.

Each target is recursively evaluated to see if its dependencies are satisfied.
The algorithm does this by going through the filenames and targets in the
C<dependsOn> parameter. Targets are resolved to their filename(s). All of the
filenames (whether real or evaluated) are checked. If any of the files do not
exist, it's assumed that a previous dependency creates it. If any of the files
are newer than the target, the target must be rebuilt.

=cut

=item Perl

Runs perl on the files in the C<input> parameter to form the file in the
C<output> parameter.

=cut

my $foo_c = Perl(
  output => 'foo.c',
  input => 'foo.ops',
  commandLine => 'makeTest.pl foo.ops > foo.c',
  dependsOn => ['foo.ops', 'makeTest.pl'],
);

=item CC

Compiles the files in the C<input> parameter to form the file in the C<output>
parameter. Note in this case that the C<Object> target takes its C<input>
parameter and adds the appropriate platform-specific extension (For Windows,
C<.obj>, for UNIX C<.o>), generating a platform-specific file name to build.

=cut

my $foo_o = CC(
  output => Object( input => 'foo' ),
  input => 'foo.c',     # foo.o: foo.c
  dependsOn => $foo_c,
);

my $bar_o = CC(
  output => Object( input => 'bar' ),
  input => 'bar.c',     # bar.o: bar.c
  dependsOn => 'bar.c', #   cc -c bar.c
);

=item Link

Takes the files in the C<input> parameter and links them to create the file in
C<output>. Several interesting things happen here. First is the C<Executable>
target, which handles platform-specific build issues for executable files.
More specifically, it attaches C<.exe> to builds on Windows and does nothing
for the other platforms.

Also, you'll notice that C<dependsOn> is a list of target objects. Each of these
gets evaluated to generate the instructions needed to build its file in turn.
Also, since they're not filenames, each target knows what filename it will
eventually end up being.

=cut

my $foo_exe = Link(
  output => Executable( input => 'foo' ),
  input => [ Object(input=>'foo'),
             Object(input=>'bar') ], # foo: foo.o bar.o
  dependsOn => [$foo_o, $bar_o],     #   cc -o foo foo.o bar.o
);

=item Target

What the user invokes when typing 'make foo'. C<foo> is a sample target, and
when it's made, the nested dependencies are evaluated and eventually the
proper executable is built.

=cut

$depends->{foo} = Target(
  input => 'foo',
  dependsOn => $foo_exe,
);

#------------------------------------------------------------------------------

my $target = shift(@ARGV);

Satisfy($target);

exit;

#------------------------------------------------------------------------------

=item Satisfy

Satisfy dependencies by generating a list of actions and execute them in order.
This simply generates a list of actions to be taken in a linear order, with no
notes on how many of these tasks can be executed in parallel. This needs to be
added before it will be a true make() replacement.

=cut

sub Satisfy {
  my ($target) = @_;
  my $actions = [];
  $depends->{$target}->satisfied($actions);

#  print Store($depends);

  for(@$actions) {
print "running $_->{action}\n";
    system $_->{action};
  }
}

#------------------------------------------------------------------------------
