from gdb.printing import PrettyPrinter, SubPrettyPrinter
import gdb.types
import gdb
import re

class ParrotPrinter(PrettyPrinter):
    """
    Pretty-printer collection for libparrot.
    """

    def __init__(self):
        super(ParrotPrinter, self).__init__("libparrot")
        self.subprinters = [
            self.__class__.ParrotStringPrinter(),
            self.__class__.ParrotPMCPrinter(),
        ]

    def __call__(self, val):
        """
        Looks up a printer for a value.
        """
        type_tag = gdb.types.get_basic_type(val.type).tag

        if type_tag is None and val.type.code == gdb.TYPE_CODE_PTR:
            if val == 0:
                return None

            # Try dereferencing first.
            try:
                val = val.dereference()
                type_tag = gdb.types.get_basic_type(val.type).tag
            except gdb.error:
                return None

        if type_tag is None:
            return None

        for p in self.subprinters:
            if p.regex.match(type_tag):
                return p.gen_printer(val)

        return None

    class ParrotStringPrinter(SubPrettyPrinter):
        def __init__(self):
            self.name = "parrot_string_t"
            self.regex = re.compile("^parrot_string_t$")
            self.gen_printer = self.__class__.Printer

        class Printer(object):
            def __init__(self, val):
                self.val = val

            def to_string(self):
                return _parrot_str_to_str(self.val)

            def display_hint(self):
                return "string"

    class ParrotPMCPrinter(SubPrettyPrinter):
        def __init__(self):
            self.name = "PMC"
            self.regex = re.compile("^PMC$")
            self.gen_printer = self.__class__.Printer

        class Printer(object):
            def __init__(self, val):
                self.val = val

            def to_string(self):
                pmc_name = _parrot_str_to_str(self.val['vtable'].dereference()['whoami'])
                '''try:
                    attr_name = 'Parrot_%s_attributes' % pmc_name
                    attr_type = gdb.lookup_type(attr_name).pointer()

                    attrs = self.val['data'].cast(attr_type).dereference()
                except RuntimeError as e:
                    pass'''

                return 'PMC<%s>' % pmc_name

def _parrot_str_to_str(val):
    encoding = val['encoding'].dereference()
    encoding_name = encoding['name'].string()
    length = val['strlen']

    return val['strstart'].string(encoding=encoding_name,length=length)
