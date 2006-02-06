#
#
#	Lexer module
#

package Lua::parser;

use strict;

#use Math::BigFloat;

sub Error {
	my $parser = shift;
	my ($msg) = @_;

	$msg ||= "Syntax error.\n";

	if (exists $parser->YYData->{nb_error}) {
		$parser->YYData->{nb_error} ++;
	} else {
		$parser->YYData->{nb_error} = 1;
	}

	print STDOUT 'lua: ',$parser->YYData->{srcname},':',$parser->YYData->{lineno},': ',$msg
			if (		exists $parser->YYData->{verbose_error}
					and $parser->YYData->{verbose_error});
}

sub Warning {
	my $parser = shift;
	my ($msg) = @_;

	$msg ||= ".\n";

	if (exists $parser->YYData->{nb_warning}) {
		$parser->YYData->{nb_warning} ++;
	} else {
		$parser->YYData->{nb_warning} = 1;
	}

	print STDOUT 'lua: ',$parser->YYData->{srcname},':',$parser->YYData->{lineno},': ',$msg
			if (		exists $parser->YYData->{verbose_warning}
					and $parser->YYData->{verbose_warning});
}

sub Info {
	my $parser = shift;
	my ($msg) = @_;

	$msg ||= ".\n";

	if (exists $parser->YYData->{nb_info}) {
		$parser->YYData->{nb_info} ++;
	} else {
		$parser->YYData->{nb_info} = 1;
	}

	print STDOUT 'lua: ',$parser->YYData->{srcname},':',$parser->YYData->{lineno},': ',$msg
			if (		exists $parser->YYData->{verbose_info}
					and $parser->YYData->{verbose_info});
}

sub _DoubleQuoteStringLexer {
	my $parser = shift;
	my $str = '';
	my $type = 'LITERAL';

	while ($parser->YYData->{INPUT}) {

		for ($parser->YYData->{INPUT}) {

			s/^\"//
				and return ($type, $str);

			s/^([^"\\]+)//
				and $str .= $1,
				    last;

			s/^\\([\\"'\[\]])//
				and $str .= $1,		#  backslash, quotation mark, apostrophe, square bracket
				    last;
			s/^\\a//
				and $str .= "\a",	# bell
				    last;
			s/^\\b//
				and $str .= "\b",	# backspace
				    last;
			s/^\\f//
				and $str .= "\f",	# form feed
				    last;
			s/^\\n//
				and $str .= "\n",	# new line
				    last;
			s/^\\r//
				and $str .= "\r",	# carriage return
				    last;
			s/^\\t//
				and $str .= "\t",	# horizontal tab
				    last;
			s/^\\v//
				and $str .= "\x0b",	# vertical tab
				    last;
			s/^\\([0-9]{1,3})//
				and $str .= chr $1,
				    last;

			s/^\\//
				and $parser->Error("Invalid escape sequence $_ .\n"),
				    last;
		}
	}

	$parser->Error("Untermined string.\n");
	$parser->YYData->{lineno} ++;
	return ($type, $str);
}

sub _SingleQuoteStringLexer {
	my $parser = shift;
	my $str = '';
	my $type = 'LITERAL';

	while ($parser->YYData->{INPUT}) {

		for ($parser->YYData->{INPUT}) {

			s/^'//
				and return ($type, $str);

			s/^([^'\\]+)//
				and $str .= $1,
				    last;

			s/^\\([\\"'\[\]])//
				and $str .= $1,		#  backslash, quotation mark, apostrophe, square bracket
				    last;
			s/^\\a//
				and $str .= "\a",	# bell
				    last;
			s/^\\b//
				and $str .= "\b",	# backspace
				    last;
			s/^\\f//
				and $str .= "\f",	# form feed
				    last;
			s/^\\n//
				and $str .= "\n",	# new line
				    last;
			s/^\\r//
				and $str .= "\r",	# carriage return
				    last;
			s/^\\t//
				and $str .= "\t",	# horizontal tab
				    last;
			s/^\\v//
				and $str .= "\x0b",	# vertical tab
				    last;
			s/^\\([0-9]{1,3})//
				and $str .= chr $1,
				    last;

			s/^\\//
				and $parser->Error("Invalid escape sequence $_ .\n"),
				    last;
		}
	}

	$parser->Error("Untermined string.\n");
	$parser->YYData->{lineno} ++;
	return ($type, $str);
}

sub _LongStringLexer {
	my $parser = shift;
	my $str = '';
	my $type = 'LITERAL';

	$_ = $parser->YYData->{INPUT};
	s/^\n//
			and $parser->YYData->{lineno} ++;

	while (1) {
	        $parser->YYData->{INPUT}
		or  $parser->YYData->{INPUT} = readline $parser->YYData->{fh}
		or  last;

		for ($parser->YYData->{INPUT}) {

			s/^(\n)//
				and $parser->YYData->{lineno} ++,
				    $str .= $1;
				    last;

			s/^\]\]//
				and return ($type, $str);

			s/^(.)//
				and $str .= $1,
				    last;
		}
	}

	$parser->Error("Untermined raw string.\n");
	$parser->YYData->{lineno} ++;
	return ($type, $str);
}

sub _Identifier {
	my $parser = shift;
	my ($idf) = @_;

	if (exists $parser->YYData->{keyword}{$idf}) {
		return ($parser->YYData->{keyword}{$idf}, $idf);
	}
	return ('NAME', $idf);
}

sub _LongCommentLexer {
	my $parser = shift;

	while (1) {
	        $parser->YYData->{INPUT}
		or  $parser->YYData->{INPUT} = readline $parser->YYData->{fh}
		or  return;

		for ($parser->YYData->{INPUT}) {
			s/^\n//
					and $parser->YYData->{lineno} ++,
					last;
			s/^\]\]//
					and return;
			s/^.//
					and last;
		}
	}
}

sub _Lexer {
	my $parser = shift;

	while (1) {
	        $parser->YYData->{INPUT}
		or  $parser->YYData->{INPUT} = readline $parser->YYData->{fh}
		or  return ('', undef);

		for ($parser->YYData->{INPUT}) {

			if ($parser->YYData->{shebang}) {
				$parser->YYData->{shebang} = undef;
				s/^#(.*)\n//									# Shebang
						and $parser->YYData->{lineno} ++,
						    last;
			}

			s/^[ \r\t\f\013]+//;							# Whitespace
			s/^\n//
					and $parser->YYData->{lineno} ++,
					    last;

			s/^\-\-\[\[//										# LongComment
					and $parser->_LongCommentLexer(),
					    last;
			s/^\-\-(.*)\n//									# ShortComment
					and $parser->YYData->{lineno} ++,
					    last;

			s/^(\d+(\.\d*)?|\.\d+)([Ee][+\-]?\d+)?//
#					and return ('NUMBER', new Math::BigFloat($1));
					and return ('NUMBER', $1);

			s/^\"//
					and return $parser->_DoubleQuoteStringLexer();

			s/^\'//
					and return $parser->_SingleQuoteStringLexer();

			s/^\[\[//
					and return $parser->_LongStringLexer();

			s/^([A-Z_a-z][0-9A-Z_a-z]*)//
					and return $parser->_Identifier($1);

			s/^(\.\.\.)//
					and return ($1, $1);
			s/^(\.\.)//
					and return ($1, $1);
			s/^(<=)//
					and return ($1, $1);
			s/^(>=)//
					and return ($1, $1);
			s/^(==)//
					and return ($1, $1);
			s/^(~=)//
					and return ($1, $1);

			s/^([\{\}\(\)\[\]\.;,<>\+\-\*\/\^:=])//
					and return ($1, $1);						# punctuator

			s/^([\S]+)//
					and $parser->Error("lexer error $1.\n"),
					    last;
		}
	}
}

sub _InitLexico {
	my $parser = shift;

	my %keywords = (
		'and'			=>	'AND',
		'break'			=>	'BREAK',
		'do'			=>	'DO',
		'else'			=>	'ELSE',
		'elseif'		=>	'ELSEIF',
		'end'			=>	'END',
		'false'			=>	'FALSE',
		'for'			=>	'FOR',
		'function'		=>	'FUNCTION',
		'if'			=>	'IF',
		'in'			=>	'IN',
		'local'			=>	'LOCAL',
		'nil'			=>	'NIL',
		'not'			=>	'NOT',
		'or'			=>	'OR',
		'repeat'		=>	'REPEAT',
		'return'		=>	'RETURN',
		'then'			=>	'THEN',
		'true'			=>	'TRUE',
		'until'			=>	'UNTIL',
		'while'			=>	'WHILE',
	);

	$parser->YYData->{keyword} = \%keywords;
}

1;


