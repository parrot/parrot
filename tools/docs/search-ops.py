#!/usr/bin/python

"""
Given a valid regex (pcre style) as an argument, the script will search inside 
any *.ops file located in 'path' for an opcode name that matches, dumping both
its arguments and its description. 
If no argument is passed, every opcode found is dumped.

Example:
> ./search-ops.py load

----------------------------------------------------------------------
File: core.ops - Parrot Core Ops (2 matches)
----------------------------------------------------------------------

load_bytecode(in STR)
Load Parrot bytecode from file $1, and (TODO) search the library path,
to locate the file.

loadlib(out PMC, in STR)
Load a dynamic link library named $2 and store it in $1.

----------------------------------------------------------------------
File: debug.ops (1 matches)
----------------------------------------------------------------------

debug_load(inconst STR)
Load a Parrot source file for the current program.
"""

path = "../../src/ops/" # path to the ops source folder
wrap_width = 70         # max chars per line

import os, re
from sys import argv, exit

def wrap(text, width):
    return reduce(lambda line, word, width=width: '%s%s%s' %
                  (line,
                   ' \n'[(len(line)-line.rfind('\n')-1
                         + len(word.split('\n',1)[0]
                              ) >= width)],
                   word),
                  text.split(' ')
                 )

query = ""
if len(argv) > 1:
    query = argv[1]

try:    
    query = re.compile(query)
except:
    print "Invalid opcode regex"
    exit()

path = path.replace("\\", "/")
if len(path) > 0 and path[-1] != "/":
    path = path + "/"

try:
    opFiles = os.listdir(path)
except:
    print "Path not found"
    exit()
    
opFiles = filter(lambda file: re.compile("\.ops$").search(file) is not None, opFiles)

matches = []

for file in opFiles:
    results = []
    opsc = open(path+file, "r").read()
    
    p = re.compile("^=item\sB<(\w+)>\(([^)]+)\)\n\n(?=(.*?)\n\n)", re.MULTILINE|re.DOTALL)
    for m in p.findall(opsc):
        if query.search(m[0]) is None:
            continue
        if re.compile("=item").match(m[2]) is not None:
            m = list(m)
            m[2] = None
        results.append(m)
    
    if len(results) > 0:
        title = re.compile("^=head1\sNAME\n\n(.*)", re.MULTILINE).search(opsc).group(1)
        matches.append({"f": title, "rs": results})
        
if len(matches) == 0:
    print "No matches were found"
else:
    delim = "\n" + "-" * wrap_width + "\n"
    for v in matches:
        print "%sFile: %s (%d matches)%s" % (delim, v["f"], len(v["rs"]), delim)
        for m in v["rs"]:
            print "%s(%s)" % tuple(m[:2])
            if m[2] is not None:
                print wrap(m[2].replace("\n", " "), wrap_width)+"\n"