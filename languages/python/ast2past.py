#!/usr/bin/env python
"""
Convert Python AST to a textual representation called PAST, which is
Parrot AST as Simple Text.

usage: ast2past [-d] [-D] [-o] [-l] [-p "..."] file.py
       -d debug
       -D dump Python AST
       -o output to stdout, don't run parrot (default currently)
       -l add line info
       -p parrot options
       -r run parrot (default, except for -o)  N/Y
       -s add source comments"""


# parts of this program are stolen from Michal Wallace's pirate.py
# LocalNameFinder is copied from Lib/compiler/pycodegen.py and
# modified a bit

# the rest is hacked together by leo

import os
import compiler
import traceback
from compiler import ast

VERSION = '0.1'

class imclist(list):
    def __init__(self):
	self._verbose = False
	self._indent = 1

    def append(self, line):
	line = " " * self._indent + line
        super(imclist, self).append(line)

    def begin(self, line):
	self.append(line)
	self._indent += 1

    def end(self, line):
	self._indent -= 1
	self.append(line)


class LocalNameFinder:
    """Find local names in scope"""
    def __init__(self, names=()):
        self.names = {}
        self.globals = {}
	self.calls = 0
        for name in names:
            self.names[name] = name

    # XXX list comprehensions and for loops

    def getLocals(self):
        for elt in self.globals.keys():
            if elt in self.names:
                del self.names[elt]
        return self.names

    def visitDict(self, node):
        pass

    def visitGlobal(self, node):
        for name in node.names:
            self.globals[name] = name

    def visitFunction(self, node):
	self.calls += 1
        self.names[node.name] = node.name

    def visitLambda(self, node):
	self.calls += 1

    def visitImport(self, node):
        for name, alias in node.names:
	    n = alias or name
            self.names[n] = n

    def visitFrom(self, node):
        for name, alias in node.names:
	    n = alias or name
            self.names[n] = n

    def visitClass(self, node):
        self.names[node.name] = node.name

    def visitAssName(self, node):
        self.names[node.name] = node.name

    def visitAssign(self, node):
	# .nodes .expr
	# mark the expressions so that it assigns to
	# nodes[-1] directly if possible
	node.expr._assign_to = node.nodes[-1]
	self.visit(node.expr)
	for n in node.nodes:
	    self.visit(n)

