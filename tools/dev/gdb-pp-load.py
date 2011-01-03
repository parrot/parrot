import gdb.printing
import parrot-pp

gdb.printing.register_pretty_printer(gdb.current_objfile(), parrot-pp.build_pretty_printer())
