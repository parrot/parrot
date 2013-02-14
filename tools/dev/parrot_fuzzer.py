#!/usr/bin/env python

# Copyright (C) 2009-2011, Parrot Foundation.

from fusil.application    import Application
from fusil.process.watch  import WatchProcess
from fusil.process.create import CreateProcess
from fusil.process.stdout import WatchStdout
from fusil.project_agent  import ProjectAgent
from fusil.process.tools  import locateProgram
from fusil.write_code     import WriteCode
from optparse             import OptionGroup
import re
import string
import random

'''

=head1 NAME

parrot_fuzzer.py - opcode fuzzer

=head1 DESCRIPTION

This is a fuzzer for Parrot, written in Python using the Fusil library. It
attempts to break Parrot by generating calls to random PIR opcodes.

=head1 DEPENDENCIES

This script requires Python 2.5+ to run. The Fusil
L<http://fusil.hachoir.org/trac> and python-ptrace
L<http://python-ptrace.hachoir.org/trac> libraries are also required.

=head1 USAGE

Short version: C<sudo python tools/dev/parrot_fuzzer.py>

C<parrot_fuzzer.py> is run like any other Fusil-based fuzzer. Fusil likes to be
run as the root user so that the child process in which Parrot runs can be put
in a more restricted environment, limiting potential damage.

Fusil assumes the existence of a C<fusil> user and group. Parrot runs as this
user/group as part of its restricted environment. Passing C<--unsafe> allows
it to run as the current user. Although it is not likely that this will cause
any damage to your system, it is possible.

C<parrot_fuzzer.py> needs access to Parrot's source code in order to figure out
which PMCs and ops are available. It assumes that it's running in the root
directory of Parrot's source code. You can specify a different directory using
the C<--parrot-root> switch.

=head1 OPTIONS

=over 4

=item C<--parrot-root=/path/to/parrot>

Represents the path to the Parrot root directory. By default, this is the
current directory.

=item C<--runcore=--some-runcore>

Specifies which runcore to use when running Parrot. The default is the I<slow>
core. This option corresponds directly to Parrot's C<--runcore> option. Other
runcores include I<fast>.

Run C<parrot --help> for more details.

=item C<--ignore-blacklist>

Some PMC's and opcodes are known to cause false positives or results of limited
value. These are blacklisted by default. Using C<--ignore-blacklist> causes
the fuzzer to use all available PMC's and opcodes, even those known to behave
badly during testing.

=item C<--instructions=10>

Represents the number of instructions during the test run. Note that a larger
number such as 20 does not necessarily result in more failures. Defaults to 3.

=back

=head1 LICENSE

This program is distributed under the same license as Parrot itself.

=cut

'''

class ParrotFuzzer(Application):

    # Base name of the dir where temp files and successful results will be stored
    NAME="parrot_fuzz"

    def createFuzzerOptions(self, parser):
        options = OptionGroup(parser, "Parrot fuzzer")
        options.add_option("--parrot-root",
                help="Parrot program path (default: .)",
                type="str",
                default=".")
        options.add_option("--runcore",
                help="Run Parrot with the specified runcore (default: --slow-core)",
                type="str",
                default="--slow-core")
        options.add_option("--instructions",
                help="Generate this many instructions per test run (default: 3)",
                type="int",
                default="3")
        options.add_option("--ignore-blacklist",
                help="Use opcodes and PMCs known to cause bad or questionable results (default: use blacklists)",
                action="store_true",
                default=False)
        return options


    def setupProject(self):
        parrot_root  = self.options.parrot_root
        runcore      = self.options.runcore
        parrot       = locateProgram(parrot_root + "/parrot")
        process      = ParrotProcess(self.project, [parrot, runcore, "<fuzzy.pir>"])
        pirgen       = PirGenerator(self.project, self.options)
        WatchProcess(process)
        WatchStdout(process)

