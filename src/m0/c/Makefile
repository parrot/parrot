all: m0

include/m0.h: include/m0_constants.h include/m0_compiler_defines.h \
	          include/m0_interp.h include/m0_mob.h

include/m0_interp.h: include/m0_interp_structures.h

include/m0_interp_structures.h: include/m0_mob_structures.h

include/m0_mob.h: include/m0_interp_structures.h include/m0_mob_structures.h

m0_mob.c: include/m0_mob.h include/m0_constants.h include/m0_compiler_defines.h

m0 : include/m0.h m0_interp.c m0_mob.c
	$(CC) -W -Wall -g -Iinclude -o m0 m0_mob.c m0_interp.c

tags-emacs: tags.emacs.dummy
	rm -f TAGS
	ctags -e \
	--links=no --totals \
	-R --exclude=blib --exclude=.git  \
	--languages=c,perl --langmap=c:+.h,c:+.pmc,c:+.ops \
	-I NOTNULL,NULLOK,ARGIN,ARGMOD,ARGOUT,ARGINOUT,ARGIN_NULLOK,ARGOUT_NULLOK,ARGMOD_NULLOK,ARGFREE,ARGFREE_NOTNULL \
	.

# this works with an old etags (XEmacs 21.5*)
tags-xemacs: tags.emacs.dummy
	rm -f TAGS
	find . \
	-name \*.c -o -name \*.h -o -name \*.pmc -o -name \*.ops | etags -l c - -o TAGS

tags.emacs.dummy:

# vim ctags
# this needs exuberant-ctags

tags-vi: tags.vi.dummy
	rm -f tags
	ctags \
	--links=no --totals \
	-R --exclude=blib --exclude=.git  \
	--languages=c,perl --langmap=c:+.h,c:+.pmc,c:+.ops \
	-I NOTNULL,NULLOK,ARGIN,ARGMOD,ARGOUT,ARGINOUT,ARGIN_NULLOK,ARGOUT_NULLOK,ARGMOD_NULLOK,ARGFREE,ARGFREE_NOTNULL

tags.vi.dummy:

tags: tags.dummy
	@echo 'There is no "tags" target. You want tags-vi or tags-emacs.'

tags.dummy:
