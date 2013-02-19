# Copyright (C) 2005-2012, Parrot Foundation.

=pod

=head1 TITLE

Sudoku - A sudoku solver

=head1 OVERVIEW

This program implements scanning and blocked rows or columns invalidation.
It does not consider all effects of multiple number blocking, where a
combination of invalid numbers blocks a row or column. In such cases a
simple backtracking algorithm continues to solve the sudoku.

=head1 SYNOPSIS

  parrot sudoku.pir [--options] [file]

If no file is given a builtin game is run.

Valid options are:

=over 4

=item --version

Print version information and exit.

=item --help

Print help hint and exit.

=item --debug

Print debug output and game progress to stdout.

=item --inv=n..

Print additionally invalid state of given number(s).

=item --pairs

Print additionally fields with uniqe pairs of numbers.

=item --builtin=name

Run builtin game. If no name is given a list of builtins is printed.

=item --nc

Use ncurses for display and single step through progress. Press any key
for next display.

=back

=head1 DESCRIPTION

The game state is held in multiple views which share one Integer PMC
per common position. Thus updating a row sets also the column or square
information. These three views are list of lists.

=head1 GAME FILES

Game files may contain comments (hash sign in the first column)
digits, and dots for empty fields. E.g:

  # std020.sud
  # der standard 020 - leicht
  2.1..678.
  ...2...36
  8.9.3...5
  .7...4..2
  ..6.9.5..
  9..5...6.
  5...4.9.7
  71...3...
  .987..2.3

=head1 PARROT

=head2 Parrot features used

=over 4

=item Parrot OO

The solver is an object as well as the display.

=item Freeze/thaw

For deep copying the game state for backtracking.

=item Multi Method Dispatch

The display classes define multiple methods with the name I<print>,
which take different types and amounts of arguments.

=item Libraries

The program uses Getopt/Obj and the ncurses library.

=item Exception handling

To turn off ncurses just in case.

=back

=head2 Variable indices

Column, rows, and sqares have zero-based indices. Squares are
numbered from top left to bottom right.

=head2 Sudoku Class attributes

=over 4

=item I<rows, cols, sqrs>

LoL of 0 = free, 1..9 = number

=item I<i_rows, i_cols, i_sqrs>

LoL of a bitmask of invalid numbers per field. Bits are starting at bit
one not zero.

=item I<all>

Hash referencing these 6 items - used for backtracking.

=item I<opt>

The option hash.

=item I<disp>

Holds an instance of the display class (I<Dummy>, I<NCurses>) to use.

=back

=head1 AUTHOR

Leopold Toetsch

=head1 COPYRIGHT

Same as parrot.

=cut

.const string VERSION="0.2.3"

.loadlib 'bit_ops'
.loadlib 'io_ops'

.sub _main :main
    .param pmc argv
    .local int argc
    .local string raw_given
    .local pmc opt
    opt = parse_options(argv)
    argc = elements argv
    dec argc
    if argc < 0 goto get_default
    $I0 = defined opt["builtin"]
    if $I0 goto get_default
    $S0 = argv[argc]
    raw_given = read_given($S0)
    goto done_input
get_default:
    raw_given = builtin_game(opt)
done_input:
    run_game(raw_given, opt)
.end

# create game class, object, display, and run
.sub run_game
    .param string raw_given
    .param pmc opt

    .local pmc ar
    ar = verify_input(raw_given)
    .local pmc cl, self, disp
    cl = newclass "Sudoku"
    addattribute cl, "orig"
    addattribute cl, "all"
    addattribute cl, "cols"
    addattribute cl, "rows"
    addattribute cl, "sqrs"
    addattribute cl, "i_cols"
    addattribute cl, "i_rows"
    addattribute cl, "i_sqrs"
    addattribute cl, "opt"
    addattribute cl, "disp"
    self = new "Sudoku"
    setattribute self, "opt", opt
    disp = self."new_display"()
    ##push_eh nc_stop

    self."create"(ar)
    self."display"()
    $I0 = self."verify"()
    unless $I0 goto err
    if $I0 == 1 goto ok
    if $I0 == 2 goto fin
ok:
    disp."print"("init ok\n")
    $I0 = self."solve"()
    if $I0 == 1 goto nok
    if $I0 == 0 goto nc_stop
fin:
    self."display"()
    disp."print"("solved\n")
    disp."wait"()
nc_stop:
    self."end_display"()
    end
nok:
    # need backtracking
    .local pmc tries, all
    tries = new 'ResizablePMCArray'
    all = getattribute self, "all"
    push tries, all
    $I0 = self."back_track"(tries)
    if $I0 == 2 goto fin
    disp."print"("failed\n")
    goto nc_stop
err:
    printerr "inconsistent start\n"
    self."end_display"()
    die 3, 100
.end

# read game from file
#  - ignore comment lines w/ hash sign in first col
#  - valid chars are dots (empty) and digits 1..9
.sub read_given
    .param string file_name
    .local pmc io
    .local string line, result, c
    .local int i, len
    result = ""
    io = open file_name, 'r'
    $I0 = defined io
    unless $I0 goto err
loop:
    line = readline io
    unless io goto done
    substr c, line, 0, 1
    if c == '#' goto loop
    len = length line
    i = 0
lp2:
    substr c, line, i, 1
    if c != '.' goto no_dot
    result .= c
no_dot:
    if c < '1' goto no_num
    if c > '9' goto no_num
    result .= c
no_num:
    inc i
    if i < len goto lp2
    goto loop
done:
    .return(result)
err:
    printerr "read '"
    printerr file_name
    printerr "' failed\n"
    die 3, 100
.end

# get commandline options
.sub parse_options
    .param pmc argv

    load_bytecode "Getopt/Obj.pbc"

    .local string prog
    prog = shift argv

    # Specification of command line arguments.
    # --version, --debug, --inv=nnn, --builtin=name, --nc, --help
    .local pmc getopts
    getopts = new ["Getopt";"Obj"]
    push getopts, "version"
    push getopts, "debug"
    push getopts, "pairs"
    push getopts, "inv=s"
    push getopts, "builtin:s"   # optional
    push getopts, "nc"
    push getopts, "help"

    .local pmc opt
    opt = getopts."get_options"(argv)

    $I0 = defined opt['version']
    unless $I0 goto n_ver
    print prog
    print " "
    print VERSION
    print "\n"
    end
n_ver:
    $I0 = defined opt['help']
    unless $I0 goto n_help
    print "usage: "
    print prog
    print " [options...] [file]\n"
    print "see\n\tperldoc -F "
    print prog
    print "\nfor more\n"
    end

n_help:
    $I0 = defined opt['debug']
    unless $I0 goto n_deb
    print "debugging on\n"
n_deb:
    .return (opt)
.end

.include "iterator.pasm"

# return one of the builtin games
.sub builtin_game
    .param pmc opt

    .local string raw_given, name
    .local pmc b, it

    b = get_builtins()
    $I0 = exists opt["builtin"]
    if $I0 goto some
    $S0 = b['wikipedia']
    .return ($S0)
some:
    name = opt["builtin"]
    if name == "1" goto list_names
    if name goto sel_name

list_names:
    it = iter b
    it = .ITERATE_FROM_START
loop:
    unless it goto fin
    $S0 = shift it
    print $S0
    print " "
    goto loop
fin:
    say ''
    end

sel_name:
    $I0 = exists b[name]
    if $I0 goto ok
    printerr "no such builtin: '"
    printerr name
    printerr "'\n"
    die 3, 100
ok:
    $S0 = b[name]
    .return ($S0)
.end