class PirGenerator(ProjectAgent, WriteCode):

    def __init__(self, project, options):
        self.parrot_root       = options.parrot_root
        self.instruction_count = options.instructions
        self.ignore_blacklist  = options.ignore_blacklist
        self.opfunc_gen        = OpfuncGenerator()
        self.arg_gen           = ArgGenerator(self.parrot_root, self.ignore_blacklist)

        self.opfunc_gen.populateOpfuncList(self.parrot_root, self.ignore_blacklist)

        ProjectAgent.__init__(self, project, "pir_source")
        WriteCode.__init__(self)

    def generatePir(self, filename):

        self.pir_body     = ''
        self.pir_preamble = """
.sub main
    $P0 = new ['ExceptionHandler']
    set_addr $P0, catchall
    push_eh $P0   #pokemon: gotta catch 'em all
"""
        self.pir_postamble = """
catchall:
    # Don't do anything with exceptions: we're hoping for a segfault or similar.
.end
"""
        # How many instructions to generate
        # Strangely, a low number like 3 seems to generate slightly more faults
        # than a high number like 20
        opfunc_count = self.instruction_count
        self.pir_body += "    # generating "+str(opfunc_count)+" instructions\n"

        arg_types = ['s', 'p', 'i', 'n', 'sc', 'ic', 'nc']
        opfuncs      = []
        arg_counts   = dict()
        self.createFile(filename)
        arg_gen = self.arg_gen

        # Pick some opfuncs
        for i in range(opfunc_count):
            opfuncs.append(OpfuncCall(*self.opfunc_gen.getOpfunc()))

        # Calculate how many of each type of arg will be needed
        for arg_type in arg_types:
            arg_counts[arg_type] = 0
            for opfunc in opfuncs:
                arg_counts[arg_type] += opfunc.getArgCount(arg_type)

        for arg_type in arg_types:
            arg_gen.setArgCount(arg_type, arg_counts[arg_type])

        # Generate the args, adding any supporting code to the preamble
        self.pir_preamble += arg_gen.generateStringArgs()
        self.pir_preamble += arg_gen.generatePMCArgs()
        self.pir_preamble += arg_gen.generateIntArgs()
        self.pir_preamble += arg_gen.generateNumArgs()
        self.pir_preamble += arg_gen.generateStringConstArgs()
        self.pir_preamble += arg_gen.generateIntConstArgs()
        self.pir_preamble += arg_gen.generateNumConstArgs()

        # Put the args into the opfunc calls
        for opfunc in opfuncs:
            for arg_num in range(opfunc.getTotalArgCount()):
                arg_type = opfunc.getArgType(arg_num)
                opfunc.setArgVal(arg_num, arg_gen.getArgVal(arg_type))
            self.pir_body += opfunc.getOpfuncCall()

        # Write the code
        self.write(0, self.pir_preamble)
        self.write(0, self.pir_body)
        self.write(0, self.pir_postamble)
        self.close()

    def on_session_start(self):
        filename = self.session().createFilename('fuzzy.pir')
        self.generatePir(filename)
        self.send('pir_source', filename)

# Representation of a call to an opfunc, including values of arguments
# Note that argumens are literal, e.g. '$P0', '"foo"', etc
class OpfuncCall:
    def __init__(self, name, sig):
        self.arg_types = []
        self.arg_vals = []
        self.name = name
        if sig == '':
            self.long_name = name
        else:
            self.long_name = name + '_' + sig
        self.total_arg_count = 0
        if sig != '':
            for arg in string.split(sig, "_"):
                self.arg_types.append(arg)
                self.arg_vals.append('')
                self.total_arg_count += 1

    def getLongName(self):
        return self.long_name

    def getArgCount(self, arg):
        return self.arg_types.count(arg)

    def getTotalArgCount(self):
        return self.total_arg_count

    def getArgType(self, n):
        return self.arg_types[n]

    def getArgType(self, n):
        return self.arg_types[n]

    def setArgVal(self, n, arg_val):
        self.arg_vals[n] = arg_val

    def getOpfuncCall(self):
        opfunc_call = '\n    # '+self.long_name+'\n    ' + self.name
        for arg_val in self.arg_vals:
            opfunc_call += ' ' + arg_val + ','
        opfunc_call = string.rstrip(opfunc_call, ",")
        opfunc_call += "\n"
        return opfunc_call

