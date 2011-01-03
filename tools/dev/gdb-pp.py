from gdb.printing import PrettyPrinter, SubPrettyPrinter
import gdb.types
import gdb
import re
import itertools

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
                self.pmc_name = _parrot_str_to_str(self.val['vtable'].dereference()['whoami'])

            def to_string(self):
                return 'PMC<%s>' % self.pmc_name

            def children(self):
                try:
                    attr_name = 'Parrot_%s_attributes' % self.pmc_name
                    attr_type = gdb.lookup_type(attr_name).pointer()

                    attrs = self.val['data'].cast(attr_type).dereference()

                    # Python iterator magic.
                    name_value_tuples = PMCIterator(attrs)
                    names = itertools.imap(lambda val: ("attr-name", val[0]), name_value_tuples)
                    values = itertools.imap(lambda val: ("attr-value", val[1]), name_value_tuples)

                    # Something ridiculous happens here.
                    # I take [0, 2, 4] and [1, 3, 5], turn it into
                    # [(0, 1), (2, 3), (4, 5)], and then that into
                    # [0, 1, 2, 3, 4, 5]. Only the numbers are tuples. Magic.
                    # What we go through for 100% lazy iteration.
                    return itertools.chain.from_iterable(itertools.izip(names, values))
                except RuntimeError as e:
                    return ( ( "", "" ) ).__iter__()

            def display_hint(self):
                return 'map'

class PMCIterator(object):
    def __init__(self, attrs):
        self.attrs = attrs
        self.iterobj = attrs.type.fields().__iter__()

    def __iter__(self):
        return self

    def next(self):
        nextattr = self.iterobj.next()
        #print "[[[%s]]]" % nextattr.name
        return (nextattr.name, self.attrs[nextattr.name])

def _parrot_str_to_str(val):
    encoding = val['encoding'].dereference()
    encoding_name = encoding['name'].string()
    length = val['strlen']

    return val['strstart'].string(encoding=encoding_name,length=length)