.sub get_builtins
    .local pmc b
    .local string raw_given
    b = new 'Hash'

    # sudokusan malicious 26.6
    raw_given  = "..9...8.."
    raw_given .= "....85..."
    raw_given .= "4..23...1"
    raw_given .= ".4....9.."
    raw_given .= ".75...34."
    raw_given .= "..2....8."
    raw_given .= "1...59..4"
    raw_given .= "...17...."
    raw_given .= "..3...6.."
    b["san_m0626"] = raw_given

    # sudokusan atrocious 20.6
    raw_given  = "..2.1..5."
    raw_given .= "95...736."
    raw_given .= ".3......8"
    raw_given .= ".8.6.1..."
    raw_given .= "5...2...3"
    raw_given .= "...7.5.1."
    raw_given .= "8......3."
    raw_given .= ".451...29"
    raw_given .= ".1..6.4.."
    b["san_a0620"] = raw_given

    # sudokusan atrocious 24.6
    raw_given  = ".83......"
    raw_given .= "....4...3"
    raw_given .= "..79..8.6"
    raw_given .= "....2.3.."
    raw_given .= ".6.8.3.1."
    raw_given .= "..5.6...."
    raw_given .= "4.6..97.."
    raw_given .= "3...8...."
    raw_given .= "......12."
    b["san_a0624"] = raw_given

    # sudokusan atrocious 26.6
    raw_given  = "5.93....7"
    raw_given .= "....9...."
    raw_given .= "....64..1"
    raw_given .= "..6.....5"
    raw_given .= ".58...27."
    raw_given .= "2.....4.."
    raw_given .= "7..51...."
    raw_given .= "....4...."
    raw_given .= "8....61.9"
    b["san_a0626"] = raw_given

    # sudoku-san 4th aug 2006 - atrocious  - Y-WING
    raw_given  = ".....1..."
    raw_given .= "6..7....5"
    raw_given .= ".82..49.."
    raw_given .= ".734...8."
    raw_given .= "........."
    raw_given .= ".5...736."
    raw_given .= "..16..23."
    raw_given .= "9....5..1"
    raw_given .= "...8....."
    b["san_a0804"] = raw_given

    # wikipedia - (one of ) the smallest (17 clues) known sudoku
    raw_given  = "1........"
    raw_given .= "..274...."
    raw_given .= "...5....4"
    raw_given .= ".3......."
    raw_given .= "75......."
    raw_given .= ".....96.."
    raw_given .= ".4...6..."
    raw_given .= ".......71"
    raw_given .= ".....1.3."
    b["wikipedia"] = raw_given

    # derstandard 019 schwer
    raw_given  = "....8..5."
    raw_given .= ".123....6"
    raw_given .= ".456....."
    raw_given .= ".789....."
    raw_given .= "5.......4"
    raw_given .= ".....123."
    raw_given .= ".....456."
    raw_given .= "3....789."
    raw_given .= ".5..3...."
    b["std019"] = raw_given

    # derstandard 018 mittel
    raw_given  = "....247.."
    raw_given .= ".1.....5."
    raw_given .= "..8.....3"
    raw_given .= "..25....7"
    raw_given .= ".4..3..8."
    raw_given .= "6....91.."
    raw_given .= "7.....9.."
    raw_given .= ".3.....6."
    raw_given .= "..581...."
    b["std018"] = raw_given

    # "unsolvable" 3 - Y-Wing
    raw_given  = "...8....6"
    raw_given .= "..162.43."
    raw_given .= "4...71..2"
    raw_given .= "..72...8."
    raw_given .= "....1...."
    raw_given .= ".1...62.."
    raw_given .= "1..73...4"
    raw_given .= ".26.481.."
    raw_given .= "3....5..."
    b["uns3"] = raw_given

    .return (b)
.end

# count zero bits
.sub bits0
    .param int c
    .local int i, n, b

    i = 0
    n = 0
loop:
    c >>= 1        # bits start at 1
    b = c & 1
    if b goto is_set
    inc n
is_set:
    inc i
    if i < 9 goto loop
    .return (n)
.end

# count one bits (3 max - zero based)
.sub bits1
    .param int c
    .local int i, n, b

    i = 0
    n = 0
loop:
    b = c & 1
    c >>= 1
    unless b goto not_set
    inc n
not_set:
    inc i
    if i < 3 goto loop
    .return (n)
.end

# make sure the game is valid
.sub verify_input
    .param string raw
    .local int i, c
    i = length raw
    if i != 81 goto len_err
    .local pmc ar
    ar = new 'FixedIntegerArray'
    ar = 81
    i = 0
loop:
    $I0 = ord raw, i
    if $I0 != 0x2e goto not_dot
    c =  0
    goto set_it
not_dot:
    if $I0 < 0x30 goto err
    if $I0 > 0x39 goto err
    c = $I0 - 0x30
set_it:
    ar[i] = c
    inc i
    if i < 81 goto loop
    .return (ar)
err:
    printerr "ill char: '"
    substr $S0, raw, i, 1
    printerr $S0
    printerr "\n"
    die 3, 100

len_err:
    printerr "length != 81 found : "
    printerr i
    printerr "\n"
    die 3, 100
.end

#
# game methods
#

.namespace ["Sudoku"]

# return true if we single-step
.sub "step" :method
    .local pmc opt
    opt = getattribute self, "opt"
    $I0 = defined opt['debug']
    unless $I0 goto check_nc
    .return ($I0)
check_nc:
    $I0 = defined opt['nc']
    .return ($I0)
.end

# return true if debugging is on
.sub "debug" :method
    .local pmc opt
    opt = getattribute self, "opt"
    $I0 = defined opt['debug']
    .return ($I0)
.end

# create 9x9 LoL
.sub create_1 :method
    .param string what
    .local pmc rcss, rcs, all

    rcss = new 'FixedPMCArray'
    rcss = 9
    setattribute self, what, rcss
    all = getattribute self, "all"
    all[what] = rcss

    .local int y
    # create arrays
    y = 0
ly1:
    rcs = new 'FixedPMCArray'
    rcs = 9
    rcss[y] = rcs
    inc y
    if y < 9 goto ly1
.end

# create all arrays
.sub create :method
    .param pmc ar
    .local int x, y, p, c

    .local pmc cols, rows, sqrs, e, col, row, sqr, all
    .local pmc i_cols, i_rows, i_sqrs, i_col, i_row, i_sqr, inv
    setattribute self, "orig", ar
    all = new 'Hash'
    setattribute self, "all", all
    self.'create_1'("rows")
    self.'create_1'("cols")
    self.'create_1'("sqrs")
    self.'create_1'("i_rows")
    self.'create_1'("i_cols")
    self.'create_1'("i_sqrs")

    rows = getattribute self, "rows"
    cols = getattribute self, "cols"
    sqrs = getattribute self, "sqrs"
    i_rows = getattribute self, "i_rows"
    i_cols = getattribute self, "i_cols"
    i_sqrs = getattribute self, "i_sqrs"

    # now fill em
    y = 0
ly2:
    x = 0
lx2:
    p = y * 9
    p += x
    c = ar[p]

    # the entries 'e' and 'inv' are common to all 3 views of the sudoku
    e = new 'Integer'
    e = c
    inv = new 'Integer'

    # set row
    row = rows[y]
    i_row = i_rows[y]
    row[x] = e
    i_row[x] = inv

    # set col
    col = cols[x]
    i_col = i_cols[x]
    col[y] = e
    i_col[y] = inv

    # set square
    $I2 = square_of(x, y)
    sqr = sqrs[$I2]
    i_sqr = i_sqrs[$I2]
    $I0 = x % 3
    $I1 = y % 3
    $I1 *= 3
    $I2 = $I0 + $I1
    sqr[$I2] = e
    i_sqr[$I2] = inv

    inc x
    if x < 9 goto lx2
    inc y
    if y < 9 goto ly2
.end

# display
# TODO disp 2nd in different color, use curses or shell escapes
.sub display :method
    .local pmc ar, rows, row, opt, disp
    .local string s, c
    .local int i, x, y, c1, c2, r, deb_pairs
    .local string deb_n
    deb_n = ""  # print inv for that
    self."create_inv"()
    opt = getattribute self, "opt"
    disp = getattribute self, "disp"
    $I0 = defined opt["inv"]
    unless $I0 goto no_deb
    deb_n = opt["inv"]
no_deb:
    deb_pairs = defined opt["pairs"]
    i = 0
    y = 0
    s = ""
    r = 0
    # orig is a linear array 0..80
    ar = getattribute self, "orig"
    rows = getattribute self, "rows"
loop_y:
    $I0 = y % 3
    if $I0 goto no_line
    disp."print"(r,0,"+---------+---------+---------+\n")
    inc r
no_line:
    row = rows[y]
    x = 0
loop_x:
    c1 = ar[i]
    c2 = row[x]
    if c1 == 0 goto ok
    if c2 == 0 goto ok
    if c1 != c2 goto intern_err
ok:
    c = "."
    if c1 == 0 goto nxt
        $I0 = c1 + 0x30
    c = chr $I0
    goto set
nxt:
    if c2 == 0 goto set
        $I0 = c2 + 0x30
    c = chr $I0
set:
    $I0 = i % 3
    if $I0 goto sp1
    s .= '| '
    goto sp2
sp1:
    s .= ' '
sp2:
    s .= c
    s .= ' '
    inc i
    inc x
    if x < 9 goto loop_x
    s .= '|'
    disp."print"(r,0, s)
    unless deb_n goto not_deb_n
    self."deb_inv"(y, deb_n)
not_deb_n:
    unless deb_pairs goto not_deb_pairs
    self."deb_pairs"(y)
not_deb_pairs:
    disp."print"("\n")
    inc r
    s = ""
    inc y
    if y < 9 goto loop_y
    disp."print"(r,0,"+---------+---------+---------+\n")
    inc r
    disp."wait"()
    .return()
intern_err:
    printerr "diff between ar and try\n"
    die 3, 100
.end

# print invalid for given row and number(s)
.sub deb_inv :method
    .param int y
    .param string ns

    .local pmc invs, inv
    .local int b, x, c, i, len, n
    i = 0
    len = length ns
lp_inv:
    substr $S0, ns, i, 1
    n = $S0
    print "   "
    invs = getattribute self, "i_rows"
    inv = invs[y]
    x = 0
loop:
    $I0 = x % 3
    if $I0 goto nosp
    print " "
nosp:
    c = inv[x]
    b = 1 << n
    $I0 = c & b
    if $I0 goto is_set
        print "."
    goto nxt
is_set:
    print n
nxt:
    inc x
    if x < 9 goto loop
    inc i
    if i < len goto lp_inv
.end

# print pairs for given row
.sub deb_pairs :method
    .param int y

    .local pmc invs, inv
    .local int x
    print "   "
    invs = getattribute self, "i_rows"
    inv = invs[y]
    x = 0
loop:
    $I0 = x % 3
    if $I0 goto nosp
    print "   "
nosp:
    .local int el, bits, i, b
    el = inv[x]
    bits = bits0(el)
    if bits == 2 goto isa_pair
    print ".."
    goto nxt_x
isa_pair:
    i = 1
bit_loop:
    el >>= 1        # bits start at 1
    b = el & 1
    if b goto is_set
    $I0 = i + 0x30
    $S0 = chr $I0
    print $S0
is_set:
    inc i
    if i <= 9 goto bit_loop
nxt_x:
    inc x
    print " "
    if x < 9 goto loop
.end

# verify numbers
# returns:
#   0 ... failure
#   1 ... ok
#   2 ... finished

.sub verify :method
    .local pmc rcss
    .local int r, done
    done = 2
    rcss = getattribute self, "rows"
    r = self."verify_1"(rcss)
    unless r goto err
    if r == 2 goto fin1
    done = 1
fin1:
    rcss = getattribute self, "cols"
    r = self."verify_1"(rcss)
    unless r goto err
    if r == 2 goto fin2
    done = 1
fin2:
    rcss = getattribute self, "sqrs"
    r = self."verify_1"(rcss)
    unless r goto err
    if r == 2 goto fin3
    done = 1
fin3:
    .return (done)
err:
    .return (0)
.end

# verify rows, cols, or sqrs
.sub verify_1 :method
    .param pmc rcss

    .local int x, y, result
    .local pmc one, e, seen, s
    result = 2         # finished
    y = 0
lpy:
    one = rcss[y]
    seen = new 'Hash'
    x = 0
lpx:
    e = one[x]
    unless e goto nxtx
    $I0 = exists seen[e]
    unless $I0 goto not_seen
    s = seen[e]
    inc s
    goto nxtx
not_seen:
    seen[e] = 1
nxtx:
    inc x
    if x < 9 goto lpx

    $I0 = elements seen
    if $I0 == 9 goto done
        result = 1
done:
    $I0 = check_seen(seen)
    unless $I0 goto ret_0
    inc y
    if y < 9 goto lpy
    .return (result)
ret_0:
    .return (0)
.end

# count seen in one
.sub check_seen
    .param pmc seen
    .local pmc it
    it = iter seen
    it = .ITERATE_FROM_START
loop:
    unless it goto ok
    $S0 = shift it
    $I0 = seen[$S0]
    if $I0 > 1 goto err
    goto loop
ok:
    .return(1)
err:
    .return(0)
.end

# create invalid bits
.sub create_inv :method
    .local pmc rcss, i_rcss
    rcss = getattribute self, "rows"
    i_rcss =  getattribute self, "i_rows"
    self."create_inv_1"(rcss, i_rcss, "row")
    rcss = getattribute self, "cols"
    i_rcss =  getattribute self, "i_cols"
    self."create_inv_1"(rcss, i_rcss, "col")
    rcss = getattribute self, "sqrs"
    i_rcss =  getattribute self, "i_sqrs"
    self."create_inv_1"(rcss, i_rcss, "sqr")
.end

# create row, cols, or sqrs of invalid numbers
# one bit per invalid

.sub create_inv_1 :method
    .param pmc ars
    .param pmc invs
    .param string what

    .local int x, y, n, i, c
    .local pmc ar, inv

    y = 0
lpy:
    ar = ars[y]
    inv = invs[y]
    x = 0
lpx:
    c = ar[x]
    unless c goto nxt_x
    $P0 = inv[x]
    $P0 |= 0b1111111110
nxt_x:
    inc x
    if x < 9 goto lpx
    n = 1
lpn:
    $I0 = self."contains"(ar, n)
    unless $I0 goto nxt_n
        i = 0
fill:
    $I0 = 1 << n
    $P1 = inv[i]
    $P1 |= $I0
    inc i
    if i < 9 goto fill
nxt_n:
    inc n
    if n <= 9 goto lpn
    self."create_inv_n"(ar, inv, y, what)
    inc y
    if y < 9 goto lpy
.end

# if inv contains 2 identical entries and exactly 2 nums are
# allowed these 2 positions are invalid for all other digits
.sub create_inv_n :method
    .param pmc ar
    .param pmc inv
    .param int y
    .param string what

    .local int x, x1, x2, n, m, msk
    .local pmc d, e1, e2, empty_2, digs

    # transpose into a digit-base array with positions as bits
    # this should simplify the test for 2 empty squares with
    # same digit
    digs = new 'FixedPMCArray'
    digs = 9
    n = 0
lpn:
    msk = 2 << n
    d = new 'Integer'
    digs[n] = d
    x = 0
    # don't bother looking further if n is already set
    $I1 = n + 1
    $I0 = self."contains"(ar, $I1)
    if $I0 goto nxt_n
lpx:
    e1 = inv[x]
    $I0 = e1
    $I0 &= msk
    unless $I0 goto nxt_x
    $I1 = 2 << x
    d |= $I1
nxt_x:
    inc x
    if x < 9 goto lpx
nxt_n:
    inc n
    if n < 9 goto lpn

    x1 = 0
lpx1:
    empty_2 = new 'ResizablePMCArray'
    e1 = digs[x1]
    n = bits0(e1)
    if n != 2 goto nxt_x1
    m = 1
    x2 = x1 + 1
lpx2:
    e2 = digs[x2]
    if e1 != e2 goto nxt_x2
    inc m
    if m > 2 goto nxt_x1
    push empty_2, e1
    push empty_2, x1
    push empty_2, x2
nxt_x2:
    inc x2
    if x2 < 9 goto lpx2
    $I0 = elements empty_2
    unless $I0 goto nxt_x1
    if m != 2 goto nxt_x1
    goto done
nxt_x1:
    inc x1
    if x1 < 8 goto lpx1

    $I0 = elements empty_2
    unless $I0 goto ret
done:
    .local int d1, d2, pos_msk, changed
    pos_msk = empty_2[0]   # positions 1 based
    d1 =      empty_2[1]   # 0 based
    d2 =      empty_2[2]   # 0 based
    x = 0
    changed = 0
lpx3:
    $I0 = 2 << x
    $I0 &= pos_msk
    if $I0 goto nxt_x3
       e1 = inv[x]
       n = 0
    lpn3:
       if n == d1 goto nxt_n3
       if n == d2 goto nxt_n3
       # invalidate all but d1, d2 at the 2 positions
       $I0 = 2 << n
       $I1 = e1
       $I1 &= $I0
       if $I1 goto no_c
       e1 |= $I0
       changed = 1
    no_c:
    nxt_n3:
       inc n
       if n < 9 goto lpn3
nxt_x3:
    inc x
    if x < 9 goto lpx3
    $I0 = self."debug"()
    unless $I0 goto ret

    unless changed goto ret
    # reuse array for debug reports
    unshift empty_2, y
    unshift empty_2, what
    $S0 = sprintf "*** found inv_2 %s %d: %#b %d %d\n", empty_2
    print $S0
ret:
.end

# return 1 if row/col/sqr contains num n
.sub contains :method
    .param pmc ar
    .param int n

    .local int i, c
    i = 0
lp:
    c = ar[i]
    if c == n goto ret_1
    inc i
    if i < 9 goto lp
    .return (0)
ret_1:
    .return (1)
.end

# main solver method
# returns
#   0 ... err
#   1 ... incomplete
#   2 ... finito
.sub solve :method
    .local int r
    #self."sanity_check"()
loop:
    self."create_inv"()
    r = self."scan"()
    if r == -1 goto err
    unless r goto done
    $I0 = self."step"()
    unless $I0 goto loop
    self."display"()
    goto loop
done:
    #self."sanity_check"()
    $I0 = self."verify"()
    # if yet unfished, try advanced methods before back_tracking starts
    unless $I0 == 1 goto no_adv
    r = self."adv_scan"()
    # if changes, start over with "normal" stuff
    if r == 1 goto loop
no_adv:
    .return ($I0)
err:
    print "mismatch\n"
    .return (0)
.end

# scan for forced numbers
# returns
# -1 ... err
# 0  ... no change
# 1  ... changes
.sub scan :method
    .local int any, y, x, m
    any = 0
    .local pmc rcss, i_rcss
    rcss = getattribute self, "rows"
    i_rcss = getattribute self, "i_rows"
    $I0 = self."scan_1"(rcss, i_rcss, "rows")
    if $I0 == -1 goto err
    any |= $I0
    $I0 = self."scan_dbl"(rcss, i_rcss, "rows")
    any |= $I0

    rcss = getattribute self, "cols"
    i_rcss = getattribute self, "i_cols"
    $I0 = self."scan_1"(rcss, i_rcss, "cols")
    if $I0 == -1 goto err
    any |= $I0
    $I0 = self."scan_dbl"(rcss, i_rcss, "cols")
    any |= $I0

    rcss = getattribute self, "sqrs"
    i_rcss = getattribute self, "i_sqrs"
    $I0 = self."scan_1"(rcss, i_rcss, "sqrs")
    if $I0 == -1 goto err
    any |= $I0
    $I0 = self."step"()
    unless $I0 goto nd2
    self."display"()
nd2:
    $I0 = self."scan_blocked"(rcss, i_rcss, "sqrs")
    any |= $I0
    (y, x, m) = self."best_pos"()
    if m != 1 goto not_uniq
        self."set_uniq"(y, x)
    any = 1
not_uniq:
    .return (any)
err:
    .return (-1)
.end

# scan for advanced methods
# returns
# -1 ... err
# 0  ... no change
# 1  ... changes
.sub adv_scan :method
    $I0 = self."y_wing"()
    # TODO try more stuff
    .return ($I0)
.end

.sub "y_wing" :method
    # scan for pairs all over
    .local int x, y, bits, el, res
    .local pmc i_rows, i_row
    res = 0
    y = 0
    i_rows = getattribute self, "i_rows"
loop_y:
    x = 0
    i_row = i_rows[y]
loop_x:
    el = i_row[x]
    bits = bits0(el)
    if bits != 2 goto nxt_x
    $I0 = self."check_y_wing"(x, y, el)
    res |= $I0
nxt_x:
    inc x
    if x < 9 goto loop_x
    inc y
    if y < 9 goto loop_y
    .return (res)
.end

.sub pair_vals
    .param int el
    .local int i, b, A, B
    A = 0
    i = 1       # A, B are 1-based
loop:
    el >>= 1        # bits start at 1
    b = el & 1
    if b goto next
    if A goto A_is_set
    A = i
    goto next
A_is_set:
    B = i
    .return (A, B)
next:
    inc i
    if i <= 9 goto loop
    printerr "failed to fined pair"
    exit 1
.end

# get the square # of coors (x,y) TODO reuse
.sub square_of
    .param int x
    .param int y
    x /= 3
    y /= 3
    y *= 3
    $I0 = x + y
    .return ($I0)
.end

# given the square # and idx inside, return coors (x,y) TODO reuse
.sub square_to_xy
    .param int sq
    .param int idx
    .local int x, y
    x = sq % 3
    x *= 3
    $I0 = idx % 3
    x += $I0
    y = sq / 3
    y *= 3
    $I1 = idx / 3
    y += $I1
    .return (x, y)
.end

# look for another pair AC (A,C != B)
# return C and the position in i_rcs
.sub "y_wing-pair" :method
    .param pmc i_rcs
    .param int A
    .param int not_B
    .local int x, el, bits, p1, p2
    x = 0
loop:
    el = i_rcs[x]
    bits = bits0(el)
    if bits != 2 goto next
    (p1, p2) = pair_vals(el)
    if p1 == not_B goto next
    if p2 == not_B goto next
    if p1 != A goto check_p2
    .return (p2, x)
check_p2:
    if p2 != A goto next
    .return (p1, x)
next:
    inc x
    if x < 9 goto loop
    .return (0,0)
.end

# look for another pair BC
# return 0/1 and the position in i_rcs
.sub "y_wing-pair_BC" :method
    .param pmc i_rcs
    .param int B
    .param int C
    .local int x, el, bits, p1, p2
    x = 0
loop:
    el = i_rcs[x]
    bits = bits0(el)
    if bits != 2 goto next
    (p1, p2) = pair_vals(el)
    if p1 == B goto ok1
    if p2 == B goto ok2
    goto next
ok1:
    if p2 != C goto next
    .return (1, x)
ok2:
    if p1 != C goto next
    .return (1, x)