class ArgGenerator:
    arg_counts = {}
    args       = {}

    def __init__(self, parrot_root, ignore_blacklist):
        self.pmc_gen = PMCTypeGenerator()
        self.pmc_gen.populatePMCList(parrot_root, ignore_blacklist)

    def setArgCount(self, arg_type, count):
        self.arg_counts[arg_type] = count

    def getArgVal(self, arg_type):
        return random.choice(self.args[arg_type])

    def generateStringArgs(self):
        pir_preamble = ""
        self.args['s'] = []
        for n in range(self.arg_counts['s']):
            str_val = self.getString()
            pir_preamble += "    $S" + str(n) + " = \"" + str_val + "\"\n"
            self.args['s'].append('$S' + str(n))
        return pir_preamble

    def generatePMCArgs(self):
        pir_preamble = ""
        self.args['p'] = []
        for n in range(self.arg_counts['p']):
            pir_preamble += "    $P" + str(n) + " = new ['" + self.pmc_gen.getPMCType() + "']\n"
            self.args['p'].append('$P' + str(n))
        return pir_preamble

    def generateIntArgs(self):
        pir_preamble = ""
        self.args['i'] = []
        for n in range(self.arg_counts['i']):
            num = random.choice(['neg_many','neg_one','zero','pos_one','pos_many'])

            if num == 'neg_many':
                num_val = random.randint(-999999,-2)
            if num == 'neg_one':
                num_val = -1
            if num == 'zero':
                num_val = 0
            if num == 'pos_one':
                num_val = 1
            if num == 'pos_many':
                num_val = random.randint(2, 999999)

            pir_preamble += "    $I" + str(n) + " = "+str(num_val)+"\n"
            self.args['i'].append('$I' + str(n))
        return pir_preamble

    def generateNumArgs(self):
        pir_preamble = ""
        self.args['n'] = []
        for n in range(self.arg_counts['n']):
            num = random.choice(['neg_many','neg_one','zero','pos_one','pos_many'])

            if num == 'neg_many':
                num_val = (random.random() * -999999) - 1
            if num == 'neg_one':
                num_val = -1.0
            if num == 'zero':
                num_val = 0.0
            if num == 'pos_one':
                num_val = 1.0
            if num == 'pos_many':
                num_val = (random.random() * 999999) + 1
            pir_preamble += "    $N" + str(n) + " = "+str(num_val)+"\n"
            self.args['n'].append('$N' + str(n))
        return pir_preamble

    def generateStringConstArgs(self):
        pir_preamble = ""
        self.args['sc'] = []
        for n in range(self.arg_counts['sc']):
            self.args['sc'].append('"'+self.getString()+'"')
        return pir_preamble

    def generateIntConstArgs(self):
        pir_preamble = ""
        self.args['ic'] = []
        for n in range(self.arg_counts['ic']):
            # Negative numbers and zero mess up control flow-related ops
            #num = random.choice(['neg_many','neg_one','zero','pos_one','pos_many'])
            num = random.choice(['pos_one','pos_many'])

            if num == 'neg_many':
                num_val = random.randint(-999999,-2)
            if num == 'neg_one':
                num_val = -1
            if num == 'zero':
                num_val = 0
            if num == 'pos_one':
                num_val = 1
            if num == 'pos_many':
                num_val = random.randint(2, 999999)

            self.args['ic'].append(str(num_val))
        return pir_preamble

    def generateNumConstArgs(self):
        pir_preamble = ""
        self.args['nc'] = []
        for n in range(self.arg_counts['nc']):
            num = random.choice(['neg_many','neg_one','zero','pos_one','pos_many'])

            if num == 'neg_many':
                num_val = (random.random() * -999999) - 1
            if num == 'neg_one':
                num_val = -1.0
            if num == 'zero':
                num_val = 0.0
            if num == 'pos_one':
                num_val = 1.0
            if num == 'pos_many':
                num_val = (random.random() * 999999) + 1
            self.args['nc'].append(str(num_val))
        return pir_preamble

    def getString(self):
        str_val = ''
        chars = string.printable + string.punctuation + string.whitespace
        str_len = random.randint(0,10)
        for m in range(str_len):
            char = chars[random.randint(0, len(chars)-1)]
            if char == '"':
                char = '\\"'
            if char == '\\':
                char = '\\\\'
            if char == '\n' or char == '\r':
                char = ''
            str_val += char
        return str_val

