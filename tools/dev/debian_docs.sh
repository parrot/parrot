#! /bin/sh
# 		debian_docs.sh


# A script to generate the file ports/debian/parrot-doc.docs 
# Creates a complete list of all files (but not directories) in the docs/ 
# directory, with repository-relative paths to the files, e.g. docs/ops/math.pod

run_from=($PWD) # Save starting directory for error message
# Assuming run from top-level parrot directory as:
#    sh tools/dev/debian_docs.sh

if [ $(basename $PWD) != parrot ] 
then 
    echo "Should be run from parrot/, not $run_from"
    exit
fi

find docs -type f -o -type f  > ports/debian/parrot-doc.docs

#		End debian_docs.sh