next:
    inc x
    if x < 9 goto loop
    .return (0,0)
.end

# invalidate C from the given [start,end] range#
# return 1 if something changed
.sub "y_wing_inv" :method
    .param pmc i_rcs
    .param int C
    .param int start
    .param int end

    .local int changed, b
    .local pmc el
    changed = 0
    b = 1 << C
loop:
    el = i_rcs[start]
    $I0 = el
    $I1 = $I0 & b
    if $I1 goto next
    el |= b
    changed = 1
next:
    inc start
    if start <= end goto loop
    .return (changed)
.end

# find C for A B
# and invalidate C if found
.sub "find_C_y_wing_1" :method
    .param int x
    .param int y
    .param int A
    .param int B
    # check same row, col, or sqr for a pair with A and not B
    .local pmc i_rcss, i_rcs
    i_rcss = getattribute self, "i_sqrs"
    .local int sq, changed
    changed = 0
    sq = square_of(x, y)    # TODO reuse this func
    .local int C, c
    i_rcs = i_rcss[sq]
    (C, c) = self."y_wing-pair"(i_rcs, A, B)
    unless C goto check_row # TODO row, col
    # convert the square coordinate to (x, y)
    .local int cx, cy, bx, by, has_bc
    (cx, cy) = square_to_xy(sq, c)  # AC
    if x == cx goto try_row
    # check col and row at AB for a BC pair
    i_rcss = getattribute self, "i_cols"
    i_rcs  = i_rcss[x]
    (has_bc, c) = self."y_wing-pair_BC"(i_rcs, B, C)
    unless has_bc goto try_row
    bx = x
    by = c
    # but B have to be in a different square too
    $I0 = square_of(bx, by)
    if sq == $I0 goto try_row
    .local int start, end
    # invalidate col x in sqr(x,y)
    sq = square_of(x, y)
    ($I0, start) = square_to_xy(sq, 0)
    end = start + 2
    changed = self."y_wing_inv"(i_rcs, C, start, end)
    # invalidate col x at BC
    i_rcs  = i_rcss[cx]
    sq = square_of(bx, by)
    ($I0, start) = square_to_xy(sq, 0)
    end = start + 2
    $I0 = self."y_wing_inv"(i_rcs, C, start, end)
    changed |= $I0
    goto show_debug
    try_row:
    if y == cy goto nope
    i_rcss = getattribute self, "i_rows"
    i_rcs  = i_rcss[y]
    (has_bc, c) = self."y_wing-pair_BC"(i_rcs, B, C)
    unless has_bc goto nope
    bx = c
    by = y
    .local int start, end
    # TODO invalidate row y too
    i_rcs  = i_rcss[cx]
    sq = square_of(bx, by)
    ($I0, start) = square_to_xy(sq, 0)
    end = start + 2
    changed = self."y_wing_inv"(i_rcs, C, start, end)
    show_debug:
    $I0 = self."debug"()
    unless $I0 goto ex
        $S0 = "CHG"
        if changed goto chg_ok
        $S0 = "noC"
    chg_ok:
        print $S0
        print " Y-WING A "
        print A
        print " B "
        print B
        print " C "
        print C
        print " at x "
        print x
        print " y "
        print y
        print " cx "
        print cx
        print " cy "
        print cy
        print " bx "
        print bx
        print " by "
        say by
        self."display"()
        goto ex

check_row:
    i_rcss = getattribute self, "i_rows"
    i_rcs = i_rcss[y]
    # XXX TODO check that A is in a forced pair
    (C, c) = self."y_wing-pair"(i_rcs, A, B)
    cx = c
    cy = y
    unless C goto check_col
    i_rcss = getattribute self, "i_cols"
    i_rcs  = i_rcss[x]
    # XXX TODO check that B is in a forced pair
    (has_bc, by) = self."y_wing-pair_BC"(i_rcs, B, C)
    bx = cx
    unless has_bc goto check_col
    i_rcs  = i_rcss[cx]
    changed = self."y_wing_inv"(i_rcs, C, by, by)
    if changed goto show_debug

check_col:
    # TODO
nope:
ex:
    .return (changed)
.end

# find C for A, or B
.sub "find_C_y_wing" :method
    .param int x
    .param int y
    .param int A
    .param int B

    .local int changed
    changed = self."find_C_y_wing_1"(x, y, A, B)
    unless changed goto not_A
    .return (changed)
not_A:
    .tailcall self."find_C_y_wing_1"(x, y, B, A)
.end

# check, if we find another pair with 1 digit in common with el
.sub "check_y_wing" :method
    .param int x
    .param int y
    .param int el
    # ok - we have a pair at col/row (x,y) with inv_bits el
    # assume, we are at the corner of the Y
    # let one number be A, the other B
    .local int A, B, C
    #trace 1
    (A, B) = pair_vals(el)
    # now find another pair in
    # - another *this* row, col, or square
    # - AC or BC giving another unique element C
    .tailcall self."find_C_y_wing"(x, y, A, B)
.end

# the quare y has a uniq digit at x - set it
.sub set_uniq :method
    .param int y
    .param int x
    .local pmc sqrs, sqr, e
    .local int n, b
    sqrs = getattribute self, "i_sqrs"
    sqr = sqrs[y]
    b = sqr[x]
    n = 1
loop:
    $I0 = 1 << n
    $I1 = b & $I0
    if $I1 goto nxt
    sqrs = getattribute self, "sqrs"
    sqr = sqrs[y]
    e = sqr[x]
    e = n
    $I0 = self."debug"()
    unless $I0 goto nd
        print "uniq sqr="
        print y
        print " x="
        print x
        print " n="
        print n
        print "\n"
    nd:
    .return()
nxt:
    inc n
    if n <= 9 goto loop
.end

# check inv of rows,cols,sqrs for forced numbers
# returns
# -1 ... err
# 0  ... no change
# 1  ... changes
.sub scan_1 :method
    .param pmc rcss
    .param pmc i_rcss
    .param string what

    .local int x, y, c, m, n, b, xx, any
    .local pmc one, inv, e
    any = 0
    y = 0
lpy:
    one = rcss[y]
    inv = i_rcss[y]
    n = 1
lpn:
    x = 0
    b = 0
lpx:
    c = inv[x]
    $I0 = 1 << n
    $I1 = c & $I0
    if $I1 goto nxt_x
    inc b
    xx = x
nxt_x:
    inc x
    if x < 9 goto lpx

    if b != 1 goto nxt_n
    any = 1
    $P0 = one[xx]
    unless $P0 goto ok
    if $P0 != n goto err
    goto nxt_n
    ok:
    $P0 = n
    $I0 = self."debug"()
    unless $I0 goto nxt_n
    print "found "
    print what
    print " y="
    print y
    print " x="
    print xx
    print " n="
    say n
nxt_n:
    inc n
    if n <= 9 goto lpn
    inc y
    if y < 9 goto lpy
    .return (any)
err:
    .return (-1)
.end

# check double invs of rows,cols for forced rows/cols
# returns
# 0  ... no change
# 1  ... changes
# this implements half of TODO item 1 (digit '7' ...)
# scan_dbl finds both occurrences of the blocked '7' but needs more testing still

.sub scan_dbl :method
    .param pmc rcss
    .param pmc i_rcss
    .param string what

    .local pmc inv, bits
    .local int n, y, x, sx, sy, el, retval
    retval = 0
    n = 1
    # for all digits
lpn:
    sx = 0
    # when scanning cols, sx is horizontal
    # need 3 cols at a time
lpsx:
    bits = new 'FixedIntegerArray'
    bits = 3
    x = 0
lpx:
    $I0 = sx * 3
    $I0 += x
    inv = i_rcss[$I0]
    sy = 0
lpsy:
    y = 0
