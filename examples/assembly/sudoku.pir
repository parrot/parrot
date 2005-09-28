=pod

=head1 TITLE

Sudoku - A sudoku solver

=head1 OVERVIEW

This program implements scanning and blocked rows or columns invalidation.
It does not consider all effects of multiple number blocking, where a
combination of invalid numbers blocks a row or column. In such cases a
simple backtracking algorithm continues to solve the sudoku.

=head1 SYNOPSIS

  parrot -Ot sudoku.pir [--options] [file]

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

The program uses Getopt/Long and the ncurses library.

=item Exception handling

To turn off ncurses just in case.

=back

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

.sub _main @MAIN
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
    push_eh nc_stop

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
    tries = new .ResizablePMCArray
    all = getattribute self, "all"
    push tries, all
    $I0 = self."back_track"(tries)
    if $I0 == 2 goto fin
    disp."print"("failed\n")
    goto nc_stop
err:
    printerr "inconsistent start\n"
    self."end_display"()
    die 1
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
    io = open file_name, "<"
    $I0 = defined io
    unless $I0 goto err
loop:
    line = readline io
    unless io goto done
    c = line[0]
    if c == '#' goto loop
    len = length line
    i = 0
lp2:
    c = line[i]
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
    die 1
.end

# get commandline options
.sub parse_options
    .param pmc argv

    .local string prog
    prog = shift argv
    load_bytecode "Getopt/Long.pbc"
    .local pmc get_options, opt_spec, opt
    find_global get_options, "Getopt::Long", "get_options"
    opt_spec = new ResizableStringArray
    # --version, --debug, --inv=nnn, --builtin=name, --nc, --help
    push opt_spec, "version"
    push opt_spec, "debug"
    push opt_spec, "inv=s"
    push opt_spec, "builtin=s"
    push opt_spec, "nc"
    push opt_spec, "help"
    opt = get_options(argv, opt_spec)
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
    new it, .Iterator, b
    it = .ITERATE_FROM_START
loop:
    unless it goto fin
    $S0 = shift it
    print_item $S0
    goto loop
fin:
    print_newline
    end

sel_name:
    $I0 = exists b[name]
    if $I0 goto ok
	printerr "no such builtin: '"
	printerr name
	printerr "'\n"
	die 1
ok:
    $S0 = b[name]
    .return ($S0)
.end

.sub get_builtins
    .local pmc b
    .local string raw_given
    b = new Hash

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

    # wikipedia - the smallest (17 given) known sudoku
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

# make sure the game is valid
.sub verify_input
    .param string raw
    .local int i, c
    i = length raw
    if i != 81 goto len_err
    .local pmc ar
    ar = new .FixedIntegerArray
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
    $S0 = raw[i]
    printerr $S0
    printerr "\n"
    die 1

len_err:
    printerr "length != 81\n"
    die
.end

#
# game methods
#

.namespace ["Sudoku"]

# return true if we single-step
.sub "step" method
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
.sub "debug" method
    .local pmc opt
    opt = getattribute self, "opt"
    $I0 = defined opt['debug']
    .return ($I0)
.end

# create 9x9 LoL
.sub create_1 method
    .param string what
    .local pmc rcss, rcs, all

    rcss = new .FixedPMCArray
    rcss = 9
    setattribute self, what, rcss
    all = getattribute self, "all"
    all[what] = rcss

    .local int y
    # create arrays
    y = 0
ly1:
    rcs = new .FixedPMCArray
    rcs = 9
    rcss[y] = rcs
    inc y
    if y < 9 goto ly1
.end

# create all arrays
.sub create method
    .param pmc ar
    .local int x, y, p, c

    .local pmc cols, rows, sqrs, e, col, row, sqr, all
    .local pmc i_cols, i_rows, i_sqrs, i_col, i_row, i_sqr, inv
    setattribute self, "orig", ar
    all = new Hash
    setattribute self, "all", all
    self.create_1("rows")
    self.create_1("cols")
    self.create_1("sqrs")
    self.create_1("i_rows")
    self.create_1("i_cols")
    self.create_1("i_sqrs")

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
    e = new .Integer
    e = c
    inv = new .Integer

    # set row
    row = rows[y]
    i_row = i_rows[y]
    row[x] = e
    i_row[x] = inv

    # set col
    $I0 = p % 9
    col = cols[$I0]
    i_col = i_cols[$I0]
    $I1 = p / 9
    col[$I1] = e
    i_col[$I1] = inv

    # set square
    $I0 = x / 3
    $I1 = y / 3
    $I1 *= 3
    $I2 = $I0 + $I1
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
.sub display method
    .local pmc ar, rows, row, opt, disp
    .local string s, c
    .local int i, x, y, c1, c2, r
    .local string deb_n
    deb_n = ""  # print inv for that
    opt = getattribute self, "opt"
    disp = getattribute self, "disp"
    $I0 = defined opt["inv"]
    unless $I0 goto no_deb
	deb_n = opt["inv"]
no_deb:
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
    unless deb_n goto not_deb
    self."create_inv"()
    self."deb_inv"(y, deb_n)
not_deb:
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
    die
.end

# print invalid for given row and number(s)
.sub deb_inv method
    .param int y
    .param string ns

    .local pmc invs, inv
    .local int b, x, c, i, len, n
    i = 0
    len = length ns
lp_inv:
    $S0 = ns[i]
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


# verify numbers
# returns:
#   0 ... failure
#   1 ... ok
#   2 ... finished

.sub verify method
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
.sub verify_1 method
    .param pmc rcss

    .local int x, y, result
    .local pmc one, e, seen, s
    result = 2         # finished
    y = 0
lpy:
    one = rcss[y]
    seen = new .Hash
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
    new it, .Iterator, seen
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
.sub create_inv method
    .local pmc rcss, i_rcss
    rcss = getattribute self, "rows"
    i_rcss =  getattribute self, "i_rows"
    self."create_inv_1"(rcss, i_rcss)
    rcss = getattribute self, "cols"
    i_rcss =  getattribute self, "i_cols"
    self."create_inv_1"(rcss, i_rcss)
    rcss = getattribute self, "sqrs"
    i_rcss =  getattribute self, "i_sqrs"
    self."create_inv_1"(rcss, i_rcss)
.end

# create row, cols, or sqrs of invalid numbers
# one bit per invalid

.sub create_inv_1 method
    .param pmc ars
    .param pmc invs
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
    inc y
    if y < 9 goto lpy
.end

# return 1 if row/col/sqr contains num n
.sub contains method
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
.sub solve method
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
    .return ($I0)
err:
    $I0 = self."debug"()
    unless $I0 goto nd
    print "mismatch\n"
nd:
    .return (0)
.end

# scan for forced numbers
# returns
# -1 ... err
# 0  ... no change
# 1  ... changes
.sub scan method
    .local int any, y, x, m
    any = 0
    .local pmc rcss, i_rcss
    rcss = getattribute self, "rows"
    i_rcss = getattribute self, "i_rows"
    $I0 = self."scan_1"(rcss, i_rcss, "rows")
    if $I0 == -1 goto err
    any |= $I0
    rcss = getattribute self, "cols"
    i_rcss = getattribute self, "i_cols"
    $I0 = self."scan_1"(rcss, i_rcss, "cols")
    if $I0 == -1 goto err
    any |= $I0
    rcss = getattribute self, "sqrs"
    i_rcss = getattribute self, "i_sqrs"
    $I0 = self."scan_1"(rcss, i_rcss, "sqrs")
    if $I0 == -1 goto err
    any |= $I0
    $I0 = self."step"()
    unless $I0 goto nd
    self."display"()
nd:
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

# the quare y has a uniq digit at x - set it
.sub set_uniq method
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
.sub scan_1 method
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
	print n
	print_newline
nxt_n:
    inc n
    if n <= 9 goto lpn
    inc y
    if y < 9 goto lpy
    .return (any)
err:
    .return (-1)