class PirateVisitor(object):
    def __init__(self, name, counter=None, depth=None):
        self.name = name
        self._last_lineno = None
        self.lines = imclist()
        self.loops = []
        self.counter = counter or {}
        self.subs = []
        self.vars = {}	# parrot known vars
        self.depth = depth or 0 # lexical scope depth
        self.globals = {}
        self.locals = {}
        self.classKnown = [] # only make one constructor per class
        self.classStack = [] # the class we're looking at right now


    def getCode(self):
	res = "\n".join(self.lines)
        res += "\n".join([s.getCode() for s in self.subs])
        return res

    def set_lineno (self, node):
        if (node.lineno is not None and
            node.lineno != self._last_lineno):
            self._last_lineno = node.lineno
	    self.lines._verbose = self._verbose
	    if self._print_source:
		if not hasattr(self, "_src_list"):
		    self._src_list = src.split("\n")
		self.append("Src_Line(" +
		    `self._src_list[node.lineno - 1]` + ")")
	    if self._lines:
		self.append('Line_no(%i)' % node.lineno)

    def append(self, line):
        self.lines.append(line)

    def begin(self, line):
        self.lines.begin(line)

    def end(self, line):
        self.lines.end(line)

    # visitor methods in alphabetical order

    # Python Library Reference
    # 19.3.1 AST nodes

    def find_locals(self, node):
        lnf = compiler.visitor.walk(node, LocalNameFinder())
	for n in lnf.getLocals():
	    self.locals[n] = n
	    self.append("Py_Local(:%s)" % n)

    def binary(self, node, op):
	# .left .right
	self.set_lineno(node)
	self.begin("Binary(")
	self.append("Op(%s)" % op)
	self.visit(node.left)
	self.visit(node.right)
	self.end(") # Binary")

    def visitAdd(self, node):
	self.binary(node, 'add')

    def expr_helper(self, nodes, txt, op=None):
	"""Convert the lhs tuple to a series of expressions"""
	self.begin("%s(" % txt)
	l = nodes[0]
	r = nodes[1]
	if op:
	    self.append("Op(%s)" % op)
	self.visit(l)
	n = nodes[1:]
	if len(n) >= 2:
	    self.expr_helper(n, txt, op)
	else:
	    self.visit(r)
	self.end(") # %s" % txt)

    def visitAnd(self, node):
	# .nodes
	self.set_lineno(node)
	self.expr_helper(node.nodes, "And")

    def visitAssAttr(self, node):
	# .expr
	# .attrname
	# .flags TODO
	self.set_lineno(node)
	self.begin("AssAttr(")
	self.visit(node.expr)
	self.append("Attr(%s)" % node.attrname)
	self.end(") # AssAttr")

    def visitAssName(self, node):
	# .name .flags TODO
	self.set_lineno(node)
	self.append("AssName(:" + node.name + ")")

    def visitAssList(self, node):
	# .nodes
	self.set_lineno(node)
	self.begin("AssList(")
	for n in node.nodes:
	    self.visit(n)
	self.end(") # AssList")

    def visitAssTuple(self, node):
	# .nodes
	self.set_lineno(node)
	self.begin("AssTuple(")
	for n in node.nodes:
	    self.visit(n)
	self.end(") # AssTuple")

    def visitAssert(self, node):
	# .test .fail
	self.set_lineno(node)
	self.begin("Assert(")
	self.visit(node.test)
	if node.fail:
	    self.visit(node.fail)
	self.end(") # Assert")

    def visitAssign(self, node):
	# .nodes, .expr
	self.set_lineno(node)
	nodes = node.nodes
	nodes.append(node.expr)
	self.expr_helper(nodes, "Assign")

    def visitAugAssign(self, node):
	# .node, .op .expr
	self.set_lineno(node)
	self.begin("AugAssign(")
	self.visit(node.node)
	self.append("Op(%s)" % node.op)
	self.visit(node.expr)
	self.end(") # AugAssign")

    def visitBackquote(self, node):
	self.begin("Backquote(")
	self.visit(node.expr)
	self.end(") # Backquote")

    def visitBitand(self, node):
	# .nodes
	self.set_lineno(node)
	self.expr_helper(node.nodes, "Binary", 'band')

    def visitBitor(self, node):
	# .nodes
	self.set_lineno(node)
	self.expr_helper(node.nodes, "Binary", 'bor')

    def visitBitxor(self, node):
	# .nodes
	self.set_lineno(node)
	self.expr_helper(node.nodes, "Binary", 'bxor')

    def visitBreak(self, node):
	self.set_lineno(node)
	self.append("Break()")

    def visitCallFunc(self, node):
	# .node (callee)
	# .args
	# .star_args
	# .dstar_args
	self.set_lineno(node)
	self.begin("Py_Call(")
	self.visit(node.node)
	self.begin("Args(")
	for n in node.args:
	    self.visit(n)
	self.end(") # Args")
	if node.star_args:
	    self.begin("Star_Args(")
	    self.visit(node.star_args)
	    self.end(") # StarArgs")
	else:
	    self.append("_()")
	if node.dstar_args:
	    self.begin("DStar_Args(")
	    self.visit(node.dstar_args)
	    self.end(") # DStarArgs")
	else:
	    self.append("_()")
	self.end(") # Py_Call")

    def visitClass(self, node):
	# .name .bases .doc .code
	self.set_lineno(node)
	self.append("")
	self.begin("Py_Class(")
	self.append("Name(%s)" % `node.name`)
	if node.doc:
	    self.append("Py_doc(" + `node.doc` + ")")
	self.begin("BaseClasses(")
	for n in node.bases:
	    self.visit(n)
	self.end(") # BaseClasses")
	self.find_locals(node.code)
	self.visit(node.code)
	self.end(") # Py_class")
	self.append("")

    def visitCompare(self, node):
	# .expr .ops
	# x < y <= z   :=   x < y and y <= z
	# but evaluate y only once, so we can't create
	# a more regular node
	self.set_lineno(node)
	self.begin("Compare(")
	self.visit(node.expr)	# lhs
	op_map = {
	    '>'  : 'isgt',
	    '>=' : 'isge',
	    '==' : 'iseq',
	    '!=' : 'isne',
	    '<=' : 'isle',
	    '<'  : 'islt',
	    'is' : 'issame',
	    'is not' : 'isntsame',
	    'in' : '_in',
	    'not in' : '_not in'
        }

	for op, n in node.ops:
	    self.append("Op(%s)" % op_map[op])
	    self.visit(n)
	self.end(") # Compare")

    def visitConst(self, node):
	# .value
	self.set_lineno(node)
	self.append("Const(" + `node.value` + ")")

    def visitContinue(self, node):
	self.set_lineno(node)
	self.append("Continue()")

    def visitDict(self, node):
	# .items
	self.set_lineno(node)
	self.begin("Dict(")
	for k, v in node.items:
	    self.visit(k)
	    self.visit(v)
	self.end(") # Dict")

    def visitDiscard(self, node):
	# .expr
	self.set_lineno(node)
	self.begin("Void(")
	self.visit(node.expr)
	self.end(") # Void")

    def visitDiv(self, node):
	# .left .right
	self.binary(node, 'div')

    def visitEllipsis(self, node):
	self.set_lineno(node)
	self.append("Ellipsis()")

    def visitExec(self, node):
	# .expr .locals .globals TODO
	self.set_lineno(node)
	self.begin("Exec(")
	self.visit(node.expr)
	self.end(") # Exec")

    def visitFloorDiv(self, node):
	# .left .right
	self.binary(node, 'fdiv')

    def visitFor(self, node):
	# .assign .list .body .else_
	self.set_lineno(node)
	self.begin("Py_For(")
	self.visit(node.assign)
	self.visit(node.list)
	self.visit(node.body)
	if node.else_:
	    self.visit(node.else_)
	else:
	    self.append("_()")
	self.end(") # Py_for")

    def visitFrom(self, node):
	# .modname .names
	self.set_lineno(node)
	self.begin("Py_Import(")
	self.append("py_module(%s)" % node.modname)
        for name, alias in node.names:
	    self.append("py_import(%s, %s)" % (name, alias))
	self.end(") # Py_Import")

    def function(self, node, is_lambda):
	self.append("")
	self.set_lineno(node)
	self.begin("Function(")
	if not is_lambda:
	    self.append("Name(:%s)" % node.name)
	    if node.doc:
		self.append("Py_doc(" + `node.doc` + ")")
	self.begin("Params(")
	for n in node.argnames:
	    self.append("Name(:%s)" % n)
	self.begin("Defaults(")
	for n in node.defaults:
	    self.visit(n)
	self.end(") # Defaults")
	if node.varargs:
	    self.append("py_var_args(1)")
	else:
	    self.append("_()")
	if node.kwargs:
	    self.append("py_kw_args(1)")
	else:
	    self.append("_()")
	self.end(") # Params")
	self.find_locals(node.code)
	self.visit(node.code)
	self.end(") # Function")
	self.append("")

    def visitFunction(self, node):
	# .name .argnames .defaults .flags .doc .code
	self.function(node, 0)

    def visitGetattr(self, node):
	# .expr
	# .attrname
	self.set_lineno(node)
	self.begin("GetAttr(")
	self.visit(node.expr)
	self.append("Attr(%s)" % node.attrname)
	self.end(") # GetAttr")

    def visitGlobal(self, node):
	# .names
	self.set_lineno(node)
	self.begin("Global(")
        for n in node.names:
	    self.append("Name(:%s)" % n)
	self.end(") # Global")

    def visitIf(self, node):
	# .tests .else_
	self.set_lineno(node)
	self.begin("If(")
	self.begin("Tests(")
        for test, suite in node.tests:
	    self.visit(test)
	    self.visit(suite)
	self.end(") # Tests")
	if node.else_:
	    self.visit(node.else_)
	else:
	    self.append("_()")
	self.end(") # If")

    def visitImport(self, node):
	# .names
	self.set_lineno(node)
	self.begin("Py_Import(")
        for name, alias in node.names:
	    self.append("py_import(%s, %s)" % (name, alias))
	self.end(") # Py_Import")

    def visitInvert(self, node):
	# .expr
	self.set_lineno(node)
	self.begin("Unary(")
	self.append("Op(bnot)")
	self.visit(node.expr)
	self.end(") # Unary")

    def visitKeyword(self, node):
	# .name .expr
	# f(x=y)
	self.set_lineno(node)
	self.begin("Kw_arg(")
	self.append("Name(:%s)" % node.name)
	self.visit(node.expr)
	self.end(") # Kw_arg")

    def visitLamda(self, node):
	# .argnames .defaults .flags .code
	self.function(node, 1)

    def visitLeftShift(self, node):
	self.binary(node, 'shl')

    def visitList(self, node):
	# .nodes
	self.set_lineno(node)
	self.begin("List(")
	for n in node.nodes:
	    self.visit(n)
	self.end(") # List")

    def visitListComp(self, node):
	assert(0)	# TODO
    def visitListCompFor(self, node):
	assert(0)	# TODO
    def visitListCompIf(self, node):
	assert(0)	# TODO

    def visitMod(self, node):
	self.binary(node, 'mod')

    def visitModule(self, node):
	self.set_lineno(node)
	# walk through and collect some information first
	self.begin("Py_Module(")
	if node.doc:
	    self.append("Py_doc(" + `node.doc` + ")")
	else:
	    self.append("_()")
	self.find_locals(node.node)
	self.visit(node.node)
	self.end(") # Py_Module")

    def visitMul(self, node):
	self.binary(node, 'mul')

    def visitName(self, node):
	# .name
	self.set_lineno(node)
	self.append("Name(:" + node.name + ")")

    def visitNot(self, node):
	# .expr
	self.set_lineno(node)
	self.begin("Unary(")
	self.append("Op(not)")
	self.visit(node.expr)
	self.end(") # Unary")

    def visitOr(self, node):
	self.set_lineno(node)
	self.expr_helper(node.nodes, "Or")

    def visitPass(self, node):
	pass

    def visitPow(self, node):
	self.binary(node, 'pow')

    def visitPrint(self, node):
	# .nodes .dest
	self.set_lineno(node)
	pio = ""
	self.set_lineno(node)
	self.begin("Py_Print(")
	if node.dest:
	    self.append("Handle(")
	    self.visit(node.dest)
	    self.append(") # Handle")
	for n in node.nodes:
	    self.visit(n)
	self.end(") # Py_Print")

    def visitPrintnl(self, node):
	self.set_lineno(node)
	self.visitPrint(node)
	self.append("Py_Print_nl()")

    def visitRaise(self, node):
	# .expr1 .expr2 .expr2
	self.set_lineno(node)
	self.begin("Raise(")
	self.visit(node.expr1)
	if node.expr2:
	    self.visit(node.expr2)
	    if node.expr3:
		self.visit(node.expr3)
	self.end(") # Raise")

    def visitReturn(self, node):
	# .value
	self.set_lineno(node)
	self.begin("Return(")
	self.visit(node.value)
	self.end(") # Return")

    def visitRightShift(self, node):
	self.binary(node, 'shr')

    def visitSlice(self, node):
	# .expr .flags .lower .upper
	self.set_lineno(node)
	self.begin("Slice(")
	self.visit(node.expr)
	if node.lower:
	    self.visit(node.lower)
	else:
	    self.append("_()")
	if node.upper:
	    self.visit(node.upper)
	else:
	    self.append("_()")
	self.end(") # Slice")

    def visitSliceobj(self, node):
	# .nodes
	assert(0)	# TODO

    def visitStmt(self, node):
	# .nodes
	self.set_lineno(node)
	self.begin("Stmts(")
	for n in node.nodes:
	    self.visit(n)
	self.end(") # Stmts")

    def visitSub(self, node):
	self.binary(node, 'sub')

    def visitSubscript(self, node):
	# .expr .flags .subs
	self.set_lineno(node)
	self.begin("Subscript(")	# TODO flags
	self.visit(node.expr)
	for n in node.subs:
	    self.visit(n)
	self.end(") # Subscript")

    def visitTryExcept(self, node):
	# .body .handlers .else_
	self.set_lineno(node)
	self.begin("TryExcept(")
	self.visit(node.body)
	self.begin("Handler(")
	for expr, target, body in node.handlers:
	    self.visit(expr)
	    if target:
		self.visit(target)
	    else:
		self.append("_()")
	    self.visit(body)
	self.end(") # Handler")
	if node.else_:
	    self.visit(node.else_)
	else:
	    self.append("_()")

	self.end(") # TryExcept")

    def visitTryFinally(self, node):
	# .body .final
	self.set_lineno(node)
	self.begin("TryFinally(")
	self.visit(node.body)
	self.visit(node.final)
	self.end(") # TryFinally")

    def visitTuple(self, node):
	# .nodes
	self.set_lineno(node)
	self.begin("Tuple(")
	for n in node.nodes:
	    self.visit(n)
	self.end(") # Tuple")

    def visitUnaryAdd(self, node):
	# .expr
	self.set_lineno(node)
	self.begin("Unary(")
	self.append("Op(add)")
	self.visit(node.expr)
	self.end(") # UnaryAdd")

    def visitUnarySub(self, node):
	# .expr
	self.set_lineno(node)
	self.begin("Unary(")
	self.append("Op(sub)")
	self.visit(node.expr)
	self.end(") # UnarySub")

    def visitWhile(self, node):
	# .test .body .else_
	self.set_lineno(node)
	self.begin("While(")
	self.visit(node.test)
	self.visit(node.body)
	if node.else_:
	    self.visit(node.else_)
	else:
	    self.append("_()")
	self.end(") # While")

    def visitYield(self, node):
	# .value
	self.set_lineno(node)
	self.begin("Yield(")
	self.visit(node.value)
	self.end(") # Yield")


