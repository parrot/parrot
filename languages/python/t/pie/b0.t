# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 3;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'MetaToken');
def proto___new__(cls, name):
    if name in cls.name2num:
        return cls.name2num[name]
    cls.name2num[name] = obj = int.__new__(cls, cls.next)
    cls.num2name[obj] = name
    cls.next += 1
    return obj

def proto___repr__(self):
    return self.__class__.num2name[self]

class MetaToken(type):
    def __new__(metacls, name, bases, vars):
        cls = type.__new__(metacls, name, bases, vars)
        cls.__new__ = staticmethod(proto___new__)
        cls.__repr__ = cls.__str__ = proto___repr__
        cls.next = 0
        cls.name2num = {}
        cls.num2name = {}
        return cls

Token = MetaToken('Token', (int,), {})

EOF = Token('EOF')
INDENT = Token('INDENT')
DEDENT = Token('DEDENT')
NEWLINE = Token('NEWLINE')
NAME = Token('NAME')
NUMBER = Token('NUMBER')
STRING = Token('STRING')
OPERATOR = Token('OPERATOR')

for t in [EOF, INDENT, DEDENT, NEWLINE, NAME, NUMBER, STRING, OPERATOR]:
  print t, int(t)
CODE

test(<<'CODE', 'Clone iterator');
class Scanner(object):
    def tokenize(self):
        yield 5, '5'
        yield 0, ''

class Link(object):
    __slots__ = ['value', 'next']
    def __init__(self):
        self.value = None
        self.next = None

class Clone(object):
    __slots__ = ['link', 'itnext']
    def __init__(self, it, link=None):
        if isinstance(it, Clone):
            self.itnext = it.itnext
            self.link = it.link
        else:
            self.itnext = it.next
            self.link = Link()
    def __iter__(self):
        return self
    def next(self):
        next = self.link.next
        if next is None:
            self.link.value = value = self.itnext()
            self.link.next = next = Link()
        else:
            value = self.link.value
        self.link = next
        return value

def main():
    s = Scanner()
    it = Clone(s.tokenize())
    it2 = Clone(it)
    L = []
    for pair in it:
        L.append(pair)
    print L
    L2 = list(it2)
    print L2

if __name__ == '__main__':
    main()
CODE

SKIP: {
  skip("todo", 1);
test(<<'CODE', 'b0.py');
def check(a, b):
    if not a == b:
        raise AssertionError("%.30r != %.30r" % (a, b))

def proto___new__(cls, name):
    if name in cls.name2num:
        return cls.name2num[name]
    cls.name2num[name] = obj = int.__new__(cls, cls.next)
    cls.num2name[obj] = name
    cls.next += 1
    return obj

def proto___repr__(self):
    return self.__class__.num2name[self]

class MetaToken(type):
    def __new__(metacls, name, bases, vars):
        cls = type.__new__(metacls, name, bases, vars)
        cls.__new__ = staticmethod(proto___new__)
        cls.__repr__ = cls.__str__ = proto___repr__
        cls.next = 0
        cls.name2num = {}
        cls.num2name = {}
        return cls

Token = MetaToken('Token', (int,), {})

EOF = Token('EOF')
INDENT = Token('INDENT')
DEDENT = Token('DEDENT')
NEWLINE = Token('NEWLINE')
NAME = Token('NAME')
NUMBER = Token('NUMBER')
STRING = Token('STRING')
OPERATOR = Token('OPERATOR')

class Scanner(object):

    # A vaguely Pythonic tokenizer

    def __init__(self, getc):
        self.getc = getc
        self.indents = [0]

    def tokenize(self,
                 eolchars = ('', '\r', '\n'),
                 quotes = ('"', '\''),
                 hspaces = (' ', '\t'),
                 longops = dict.fromkeys(
                     ('<<', '>>', '<=', '>=', '==', '!=', '//', '**'))):
        # A generator yielding successive tokens to the parser
        # Each token is a (tokentype, value) pair
        getc = self.getc
        nextc = getc()
        while True:
            col = 0
            while nextc.isspace():
                if nextc == '\t':
                    col = ((col//8) + 1)*8
                elif nextc == ' ':
                    col += 1
                else:
                    col = 0 # \f, \v, \r, \n all reset the column
                nextc = getc()
            if nextc == '#':
                while nextc not in eolchars:
                    nextc = getc()
                continue
            if col != self.indents[-1]:
                while col < self.indents[-1]:
                    yield DEDENT, ''
                    del self.indents[-1]
                # This will yield DEDENT + INDENT for inconsistent dedent
                if col > self.indents[-1]:
                    yield INDENT, ''
                    self.indents.append(col)
            while nextc not in eolchars:
                if nextc.isalpha() or nextc == '_':
                    name = ''
                    while nextc.isalnum() or nextc == '_':
                        name += nextc
                        nextc = getc()
                    yield NAME, name
                elif nextc.isdigit():
                    number = ''
                    while nextc.isdigit():
                        number += nextc
                        nextc = getc()
                    yield NUMBER, number
                elif nextc in quotes:
                    quote = nextc
                    s = nextc
                    nextc = getc()
                    while nextc != quote:
                        if nextc in eolchars:
                            if not nextc:
                                raise SyntaxError("EOF in string")
                            raise SyntaxError("unescaped %r in string" % nextc)
                        s += nextc
                        if nextc == '\\':
                            nextc = getc()
                            s += nextc
                        nextc = getc()
                    s += nextc
                    nextc = getc()
                    yield STRING, s
                elif nextc == '#':
                    while nextc not in eolchars:
                        nextc = getc()
                elif nextc in hspaces:
                    nextc = getc()
                else:
                    c1 = nextc
                    nextc = getc()
                    if c1+nextc in longops:
                        c2 = nextc
                        nextc = getc()
                        yield OPERATOR, c1+c2
                    else:
                        yield OPERATOR, c1
            yield NEWLINE, ''
            nextc = getc()
            if not nextc:
                while self.indents[-1]:
                    yield DEDENT, ''
                    del self.indents[-1]
                break
        yield EOF, ''

class Link(object):
    __slots__ = ['value', 'next']
    def __init__(self):
        self.value = None
        self.next = None

class Clone(object):
    __slots__ = ['link', 'itnext']
    def __init__(self, it, link=None):
        if isinstance(it, Clone):
            self.itnext = it.itnext
            self.link = it.link
        else:
            self.itnext = it.next
            self.link = Link()
    def __iter__(self):
        return self
    def next(self):
        next = self.link.next
        if next is None:
            self.link.value = value = self.itnext()
            self.link.next = next = Link()
        else:
            value = self.link.value
        self.link = next
        return value

def getcFromString(s):
    for c in s:
        yield c
    while True:
        yield ''

sample = '''
def pi():
    # Compute digits of Pi.  Algorithm due to LGLT Meertens.
    k, a, b, a1, b1 = 2, 4, 1, 12, 4
    while 1:
        p, q, k = k*k, 2*k+1, k+1
        a, b, a1, b1 = a1, b1, p*a+q*a1, p*b+q*b1
        d, d1 = a//b, a1//b1
        while d == d1:
            yield d
            a, a1 = 10*(a%b), 10*(a1%b1)
            d, d1 = a//b, a1//b1
def strhash(s):
    # Python 2.x string hash algorithm
    if s == '':
        return 0
    x = ord(s[0])<<7
    for c in s:
        x = ((1000003*x) ^ ord(c)) & 4294967295 # 0xffffffff
    return x^len(s)
'''

operators = {
    '<': 1,
    '<=': 1,
    '==': 1,
    '!=': 1,
    '>': 1,
    '>=': 1,
    '|': 2,
    '^': 3,
    '&': 4,
    '<<': 5,
    '>>': 5,
    '+': 6,
    '-': 6,
    '*': 7,
    '/': 7,
    '//': 7,
    '%': 7,
    '**': 8,
}

dispatch = {
    '<': lambda x, y: x < y,
    '<=': lambda x, y: x <= y,
    '==': lambda x, y: x == y,
    '!=': lambda x, y: x != y,
    '>': lambda x, y: x > y,
    '>=': lambda x, y: x >= y,

    '|': lambda x, y: x | y,
    '^': lambda x, y: x ^ y,
    '&': lambda x, y: x & y,
    '<<': lambda x, y: x << y,
    '>>': lambda x, y: x >> y,

    '+': lambda x, y: x + y,
    '-': lambda x, y: x - y,

    '*': lambda x, y: x * y,
    '/': lambda x, y: x / y,
    '%': lambda x, y: x % y,
    '//': lambda x, y: x // y,

    '**': lambda x, y: x ** y,
    }

class DoReturn(Exception):
    def __init__(self, value=None):
        self.value = value

class DoBreak(Exception):
    pass

def eval(body, globals, locals):
    for stmt in body:
        stmt.eval(globals, locals)

def geneval(body, globals, locals):
    for stmt in body:
        for value in stmt.geneval(globals, locals):
            yield value

def isgenerator(body):
    for stmt in body:
        if stmt.isgenerator():
            return True
    return False

class Dict(dict):

    def __repr__(self):
        keys = self.keys()
        keys.sort()
        L = []
        for key in keys:
            L.append(repr(key) + ": " + repr(self[key]))
        return "{" + ", ".join(L) + "}"

class Function(object):
    makeLocals = Dict
    def __init__(self, name, args, body, globals):
        self.name = name
        self.args = args
        self.body = body
        self.globals = globals
    def __call__(self, *args):
        check(len(args), len(self.args))
        locals = self.makeLocals(zip(self.args, args))
        try:
            eval(self.body, self.globals, locals)
        except DoReturn, exc:
            return exc.value

class Generator(Function):
    def __call__(self, *args):
        check(len(args), len(self.args))
        locals = self.makeLocals(zip(self.args, args))
        try:
            for value in geneval(self.body, self.globals, locals):
                yield value
        except DoReturn, exc:
            if exc.value is not None:
                raise RuntimeError("'return' with argument in generator")
            return

class Node(object):
    def isgenerator(self):
        return False
    def geneval(self, globals, locals):
        self.eval(globals, locals)
        if False:
            yield None
class Define(Node):
    def __init__(self, name, args, body):
        self.name = name
        self.args = args
        self.body = body
    def __repr__(self):
        return "%s(%r, %r, ...)" % (self.__class__.__name__,
                                    self.name, self.args)
    def eval(self, globals, locals):
        if isgenerator(self.body):
            obj = Generator(self.name, self.args, self.body, globals)
        else:
            obj = Function(self.name, self.args, self.body, globals)
        globals[self.name] = obj
class For(Node):
    def __init__(self, var, seq, body):
        self.var = var
        self.seq = seq
        self.body = body
    def __repr__(self):
        return "%s(%r, %r, ...)" % (self.__class__.__name__,
                                    self.var, self.seq)
    def eval(self, globals, locals):
        for value in self.seq.eval(globals, locals):
            self.var.assign(value, globals, locals)
            try:
                eval(self.body, globals, locals)
            except DoBreak:
                break
    def geneval(self, globals, locals):
        for value in self.seq.eval(globals, locals):
            self.var.assign(value, globals, locals)
            try:
                for v in geneval(self.body, globals, locals):
                    yield v
            except DoBreak:
                break
class While(Node):
    def __init__(self, test, body):
        self.test = test
        self.body = body
    def __repr__(self):
        return "%s(%r, ...)" % (self.__class__.__name__, self.test)
    def isgenerator(self):
        return isgenerator(self.body)
    def eval(self, globals, locals):
        while self.test.eval(globals, locals):
            try:
                eval(self.body, globals, locals)
            except DoBreak:
                break
    def geneval(self, globals, locals):
        while self.test.eval(globals, locals):
            try:
                for value in geneval(self.body, globals, locals):
                    yield value
            except DoBreak:
                break
class If(Node):
    def __init__(self, test, body, elsebody=None):
        self.test = test
        self.body = body
        self.elsebody = elsebody
    def __repr__(self):
        return "%s(%r, ...)" % (self.__class__.__name__, self.test)
    def isgenerator(self):
        return isgenerator(self.body) or (self.elsebody is not None and
                                          isgenerator(self.elsebody))
    def eval(self, globals, locals):
        if self.test.eval(globals, locals):
            eval(self.body, globals, locals)
        elif self.elsebody is not None:
            eval(self.elsebody, globals, locals)
    def geneval(self, globals, locals):
        if self.test.eval(globals, locals):
            for value in geneval(self.body, globals, locals):
                yield value
        elif self.elsebody is not None:
            for value in geneval(self.elsebody, globals, locals):
                yield value
class Return(Node):
    def __init__(self, expr=None):
        self.expr = expr
    def __repr__(self):
        return "%s(%r)" % (self.__class__.__name__, self.expr)
    def eval(self, globals, locals):
        if self.expr is None:
            value = None
        else:
            value = self.expr.eval(globals, locals)
        raise DoReturn(value)
class Yield(Node):
    def __init__(self, expr):
        self.expr = expr
    def __repr__(self):
        return "%s(%r)" % (self.__class__.__name__, self.expr)
    def isgenerator(self):
        return True
    def geneval(self, globals, locals):
        if self.expr is None:
            value = None
        else:
            value = self.expr.eval(globals, locals)
        yield value
class Break(Node):
    def __repr__(self):
        return "%s()" % (self.__class__.__name__,)
    def eval(self, globals, locals):
        raise DoBreak()
class Print(Node):
    def __init__(self, exprs):
        if not isinstance(exprs, list):
            exprs = [exprs]
        self.exprs = exprs
    def eval(self, globals, locals):
        for e in self.exprs:
            print e.eval(globals, locals),
        print
class Assign(Node):
    def __init__(self, lhs, expr):
        self.lhs = lhs
        self.expr = expr
    def __repr__(self):
        return "%s(%r, %r)" % (self.__class__.__name__, self.lhs, self.expr)
    def eval(self, globals, locals):
        value = self.expr.eval(globals, locals)
        for v in self.lhs:
            v.assign(value, globals, locals)
class Exprs(Node):
    def __init__(self, exprs):
        self.exprs = exprs
    def __repr__(self):
        return "%s(%r)" % (self.__class__.__name__, self.exprs)
    def eval(self, globals, locals):
        return tuple([e.eval(globals, locals) for e in self.exprs])
    def assign(self, value, globals, locals):
        if len(self.exprs) != len(value):
            raise TypeError("multi-assign length mismatch")
        for e, v in zip(self.exprs, value):
            e.assign(v, globals, locals)
class Binop(Node):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right
        self.opeval = dispatch[self.op]
    def __repr__(self):
        return "%s(%r, %r, %r)" % (self.__class__.__name__,
                                   self.left, self.op, self.right)
    def eval(self, globals, locals):
        return self.opeval(self.left.eval(globals, locals),
                           self.right.eval(globals, locals))
class Attribute(Node):
    def __init__(self, expr, name):
        self.expr = expr
        self.name = name
    def __repr__(self):
        return "%s(%r, %r)" % (self.__class__.__name__, self.expr, self.name)
    def eval(self, globals, locals):
        v = self.expr.eval(globals, locals)
        return getattr(v, self.name)
class Index(Node):
    def __init__(self, expr, index):
        self.expr = expr
        self.index = index
    def __repr__(self):
        return "%s(%r, %r)" % (self.__class__.__name__, self.expr, self.index)
    def eval(self, globals, locals):
        v = self.expr.eval(globals, locals)
        return v[self.index.eval(globals, locals)]
    def assign(self, value, globals, locals):
        v = self.expr.eval(globals, locals)
        v[self.index.eval(globals, locals)] = value
class Call(Node):
    def __init__(self, expr, args):
        if not isinstance(args, list):
            args = [args]
        self.expr = expr
        self.args = args
    def __repr__(self):
        return "%s(%r, %r)" % (self.__class__.__name__, self.expr, self.args)
    def eval(self, globals, locals):
        f = self.expr.eval(globals, locals)
        args = [a.eval(globals, locals) for a in self.args]
        return f(*args)
class Literal(Node):
    def __init__(self, literal):
        self.literal = literal
        self.value = self.evalit()
    def eval(self, globals, locals):
        return self.value
    def __repr__(self):
        return "%s(%r)" % (self.__class__.__name__, self.literal)
simple_escapes = {"a": "\a",
                  "b": "\b",
                  "f": "\f",
                  "n": "\n",
                  "r": "\r",
                  "t": "\t",
                  "v": "\v",
                  "'": "'",
                  '"': '"',
                  "\\": "\\"}
class String(Literal):
    def evalit(self, octals='01234567'):
        s = self.literal[1:-1]
        if '\\' not in s:
            return s
        L = []
        it = iter(range(len(s)))
        for i in it:
            c = s[i]
            if c != '\\':
                L.append(c)
            else:
                i = it.next()
                c = s[i]
                if c == 'x':
                    if i+2 >= len(s):
                        raise ValueError("incomplete \\x escape in string")
                    d1 = s[it.next()]
                    d2 = s[it.next()]
                    L.append(chr(int(d1+d2, 16)))
                elif c in octals:
                    if i+1 < len(s) and s[i+1] in octals:
                        c += s[it.next()]
                        if i+2 < len(s) and s[i+2] in octals:
                            c += s[it.next()]
                    L.append(chr(int(c, 8)))
                else:
                    L.append(simple_escapes.get(c, '\\' + c))
        return "".join(L)
class Number(Literal):
    def evalit(self):
        return int(self.literal)
class Name(Node):
    def __init__(self, name):
        self.name = name
    def __repr__(self):
        return "Name(%r)" % self.name
    def eval(self, globals, locals):
        if self.name in locals:
            return locals[self.name]
        if self.name in globals:
            return globals[self.name]
        if self.name == 'ord':
            return ord
        if self.name == 'len':
            return len
        raise NameError(self.name)
    def assign(self, value, globals, locals):
        locals[self.name] = value

class Parser(object):
    def __init__(self, scanner):
        self.scanner = scanner
        self.nexttoken()
    def nexttoken(self):
        self.token, self.value = rv = self.scanner.next()
        ##print rv
        return rv
    def expect(self, token, value=None):
        if self.token != token:
            raise SyntaxError
        if value is not None and self.value != value:
            raise SyntaxError
        value = self.value
        self.nexttoken()
        return value
    def parse(self):
        stmts = []
        while self.token != EOF:
            stmts.append(self.parse_stmt())
        return stmts
    def parse_stmt(self,
                   keywords=('def', 'for', 'while', 'if',
                             'print', 'return', 'yield', 'break')):
        if self.value in keywords:
            return getattr(self, 'parse_' + self.value)()
        else:
            return self.parse_simple()
    def parse_def(self):
        self.expect(NAME, 'def')
        name = self.expect(NAME)
        self.expect(OPERATOR, '(')
        args = []
        if self.value != ')':
            args.append(self.expect(NAME))
            while self.value == ',':
                self.nexttoken()
                args.append(self.expect(NAME))
        self.expect(OPERATOR, ')')
        self.expect(OPERATOR, ':')
        self.expect(NEWLINE)
        body = self.parse_body()
        return Define(name, args, body)
    def parse_for(self):
        self.expect(NAME, 'for')
        var = self.parse_expr()
        self.expect(NAME, 'in')
        seq = self.parse_expr()
        self.expect(OPERATOR, ':')
        self.expect(NEWLINE)
        body = self.parse_body()
        return For(var, seq, body)
    def parse_while(self):
        self.expect(NAME, 'while')
        test = self.parse_expr()
        self.expect(OPERATOR, ':')
        self.expect(NEWLINE)
        body = self.parse_body()
        return While(test, body)
    def parse_if(self):
        self.expect(NAME, 'if')
        test = self.parse_expr()
        self.expect(OPERATOR, ':')
        self.expect(NEWLINE)
        body = self.parse_body()
        if self.value != 'else':
            elsebody = None
        else:
            self.expect(NAME, 'else')
            self.expect(OPERATOR, ':')
            self.expect(NEWLINE)
            elsebody = self.parse_body()
        return If(test, body, elsebody)
    def parse_body(self):
        self.expect(INDENT)
        body = [self.parse_stmt()]
        while self.token != DEDENT:
            body.append(self.parse_stmt())
        self.expect(DEDENT)
        return body
    def parse_print(self):
        self.expect(NAME, 'print')
        exprs = self.parse_exprs()
        self.expect(NEWLINE)
        return Print(exprs)
    def parse_return(self):
        self.expect(NAME, 'return')
        if self.token == NEWLINE:
            e = None
        else:
            e = self.parse_exprs()
        self.expect(NEWLINE)
        return Return(e)
    def parse_yield(self):
        self.expect(NAME, 'yield')
        e = self.parse_exprs()
        self.expect(NEWLINE)
        return Yield(e)
    def parse_break(self):
        self.expect(NAME, 'break')
        self.expect(NEWLINE)
        return Break()
    def parse_simple(self):
        e = self.parse_exprs()
        if self.value == '=':
            lhs = []
            while self.value == '=':
                self.nexttoken()
                lhs.append(e)
                e = self.parse_exprs()
            self.expect(NEWLINE)
            return Assign(lhs, e)
        else:
            self.expect(NEWLINE)
            return e
    def parse_exprs(self):
        e = self.parse_expr()
        if self.value != ',':
            return e
        exprs = [e]
        while self.value == ',':
            self.nexttoken()
            exprs.append(self.parse_expr())
        return Exprs(exprs)
    def parse_expr(self, prio=0):
        left = self.parse_term()
        while self.value in operators and operators[self.value] > prio:
            op = self.expect(OPERATOR)
            right = self.parse_expr(operators[op])
            left = Binop(left, op, right)
        return left
    def parse_term(self):
        t = self.parse_atom()
        while self.value in ('.', '[', '('):
            if self.value == '.':
                self.nexttoken()
                name = self.expect(NAME)
                t = Attribute(t, name)
            elif self.value == '[':
                self.nexttoken()
                index = self.parse_exprs()
                self.expect(OPERATOR, ']')
                t = Index(t, index)
            elif self.value == '(':
                self.nexttoken()
                if self.value == ')':
                    args = []
                else:
                    args = self.parse_exprs()
                    if isinstance(args, Exprs):
                        args = args.exprs
                self.expect(OPERATOR, ')')
                t = Call(t, args)
            else:
                raise AssertionError("shouldn't get here")
        return t
    def parse_atom(self):
        if self.value == '(':
            self.nexttoken()
            exprs = self.parse_exprs()
            self.expect(OPERATOR, ')')
            return exprs
        if self.token is STRING:
            return String(self.expect(STRING))
        if self.token is NAME:
            return Name(self.expect(NAME))
        if self.token is NUMBER:
            return Number(self.expect(NUMBER))
        raise SyntaxError

class List(list):
    __setitem__ = list.__setitem__
    __getitem__ = list.__getitem__

class Str(str):
    __getitem__ = str.__getitem__

class OutputFile(object):
    def __init__(self):
        self.data = []
        self.softspace = True
    reset = __init__
    def write(self, s):
        self.data.append(s)
    def getvalue(self):
        r = "".join(self.data)
        self.data = List()
        return r

output = OutputFile()

def cleanup(s):
    s = str(s).replace('<__main__.', '<').replace('<b0.', '<')
    i = s.find(' at 0x')
    while i > 0:
        j = s.find('>', i+6)
        if j < 0:
            break
        digits = s[i+4:j]
        try:
            number = int(digits, 0)
        except ValueError:
            break
        else:
            s = s[:i+5] + s[j:]
            i = s.find(' at 0x')
    return s

def write(s):
    s = cleanup(s)
    if __debug__:
        print s,
    print >>output, s,

def writeln(s=''):
    write(str(s) + '\n')

def myhash(s, ord=ord):
    if not s:
        return 0
    x = ord(s[0])<<7
    for c in s:
        x = ((1000003*x) ^ ord(c)) & 0xffffffffL
    return x^len(s)

def checkoutput(n=0):
    outputtext = output.getvalue()
    check(strhash(outputtext), n)

#!!! Added two helper functions
def check2(a, b1, b2):
    if not a == b1 and not a == b2:
        raise AssertionError("%.30r != %.30r or %.30r" % (a, b1, b2))
    
def checkoutput2(n=0, alt=0):
    outputtext = output.getvalue()
    check2(strhash(outputtext), n, alt)
    

strhash = myhash

indent = ""

def instrumentClass(cls):
    cname = cls.__name__ + '.'
    for name in cls.__dict__:
        if name == '__dict__':
            continue
        descr = cls.__dict__[name]
        if hasattr(descr, '__get__'):
            setattr(cls, name, instrumentDescriptor(cname+name, descr))

def unInstrumentClass(cls):
    for name in cls.__dict__:
        descr = cls.__dict__[name]
        if isinstance(descr, instrumentDescriptor):
            setattr(cls, name, descr.obj)

class instrumentDescriptor(object):
    def __init__(self, name, obj):
        self.name = name
        self.obj = obj
    def __get__(self, *args):
        result = self.obj.__get__(*args)
        if not hasattr(result, '__call__'):
            return result
        return instrumentCall(self.name, result)

class instrumentCall(object):
    def __init__(self, name, obj):
        self.name = name
        self.obj = obj
    def __call__(self, *args):
        global indent
        oldindent = indent
        try:
            indent = indent + " "
            argreprs = map(repr, args)
            for i, s in enumerate(argreprs):
                s = cleanup(s)
                if len(s) >= 45:
                    s = s[:20] + "..." + s[-20:]
                argreprs[i] = s
            writeln(indent + "%s(%r)" % (self.name, ", ".join(argreprs)))
            try:
                result = self.obj(*args)
            except Exception, exc:
                writeln(indent + "raise %r" % (exc,))
                raise
            else:
                if result is None:
                    writeln(indent + "return")
                else:
                    writeln(indent + "return %r" % (result,))
                return result
        finally:
            indent = oldindent

def instrumentTree(base):
    instrumentClass(base)
    for cls in base.__subclasses__():
        instrumentTree(cls)

def unInstrumentTree(base):
    unInstrumentClass(base)
    for cls in base.__subclasses__():
        unInstrumentTree(cls)

def main():
    output.reset()

    s = Scanner(getcFromString(sample).next)
    it = Clone(s.tokenize())
    it2 = Clone(it)
    L = []
    for pair in it:
        L.append(pair)
    L2 = list(it2)
    check(L, L2)

    scanner = Scanner(getcFromString(sample).next).tokenize()
    parser = Parser(scanner)
    instrumentClass(Parser)
    root = parser.parse()

    checkoutput(1413352820)

    env = Dict()
    eval(root, env, env)
    g = env['pi']()
    for i in range(1000):
        write(g.next())
    writeln('')
    strhash = env['strhash']

    for x in '', 'x', 'abc', 'abc'*100:
        check(strhash(x), myhash(x))

    strhash = myhash
    checkoutput(3960406533)

    it = Clone(getcFromString(unicode(sample, "utf8")))
    it2 = Clone(it)
    scanner = Scanner(it.next).tokenize()
    parser = Parser(scanner)
    root = parser.parse()
    checkoutput2(1308798191, 2837404767) #!!! unicode repr
    env = Dict()
    eval(root, env, env)
    g = env['pi']()
    for i in range(1000):
        write(g.next())
    writeln()
    checkoutput(3960406533)

    instrumentTree(Node)
    scanner = Clone(Scanner(it2.next).tokenize())
    scanner2 = Clone(scanner)
    parser = Parser(scanner)
    root = parser.parse()
    checkoutput2(3257889492, 1379369348) #!!! unicode repr
    env = Dict()
    eval(root, env, env)
    g = env['pi']()
    digits = []
    for i in range(10):
        digits.append(g.next())
    checkoutput2(3259608361, 1529706333)  #!!! unicode repr
    print "".join(map(str, digits))

    unInstrumentTree(Node)
    unInstrumentClass(Parser)
    parser = Parser(scanner2)
    root = parser.parse()
    checkoutput(0)
    env = Dict()
    eval(root, env, env)
    g = env['pi']()
    digits = []
    for i in range(10):
        digits.append(g.next())
    print "".join(map(str, digits))
    out2 = output.getvalue()
    checkoutput(0)

    class TrackingDict(Dict):
        def __setitem__(self, *args):
            writeln("%s = %.50r" % args)
            super(TrackingDict, self).__setitem__(*args)
    Function.makeLocals = TrackingDict
    g = env['pi']()
    digits = []
    for i in range(100):
        digits.append(g.next())
    checkoutput(902386495)
    Function.makeLocals = Dict

if __name__ == '__main__':
    main()
CODE
}