.end

# check for blocked rows or colums
# returns
# 0  ... no change
# 1  ... changes
.sub scan_blocked method
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
    rbl = 7         # blocked is reset per sqare row/col
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
.sub "inv_row" method
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
.sub "inv_col" method
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
.sub "inv_rc" method
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
    $I0 = x / 3		# skip this square
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
	print n
	print_newline
ret:
    .return (any)
.end

# check that pmcs in rows, cols and sqrs are the same
.sub sanity_check method
    .local pmc rows, cols
    rows = getattribute self, "rows"
    cols = getattribute self, "cols"
    self."sanity_check_rc"(rows, cols)
    rows = getattribute self, "i_rows"
    cols = getattribute self, "i_cols"
    self."sanity_check_rc"(rows, cols)
.end

.sub sanity_check_rc method
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
    die 1
ok:
    inc x
    if x < 9 goto lpx
    inc y
    if y < 9 goto lpy
.end

# backtrack progress
.sub progress method
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
.sub back_track method
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
    all = thaw state		# restore state
    self.set_attrs(all)         # set attributes to this state
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
# used for backtacking
# if m == 1 this is a forced uniq position
.sub best_pos method
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

.sub set_attrs method
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
.sub new_display method
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

.sub end_display method
    .local pmc opt
    opt = getattribute self, "opt"
    $I0 = defined opt["nc"]
    unless $I0 goto out
    nc_end()
out:
.end

.namespace ["Dummy"]

.sub "print" @MULTI(_, int, int, string), method
    .param int r
    .param int c
    .param string s
    print s
.end

.sub "print" @MULTI(_, string), method
    .param string s
    print s
.end

.sub "print" @MULTI(_, int), method
    .param int s
    print s
.end

.sub wait
.end

.namespace ["NCurses"]

# TODO remember last position, parse newlines to increment row
# this should better be all in a new library

.sub "print" @MULTI(_, int, int, string), method
    .param int r
    .param int c
    .param string s
    .local pmc win, f

    win = getattribute self, "win"
    f = global "ncurses::mvwaddstr"
    f(win, r, c, s)
.end

.sub "print" @MULTI(_, string), method
    .param string s
    .local pmc win, f

    win = getattribute self, "win"
    f = global "ncurses::waddstr"
    f(win, s)
.end

.sub "print" @MULTI(_, int), method
    .param int i
    .local string s
    .local pmc win, f

    s = i
    win = getattribute self, "win"
    f = global "ncurses::waddstr"
    f(win, s)
.end

.sub wait
    .local pmc f
    .local int key
    f = global "ncurses::getch"
    key = f()
.end

.namespace [""]
# ncurses support

.sub nc_start
    .local pmc stdscr
    load_bytecode "library/ncurses.pasm"
    stdscr = _init_curses()
    .return(stdscr)
.end

.sub nc_end
    .local pmc endwin, curs_set
    curs_set = global "ncurses::curs_set"
    curs_set(1)
    endwin = global "ncurses::endwin"
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
    INITSCR     = global "ncurses::initscr"
    START_COLOR = global "ncurses::start_color"
    INIT_PAIR   = global "ncurses::init_pair"
    COLOR_PAIR  = global "ncurses::COLOR_PAIR"
    WATTRON     = global "ncurses::wattron"
    CURS_SET    = global "ncurses::curs_set"
    NODELAY     = global "ncurses::nodelay"
    KEYPAD      = global "ncurses::keypad"
    STDSCR = INITSCR()
    START_COLOR()
    # Color pair 1, dark green fg, black background
    INIT_PAIR(1, 2, 0)
    $I0 = COLOR_PAIR(1)
    # We pass what's returned from COLOR_PAIR straight on
    ## WATTRON($I0)
    CURS_SET(0)			# turn off cursor
    ## NODELAY(STDSCR, 1)	# set nodelay mode
    ## KEYPAD(STDSCR, 1)	# set keypad mode
    .return(STDSCR)
.end

# vim: ft=imc sw=4:
