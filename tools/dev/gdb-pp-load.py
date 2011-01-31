# Copyright (C) 2011, Parrot Foundation.
import gdb.printing
import sys

if not 'blib/lib' in sys.path:
    sys.path.append('blib/lib')

from GDBPrettyPrint import ParrotPrinter

gdb.printing.register_pretty_printer(gdb.current_objfile(), ParrotPrinter())
