# Copyright (C) 2005-2011, Parrot Foundation.

=head1 NAME

data_json - parse JSON, a lightweight data-interchange format.

=head1 SYNOPSIS

Given a valid JSON (JavaScript Object Notation) string, the compiler will
return a sub that when called will produce the appropriate values.  For
example:

    .local pmc json, code, result

    load_language 'data_json'
    json   = compreg 'data_json'

    code   = json.'compile'('[1,2,3]')
    result = code()

    load_bytecode 'dumper.pbc'
    _dumper( result, 'array' )

will create a PMC that C<does> C<array> containing the values 1, 2, and 3,
and store it in the C<result>.

For more information about the structure of the JSON representation, see
the documentation at L<http://www.json.org/>.

=cut

.HLL 'data_json'

.sub '__onload' :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'TGE.pbc'

    $P1 = newclass ['JSON'; 'Compiler']
    $P2 = new $P1
    compreg 'data_json', $P2

    $P1 = new 'Hash'
    $P1['\"'] = '"'
    $P1['\\'] = "\\"
    $P1['\/'] = '/'
    $P1['\b'] = "\b"
    $P1['\f'] = "\f"
    $P1['\n'] = "\n"
    $P1['\r'] = "\r"
    $P1['\t'] = "\t"

    set_root_global ['parrot'; 'data_json'], '$escapes', $P1
.end


.namespace ['JSON';'Compiler']

.sub 'compile' :method
    .param string json_string
    .param pmc    opts :slurpy :named

    .local pmc parse, match
    parse = get_root_global ['parrot'; 'JSON'], 'value'

    $P0 = get_root_global ['parrot'; 'PGE'], 'Match'
    match = $P0.'new'(json_string)
    match.'to'(0)
    match = parse(match)
    unless match goto failed

    .local pmc pirgrammar, pirbuilder, pir
    pirgrammar = new ['JSON'; 'PIR']
    pirbuilder = pirgrammar.'apply'(match)
    pir = pirbuilder.'get'('result')

    $I0 = exists opts['target']
    unless $I0 goto no_targ
        $S0 = opts['target']
        unless $S0 == 'pir' goto not_pir
            .return (pir)
        not_pir:
    no_targ:

    .local pmc pirc, result
    pirc = compreg 'PIR'
    result = pirc(pir)
    result = result.'main_sub'()
    .return (result)

  failed:
    $P0 = new 'Exception'
    $P0[0] = "Invalid JSON value"
    throw $P0
.end


.HLL 'parrot'

.sub unique_pmc_reg
    $P0 = get_root_global ['parrot';'PGE';'Util'], 'unique'
    $I0 = $P0()
    $S0 = $I0
    $S0 = concat "$P", $S0
    .return ($S0)
.end

.sub appendln
    .param pmc sb
    .param string line
    push sb, line
    push sb, "\n"
.end

.sub 'sprintf'
    .param string fmt
    .param pmc args :slurpy
    $S0 = sprintf fmt, args
    .return ($S0)
.end

.include 'compilers/data_json/data_json/grammar.pir'
.include 'compilers/data_json/data_json/pge2pir.pir'


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
