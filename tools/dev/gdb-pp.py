import gdb.printing

class StringPMCPrinter:
    """
    Pretty-printer for a string PMC
    """

    def __init__(self, val):
        self.val = val

    def to_string(self):
        return '"' + str(val.strstart) + '"'

    def display_hint(self):
        return "string"

def build_pretty_printer():
    pp = gdb.printing.RegexpCollectionPrettyPrinter("libparrot")
    pp.add_printer('STRING', '^STRING$', StringPMCPrinter)
    return pp
