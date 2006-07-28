# compile a .c src test
#
# usage: sh src-t.sh t/src/extend_15
# 

function usage()
{
    echo "usage sh $0 t/src/some_file"
    exit 1
}    

function no_c_file()
{
    echo "$1.c doesn't exit"
    exit 1
}    
F=$1

[ "$F" != "" ] || usage
[ -f "$F.c"  ] || no_c_file $F

# compile bits
CC=$(./parrot parrot-config cc)
CCFLAGS=$(./parrot parrot-config ccflags)
CCDEBUG=$(./parrot parrot-config cc_debug)
INCLUDE='-I./include'
O=$(./parrot parrot-config o)
CC_O_OUT=$(./parrot parrot-config cc_o_out)
CC_CMD="$CC $CCFLAGS $CCDEBUG $INCLUDE -c $CC_O_OUT$F$O $F.c"

# compile it
echo $CC_CMD
$CC_CMD

# link bits

LINK=$(./parrot parrot-config link)
LINKFLAGS=$(./parrot parrot-config linkflags)
LD_DEBUG=$(./parrot parrot-config ld_debug)
CFG_FILE="src/parrot_config$O"
LD_OUT=$(./parrot parrot-config ld_out)
EXE=$(./parrot parrot-config exe)
RPATH=$(./parrot parrot-config rpath)
BLIB_DIR=$(./parrot parrot-config blib_dir)
# build shared
LIBPARROT="$RPATH$BLIB_DIR -L$BLIB_DIR -lparrot"
LIBS=$(./parrot parrot-config libs)
# assume no icu need

LINK_CMD="$LINK $LINK_FLAGS $LD_DEBG $F$O $CFG_FILE $LD_OUT$F$EXE $LIBPARROT $LIBS"

echo $LINK_CMD
$LINK_CMD