#############################################

import time
HEAD=\
'''
# generated by ast2past.py on %s
''' % time.asctime()

def compile(src, fn, name="__main__", dump=False, debug=False,
    lines=False, source = False, verbose = False):
    ast = compiler.parse(src)
    if dump:
	print "# " + `ast`
    vis = compiler.visitor.ExampleASTVisitor()
    # vis.preorder(ast, pir)
    pir = PirateVisitor(name)
    pir._debug = debug
    pir._lines = lines
    pir._verbose = verbose
    pir._src = src
    pir._print_source = source
    compiler.visitor.walk(ast, pir, vis, 1)
    pir.append("# end")
    lines = [ "Parrot_AST(",
	      "  version(Const('%s'))" % VERSION,
              " _options(",
	      " ) # _options",
              " Src_File(\"%s\")" % fn
	    ]

    pir.lines = lines + pir.lines + [") # Parrot_AST"]
    code =  pir.getCode()
    return code

def invoke(code, options=""):
    i,o = os.popen4("parrot %s -" % options)
    print >> i, HEAD
    print >> i, code
    i.close()
    return o.read()

if __name__=="__main__":
    import sys
    import getopt

    if len(sys.argv) > 1:
	try:
	    opts, args = getopt.getopt(sys.argv[1:], 'dDlop:rsv')
	except getopt.GetoptError:
	    print __doc__
	    sys.exit()
        # file or stdin?
	if args[0] == '-':
	    src = sys.stdin.read()
	    fn = "<stdin>"
	else:
	    fn = args[0]
	    src = open(fn).read()
	lines = debug = dump = out = source = verbose = 0
	run = 0	# N/Y
	out = 1
	parrot_options = ""
	for o, a in opts:
	    if o == "-D":
		dump = 1
	    if o == "-d":
		debug = 1
	    if o == "-l":
		lines = 1
	    if o == "-o":
		out = 1
		run -= 1
	    if o == "-r":
		run += 1
	    if o == "-s":
		source = 1
	    if o == "-v":
		verbose = 1
	    if o == "-p":
		parrot_options = a
	code = compile(src, fn, dump=dump, debug=debug, lines=lines,
	    source=source, verbose=verbose)
        # dump or run?
	if out:
            print HEAD
            print code
        if run:
            sys.stdout.write(invoke(code, parrot_options))
    else:
        print __doc__
        sys.exit()

# vim: sw=4 tw=70:
