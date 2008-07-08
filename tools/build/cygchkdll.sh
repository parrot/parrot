libname=${2##*/}
if cygcheck ./$1 | egrep "Error.*find.*$libname" >/dev/null ; then
	echo "Could not find $2.  Guessing you need to add `pwd`/blib/lib to PATH."
	exit 1
fi
