####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package Lua::parser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;

#line 1 "src\yapp\Lua\lua51.yp"

# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$


sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'' => -6,
			'NAME' => -6,
			'REPEAT' => -6,
			'BREAK' => -6,
			'FOR' => -6,
			"(" => -6,
			'RETURN' => -6,
			'IF' => -6,
			'FUNCTION' => -6,
			'error' => 2,
			'DO' => -6,
			'LOCAL' => -6,
			'WHILE' => -6
		},
		GOTOS => {
			'_stat' => 1,
			'chunk' => 3,
			'program' => 4
		}
	},
	{#State 1
		ACTIONS => {
			'NAME' => 18,
			'REPEAT' => 6,
			'BREAK' => 5,
			'FOR' => 7,
			"(" => 20,
			'RETURN' => 10,
			'IF' => 11,
			'FUNCTION' => 13,
			'DO' => 21,
			'LOCAL' => 16,
			'WHILE' => 17
		},
		DEFAULT => -4,
		GOTOS => {
			'functioncall' => 9,
			'var' => 12,
			'laststat' => 8,
			'_if_then' => 15,
			'varlist1' => 14,
			'stat' => 19
		}
	},
	{#State 2
		DEFAULT => -2
	},
	{#State 3
		DEFAULT => -1
	},
	{#State 4
		ACTIONS => {
			'' => 22
		}
	},
	{#State 5
		DEFAULT => -39
	},
	{#State 6
		DEFAULT => -16,
		GOTOS => {
			'@3-1' => 23
		}
	},
	{#State 7
		ACTIONS => {
			'NAME' => 24
		},
		GOTOS => {
			'namelist' => 25
		}
	},
	{#State 8
		ACTIONS => {
			";" => 26
		},
		DEFAULT => -8,
		GOTOS => {
			'_semicolon_opt' => 27
		}
	},
	{#State 9
		ACTIONS => {
			":" => 28,
			'STRING' => 30,
			"[" => 33,
			"{" => 34,
			"(" => 35,
			"." => 36
		},
		DEFAULT => -11,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 29,
			'key' => 31
		}
	},
	{#State 10
		ACTIONS => {
			"-" => 37,
			'TRUE' => 38,
			'NOT' => 41,
			'STRING' => 43,
			'NIL' => 44,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50,
			'NAME' => 18,
			"{" => 34,
			"..." => 52,
			"(" => 53,
			"#" => 54
		},
		DEFAULT => -38,
		GOTOS => {
			'exp' => 51,
			'functioncall' => 45,
			'explist1' => 39,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 11
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 55,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 12
		ACTIONS => {
			":" => 56,
			"{" => 34,
			'STRING' => 30,
			"(" => 35,
			"[" => 33,
			"." => 36
		},
		DEFAULT => -45,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 57,
			'key' => 58
		}
	},
	{#State 13
		DEFAULT => -27,
		GOTOS => {
			'@8-1' => 59
		}
	},
	{#State 14
		ACTIONS => {
			"," => 60,
			"=" => 61
		}
	},
	{#State 15
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 63,
			'chunk' => 62
		}
	},
	{#State 16
		ACTIONS => {
			'NAME' => 65,
			'FUNCTION' => 64
		},
		GOTOS => {
			'namelist' => 66
		}
	},
	{#State 17
		DEFAULT => -14,
		GOTOS => {
			'@2-1' => 67
		}
	},
	{#State 18
		DEFAULT => -46
	},
	{#State 19
		ACTIONS => {
			";" => 26
		},
		DEFAULT => -8,
		GOTOS => {
			'_semicolon_opt' => 68
		}
	},
	{#State 20
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 69,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 21
		DEFAULT => -12,
		GOTOS => {
			'@1-1' => 70
		}
	},
	{#State 22
		DEFAULT => 0
	},
	{#State 23
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 71,
			'chunk' => 62
		}
	},
	{#State 24
		ACTIONS => {
			"=" => 72
		},
		DEFAULT => -53
	},
	{#State 25
		ACTIONS => {
			"," => 73,
			'IN' => 74
		}
	},
	{#State 26
		DEFAULT => -7
	},
	{#State 27
		DEFAULT => -3
	},
	{#State 28
		ACTIONS => {
			'NAME' => 75
		}
	},
	{#State 29
		DEFAULT => -90
	},
	{#State 30
		DEFAULT => -95
	},
	{#State 31
		DEFAULT => -48
	},
	{#State 32
		DEFAULT => -94
	},
	{#State 33
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 76,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 34
		ACTIONS => {
			"}" => 77,
			"-" => 37,
			'NAME' => 81,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			"[" => 78,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 80,
			'function' => 40,
			'primary' => 42,
			'fieldlist' => 82,
			'functioncall' => 45,
			'tableconstructor' => 46,
			'var' => 49,
			'_field_plus' => 83,
			'field' => 79
		}
	},
	{#State 35
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50,
			")" => 85
		},
		GOTOS => {
			'exp' => 51,
			'functioncall' => 45,
			'explist1' => 84,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 36
		ACTIONS => {
			'NAME' => 86
		}
	},
	{#State 37
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 87,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 38
		DEFAULT => -79
	},
	{#State 39
		ACTIONS => {
			"," => 88
		},
		DEFAULT => -37
	},
	{#State 40
		DEFAULT => -83
	},
	{#State 41
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 89,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 42
		DEFAULT => -56
	},
	{#State 43
		DEFAULT => -81
	},
	{#State 44
		DEFAULT => -77
	},
	{#State 45
		ACTIONS => {
			":" => 28,
			"[" => 33,
			"(" => 35,
			"." => 36,
			'STRING' => 30,
			"{" => 34
		},
		DEFAULT => -58,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 29,
			'key' => 31
		}
	},
	{#State 46
		DEFAULT => -84
	},
	{#State 47
		DEFAULT => -78
	},
	{#State 48
		DEFAULT => -96,
		GOTOS => {
			'@11-1' => 90
		}
	},
	{#State 49
		ACTIONS => {
			":" => 56,
			"[" => 33,
			"(" => 35,
			"." => 36,
			'STRING' => 30,
			"{" => 34
		},
		DEFAULT => -57,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 57,
			'key' => 58
		}
	},
	{#State 50
		DEFAULT => -80
	},
	{#State 51
		ACTIONS => {
			"-" => 92,
			"<" => 94,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"*" => 100,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			">" => 105,
			".." => 91,
			"~=" => 93,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -55
	},
	{#State 52
		DEFAULT => -82
	},
	{#State 53
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 106,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 54
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 107,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 55
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			'THEN' => 108,
			"<=" => 104,
			'OR' => 103,
			">" => 105
		}
	},
	{#State 56
		ACTIONS => {
			'NAME' => 109
		}
	},
	{#State 57
		DEFAULT => -88
	},
	{#State 58
		DEFAULT => -49
	},
	{#State 59
		ACTIONS => {
			'NAME' => 110
		},
		GOTOS => {
			'funcname' => 111,
			'_funcname' => 112
		}
	},
	{#State 60
		ACTIONS => {
			"(" => 20,
			'NAME' => 18
		},
		GOTOS => {
			'functioncall' => 113,
			'var' => 114
		}
	},
	{#State 61
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 51,
			'functioncall' => 45,
			'explist1' => 115,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 62
		DEFAULT => -9
	},
	{#State 63
		DEFAULT => -36,
		GOTOS => {
			'_elseif_star' => 116
		}
	},
	{#State 64
		ACTIONS => {
			'NAME' => 117
		}
	},
	{#State 65
		DEFAULT => -53
	},
	{#State 66
		ACTIONS => {
			"," => 73,
			"=" => 118
		},
		DEFAULT => -32
	},
	{#State 67
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 119,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 68
		DEFAULT => -5
	},
	{#State 69
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			"<=" => 104,
			'OR' => 103,
			")" => 120,
			">" => 105
		}
	},
	{#State 70
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 121,
			'chunk' => 62
		}
	},
	{#State 71
		ACTIONS => {
			'UNTIL' => 122
		}
	},
	{#State 72
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 123,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 73
		ACTIONS => {
			'NAME' => 124
		}
	},
	{#State 74
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 51,
			'functioncall' => 45,
			'explist1' => 125,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 75
		ACTIONS => {
			"(" => 35,
			"{" => 34,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 126
		}
	},
	{#State 76
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			"<=" => 104,
			'OR' => 103,
			"]" => 127,
			">" => 105
		}
	},
	{#State 77
		DEFAULT => -106
	},
	{#State 78
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 128,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 79
		DEFAULT => -110
	},
	{#State 80
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"^" => 99,
			"*" => 100,
			"/" => 101,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			">" => 105
		},
		DEFAULT => -113
	},
	{#State 81
		ACTIONS => {
			"=" => 129
		},
		DEFAULT => -46
	},
	{#State 82
		ACTIONS => {
			"}" => 130
		}
	},
	{#State 83
		ACTIONS => {
			";" => 132,
			"," => 133
		},
		DEFAULT => -108,
		GOTOS => {
			'fieldsep' => 131
		}
	},
	{#State 84
		ACTIONS => {
			"," => 88,
			")" => 134
		}
	},
	{#State 85
		DEFAULT => -93
	},
	{#State 86
		DEFAULT => -51
	},
	{#State 87
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -74
	},
	{#State 88
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 135,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 89
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -76
	},
	{#State 90
		ACTIONS => {
			"(" => 137
		},
		GOTOS => {
			'funcbody' => 136
		}
	},
	{#State 91
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 138,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 92
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 139,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 93
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 140,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 94
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 141,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 95
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 142,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 96
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 143,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 97
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 144,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 98
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 145,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 99
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 146,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 100
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 147,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 101
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 148,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 102
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 149,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 103
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 150,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 104
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 151,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 105
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 152,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 106
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			"<=" => 104,
			'OR' => 103,
			")" => 153,
			">" => 105
		}
	},
	{#State 107
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -75
	},
	{#State 108
		DEFAULT => -33
	},
	{#State 109
		ACTIONS => {
			"(" => 35,
			"{" => 34,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 154
		}
	},
	{#State 110
		DEFAULT => -43
	},
	{#State 111
		ACTIONS => {
			"(" => 137
		},
		GOTOS => {
			'funcbody' => 155
		}
	},
	{#State 112
		ACTIONS => {
			":" => 156,
			"." => 157
		},
		DEFAULT => -40
	},
	{#State 113
		ACTIONS => {
			":" => 28,
			"(" => 35,
			"{" => 34,
			"[" => 33,
			"." => 36,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 29,
			'key' => 31
		}
	},
	{#State 114
		ACTIONS => {
			":" => 56,
			"{" => 34,
			'STRING' => 30,
			"(" => 35,
			"[" => 33,
			"." => 36
		},
		DEFAULT => -44,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 57,
			'key' => 58
		}
	},
	{#State 115
		ACTIONS => {
			"," => 88
		},
		DEFAULT => -10
	},
	{#State 116
		ACTIONS => {
			'ELSE' => 158,
			'ELSEIF' => 160,
			'END' => 159
		}
	},
	{#State 117
		DEFAULT => -29,
		GOTOS => {
			'@9-3' => 161
		}
	},
	{#State 118
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 51,
			'functioncall' => 45,
			'explist1' => 162,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 119
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			'DO' => 163,
			"<=" => 104,
			'OR' => 103,
			">" => 105
		}
	},
	{#State 120
		ACTIONS => {
			":" => 164,
			"(" => 35,
			"{" => 34,
			"[" => 33,
			"." => 36,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 165,
			'key' => 166
		}
	},
	{#State 121
		ACTIONS => {
			'END' => 167
		}
	},
	{#State 122
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 168,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 123
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"," => 169,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			"<=" => 104,
			'OR' => 103,
			">" => 105
		}
	},
	{#State 124
		DEFAULT => -52
	},
	{#State 125
		ACTIONS => {
			"," => 88,
			'DO' => 170
		}
	},
	{#State 126
		DEFAULT => -91
	},
	{#State 127
		DEFAULT => -50
	},
	{#State 128
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			"<=" => 104,
			'OR' => 103,
			"]" => 171,
			">" => 105
		}
	},
	{#State 129
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 172,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 130
		DEFAULT => -105
	},
	{#State 131
		ACTIONS => {
			"-" => 37,
			'TRUE' => 38,
			'NOT' => 41,
			'STRING' => 43,
			'NIL' => 44,
			'FALSE' => 47,
			'FUNCTION' => 48,
			"[" => 78,
			'NUMBER' => 50,
			'NAME' => 81,
			"{" => 34,
			"..." => 52,
			"(" => 53,
			"#" => 54
		},
		DEFAULT => -107,
		GOTOS => {
			'exp' => 80,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42,
			'field' => 173
		}
	},
	{#State 132
		DEFAULT => -115
	},
	{#State 133
		DEFAULT => -114
	},
	{#State 134
		DEFAULT => -92
	},
	{#State 135
		ACTIONS => {
			"-" => 92,
			"<" => 94,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"*" => 100,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			">" => 105,
			".." => 91,
			"~=" => 93,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -54
	},
	{#State 136
		DEFAULT => -97
	},
	{#State 137
		ACTIONS => {
			'NAME' => 176,
			"..." => 177,
			")" => 175
		},
		GOTOS => {
			'parlist' => 174,
			'parlist1' => 178
		}
	},
	{#State 138
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -65
	},
	{#State 139
		ACTIONS => {
			"%" => 96,
			"*" => 100,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -60
	},
	{#State 140
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -71
	},
	{#State 141
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -66
	},
	{#State 142
		ACTIONS => {
			"%" => 96,
			"*" => 100,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -59
	},
	{#State 143
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -64
	},
	{#State 144
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -70
	},
	{#State 145
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -69
	},
	{#State 146
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -63
	},
	{#State 147
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -61
	},
	{#State 148
		ACTIONS => {
			"^" => 99
		},
		DEFAULT => -62
	},
	{#State 149
		ACTIONS => {
			"-" => 92,
			"<" => 94,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"*" => 100,
			"<=" => 104,
			">" => 105,
			".." => 91,
			"~=" => 93,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -72
	},
	{#State 150
		ACTIONS => {
			"-" => 92,
			"<" => 94,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"*" => 100,
			'AND' => 102,
			"<=" => 104,
			">" => 105,
			".." => 91,
			"~=" => 93,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -73
	},
	{#State 151
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -67
	},
	{#State 152
		ACTIONS => {
			"-" => 92,
			"%" => 96,
			"*" => 100,
			".." => 91,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -68
	},
	{#State 153
		ACTIONS => {
			":" => 164,
			"[" => 33,
			"(" => 35,
			"." => 36,
			'STRING' => 30,
			"{" => 34
		},
		DEFAULT => -85,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 165,
			'key' => 166
		}
	},
	{#State 154
		DEFAULT => -89
	},
	{#State 155
		DEFAULT => -28
	},
	{#State 156
		ACTIONS => {
			'NAME' => 179
		}
	},
	{#State 157
		ACTIONS => {
			'NAME' => 180
		}
	},
	{#State 158
		DEFAULT => -18,
		GOTOS => {
			'@4-4' => 181
		}
	},
	{#State 159
		DEFAULT => -20
	},
	{#State 160
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 182,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 161
		ACTIONS => {
			"(" => 137
		},
		GOTOS => {
			'funcbody' => 183
		}
	},
	{#State 162
		ACTIONS => {
			"," => 88
		},
		DEFAULT => -31
	},
	{#State 163
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 184,
			'chunk' => 62
		}
	},
	{#State 164
		ACTIONS => {
			'NAME' => 185
		}
	},
	{#State 165
		DEFAULT => -86
	},
	{#State 166
		DEFAULT => -47
	},
	{#State 167
		DEFAULT => -13
	},
	{#State 168
		ACTIONS => {
			"-" => 92,
			"<" => 94,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"*" => 100,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			">" => 105,
			".." => 91,
			"~=" => 93,
			"+" => 95,
			"^" => 99,
			"/" => 101
		},
		DEFAULT => -17
	},
	{#State 169
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 186,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 170
		DEFAULT => -25,
		GOTOS => {
			'@7-5' => 187
		}
	},
	{#State 171
		ACTIONS => {
			"=" => 188
		}
	},
	{#State 172
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"^" => 99,
			"*" => 100,
			"/" => 101,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			">" => 105
		},
		DEFAULT => -112
	},
	{#State 173
		DEFAULT => -109
	},
	{#State 174
		ACTIONS => {
			"," => 189
		},
		DEFAULT => -101
	},
	{#State 175
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 190,
			'chunk' => 62
		}
	},
	{#State 176
		DEFAULT => -104
	},
	{#State 177
		DEFAULT => -102
	},
	{#State 178
		ACTIONS => {
			")" => 191
		}
	},
	{#State 179
		DEFAULT => -41
	},
	{#State 180
		DEFAULT => -42
	},
	{#State 181
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 192,
			'chunk' => 62
		}
	},
	{#State 182
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			'THEN' => 193,
			"<=" => 104,
			'OR' => 103,
			">" => 105
		}
	},
	{#State 183
		DEFAULT => -30
	},
	{#State 184
		ACTIONS => {
			'END' => 194
		}
	},
	{#State 185
		ACTIONS => {
			"(" => 35,
			"{" => 34,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 195
		}
	},
	{#State 186
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"," => 196,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"^" => 99,
			"*" => 100,
			"/" => 101,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			'DO' => 197,
			">" => 105
		}
	},
	{#State 187
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 198,
			'chunk' => 62
		}
	},
	{#State 188
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 199,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 189
		ACTIONS => {
			'NAME' => 200,
			"..." => 201
		}
	},
	{#State 190
		ACTIONS => {
			'END' => 202
		}
	},
	{#State 191
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 203,
			'chunk' => 62
		}
	},
	{#State 192
		ACTIONS => {
			'END' => 204
		}
	},
	{#State 193
		DEFAULT => -34,
		GOTOS => {
			'@10-4' => 205
		}
	},
	{#State 194
		DEFAULT => -15
	},
	{#State 195
		DEFAULT => -87
	},
	{#State 196
		ACTIONS => {
			"-" => 37,
			'NAME' => 18,
			'TRUE' => 38,
			"{" => 34,
			'NOT' => 41,
			"..." => 52,
			'STRING' => 43,
			"(" => 53,
			'NIL' => 44,
			"#" => 54,
			'FALSE' => 47,
			'FUNCTION' => 48,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 206,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 197
		DEFAULT => -23,
		GOTOS => {
			'@6-7' => 207
		}
	},
	{#State 198
		ACTIONS => {
			'END' => 208
		}
	},
	{#State 199
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			"^" => 99,
			"*" => 100,
			"/" => 101,
			'AND' => 102,
			'OR' => 103,
			"<=" => 104,
			">" => 105
		},
		DEFAULT => -111
	},
	{#State 200
		DEFAULT => -103
	},
	{#State 201
		DEFAULT => -100
	},
	{#State 202
		DEFAULT => -99
	},
	{#State 203
		ACTIONS => {
			'END' => 209
		}
	},
	{#State 204
		DEFAULT => -19
	},
	{#State 205
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 210,
			'chunk' => 62
		}
	},
	{#State 206
		ACTIONS => {
			"-" => 92,
			".." => 91,
			"<" => 94,
			"~=" => 93,
			"+" => 95,
			"/" => 101,
			"%" => 96,
			"==" => 97,
			">=" => 98,
			'AND' => 102,
			"^" => 99,
			"*" => 100,
			'DO' => 211,
			"<=" => 104,
			'OR' => 103,
			">" => 105
		}
	},
	{#State 207
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 212,
			'chunk' => 62
		}
	},
	{#State 208
		DEFAULT => -26
	},
	{#State 209
		DEFAULT => -98
	},
	{#State 210
		DEFAULT => -35
	},
	{#State 211
		DEFAULT => -21,
		GOTOS => {
			'@5-9' => 213
		}
	},
	{#State 212
		ACTIONS => {
			'END' => 214
		}
	},
	{#State 213
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 215,
			'chunk' => 62
		}
	},
	{#State 214
		DEFAULT => -24
	},
	{#State 215
		ACTIONS => {
			'END' => 216
		}
	},
	{#State 216
		DEFAULT => -22
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'program', 1,
sub
#line 51 "src\yapp\Lua\lua51.yp"
{
            BuildMain( $_[0], $_[1] );
        }
	],
	[#Rule 2
		 'program', 1,
sub
#line 55 "src\yapp\Lua\lua51.yp"
{
            print "Error (program)\n";
        }
	],
	[#Rule 3
		 'chunk', 3,
sub
#line 62 "src\yapp\Lua\lua51.yp"
{
            [ @{ $_[1] }, @{ $_[2] } ];
        }
	],
	[#Rule 4
		 'chunk', 1,
sub
#line 66 "src\yapp\Lua\lua51.yp"
{
            $_[1];
        }
	],
	[#Rule 5
		 '_stat', 3,
sub
#line 73 "src\yapp\Lua\lua51.yp"
{
            [ @{ $_[1] }, @{ $_[2] } ];
        }
	],
	[#Rule 6
		 '_stat', 0,
sub
#line 77 "src\yapp\Lua\lua51.yp"
{
            [];
        }
	],
	[#Rule 7
		 '_semicolon_opt', 1, undef
	],
	[#Rule 8
		 '_semicolon_opt', 0, undef
	],
	[#Rule 9
		 'block', 1,
sub
#line 91 "src\yapp\Lua\lua51.yp"
{
            PopScope( $_[0] );
            $_[1];
        }
	],
	[#Rule 10
		 'stat', 3,
sub
#line 99 "src\yapp\Lua\lua51.yp"
{
            BuildAssigns( $_[0], $_[1], $_[3] );
        }
	],
	[#Rule 11
		 'stat', 1,
sub
#line 103 "src\yapp\Lua\lua51.yp"
{
            BuildVoidFunctionCall( $_[0], $_[1] );
        }
	],
	[#Rule 12
		 '@1-1', 0,
sub
#line 107 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 13
		 'stat', 4,
sub
#line 111 "src\yapp\Lua\lua51.yp"
{
            $_[3];
        }
	],
	[#Rule 14
		 '@2-1', 0,
sub
#line 115 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 15
		 'stat', 6,
sub
#line 119 "src\yapp\Lua\lua51.yp"
{
            BuildWhile( $_[0], $_[3], $_[5] );
        }
	],
	[#Rule 16
		 '@3-1', 0,
sub
#line 123 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 17
		 'stat', 5,
sub
#line 127 "src\yapp\Lua\lua51.yp"
{
            BuildRepeat( $_[0], $_[3], $_[5] );
        }
	],
	[#Rule 18
		 '@4-4', 0,
sub
#line 131 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 19
		 'stat', 7,
sub
#line 135 "src\yapp\Lua\lua51.yp"
{
            BuildIf( $_[0], $_[1], $_[2], $_[3], $_[6] );
        }
	],
	[#Rule 20
		 'stat', 4,
sub
#line 139 "src\yapp\Lua\lua51.yp"
{
            BuildIf( $_[0], $_[1], $_[2], $_[3], undef );
        }
	],
	[#Rule 21
		 '@5-9', 0,
sub
#line 143 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
            my $var = BuildLocalVariable( $_[0], $_[2] );
            Insert( $_[0], $var );
        }
	],
	[#Rule 22
		 'stat', 12,
sub
#line 149 "src\yapp\Lua\lua51.yp"
{
            BuildForNum( $_[0], $_[10], $_[4], $_[6], $_[8], $_[11] );
        }
	],
	[#Rule 23
		 '@6-7', 0,
sub
#line 153 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
            my $var = BuildLocalVariable( $_[0], $_[2] );
            Insert( $_[0], $var );
        }
	],
	[#Rule 24
		 'stat', 10,
sub
#line 159 "src\yapp\Lua\lua51.yp"
{
            BuildForNum( $_[0], $_[8], $_[4], $_[6], undef, $_[9] );
        }
	],
	[#Rule 25
		 '@7-5', 0,
sub
#line 163 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
            InsertList( $_[0], $_[2] );
        }
	],
	[#Rule 26
		 'stat', 8,
sub
#line 168 "src\yapp\Lua\lua51.yp"
{
            BuildForList( $_[0], $_[2], $_[4], $_[7] );
        }
	],
	[#Rule 27
		 '@8-1', 0,
sub
#line 172 "src\yapp\Lua\lua51.yp"
{
            PushScopeF( $_[0] );
            PushScope( $_[0] );
        }
	],
	[#Rule 28
		 'stat', 4,
sub
#line 177 "src\yapp\Lua\lua51.yp"
{
            my $var = BuildVariable( $_[0], $_[3] );
            BuildAssigns( $_[0], [ $var ], [ $_[4] ] );
        }
	],
	[#Rule 29
		 '@9-3', 0,
sub
#line 182 "src\yapp\Lua\lua51.yp"
{
            my $var = BuildLocalVariable( $_[0], $_[3] );
            Insert( $_[0], $var );
            PushScopeF( $_[0] );
            PushScope( $_[0] );
            return $var;
        }
	],
	[#Rule 30
		 'stat', 5,
sub
#line 190 "src\yapp\Lua\lua51.yp"
{
            BuildAssigns( $_[0], [ $_[4] ], [ $_[5] ] );
        }
	],
	[#Rule 31
		 'stat', 4,
sub
#line 194 "src\yapp\Lua\lua51.yp"
{
            InsertList( $_[0], $_[2] );
            BuildAssigns( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 32
		 'stat', 2,
sub
#line 199 "src\yapp\Lua\lua51.yp"
{
            InsertList( $_[0], $_[2] );
            BuildAssigns( $_[0], $_[2], [] );
        }
	],
	[#Rule 33
		 '_if_then', 3,
sub
#line 207 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
            $_[2];
        }
	],
	[#Rule 34
		 '@10-4', 0,
sub
#line 215 "src\yapp\Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 35
		 '_elseif_star', 6,
sub
#line 219 "src\yapp\Lua\lua51.yp"
{
            [ @{ $_[1] }, [ $_[3], $_[6] ] ];
        }
	],
	[#Rule 36
		 '_elseif_star', 0,
sub
#line 223 "src\yapp\Lua\lua51.yp"
{
            [];
        }
	],
	[#Rule 37
		 'laststat', 2,
sub
#line 230 "src\yapp\Lua\lua51.yp"
{
            BuildReturn( $_[0], $_[2] );
        }
	],
	[#Rule 38
		 'laststat', 1,
sub
#line 234 "src\yapp\Lua\lua51.yp"
{
            BuildReturn( $_[0], [] );
        }
	],
	[#Rule 39
		 'laststat', 1,
sub
#line 238 "src\yapp\Lua\lua51.yp"
{
            BuildBreak( $_[0] );
        }
	],
	[#Rule 40
		 'funcname', 1, undef
	],
	[#Rule 41
		 'funcname', 3,
sub
#line 247 "src\yapp\Lua\lua51.yp"
{
            PrepareMethod( $_[0] );
            [
                @{ $_[1] },
                BuildLiteral( $_[0], $_[3], 'key' ),
            ];
        }
	],
	[#Rule 42
		 '_funcname', 3,
sub
#line 258 "src\yapp\Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildLiteral( $_[0], $_[3], 'key' ),
            ];
        }
	],
	[#Rule 43
		 '_funcname', 1,
sub
#line 265 "src\yapp\Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 44
		 'varlist1', 3,
sub
#line 272 "src\yapp\Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildVariable( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 45
		 'varlist1', 1,
sub
#line 279 "src\yapp\Lua\lua51.yp"
{
            [
                BuildVariable( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 46
		 'var', 1,
sub
#line 288 "src\yapp\Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 47
		 'var', 4,
sub
#line 292 "src\yapp\Lua\lua51.yp"
{
            [ $_[2], $_[4] ];
        }
	],
	[#Rule 48
		 'var', 2,
sub
#line 296 "src\yapp\Lua\lua51.yp"
{
            [ $_[1], $_[2] ];
        }
	],
	[#Rule 49
		 'var', 2,
sub
#line 300 "src\yapp\Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[2] ];
        }
	],
	[#Rule 50
		 'key', 3,
sub
#line 307 "src\yapp\Lua\lua51.yp"
{
            $_[2];
        }
	],
	[#Rule 51
		 'key', 2,
sub
#line 311 "src\yapp\Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[2], 'key' );
        }
	],
	[#Rule 52
		 'namelist', 3,
sub
#line 318 "src\yapp\Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildLocalVariable( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 53
		 'namelist', 1,
sub
#line 325 "src\yapp\Lua\lua51.yp"
{
            [
                BuildLocalVariable( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 54
		 'explist1', 3,
sub
#line 334 "src\yapp\Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[3] ];
        }
	],
	[#Rule 55
		 'explist1', 1,
sub
#line 338 "src\yapp\Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 56
		 'exp', 1, undef
	],
	[#Rule 57
		 'exp', 1,
sub
#line 347 "src\yapp\Lua\lua51.yp"
{
            BuildCallVariable( $_[0], $_[1] );
        }
	],
	[#Rule 58
		 'exp', 1, undef
	],
	[#Rule 59
		 'exp', 3,
sub
#line 353 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 60
		 'exp', 3,
sub
#line 357 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 61
		 'exp', 3,
sub
#line 361 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 62
		 'exp', 3,
sub
#line 365 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 63
		 'exp', 3,
sub
#line 369 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 64
		 'exp', 3,
sub
#line 373 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 65
		 'exp', 3,
sub
#line 377 "src\yapp\Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 66
		 'exp', 3,
sub
#line 381 "src\yapp\Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 67
		 'exp', 3,
sub
#line 385 "src\yapp\Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 68
		 'exp', 3,
sub
#line 389 "src\yapp\Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 69
		 'exp', 3,
sub
#line 393 "src\yapp\Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 70
		 'exp', 3,
sub
#line 397 "src\yapp\Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 71
		 'exp', 3,
sub
#line 401 "src\yapp\Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 72
		 'exp', 3,
sub
#line 405 "src\yapp\Lua\lua51.yp"
{
            BuildLogop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 73
		 'exp', 3,
sub
#line 409 "src\yapp\Lua\lua51.yp"
{
            BuildLogop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 74
		 'exp', 2,
sub
#line 413 "src\yapp\Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 75
		 'exp', 2,
sub
#line 417 "src\yapp\Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 76
		 'exp', 2,
sub
#line 421 "src\yapp\Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 77
		 'primary', 1,
sub
#line 428 "src\yapp\Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'nil' );
        }
	],
	[#Rule 78
		 'primary', 1,
sub
#line 432 "src\yapp\Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'boolean' );
        }
	],
	[#Rule 79
		 'primary', 1,
sub
#line 436 "src\yapp\Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'boolean' );
        }
	],
	[#Rule 80
		 'primary', 1,
sub
#line 440 "src\yapp\Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'number' );
        }
	],
	[#Rule 81
		 'primary', 1,
sub
#line 444 "src\yapp\Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'string' );
        }
	],
	[#Rule 82
		 'primary', 1,
sub
#line 448 "src\yapp\Lua\lua51.yp"
{
            BuildCallVararg( $_[0] );
        }
	],
	[#Rule 83
		 'primary', 1, undef
	],
	[#Rule 84
		 'primary', 1, undef
	],
	[#Rule 85
		 'primary', 3,
sub
#line 456 "src\yapp\Lua\lua51.yp"
{
            BuildParenthesedExpression( $_[0], $_[2] );
        }
	],
	[#Rule 86
		 'functioncall', 4,
sub
#line 463 "src\yapp\Lua\lua51.yp"
{
            BuildCallFunction( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 87
		 'functioncall', 6,
sub
#line 467 "src\yapp\Lua\lua51.yp"
{
            BuildCallMethod( $_[0], $_[2], $_[5], $_[6] );
        }
	],
	[#Rule 88
		 'functioncall', 2,
sub
#line 471 "src\yapp\Lua\lua51.yp"
{
            my $fct = BuildCallVariable( $_[0], $_[1] );
            BuildCallFunction( $_[0], $fct, $_[2] );
        }
	],
	[#Rule 89
		 'functioncall', 4,
sub
#line 476 "src\yapp\Lua\lua51.yp"
{
            my $obj = BuildCallVariable( $_[0], $_[1] );
            BuildCallMethod( $_[0], $obj, $_[3], $_[4] );
        }
	],
	[#Rule 90
		 'functioncall', 2,
sub
#line 481 "src\yapp\Lua\lua51.yp"
{
            BuildCallFunction( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 91
		 'functioncall', 4,
sub
#line 485 "src\yapp\Lua\lua51.yp"
{
            BuildCallMethod( $_[0], $_[1], $_[3], $_[4] );
        }
	],
	[#Rule 92
		 'args', 3,
sub
#line 492 "src\yapp\Lua\lua51.yp"
{
            $_[2];
        }
	],
	[#Rule 93
		 'args', 2,
sub
#line 496 "src\yapp\Lua\lua51.yp"
{
            [];
        }
	],
	[#Rule 94
		 'args', 1,
sub
#line 500 "src\yapp\Lua\lua51.yp"
{
            [
                $_[1],
            ];
        }
	],
	[#Rule 95
		 'args', 1,
sub
#line 506 "src\yapp\Lua\lua51.yp"
{
            [
                BuildLiteral( $_[0], $_[1], 'string' ),
            ];
        }
	],
	[#Rule 96
		 '@11-1', 0,
sub
#line 515 "src\yapp\Lua\lua51.yp"
{
            PushScopeF( $_[0] );
            PushScope( $_[0] );
        }
	],
	[#Rule 97
		 'function', 3,
sub
#line 520 "src\yapp\Lua\lua51.yp"
{
            $_[3];
        }
	],
	[#Rule 98
		 'funcbody', 5,
sub
#line 527 "src\yapp\Lua\lua51.yp"
{
            PopScopeF( $_[0] );
            BuildFunctionBody( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 99
		 'funcbody', 4,
sub
#line 532 "src\yapp\Lua\lua51.yp"
{
            PopScopeF( $_[0] );
            BuildFunctionBody( $_[0], [], $_[3] );
        }
	],
	[#Rule 100
		 'parlist1', 3,
sub
#line 540 "src\yapp\Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildParam( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 101
		 'parlist1', 1, undef
	],
	[#Rule 102
		 'parlist1', 1,
sub
#line 549 "src\yapp\Lua\lua51.yp"
{
            [
                BuildParam( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 103
		 'parlist', 3,
sub
#line 558 "src\yapp\Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildParam( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 104
		 'parlist', 1,
sub
#line 565 "src\yapp\Lua\lua51.yp"
{
            [
                BuildParam( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 105
		 'tableconstructor', 3,
sub
#line 574 "src\yapp\Lua\lua51.yp"
{
            BuildTable( $_[0], $_[2] );
        }
	],
	[#Rule 106
		 'tableconstructor', 2,
sub
#line 578 "src\yapp\Lua\lua51.yp"
{
            BuildTable( $_[0], [] );
        }
	],
	[#Rule 107
		 'fieldlist', 2, undef
	],
	[#Rule 108
		 'fieldlist', 1, undef
	],
	[#Rule 109
		 '_field_plus', 3,
sub
#line 592 "src\yapp\Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[3] ];
        }
	],
	[#Rule 110
		 '_field_plus', 1,
sub
#line 596 "src\yapp\Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 111
		 'field', 5,
sub
#line 603 "src\yapp\Lua\lua51.yp"
{
            [ $_[2], $_[5] ];
        }
	],
	[#Rule 112
		 'field', 3,
sub
#line 607 "src\yapp\Lua\lua51.yp"
{
            [ BuildLiteral( $_[0], $_[1], 'key' ), $_[3] ];
        }
	],
	[#Rule 113
		 'field', 1,
sub
#line 611 "src\yapp\Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 114
		 'fieldsep', 1, undef
	],
	[#Rule 115
		 'fieldsep', 1, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 623 "src\yapp\Lua\lua51.yp"


package Lua::parser;

use strict;
use warnings;

use Lua::lexer;
use Lua::build;
use Lua::symbtab;
use Lua::pir;

sub Run {
    my $parser = shift;
    my ($srcname) = @_;

    open $parser->YYData->{fh}, '<', $srcname
        or die "can't open $srcname ($!).\n";

    $parser->YYData->{shebang} = 1;
    $parser->YYData->{srcname} = $srcname;
    my @st = stat( $parser->YYData->{srcname} );
    $parser->YYData->{srcname_size}  = $st[7];
    $parser->YYData->{srcname_mtime} = $st[9];
    Lua::lexer::InitLexico($parser);
    $parser->YYData->{functs}      = [];
    $parser->YYData->{lex_num}     = 0;
    $parser->YYData->{scope}       = [];
    $parser->YYData->{scopef}      = [];
    $parser->YYData->{symbtab}     = new SymbTabVar($parser);
    $parser->YYData->{symbtab_cst} = new SymbTabConst($parser);
    $parser->YYData->{_G}          = undef;
    $parser->YYData->{self}        = undef;
    $parser->YYData->{idx_tmp}     = 0;
    $parser->YYData->{idx_lbl}     = 0;
    $parser->YYData->{idx_fct}     = 0;
    $parser->YYParse(
        yylex   => \&Lua::lexer::Lexer,
        yyerror => sub { return; },
#        yydebug => 0x17,
        #    Bit Value    Outputs
        #    0x01         Token reading (useful for Lexer debugging)
        #    0x02         States information
        #    0x04         Driver actions (shifts, reduces, accept...)
        #    0x08         Parse Stack dump
        #    0x10         Error Recovery tracing
    );

    close $parser->YYData->{fh};
    delete $parser->{RULES};
    delete $parser->{STATES};
    delete $parser->{STACK};
    return;
}

sub Generate {
    my $parser = shift;

    my %outer = (
        '_main' => '__start'
    );
    foreach my $fct ( @{ $parser->YYData->{functs} } ) {
        my $curr;
        foreach my $op ( @{$fct} ) {
            if ( ref($op) eq 'SubDir' ) {
                $curr = $op->{result}->{symbol};
                if ( exists $outer{$curr} ) {
                    $op->{outer} = $outer{$curr};
                }
                else {
                    warn "INTERNAL ERROR: no outer for '$curr'\n";
                }
            }
            if ( ref($op) eq 'NewClosureOp' ) {
                if ( exists $outer{ $op->{arg1}->{symbol} } ) {
                    warn "INTERNAL ERROR: duplicate outer for '$op->{arg1}->{symbol}' : '$outer{ $op->{arg1}->{symbol} }' & '$curr'\n";
                }
                else {
                    $outer{ $op->{arg1}->{symbol} } = $curr;
                }
            }
        }
    }

    my $filename = $parser->YYData->{srcname};
    $filename =~ s/\.lua$/\.pir/i;
    open my $FH, '>', $filename
        or die "can't open $filename ($!).\n";

    my $generator = new pirVisitor($FH);
#    my $generator = new pirVisitor(\*STDOUT);
    print {$FH} $generator->{prologue};
    foreach my $fct ( @{ $parser->YYData->{functs} } ) {
        foreach my $op ( @{$fct} ) {
            if ( ref($op) =~ /(Dir|Op)$/ ) {
                $op->visit($generator) if ( exists $op->{prolog} );
            }
            else {
                print $op, "\n";
                die;
            }
        }
        print {$FH} "    # end of prolog\n";
        foreach my $op ( @{$fct} ) {
            $op->visit($generator) unless ( exists $op->{prolog} );
        }
    }
    close $FH;
    return;
}

sub Error {
    my $parser = shift;
    my ($msg) = @_;

    $msg ||= "Syntax error.\n";

    if ( exists $parser->YYData->{nb_error} ) {
        $parser->YYData->{nb_error}++;
    }
    else {
        $parser->YYData->{nb_error} = 1;
    }

    print STDOUT 'lua: ', $parser->YYData->{srcname}, ':', $parser->YYData->{lineno}, ': ', $msg
        if ( exists $parser->YYData->{verbose_error}
        and $parser->YYData->{verbose_error} );
    return;
}

sub Warning {
    my $parser = shift;
    my ($msg) = @_;

    $msg ||= ".\n";

    if ( exists $parser->YYData->{nb_warning} ) {
        $parser->YYData->{nb_warning}++;
    }
    else {
        $parser->YYData->{nb_warning} = 1;
    }

    print STDOUT 'lua: ', $parser->YYData->{srcname}, ':', $parser->YYData->{lineno}, ': ', $msg
        if ( exists $parser->YYData->{verbose_warning}
        and $parser->YYData->{verbose_warning} );
    return;
}

sub Info {
    my $parser = shift;
    my ($msg) = @_;

    $msg ||= ".\n";

    if ( exists $parser->YYData->{nb_info} ) {
        $parser->YYData->{nb_info}++;
    }
    else {
        $parser->YYData->{nb_info} = 1;
    }

    print STDOUT 'lua: ', $parser->YYData->{srcname}, ':', $parser->YYData->{lineno}, ': ', $msg
        if ( exists $parser->YYData->{verbose_info}
        and $parser->YYData->{verbose_info} );
    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

1;
