#!/usr/bin/env parrot-nqp

# Testing of basic document structures

pir::load_bytecode("lib/YAML/Tiny.pbc");
pir::load_bytecode("t/lib/Test.pbc");


#####################################################################
# Sample Testing

# Test a completely empty document
yaml_ok(
	'',
	[  ],
	'empty',
);

# Just a newline
### YAML.pm has a bug where it dies on a single newline
yaml_ok(
	"\n\n",
	[ ],
	'only_newlines',
);

# Just a comment
yaml_ok(
	"# comment\n",
	[ ],
	'only_comment',
);

# Empty documents
yaml_ok(
	"---\n",
	[ undef ],
	'only_header',
	noyamlperl => 1,
);
yaml_ok(
	"---\n---\n",
	[ undef, undef ],
	'two_header',
	noyamlperl => 1,
);
yaml_ok(
	"--- ~\n",
	[ undef ],
	'one_undef',
	noyamlperl => 1,
);
yaml_ok(
	"---  ~\n",
	[ undef ],
	'one_undef2',
	noyamlperl => 1,
);
yaml_ok(
	"--- ~\n---\n",
	[ undef, undef ],
	'two_undef',
	noyamlperl => 1,
);

# Just a scalar
yaml_ok(
	"--- foo\n",
	[ 'foo' ],
	'one_scalar',
);
yaml_ok(
	"---  foo\n",
	[ 'foo' ],
	'one_scalar2',
);
yaml_ok(
	"--- foo\n--- bar\n",
	[ 'foo', 'bar' ],
	'two_scalar',
	noyamlperl => 1,
);

# Simple lists
yaml_ok(
	"---\n- foo\n",
	[ [ 'foo' ] ],
	'one_list1',
);
yaml_ok(
	"---\n- foo\n- bar\n",
	[ [ 'foo', 'bar' ] ],
	'one_list2',
);
yaml_ok(
	"---\n- ~\n- bar\n",
	[ [ undef, 'bar' ] ],
	'one_listundef',
	noyamlperl => 1,
);

# Simple hashs
yaml_ok(
	"---\nfoo: bar\n",
	[ hash( foo => 'bar' ) ],
	'one_hash1',
);

yaml_ok(
	"---\nfoo: bar\nthis: ~\n",
	[ hash(this => undef, foo => 'bar') ],
 	'one_hash2',
	noyamlperl => 1,
    todo => 1,
);

# Simple array inside a hash with an undef
yaml_ok(
	q{---
foo:
  - bar
  - ~
  - baz
},
	[ hash(foo => [ 'bar', undef, 'baz' ]) ],
	'array_in_hash',
	noyamlperl => 1,
);

# Simple hash inside a hash with an undef
yaml_ok(
	q{---
foo: ~
bar:
  foo: bar
},
	[ hash(foo => undef, bar => hash(foo => 'bar' )) ],
	'hash_in_hash',
	noyamlperl => 1,
    todo => 1,
);

# Mixed hash and scalars inside an array
yaml_ok(
	q{---
-
  foo: ~
  this: that
- foo
- ~
-
  foo: bar
  this: that
},
	[ [
		hash( foo => undef, this => 'that' ),
		'foo',
		undef,
		hash( foo => 'bar', this => 'that' ),
	] ],
	'hash_in_array',
	noyamlperl => 1,
    todo => 1,
);

# Simple single quote
yaml_ok(
	"---\n- 'foo'\n",
	[ [ 'foo' ] ],
	'single_quote1',
    todo => 1,
);
yaml_ok(
	"---\n- '  '\n",
	[ [ '  ' ] ],
	'single_spaces',
    todo => 1,
);
yaml_ok(
	"---\n- ''\n",
	[ [ '' ] ],
	'single_null',
    todo => 1,
);

# Double quotes
yaml_ok(
	"--- \"  \"\n",
	[ '  ' ],
	"only_spaces",
	noyamlpm   => 1,
	noyamlperl => 1,
    todo => 1,
);

yaml_ok(
	"--- \"  foo\"\n--- \"bar  \"\n",
	[ "  foo", "bar  " ],
	"leading_trailing_spaces",
	noyamlpm   => 1,
	noyamlperl => 1,
    todo => 1,
);

# Implicit document start
yaml_ok(
	"foo: bar\n",
	[ hash( foo => 'bar' ) ],
	'implicit_hash',
);
yaml_ok(
	"- foo\n",
	[ [ 'foo' ] ],
	'implicit_array',
);

# Inline nested hash
###yaml_ok(
###	q{
###---
###- ~
###- foo: bar
###  this: that
###- baz
###},
###	[ [ undef, hash( foo => 'bar', this => 'that' ), 'baz' ] ],
###	'inline_nested_hash',
###	noyamlperl => 1,
###    todo => 1,
###);

# Empty comments
yaml_ok(
	"---\n- foo\n#\n- bar\n",
	[ [ 'foo', 'bar' ] ],
	'empty_comment_in_list',
);

yaml_ok(
	"---\nfoo: bar\n# foo\none: two\n",
	[ hash( foo => 'bar', one => 'two' ) ],
	'empty_comment_in_hash',
);

# Complex keys
#yaml_ok(
#	"---\na b: c d\n",
#	[ { 'a b' => 'c d' } ],
#	'key_with_whitespace',
#);

done_testing();