lpy:
    $I1 = sy * 3
    $I1 += y
    el = inv[$I1]
    # if n is allowed, set a bit in bits
    $I2 = 1 << n
    $I2 &= el
    if $I2 goto blocked
    $I6 = bits[sy]
    $I5 = 1 << x
    $I6 |= $I5
    bits[sy] = $I6
blocked:
    inc y
    if y < 3 goto lpy
    inc sy
    if sy < 3 goto lpsy
    inc x
    if x < 3 goto lpx
    $I3 = 0
lp_c:
    $I4 = bits[$I3]
    if $I4 == 0 goto no_check
    inc $I3
    if $I3 < 3 goto lp_c
    #$S1 = sprintf "bits %x %x %x\n", bits
    #print $S1
    $I10 = self."check_dbl"(i_rcss, bits, sx, n, what)
    retval |= $I10
no_check:
    inc sx
    if sx < 3 goto lpsx
nxt_n:
    inc n
    if n <= 9 goto lpn
    .return (retval)
.end

# check if this is validly dbl blocking
.sub check_dbl :method
    .param pmc i_rcss
    .param pmc bits
    .param int sx
    .param int n
    .param string what
    # we must have 2 masks with the same 2 bits set and another one
    # where the clear one is also set e.g. 3 7 3
    .local int m0, m1, m2, b
    #trace 1
    m0 = bits[0]
    m1 = bits[1]
    m2 = bits[2]
    if m0 != m1 goto m02
    # m0 == m1
    b = bits1(m0)
    if b != 2 goto m02
    $I0 = bits1(m2)
    if $I0 != 3 goto m02
    .tailcall self.'inv_dbl'(i_rcss, n, m0, sx, 2, what)
m02:
    if m0 != m2 goto m12
    # m0 == m2
    b = bits1(m0)
    if b != 2 goto m12
    $I0 = bits1(m1)
    if $I0 != 3 goto m12
    .tailcall self.'inv_dbl'(i_rcss, n, m0, sx, 1, what)
m12:
    if m1 != m2 goto ret
    # m1 == m2
    b = bits1(m1)
    if b != 2 goto ret
    $I0 = bits1(m0)
    if $I0 != 3 goto ret
    .tailcall self.'inv_dbl'(i_rcss, n, m1, sx, 0, what)
ret:
    .return (0)
.end

# invalidate results found from check_dbl
.sub inv_dbl :method
    .param pmc i_rcss
    .param int n
    .param int msk
    .param int sx
    .param int sy
    .param string what

    .local int x, y, b
    .local pmc inv, el
    x = sx * 3
    b = 0
lpb:
    $I0 = 1 << b
    $I0 &= msk
    unless $I0 goto not_set
    $I2 = x + b
    inv = i_rcss[$I2]
    y = 0
lpy:
    $I1 = sy * 3
    $I1 += y
    el = inv[$I1]
    $I3 = 1 << n
    el |= $I3
    inc y
    if y < 3 goto lpy
not_set:
    inc b
    if b < 3 goto lpb
    $I0 = self."debug"()
    unless $I0 goto nd
    print "inv_dbl "
    print what
    print " n "
    print n
    print " msk "
    print msk
    print " sx "
    print sx
    print " sy "
    say sy
    self."display"()
nd:
    .return (1)
.end

# check for blocked rows or colums
# returns
# 0  ... no change
# 1  ... changes
.sub scan_blocked :method
    .param pmc sqrs
    .param pmc i_sqrs
    .param string what

    .local int x, y, c, m, n, b, sh, any
    .local pmc one, inv, e
    .local int sr, sc, cbl, rbl, nulb, nulc
    any = 0
    y = 0
lpy:
    one = sqrs[y]
    inv = i_sqrs[y]
    n = 1
lpn:
    x = 0
    b = 0
    rbl = 7         # blocked is reset per square row/col
    cbl = 7
    nulb = 0        # empty are set
    nulc = 0
lpx:
    sc = x % 3      # square col and row
    sr = x / 3
    c = inv[x]
    $I0 = 1 << n
    $I1 = c & $I0
    if $I1 goto nxt_x
       $I0 = 1 << sr
       nulb |= $I0
       $I1 = bnot $I0
       rbl &= $I1
       $I0 = 1 << sc
       nulc |= $I0
       $I1 = bnot $I0
       cbl &= $I1
nxt_x:
    inc x
    if x < 9 goto lpx

    b = 0
loop_br:
    sh = 1 << b
    $I0 = rbl ~ 7
    $I0 &= 7
    # need to have 2 blocked and one not-filled
    if $I0 != sh goto nbr
    if nulb != sh goto nbr
    $I0 = self."inv_row"(y, b, n)
    any |= $I0
nbr:
    $I0 = cbl ~ 7
    $I0 &= 7
    if $I0 != sh goto nbc
    if nulc != sh goto nbc
    $I0 = self."inv_col"(y, b, n)
    any |= $I0
nbc:
    inc b
    if b < 3 goto loop_br
nxt_n:
    inc n
    if n <= 9 goto lpn
    inc y
    if y < 9 goto lpy
    .return (any)
.end

# set rest of row invalid due to blocked square
# skip the square itself
.sub "inv_row" :method
    .param int y
    .param int b
    .param int n
    .local pmc rows
    .local int r, sx
    rows = getattribute self, "i_rows"
    r = y / 3       # row of square y
    r *= 3
    r += b
    sx = y % 3      # skip / 3
    $I0 = self."inv_rc"(rows, r, sx, n, "row")
    .return ($I0)
.end

# set rest of col invalid due to blocked square
.sub "inv_col" :method
    .param int y
    .param int b
    .param int n
    .local pmc cols
    .local int r, sx
    cols = getattribute self, "i_cols"
    r = y % 3       # col of square y
    r *= 3
    r += b
    sx = y / 3
    $I0 = self."inv_rc"(cols, r, sx, n, "col")
    .return ($I0)
.end

# set rest of row/col invalid due to blocked square
.sub "inv_rc" :method
    .param pmc rcs
    .param int r
    .param int sx
    .param int n
    .param string what

    .local pmc rc
    .local int r, x, bb, any

    rc = rcs[r]

    bb = 1 << n
    any = 0
    x = 0
loop:
    $I0 = x / 3     # skip this square
    if $I0 == sx goto nxt
    $P0 = rc[x]
    $I0 = $P0
    $I1 = $I0 & bb
    if $I1 goto nxt
    any = 1
    $P0 |= bb
nxt:
    inc x
    if x < 9 goto loop
    unless any goto ret
    $I0 = self."debug"()
    unless $I0 goto ret
    print "found blocked "
    print what
    print "="
    print r
    print " n="
    say n
ret:
    .return (any)
.end

# check that pmcs in rows, cols and sqrs are the same
.sub sanity_check :method
    .local pmc rows, cols
    rows = getattribute self, "rows"
    cols = getattribute self, "cols"
    self."sanity_check_rc"(rows, cols)
    rows = getattribute self, "i_rows"
    cols = getattribute self, "i_cols"
    self."sanity_check_rc"(rows, cols)
.end

.sub sanity_check_rc :method
    .param pmc rows
    .param pmc cols
    .param string what

    .local pmc row, col, e1, e2
    .local int x, y
    y = 0
lpy:
    row = rows[y]
    x = 0
lpx:
    col = cols[x]
    e1 = row[x]
    e2 = col[y]
    eq_addr e1, e2, ok
    printerr "pmc borken rc y="
    printerr y
    printerr " x="
    printerr x
    printerr "\n"
    die 3, 100
ok:
    inc x
    if x < 9 goto lpx
    inc y
    if y < 9 goto lpy
.end

# backtrack progress
.sub progress :method
    .param int size
    .param int y
    .param int x
    .param int n
    .param int m
    print "back_tracking "
    print size
    print " y="
    print y
    print " x="
    print x
    print " n="
    print n
    print " m="
    print m
    print "\n"
.end

# back_track tries
.sub back_track :method
    .param pmc tries

    .local pmc tos, all, sqrs, sqr, e
    .local int r, size, x, y, n, m
    .local string state

    size = elements tries
    dec size
    tos = tries[size]
    state = freeze tos
    (y, x, m) = self."best_pos"()
    if y >= 0 goto start
    # this shouldn't happen
    self."progress"(size, y, x, -1)
    .return (0)
start:
    n = 1                       # try all numbers at best pos
loop:
    all = thaw state        # restore state
    self.'set_attrs'(all)         # set attributes to this state
    sqrs = getattribute self, "sqrs"
    sqr = sqrs[y]
    e = sqr[x]
    e = n
    r = self."verify"()
    unless r goto nxt
    self."progress"(size, y, x, n, m)
    $I0 = self."step"()
    unless $I0 goto nd
    self."display"()
nd:
    r = self."solve"()
    if r == 0 goto nxt
    if r == 2 goto fin
    push tries, all
    r = self."back_track"(tries)
    if r == 2 goto fin
    $P0 = pop tries
nxt:
    inc n
    if n <= 9 goto loop
    $I0 = self."debug"()
    unless $I0 goto nd2
    print "back "
    print size
    print "\n"
nd2:
    .return (0)
fin:
    .return (r)
.end

# return the square coors of the minimum freedom
# used for backtracking
# if m == 1 this is a forced uniq position
.sub best_pos :method
    .local pmc sqrs, sqr
    .local int x, y, n, c, mx, my, mb

    sqrs = getattribute self, "i_sqrs"
    y = 0
    mb = 10
    mx = -1
    my = -1
lpy:
    sqr = sqrs[y]
    x = 0
lpx:
    c = sqr[x]
    n = bits0(c)
    unless n goto no_min
    if n >= mb goto no_min
        mb = n
    mx = x
    my = y
no_min:
    inc x
    if x < 9 goto lpx
    inc y
    if y < 9 goto lpy
    .return (my, mx, mb)
.end

.sub set_attrs :method
    .param pmc all
    .local pmc e

    e = all["rows"]
    setattribute self, "rows", e
    e = all["cols"]
    setattribute self, "cols", e
    e = all["sqrs"]
    setattribute self, "sqrs", e
    e = all["i_rows"]
    setattribute self, "i_rows", e
    e = all["i_cols"]
    setattribute self, "i_cols", e
    e = all["i_sqrs"]
    setattribute self, "i_sqrs", e
.end

# display support
.sub new_display :method
    .local pmc stdscr, opt, cl, p, s, it, f, gl
    opt = getattribute self, "opt"
    $I0 = defined opt["nc"]
    unless $I0 goto out
    stdscr = nc_start()
    cl = newclass "NCurses"
    addattribute cl, "win"
    p = new "NCurses"
    setattribute p, "win", stdscr

    setattribute self, "disp", p
    .return(p)
out:
    cl = newclass "Dummy"
    p = new "Dummy"
    setattribute self, "disp", p
    .return(p)
.end

.sub end_display :method
    .local pmc opt
    opt = getattribute self, "opt"
    $I0 = defined opt["nc"]
    unless $I0 goto out
    nc_end()
out:
.end

.namespace ["Dummy"]

.sub "print" :multi(_, int, int, string) :method
    .param int r
    .param int c
    .param string s
    print s
.end

.sub "print" :multi(_, string) :method
    .param string s
    print s
.end

.sub "print" :multi(_, int) :method
    .param int s
    print s
.end

.sub "wait" :method
.end

.namespace ["NCurses"]

# TODO remember last position, parse newlines to increment row
# this should better be all in a new library

.sub "print" :multi(_, int, int, string) :method
    .param int r
    .param int c
    .param string s
    .local pmc win, f

    win = getattribute self, "win"
    f = get_global ["ncurses"], "mvwaddstr"
    f(win, r, c, s)
.end

.sub "print" :multi(_, string) :method
    .param string s
    .local pmc win, f

    win = getattribute self, "win"
    f = get_global ["ncurses"], "waddstr"
    f(win, s)
.end

.sub "print" :multi(_, int) :method
    .param int i
    .local string s
    .local pmc win, f

    s = i
    win = getattribute self, "win"
    f = get_global ["ncurses"], "waddstr"
    f(win, s)
.end

.sub "wait" :method
    .local pmc f
    .local int key
    f = get_global ["ncurses"], "getch"
    key = f()
.end

.namespace []
# ncurses support

.sub nc_start
    .local pmc stdscr
    load_bytecode 'ncurses.pbc'
    stdscr = _init_curses()
    .return(stdscr)
.end

.sub nc_end
    .local pmc endwin, curs_set
    curs_set = get_global ["ncurses"], "curs_set"
    curs_set(1)
    endwin = get_global ["ncurses"], "endwin"
    endwin()
.end

.sub _init_curses
    .local pmc INITSCR
    .local pmc START_COLOR
    .local pmc INIT_PAIR
    .local pmc COLOR_PAIR
    .local pmc WATTRON
    .local pmc CURS_SET
    .local pmc NODELAY
    .local pmc KEYPAD
    .local pmc STDSCR
    INITSCR     = get_global ["ncurses"], "initscr"
    START_COLOR = get_global ["ncurses"], "start_color"
    INIT_PAIR   = get_global ["ncurses"], "init_pair"
    COLOR_PAIR  = get_global ["ncurses"], "COLOR_PAIR"
    WATTRON     = get_global ["ncurses"], "wattron"
    CURS_SET    = get_global ["ncurses"], "curs_set"
    NODELAY     = get_global ["ncurses"], "nodelay"
    KEYPAD      = get_global ["ncurses"], "keypad"
    STDSCR = INITSCR()
    START_COLOR()
    # Color pair 1, dark green fg, black background
    INIT_PAIR(1, 2, 0)
    $I0 = COLOR_PAIR(1)
    # We pass what's returned from COLOR_PAIR straight on
    ## WATTRON($I0)
    CURS_SET(0)         # turn off cursor
    ## NODELAY(STDSCR, 1)   # set nodelay mode
    ## KEYPAD(STDSCR, 1)    # set keypad mode
    .return(STDSCR)
.end

=head1 Advanced checks

=head2 Double blocked rows/columns

Consider this one:

  # daily sudoku 16-nov-2005 very hard
  .5..3.9..
  .394.....
  .....964.
  .6...84..
  5.......8
  ..19...2.
  .826.....
  .....576.
  ..5.9..8.

It got solved until here, then backtracking began (and succeeded).

  +---------+---------+---------+
  | 4  5  6 | 8  3  . | 9  .  . |    777 77. 7..
  | .  3  9 | 4  .  . | 8  .  . |    .77 7.. 7..
  | .  .  8 | .  .  9 | 6  4  3 |    ..7 ..7 777
  +---------+---------+---------+
  | .  6  . | .  .  8 | 4  .  . |    .7. ..7 7..
  | 5  .  . | .  .  . | .  .  8 |    7.. ... 7.7
  | 8  .  1 | 9  .  . | .  2  6 |    7.7 7.. 777  <<<<<<<<<<
  +---------+---------+---------+
  | .  8  2 | 6  .  . | .  .  . |    .77 7.. 777
  | .  .  . | 2  8  5 | 7  6  . |    777 777 777
  | 6  .  5 | .  9  . | 2  8  . |    7.7 .7. 777
  +---------+---------+---------+

Have a look at the marked row 5. '3' and '5' can't be in col 1.
So '3' and '5' have to be at the right side of the row.

Now take a look at the '7' - invalid positions are shown above already
(dumped with the --inv=7 option).

In both squares 0 and 6 the '7' can only be in columns 0 or 1. This
implies that a '7' has to be in col 2, row 3 or 4. Looking at
square 5, the '7' is also in row 3 or 4. Therefore the '7' in the
middle square (4) has to be too in row 5.

Voila we have 3 numbers (3,5,7) which are somewhere on the right
side of row 5 and we get a unique number in row 5, col 1 - the '4'.

And then it's easy.

One part (the '7') is implemented in C<scan_dbl>, which
boils down this case to the other one below.

=head2 Blocking due to multiple others

Given this sudoku:

  # daily sudoku 16-nov-2005 very hard
  .5..3.9..
  .394.....
  .....964.
  .6...84..
  5.......8
  ..19...2.
  .826.....
  .....576.
  ..5.9..8.

Earlier sudoku.pir started backtracking at:

  +---------+---------+---------+
  | .  .  1 | 3  8  5 | .  .  . |
  | 6  8  7 | .  1  . | .  9  . |
  | 2  3  5 | 6  9  7 | .  .  1 |
  +---------+---------+---------+
  | 1  .  . | 9  7  3 | .  5  . |
  | .  7  6 | 5  .  8 | 1  3  . |
  | .  5  . | .  6  1 | .  .  . |
  +---------+---------+---------+
  | 7  1  . | 8  .  . | .  .  4 |
  | .  .  . | 7  .  . | .  1  8 |
  | .  .  . | 1  .  9 | 7  .  . |
  +---------+---------+---------+

In columns 7 the digits (9,5,3) are blocking this column in square 8
so that the digits (2,6) have to be in column 7 too. Which implies
that in square 2 we have a unique '7' at row 0, col 7:

  +---------+---------+---------+
  | .  .  1 | 3  8  5 | x  7  y |   (x,y) = (2|6)
  | 6  8  7 | .  1  . | .  9  . |
  | 2  3  5 | 6  9  7 | .  .  1 |
  +---------+---------+---------+
  | 1  .  . | 9  7  3 | .  5  . |
  | .  7  6 | 5  .  8 | 1  3  . |
  | .  5  . | .  6  1 | .  .  . |
  +---------+---------+---------+
  | 7  1  . | 8  .  . | a  .  4 |  (a,b,c) = (3|5|9)
  | .  .  . | 7  .  . | b  1  8 |
  | .  .  . | 1  .  9 | 7  .  c |
  +---------+---------+---------+

Now the tests in "create_inv_n" invalidate illegal positions
due to multiple-blocking and other tests are likely to proceed.

=head2 Y-WING

(This is partially still TODO)

Given this suduku:

# "unsolvable" 3 - Y-Wing
  . . . 8 . . . . 6
  . . 1 6 2 . 4 3 .
  4 . . . 7 1 . . 2
  . . 7 2 . . . 8 .
  . . . . 1 . . . .
  . 1 . . . 6 2 . .
  1 . . 7 3 . . . 4
  . 2 6 . 4 8 1 . .
  3 . . . . 5 . . .

It started backtracking at:

  +---------+---------+---------+
  | .  3  . | 8  5  4 | .  1  6 |      .. .. 29    .. .. ..    79 .. ..
  | .  .  1 | 6  2  9 | 4  3  . |      .. .. ..    .. .. ..    .. .. ..
  | 4  6  . | 3  7  1 | .  .  2 |      .. .. ..    .. .. ..    .. 59 ..
  +---------+---------+---------+
  | .  4  7 | 2  9  3 | .  8  1 |      56 .. ..    .. .. ..    56 .. ..
  | .  .  . | .  1  7 | 3  .  . |      .. .. ..    45 .. ..    .. .. 59
  | .  1  3 | .  8  6 | 2  .  . |      59 .. ..    45 .. ..    .. .. ..
  +---------+---------+---------+
  | 1  .  . | 7  3  2 | .  .  4 |      .. .. ..    .. .. ..    .. .. ..
  | .  2  6 | 9  4  8 | 1  .  3 |      57 .. ..    .. .. ..    .. 57 ..
  | 3  .  4 | 1  6  5 | .  2  . |      .. .. ..    .. .. ..    .. .. ..
  +---------+---------+---------+

The numbers on the right side are showing squares with unique pairs.
Having a look at the columns 7 and 8, we see these pairs (79, 59, and 57)

Let's label these numbers as A, B, and C:

  +---------+---------+---------+
  | .  3  . | 8  5  4 | AC 1  6 |
  | .  .  1 | 6  2  9 | 4  3  . |
  | 4  6  . | 3  7  1 | .  AB 2 |
  +---------+---------+---------+
  | .  4  7 | 2  9  3 | .  8  1 |
  | .  .  . | .  1  7 | 3  .  . |
  | .  1  3 | .  8  6 | 2  .  . |
  +---------+---------+---------+
  | 1  .  . | 7  3  2 | X  .  4 |
  | .  2  6 | 9  4  8 | 1  BC 3 |
  | 3  .  4 | 1  6  5 | X  2  . |
  +---------+---------+---------+

When we now try to fill row 2, column 7 with A or B, we see that at
positions X, a C can't be valid. Either it's blocked via the column
or directly via the last square. Thus we can eliminate digit 7 from
positions X.

=head2 TODO

  # daily sudoku wed 28-dec-2005, very hard
  # backtracking
  ...52.63.
  .5.....7.
  9....8..2
  .17..4...
  .9.....6.
  ...8..31.
  1..6....5
  .4.....9.
  .86.95...

This one starts backtracking early. The '6' is an 'X-Wing' like
configuration (col 1 and row 2 with a common corner have just 2
possible positions, just one is valid, when you try both).
The same happens a bit later with '9'.

  +---------+---------+---------+
  | .  7  . | 5  2  . | 6  3  . |    666 666 666
  | .  5  . | .  .  . | .  7  . |    .66 6.. 666
  | 9  .  . | .  .  8 | .  .  2 |    6.6 6.6 666
  +---------+---------+---------+
  | .  1  7 | .  .  4 | .  .  . |    .66 6.6 666
  | .  9  . | .  .  . | .  6  . |    666 666 666
  | .  .  . | 8  .  . | 3  1  . |    ..6 6.. 666
  +---------+---------+---------+
  | 1  .  9 | 6  .  . | .  .  5 |    666 666 666
  | .  4  . | .  .  . | .  9  6 |    666 666 666
  | .  8  6 | .  9  5 | .  .  3 |    666 666 666
  +---------+---------+---------+

Here is starts backtracking. A possible improvement would be:

  - detect such digit configuration
  - only backtrack try this digit ('6') above

=head2 TODO deadly square

See also std331.sud

=head2 TODO Generalization

A Sudoku has 2 dimensions and 3 connected views (row, column, and
square). There are 1-dim tests, which work for all views. 2-dim tests
are a bit more tricky to generalize and not yet done properly.

Basically: as only 2 views are independent, all these tests can
work on 2 of 3 views:

  square, row
  square, column
  row, columm

Now the problem is, how to generalize the possible other direction.
Let's call it the 'neighbour'. A neighbour is always 'towards' the
second view. A row has 9 column neighbours and 3
square neighbours. A square has 3 row and 3 column neighbours.
(Maybe neighbour is a bad term as it does contain itself).

C<scan_dbl> can now easily be reviewed and generalized:

For all neighbours (n): If in the view (v0) a digit is valid in only
one of (n)'s views: giving (v1), this digit is invalid in the
complement of the intersection (v0 & v1).

NB: it seems to be simpler to just hack the code as to utter the
idea in $human_lang.

This is trivial if these views are (row, column) as the intersection
is just one point, but it is the generalization of the 'inv_1' code.

Another example of a 2-dim test is of course Y-Wing.

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
