# Copyright (C) 2005-2006, The Perl Foundation.

=head1 NAME

JSON (JavaScript Object Notation) is a lightweight data-interchange format.

=head1 SYNOPSIS

Given a valid JSON string, the compiler will return a PMC containing the
appropriate values. For example:

 .local pmc JSON
 JSON = compreg 'JSON'
 $P0 = JSON('[1,2,3]')

Will create a pmc that C<does> array, contains the values 1, 2, and 3, and 
store it in register C<$P0>.

For more information about the structure of the JSON representation, see the
documentation at L<http://www.json.org/>.

=cut

.namespace [ 'JSON' ]

.sub '__onload' :load
    load_bytecode 'PGE.pbc'
    load_bytecode 'PGE/Util.pbc'
    load_bytecode 'TGE.pbc'

    load_bytecode 'compilers/json/JSON/grammar.pbc'
    load_bytecode 'compilers/json/JSON/pge2pir.pbc'

    $P1 = get_global '__compiler'
    compreg "JSON", $P1

    $P1 = new .Hash
    $P1['\"'] = '"'
    $P1['\\'] = "\\"
    $P1['\/'] = '/'
    $P1['\b'] = "\b"
    $P1['\f'] = "\f"
    $P1['\n'] = "\n"
    $P1['\r'] = "\r"
    $P1['\t'] = "\t"

    set_root_global [ 'JSON' ], '$escapes', $P1
.end

.sub '__compiler'
    .param string json_string

   .local pmc parse, match
   parse = get_root_global ['parrot'; 'JSON'], 'thing'

   $P0 = get_root_global ['parrot'; 'PGE::Match'], 'newfrom'
   match = $P0(json_string)
   match.to(0)
   match = parse(match)
   unless match goto failed

   .local pmc pirgrammar, pirbuilder, pir
   pirgrammar = new 'JSON::PIR'
   pirbuilder = pirgrammar.apply(match)
   pir = pirbuilder.get('result')
   
   .local pmc pirc, result
   pirc = compreg "PIR"
   result = pirc(pir) 
   .return result()

  failed:
   P0 = new .Exception
   P0[0] = "invalid JSON value"
   throw P0
.end