class PMCTypeGenerator:
    pmc_list = []
    pmc_blacklist = [
            'Packfile',
            'PackfileAnnotation',
            'PackfileAnnotationKeys',
            'PackfileAnnotations',
            'PackfileConstantTable',
            'PackfileDirectory',
            'PackfileFixupEntry',
            'PackfileFixupTable',
            'PackfileRawSegment',
            'PackfileSegment',
            ]

    def populatePMCList(self, parrot_root, ignore_blacklist):
        pmc_pm = parrot_root + "/lib/Parrot/PMC.pm"
        pmc_f  = open(pmc_pm, 'r')
        for line in pmc_f:
            if re.search('\t[a-zA-Z]+ => [0-9]+,', line):
                line = re.sub('\t',      '', line)
                line = re.sub(' =>.*\n', '', line)
                if ignore_blacklist or line not in self.pmc_blacklist:
                    self.pmc_list.append(line)

    def getPMCType(self):
        return random.choice(self.pmc_list)


class OpfuncGenerator:
    opfunc_list = []
    opfunc_blacklist = [
            'check_events', # Only for testing
            'check_events__', # Not for direct use
            'clears', # Clearing all [SPIN] registers isn't useful
            'clearp',
            'cleari',
            'clearn',
            'cpu_ret',
            'debug',
            'debug_break',
            'debug_init',
            'debug_load',
            'debug_print',
            'die',
            'exit',
            'gc_debug',
            'if',
            'pic_callr__',
            'pic_get_params__',
            'pic_infix__',
            'pic_inline_sub__',
            'pic_set_returns__',
            'pop_eh',
            'prederef__',
            'profile',
            'push_eh',
            'returncc',
            'rethrow',
            'runinterp',
            'setn_ind',
            'sets_ind',
            'seti_ind',
            'setp_ind',
            'sleep',
            'tailcall',
            'trace',
            'trap',
            'unless',
            'yield',
            ]

    def populateOpfuncList(self, parrot_root, ignore_blacklist):
        ops_h = parrot_root + "/src/ops/core_ops.c"
        ops_f = open(ops_h, 'r')
        # This is a moderately fragile hack that relies on the specific
        # format of some generated code, expect breakage
        for line in ops_f:
            if line.find('PARROT_INLINE_OP') > -1 or line.find('PARROT_FUNCTION_OP') > -1:
                line = ops_f.next()
                short_name = line
                line = ops_f.next()
                long_name = line
                # Strip leading space and opening double-quote
                short_name = re.sub('[ ]+"', '', short_name)
                long_name  = re.sub('[ ]+"', '', long_name)
                # Strip everything after closing double-quote
                short_name = re.sub('".*\n', '', short_name)
                long_name  = re.sub('".*\n', '', long_name)

                if long_name == short_name:
                    sig = ''
                else:
                    sig = string.replace(long_name, short_name + '_', '')

                #XXX: Don't know how to handle these args
                if (not re.search('(pc|k|ki|kc|kic)', sig)):
                    if ignore_blacklist or short_name not in self.opfunc_blacklist:
                        self.opfunc_list.append([short_name, sig])
                #        print "accepted "+long_name+"("+sig+")"
                #else:
                #    print "REJECTED "+long_name+"("+sig+")"

    def getOpfunc(self):
        return random.choice(self.opfunc_list)

class ParrotProcess(CreateProcess):
    def on_pir_source(self, filename):
        self.cmdline.arguments[1] = filename
        self.createProcess()

if __name__ == "__main__":
    ParrotFuzzer().main()
