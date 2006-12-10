# $Id$

# steal builtins from Perl6
# TODO: put that into php_builtins.pir
.sub 'print'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new .Iterator, list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop

  iter_end:
    .return (1)
.end

# steal builtins from Perl6
# TODO: put that into php_builtins.pir
.sub 'echo'
    .param pmc list            :slurpy
    .local pmc iter

    iter = new .Iterator, list
  iter_loop:
    unless iter goto iter_end
    $P0 = shift iter
    print $P0
    goto iter_loop

  iter_end:
    .return (1)
.end

.sub 'prefix:-'
    .param pmc a

    $N0 = a
    $N0 = neg $N0

    .return ($N0)
.end


.sub 'infix:<'
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = islt $I0, 0

    .return ($I0)
.end


.sub 'infix:<='
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = isle $I0, 0

    .return ($I0)
.end

.sub 'infix:==' 
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = iseq $I0, 0

    .return ($I0)
.end

.sub 'infix:!='
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = isne $I0, 0

    .return ($I0)
.end

.sub 'infix:eq' 
    .param pmc a
    .param pmc b

    $I0 = cmp_str a, b
    $I0 = iseq $I0, 0

    .return ($I0)
.end

.sub 'infix:ne'
    .param pmc a
    .param pmc b

    $I0 = cmp_str a, b
    $I0 = isne $I0, 0

    .return ($I0)
.end

.sub 'infix:>='
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = isge $I0, 0

    .return ($I0)
.end


.sub 'infix:>'
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = isgt $I0, 0

    .return ($I0)
.end


.sub 'infix:!='
    .param pmc a
    .param pmc b

    $I0 = cmp_num a, b
    $I0 = isne $I0, 0

    .return ($I0)
.end

.sub 'infix:.' :multi( PMC, PMC )
    .param pmc a
    .param pmc b

    $P0 = concat a, b

    .return ($P0)
.end

.sub 'infix:.' :multi( PMC, String )
    .param pmc a
    .param string b

    .local pmc c
    c = new .String
    c = concat a, b
    #c = 'multi PMC, String'

    .return (c)
.end

.sub 'infix:.' :multi( PMC )
    .param pmc a

    .return (a)
.end

.sub 'infix:.' :multi( String, PMC )
    .param string a
    .param pmc b

    # $P0 = concat a, b
    $P0 = 'multi String, PMC'

    .return ($P0)
.end

.sub 'infix:|'
    .param int a
    .param int b

    $I0 = bor a, b

    .return ($I0)
.end

.sub 'infix:&'
    .param int a
    .param int b

    $I0 = band a, b

    .return ($I0)
.end

.sub 'error_reporting'
  .return()
.end

# For now, only plain old CGI is supported
# Lie about the 'fcgi', in order to keep in line with the reference implementation
.sub 'php_sapi_name'
  .return( 'cgi-fcgi' )
.end

.include "library/dumper.pir"
.include "cclass.pasm"

# TODO: pass in indent_level, proper escaping
.sub var_dump
    .param pmc a

    .local string type_of_pmc
    type_of_pmc = typeof a

    ne type_of_pmc, 'String', not_a_string
        .local int string_len

        string_len = elements a
        print 'string('
        print string_len
        print ') "'
        print a
        print '"'
        say ''

       .return()

not_a_string:

    ne type_of_pmc, 'Hash', not_a_hash

        .local int num_elements
	num_elements = elements a
        string_len = elements a
        print 'array('
        print num_elements
        say ') {'

        .local pmc    iter, val
	.local string indent, key 
	.local int    key_starts_with_digit
	indent = '  '
        new iter, .Iterator, a
        set iter, 0
iter_loop:
    unless iter, iter_end
        shift key, iter
        # TODO: ugly workaround as Hash keys are stringified
        key_starts_with_digit = is_cclass .CCLASS_NUMERIC, key, 0
	print indent
	print '['
	if key_starts_with_digit goto key_is_an_integer_1 
	    print '"'
key_is_an_integer_1: 
	print key
	if key_starts_with_digit goto key_is_an_integer_2 
	    print '"'
key_is_an_integer_2: 
	say ']=>'
	print indent
	val = a[key]
	var_dump(val)

        branch iter_loop
iter_end:


        say '}'
       .return()

not_a_hash:

    ne type_of_pmc, 'Integer', not_a_integer

        print 'int('
        print a
        say ')'

       .return()

not_a_integer:

    _dumper(a)

    .return()
.end
