#!/bin/sh

FILES="{mkdistro.sh,README,MANIFEST,Makefile,t,prd-perl6.pl,perl6,P6C}"

find . -name '*~' -print | xargs rm 2>/dev/null
eval "tar czvf grammar.tgz $FILES"
