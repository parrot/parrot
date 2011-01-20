# Copyright (C) 2011, Parrot Foundation.
from gdb.printing import PrettyPrinter, SubPrettyPrinter
import gdb.types
import gdb
import re
import itertools
"""
Parrot Pretty Printing Support (P.P.P.S. E_NEEDSMOREMAGIC)
"""

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
                """
                Returns the plain string.
                """
                return _parrot_str_to_str(self.val)

            def display_hint(self):
                """
                GDB display hint.
                """
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
                """
                Returns a string representation of val.
                """
                return 'PMC<%s>' % self.pmc_name

            def children(self):
                """
                Pretty-print the attributes, resolved dynamically.
                """
                try:
                    attr_name = 'Parrot_%s_attributes' % self.pmc_name
                    attr_type = gdb.lookup_type(attr_name).pointer()

                    attrs = self.val['data'].cast(attr_type).dereference()

                    '''
                    Something ridiculous happens here. I take a list of tuples:
                            [ ("key1", "val1"), ("key2", "val2") ]

                    and turn it, in one iteration, into:
                            [
                                [("name", "key1"), ("value", "val1")],
                                [("name", "key2"), ("value", "val2")]
                            ]

                    That, in turn, is mutated into one list.
                            [
                                ("name", "key1"), ("value", "val1"),
                                ("name", "key2"), ("value", "val2")
                            ]

                    What we go through for 100% lazy iteration.
                    '''
                    name_value_tuples = PMCIterator(attrs)
                    nv_iter = itertools.imap(lambda val: [ ("name", val[0]), ("value", val[1]) ],
                        name_value_tuples)
                    nv_chain = itertools.chain.from_iterable(nv_iter)

                    return nv_chain
                except RuntimeError as e:
                    return [ ( "__ERROR__", "Unable to resolve attribute struct." ) ].__iter__()

            def display_hint(self):
                """
                GDB display hint.
                """
                return 'map'

class PMCIterator(object):
    def __init__(self, attrs):
        """
        Iterate over a PMC attrs field.
        """
        self.attrs = attrs
        self.iterobj = attrs.type.fields().__iter__()

    def __iter__(self):
        """
        Iterators should return themselves on __iter__()
        """
        return self

    def next(self):
        """
        Returns the next attribute.
        """
        nextattr = self.iterobj.next()
        return (nextattr.name, self.attrs[nextattr.name])

def _parrot_str_to_str(val):
    """
    Encoding-safe way of turning a Parrot string into a Python string.
    """
    encoding = val['encoding'].dereference()
    encoding_name = encoding['name'].string()
    length = val['strlen']

    return val['strstart'].string(encoding=encoding_name,length=length)
