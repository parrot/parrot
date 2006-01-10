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
#Included Parse/Yapp/Driver.pm file----------------------------------------
{
#
# Module Parse::Yapp::Driver
#
# This module is part of the Parse::Yapp package available on your
# nearest CPAN
#
# Any use of this module in a standalone parser make the included
# text under the same copyright as the Parse::Yapp module itself.
#
# This notice should remain unchanged.
#
# (c) Copyright 1998-2001 Francois Desarmenien, all rights reserved.
# (see the pod text in Parse::Yapp module for use and distribution rights)
#

package Parse::Yapp::Driver;

require 5.004;

use strict;

use vars qw ( $VERSION $COMPATIBLE $FILENAME );

$VERSION = '1.05';
$COMPATIBLE = '0.07';
$FILENAME=__FILE__;

use Carp;

#Known parameters, all starting with YY (leading YY will be discarded)
my(%params)=(YYLEX => 'CODE', 'YYERROR' => 'CODE', YYVERSION => '',
			 YYRULES => 'ARRAY', YYSTATES => 'ARRAY', YYDEBUG => '');
#Mandatory parameters
my(@params)=('LEX','RULES','STATES');

sub new {
    my($class)=shift;
	my($errst,$nberr,$token,$value,$check,$dotpos);
    my($self)={ ERROR => \&_Error,
				ERRST => \$errst,
                NBERR => \$nberr,
				TOKEN => \$token,
				VALUE => \$value,
				DOTPOS => \$dotpos,
				STACK => [],
				DEBUG => 0,
				CHECK => \$check };

	_CheckParams( [], \%params, \@_, $self );

		exists($$self{VERSION})
	and	$$self{VERSION} < $COMPATIBLE
	and	croak "Yapp driver version $VERSION ".
			  "incompatible with version $$self{VERSION}:\n".
			  "Please recompile parser module.";

        ref($class)
    and $class=ref($class);

    bless($self,$class);
}

sub YYParse {
    my($self)=shift;
    my($retval);

	_CheckParams( \@params, \%params, \@_, $self );

	if($$self{DEBUG}) {
		_DBLoad();
		$retval = eval '$self->_DBParse()';#Do not create stab entry on compile
        $@ and die $@;
	}
	else {
		$retval = $self->_Parse();
	}
    $retval
}

sub YYData {
	my($self)=shift;

		exists($$self{USER})
	or	$$self{USER}={};

	$$self{USER};
	
}

sub YYErrok {
	my($self)=shift;

	${$$self{ERRST}}=0;
    undef;
}

sub YYNberr {
	my($self)=shift;

	${$$self{NBERR}};
}

sub YYRecovering {
	my($self)=shift;

	${$$self{ERRST}} != 0;
}

sub YYAbort {
	my($self)=shift;

	${$$self{CHECK}}='ABORT';
    undef;
}

sub YYAccept {
	my($self)=shift;

	${$$self{CHECK}}='ACCEPT';
    undef;
}

sub YYError {
	my($self)=shift;

	${$$self{CHECK}}='ERROR';
    undef;
}

sub YYSemval {
	my($self)=shift;
	my($index)= $_[0] - ${$$self{DOTPOS}} - 1;

		$index < 0
	and	-$index <= @{$$self{STACK}}
	and	return $$self{STACK}[$index][1];

	undef;	#Invalid index
}

sub YYCurtok {
	my($self)=shift;

        @_
    and ${$$self{TOKEN}}=$_[0];
    ${$$self{TOKEN}};
}

sub YYCurval {
	my($self)=shift;

        @_
    and ${$$self{VALUE}}=$_[0];
    ${$$self{VALUE}};
}

sub YYExpect {
    my($self)=shift;

    keys %{$self->{STATES}[$self->{STACK}[-1][0]]{ACTIONS}}
}

sub YYLexer {
    my($self)=shift;

	$$self{LEX};
}


#################
# Private stuff #
#################


sub _CheckParams {
	my($mandatory,$checklist,$inarray,$outhash)=@_;
	my($prm,$value);
	my($prmlst)={};

	while(($prm,$value)=splice(@$inarray,0,2)) {
        $prm=uc($prm);
			exists($$checklist{$prm})
		or	croak("Unknow parameter '$prm'");
			ref($value) eq $$checklist{$prm}
		or	croak("Invalid value for parameter '$prm'");
        $prm=unpack('@2A*',$prm);
		$$outhash{$prm}=$value;
	}
	for (@$mandatory) {
			exists($$outhash{$_})
		or	croak("Missing mandatory parameter '".lc($_)."'");
	}
}

sub _Error {
	print "Parse error.\n";
}

sub _DBLoad {
	{
		no strict 'refs';

			exists(${__PACKAGE__.'::'}{_DBParse})#Already loaded ?
		and	return;
	}
	my($fname)=__FILE__;
	my(@drv);
	open(DRV,"<$fname") or die "Report this as a BUG: Cannot open $fname";
	while(<DRV>) {
                	/^\s*sub\s+_Parse\s*{\s*$/ .. /^\s*}\s*#\s*_Parse\s*$/
        	and     do {
                	s/^#DBG>//;
                	push(@drv,$_);
        	}
	}
	close(DRV);

	$drv[0]=~s/_P/_DBP/;
	eval join('',@drv);
}

#Note that for loading debugging version of the driver,
#this file will be parsed from 'sub _Parse' up to '}#_Parse' inclusive.
#So, DO NOT remove comment at end of sub !!!
sub _Parse {
    my($self)=shift;

	my($rules,$states,$lex,$error)
     = @$self{ 'RULES', 'STATES', 'LEX', 'ERROR' };
	my($errstatus,$nberror,$token,$value,$stack,$check,$dotpos)
     = @$self{ 'ERRST', 'NBERR', 'TOKEN', 'VALUE', 'STACK', 'CHECK', 'DOTPOS' };

#DBG>	my($debug)=$$self{DEBUG};
#DBG>	my($dbgerror)=0;

#DBG>	my($ShowCurToken) = sub {
#DBG>		my($tok)='>';
#DBG>		for (split('',$$token)) {
#DBG>			$tok.=		(ord($_) < 32 or ord($_) > 126)
#DBG>					?	sprintf('<%02X>',ord($_))
#DBG>					:	$_;
#DBG>		}
#DBG>		$tok.='<';
#DBG>	};

	$$errstatus=0;
	$$nberror=0;
	($$token,$$value)=(undef,undef);
	@$stack=( [ 0, undef ] );
	$$check='';

    while(1) {
        my($actions,$act,$stateno);

        $stateno=$$stack[-1][0];
        $actions=$$states[$stateno];

#DBG>	print STDERR ('-' x 40),"\n";
#DBG>		$debug & 0x2
#DBG>	and	print STDERR "In state $stateno:\n";
#DBG>		$debug & 0x08
#DBG>	and	print STDERR "Stack:[".
#DBG>					 join(',',map { $$_[0] } @$stack).
#DBG>					 "]\n";


        if  (exists($$actions{ACTIONS})) {

				defined($$token)
            or	do {
				($$token,$$value)=&$lex($self);
#DBG>				$debug & 0x01
#DBG>			and	print STDERR "Need token. Got ".&$ShowCurToken."\n";
			};

            $act=   exists($$actions{ACTIONS}{$$token})
                    ?   $$actions{ACTIONS}{$$token}
                    :   exists($$actions{DEFAULT})
                        ?   $$actions{DEFAULT}
                        :   undef;
        }
        else {
            $act=$$actions{DEFAULT};
#DBG>			$debug & 0x01
#DBG>		and	print STDERR "Don't need token.\n";
        }

            defined($act)
        and do {

                $act > 0
            and do {        #shift

#DBG>				$debug & 0x04
#DBG>			and	print STDERR "Shift and go to state $act.\n";

					$$errstatus
				and	do {
					--$$errstatus;

#DBG>					$debug & 0x10
#DBG>				and	$dbgerror
#DBG>				and	$$errstatus == 0
#DBG>				and	do {
#DBG>					print STDERR "**End of Error recovery.\n";
#DBG>					$dbgerror=0;
#DBG>				};
				};


                push(@$stack,[ $act, $$value ]);

					$$token ne ''	#Don't eat the eof
				and	$$token=$$value=undef;
                next;
            };

            #reduce
            my($lhs,$len,$code,@sempar,$semval);
            ($lhs,$len,$code)=@{$$rules[-$act]};

#DBG>			$debug & 0x04
#DBG>		and	$act
#DBG>		and	print STDERR "Reduce using rule ".-$act." ($lhs,$len): ";

                $act
            or  $self->YYAccept();

            $$dotpos=$len;

                unpack('A1',$lhs) eq '@'    #In line rule
            and do {
                    $lhs =~ /^\@[0-9]+\-([0-9]+)$/
                or  die "In line rule name '$lhs' ill formed: ".
                        "report it as a BUG.\n";
                $$dotpos = $1;
            };

            @sempar =       $$dotpos
                        ?   map { $$_[1] } @$stack[ -$$dotpos .. -1 ]
                        :   ();

            $semval = $code ? &$code( $self, @sempar )
                            : @sempar ? $sempar[0] : undef;

            splice(@$stack,-$len,$len);

                $$check eq 'ACCEPT'
            and do {

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Accept.\n";

				return($semval);
			};

                $$check eq 'ABORT'
            and	do {

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Abort.\n";

				return(undef);

			};

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Back to state $$stack[-1][0], then ";

                $$check eq 'ERROR'
            or  do {
#DBG>				$debug & 0x04
#DBG>			and	print STDERR 
#DBG>				    "go to state $$states[$$stack[-1][0]]{GOTOS}{$lhs}.\n";

#DBG>				$debug & 0x10
#DBG>			and	$dbgerror
#DBG>			and	$$errstatus == 0
#DBG>			and	do {
#DBG>				print STDERR "**End of Error recovery.\n";
#DBG>				$dbgerror=0;
#DBG>			};

			    push(@$stack,
                     [ $$states[$$stack[-1][0]]{GOTOS}{$lhs}, $semval ]);
                $$check='';
                next;
            };

#DBG>			$debug & 0x04
#DBG>		and	print STDERR "Forced Error recovery.\n";

            $$check='';

        };

        #Error
            $$errstatus
        or   do {

            $$errstatus = 1;
            &$error($self);
                $$errstatus # if 0, then YYErrok has been called
            or  next;       # so continue parsing

#DBG>			$debug & 0x10
#DBG>		and	do {
#DBG>			print STDERR "**Entering Error recovery.\n";
#DBG>			++$dbgerror;
#DBG>		};

            ++$$nberror;

        };

			$$errstatus == 3	#The next token is not valid: discard it
		and	do {
				$$token eq ''	# End of input: no hope
			and	do {
#DBG>				$debug & 0x10
#DBG>			and	print STDERR "**At eof: aborting.\n";
				return(undef);
			};

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**Dicard invalid token ".&$ShowCurToken.".\n";

			$$token=$$value=undef;
		};

        $$errstatus=3;

		while(	  @$stack
			  and (		not exists($$states[$$stack[-1][0]]{ACTIONS})
			        or  not exists($$states[$$stack[-1][0]]{ACTIONS}{error})
					or	$$states[$$stack[-1][0]]{ACTIONS}{error} <= 0)) {

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**Pop state $$stack[-1][0].\n";

			pop(@$stack);
		}

			@$stack
		or	do {

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**No state left on stack: aborting.\n";

			return(undef);
		};

		#shift the error token

#DBG>			$debug & 0x10
#DBG>		and	print STDERR "**Shift \$error token and go to state ".
#DBG>						 $$states[$$stack[-1][0]]{ACTIONS}{error}.
#DBG>						 ".\n";

		push(@$stack, [ $$states[$$stack[-1][0]]{ACTIONS}{error}, undef ]);

    }

    #never reached
	croak("Error in driver logic. Please, report it as a BUG");

}#_Parse
#DO NOT remove comment

1;

}
#End of include--------------------------------------------------




sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'FUNCTION' => -4,
			'' => -4,
			'NAME' => -4,
			'WHILE' => -4,
			'REPEAT' => -4,
			'error' => 1,
			'FOR' => -4,
			'LOCAL' => -4,
			'DO' => -4,
			'IF' => -4,
			"(" => -4
		},
		GOTOS => {
			'chunk' => 2,
			'program' => 3
		}
	},
	{#State 1
		DEFAULT => -2
	},
	{#State 2
		ACTIONS => {
			'FUNCTION' => 5,
			'NAME' => 7,
			'WHILE' => 8,
			'REPEAT' => 9,
			'FOR' => 10,
			'LOCAL' => 11,
			'DO' => 13,
			'IF' => 14,
			"(" => 16
		},
		DEFAULT => -1,
		GOTOS => {
			'functioncall' => 6,
			'var' => 4,
			'stat' => 12,
			'varlist1' => 15
		}
	},
	{#State 3
		ACTIONS => {
			'' => 17
		}
	},
	{#State 4
		ACTIONS => {
			":" => 18,
			'LITERAL' => 19,
			"[" => 20,
			"{" => 21,
			"." => 23,
			"(" => 26
		},
		DEFAULT => -33,
		GOTOS => {
			'args' => 22,
			'key' => 24,
			'tableconstructor' => 25
		}
	},
	{#State 5
		ACTIONS => {
			'NAME' => 27
		},
		GOTOS => {
			'funcname' => 29,
			'_funcname' => 28
		}
	},
	{#State 6
		ACTIONS => {
			"(" => 26,
			":" => 30,
			'LITERAL' => 19,
			"[" => 20,
			"{" => 21,
			"." => 23
		},
		DEFAULT => -13,
		GOTOS => {
			'args' => 31,
			'key' => 32,
			'tableconstructor' => 25
		}
	},
	{#State 7
		DEFAULT => -34
	},
	{#State 8
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			"(" => 47,
			'NIL' => 46,
			'TRUE' => 45
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 42,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 9
		DEFAULT => -4,
		GOTOS => {
			'block' => 49,
			'chunk' => 48
		}
	},
	{#State 10
		ACTIONS => {
			'NAME' => 50
		},
		GOTOS => {
			'namelist' => 51
		}
	},
	{#State 11
		ACTIONS => {
			'FUNCTION' => 52,
			'NAME' => 53
		},
		GOTOS => {
			'namelist' => 54
		}
	},
	{#State 12
		ACTIONS => {
			";" => 56
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 55
		}
	},
	{#State 13
		DEFAULT => -4,
		GOTOS => {
			'block' => 57,
			'chunk' => 48
		}
	},
	{#State 14
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			"(" => 47,
			'NIL' => 46,
			'TRUE' => 45
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 58,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 15
		ACTIONS => {
			"=" => 60,
			"," => 59
		}
	},
	{#State 16
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			"(" => 47,
			'NIL' => 46,
			'TRUE' => 45
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 61,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 17
		DEFAULT => 0
	},
	{#State 18
		ACTIONS => {
			'NAME' => 62
		}
	},
	{#State 19
		DEFAULT => -80
	},
	{#State 20
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			"(" => 47,
			'NIL' => 46,
			'TRUE' => 45
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 63,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 21
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 65,
			'NOT' => 37,
			'LITERAL' => 39,
			"[" => 67,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			"}" => 69,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'functioncall' => 35,
			'fieldlist' => 64,
			'var' => 34,
			'primary' => 38,
			'_field_plus' => 66,
			'function' => 40,
			'exp' => 68,
			'field' => 70,
			'tableconstructor' => 44
		}
	},
	{#State 22
		DEFAULT => -73
	},
	{#State 23
		ACTIONS => {
			'NAME' => 71
		}
	},
	{#State 24
		DEFAULT => -37
	},
	{#State 25
		DEFAULT => -79
	},
	{#State 26
		ACTIONS => {
			'FUNCTION' => 33,
			")" => 72,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 73,
			'explist1' => 74,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 27
		DEFAULT => -31
	},
	{#State 28
		ACTIONS => {
			"." => 76,
			":" => 75
		},
		DEFAULT => -28
	},
	{#State 29
		ACTIONS => {
			"(" => 77
		},
		GOTOS => {
			'funcbody' => 78
		}
	},
	{#State 30
		ACTIONS => {
			'NAME' => 79
		}
	},
	{#State 31
		DEFAULT => -75
	},
	{#State 32
		DEFAULT => -36
	},
	{#State 33
		ACTIONS => {
			"(" => 77
		},
		GOTOS => {
			'funcbody' => 80
		}
	},
	{#State 34
		ACTIONS => {
			"(" => 26,
			'LITERAL' => 19,
			"[" => 20,
			"{" => 21,
			"." => 23,
			":" => 18
		},
		DEFAULT => -45,
		GOTOS => {
			'args' => 22,
			'key' => 24,
			'tableconstructor' => 25
		}
	},
	{#State 35
		ACTIONS => {
			"(" => 26,
			'LITERAL' => 19,
			"[" => 20,
			"{" => 21,
			"." => 23,
			":" => 30
		},
		DEFAULT => -46,
		GOTOS => {
			'args' => 31,
			'key' => 32,
			'tableconstructor' => 25
		}
	},
	{#State 36
		DEFAULT => -66
	},
	{#State 37
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 81,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 38
		DEFAULT => -44
	},
	{#State 39
		DEFAULT => -67
	},
	{#State 40
		DEFAULT => -68
	},
	{#State 41
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 82,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 42
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			'AND' => 83,
			"-" => 90,
			"==" => 91,
			'DO' => 92,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 43
		DEFAULT => -64
	},
	{#State 44
		DEFAULT => -69
	},
	{#State 45
		DEFAULT => -65
	},
	{#State 46
		DEFAULT => -63
	},
	{#State 47
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 98,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 48
		ACTIONS => {
			'FUNCTION' => 5,
			'NAME' => 7,
			'RETURN' => 100,
			'WHILE' => 8,
			'REPEAT' => 9,
			'FOR' => 10,
			'BREAK' => 101,
			'LOCAL' => 11,
			'DO' => 13,
			'IF' => 14,
			"(" => 16
		},
		DEFAULT => -7,
		GOTOS => {
			'functioncall' => 6,
			'var' => 4,
			'_end_block' => 99,
			'stat' => 12,
			'varlist1' => 15
		}
	},
	{#State 49
		ACTIONS => {
			'UNTIL' => 102
		}
	},
	{#State 50
		ACTIONS => {
			"=" => 103
		},
		DEFAULT => -41
	},
	{#State 51
		ACTIONS => {
			'IN' => 104,
			"," => 105
		}
	},
	{#State 52
		ACTIONS => {
			'NAME' => 106
		}
	},
	{#State 53
		DEFAULT => -41
	},
	{#State 54
		ACTIONS => {
			"," => 105,
			"=" => 107
		},
		DEFAULT => -25
	},
	{#State 55
		DEFAULT => -3
	},
	{#State 56
		DEFAULT => -5
	},
	{#State 57
		ACTIONS => {
			'END' => 108
		}
	},
	{#State 58
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			'AND' => 83,
			'THEN' => 109,
			"==" => 91,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 59
		ACTIONS => {
			'NAME' => 7,
			"(" => 16
		},
		GOTOS => {
			'functioncall' => 111,
			'var' => 110
		}
	},
	{#State 60
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 73,
			'explist1' => 112,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 61
		ACTIONS => {
			")" => 113,
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			'AND' => 83,
			"==" => 91,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 62
		ACTIONS => {
			"{" => 21,
			'LITERAL' => 19,
			"(" => 26
		},
		GOTOS => {
			'args' => 114,
			'tableconstructor' => 25
		}
	},
	{#State 63
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			'AND' => 83,
			"-" => 90,
			"==" => 91,
			"]" => 115,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 64
		ACTIONS => {
			"}" => 116
		}
	},
	{#State 65
		ACTIONS => {
			"=" => 117
		},
		DEFAULT => -34
	},
	{#State 66
		ACTIONS => {
			";" => 119,
			"," => 120
		},
		DEFAULT => -92,
		GOTOS => {
			'fieldsep' => 118
		}
	},
	{#State 67
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 121,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 68
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -97
	},
	{#State 69
		DEFAULT => -90
	},
	{#State 70
		DEFAULT => -94
	},
	{#State 71
		DEFAULT => -39
	},
	{#State 72
		DEFAULT => -78
	},
	{#State 73
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -43
	},
	{#State 74
		ACTIONS => {
			")" => 122,
			"," => 123
		}
	},
	{#State 75
		ACTIONS => {
			'NAME' => 124
		}
	},
	{#State 76
		ACTIONS => {
			'NAME' => 125
		}
	},
	{#State 77
		ACTIONS => {
			")" => 129,
			'NAME' => 126,
			"..." => 128
		},
		GOTOS => {
			'parlist' => 127,
			'parlist1' => 130
		}
	},
	{#State 78
		DEFAULT => -22
	},
	{#State 79
		ACTIONS => {
			"{" => 21,
			'LITERAL' => 19,
			"(" => 26
		},
		GOTOS => {
			'args' => 131,
			'tableconstructor' => 25
		}
	},
	{#State 80
		DEFAULT => -81
	},
	{#State 81
		ACTIONS => {
			"^" => 95
		},
		DEFAULT => -62
	},
	{#State 82
		ACTIONS => {
			"^" => 95
		},
		DEFAULT => -61
	},
	{#State 83
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 132,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 84
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 133,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 85
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 134,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 86
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 135,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 87
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 136,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 88
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 137,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 89
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 138,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 90
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 139,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 91
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 140,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 92
		DEFAULT => -4,
		GOTOS => {
			'block' => 141,
			'chunk' => 48
		}
	},
	{#State 93
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 142,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 94
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 143,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 95
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 144,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 96
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 145,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 97
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 146,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 98
		ACTIONS => {
			")" => 147,
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			'AND' => 83,
			"==" => 91,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 99
		ACTIONS => {
			";" => 56
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 148
		}
	},
	{#State 100
		ACTIONS => {
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'NIL' => 46,
			"(" => 47,
			'FUNCTION' => 33,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45
		},
		DEFAULT => -10,
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 73,
			'explist1' => 149,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 101
		DEFAULT => -11
	},
	{#State 102
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 150,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 103
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 151,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 104
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 73,
			'explist1' => 152,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 105
		ACTIONS => {
			'NAME' => 153
		}
	},
	{#State 106
		ACTIONS => {
			"(" => 77
		},
		GOTOS => {
			'funcbody' => 154
		}
	},
	{#State 107
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 73,
			'explist1' => 155,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 108
		DEFAULT => -14
	},
	{#State 109
		DEFAULT => -4,
		GOTOS => {
			'block' => 156,
			'chunk' => 48
		}
	},
	{#State 110
		ACTIONS => {
			":" => 18,
			'LITERAL' => 19,
			"[" => 20,
			"{" => 21,
			"." => 23,
			"(" => 26
		},
		DEFAULT => -32,
		GOTOS => {
			'args' => 22,
			'key' => 24,
			'tableconstructor' => 25
		}
	},
	{#State 111
		ACTIONS => {
			"{" => 21,
			"." => 23,
			":" => 30,
			'LITERAL' => 19,
			"[" => 20,
			"(" => 26
		},
		GOTOS => {
			'args' => 31,
			'key' => 32,
			'tableconstructor' => 25
		}
	},
	{#State 112
		ACTIONS => {
			"," => 123
		},
		DEFAULT => -12
	},
	{#State 113
		ACTIONS => {
			"{" => 21,
			"." => 23,
			":" => 159,
			'LITERAL' => 19,
			"[" => 20,
			"(" => 26
		},
		GOTOS => {
			'args' => 157,
			'key' => 158,
			'tableconstructor' => 25
		}
	},
	{#State 114
		DEFAULT => -74
	},
	{#State 115
		DEFAULT => -38
	},
	{#State 116
		DEFAULT => -89
	},
	{#State 117
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 160,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 118
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 65,
			'NOT' => 37,
			'LITERAL' => 39,
			"[" => 67,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		DEFAULT => -91,
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 68,
			'field' => 161,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 119
		DEFAULT => -99
	},
	{#State 120
		DEFAULT => -98
	},
	{#State 121
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			'AND' => 83,
			"-" => 90,
			"==" => 91,
			"]" => 162,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 122
		DEFAULT => -77
	},
	{#State 123
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 163,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 124
		DEFAULT => -29
	},
	{#State 125
		DEFAULT => -30
	},
	{#State 126
		DEFAULT => -88
	},
	{#State 127
		ACTIONS => {
			"," => 164
		},
		DEFAULT => -85
	},
	{#State 128
		DEFAULT => -86
	},
	{#State 129
		DEFAULT => -4,
		GOTOS => {
			'block' => 165,
			'chunk' => 48
		}
	},
	{#State 130
		ACTIONS => {
			")" => 166
		}
	},
	{#State 131
		DEFAULT => -76
	},
	{#State 132
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -59
	},
	{#State 133
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -52
	},
	{#State 134
		ACTIONS => {
			"^" => 95
		},
		DEFAULT => -49
	},
	{#State 135
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -60
	},
	{#State 136
		ACTIONS => {
			"*" => 85,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -47
	},
	{#State 137
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -54
	},
	{#State 138
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -53
	},
	{#State 139
		ACTIONS => {
			"*" => 85,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -48
	},
	{#State 140
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -57
	},
	{#State 141
		ACTIONS => {
			'END' => 167
		}
	},
	{#State 142
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -55
	},
	{#State 143
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -56
	},
	{#State 144
		ACTIONS => {
			"^" => 95
		},
		DEFAULT => -51
	},
	{#State 145
		ACTIONS => {
			"^" => 95
		},
		DEFAULT => -50
	},
	{#State 146
		ACTIONS => {
			".." => 84,
			"*" => 85,
			"+" => 87,
			"-" => 90,
			"^" => 95,
			"/" => 96
		},
		DEFAULT => -58
	},
	{#State 147
		ACTIONS => {
			"(" => 26,
			'LITERAL' => 19,
			"[" => 20,
			"{" => 21,
			"." => 23,
			":" => 159
		},
		DEFAULT => -70,
		GOTOS => {
			'args' => 157,
			'key' => 158,
			'tableconstructor' => 25
		}
	},
	{#State 148
		DEFAULT => -8
	},
	{#State 149
		ACTIONS => {
			"," => 123
		},
		DEFAULT => -9
	},
	{#State 150
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -16
	},
	{#State 151
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"," => 168,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			'AND' => 83,
			"==" => 91,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 152
		ACTIONS => {
			'DO' => 169,
			"," => 123
		}
	},
	{#State 153
		DEFAULT => -40
	},
	{#State 154
		DEFAULT => -23
	},
	{#State 155
		ACTIONS => {
			"," => 123
		},
		DEFAULT => -24
	},
	{#State 156
		DEFAULT => -27,
		GOTOS => {
			'_elseif_star' => 170
		}
	},
	{#State 157
		DEFAULT => -71
	},
	{#State 158
		DEFAULT => -35
	},
	{#State 159
		ACTIONS => {
			'NAME' => 171
		}
	},
	{#State 160
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -96
	},
	{#State 161
		DEFAULT => -93
	},
	{#State 162
		ACTIONS => {
			"=" => 172
		}
	},
	{#State 163
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -42
	},
	{#State 164
		ACTIONS => {
			'NAME' => 173,
			"..." => 174
		}
	},
	{#State 165
		ACTIONS => {
			'END' => 175
		}
	},
	{#State 166
		DEFAULT => -4,
		GOTOS => {
			'block' => 176,
			'chunk' => 48
		}
	},
	{#State 167
		DEFAULT => -15
	},
	{#State 168
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 177,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 169
		DEFAULT => -4,
		GOTOS => {
			'block' => 178,
			'chunk' => 48
		}
	},
	{#State 170
		ACTIONS => {
			'ELSEIF' => 181,
			'ELSE' => 179,
			'END' => 180
		}
	},
	{#State 171
		ACTIONS => {
			"{" => 21,
			'LITERAL' => 19,
			"(" => 26
		},
		GOTOS => {
			'args' => 182,
			'tableconstructor' => 25
		}
	},
	{#State 172
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 183,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 173
		DEFAULT => -87
	},
	{#State 174
		DEFAULT => -84
	},
	{#State 175
		DEFAULT => -83
	},
	{#State 176
		ACTIONS => {
			'END' => 184
		}
	},
	{#State 177
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"," => 185,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			'DO' => 186,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		}
	},
	{#State 178
		ACTIONS => {
			'END' => 187
		}
	},
	{#State 179
		DEFAULT => -4,
		GOTOS => {
			'block' => 188,
			'chunk' => 48
		}
	},
	{#State 180
		DEFAULT => -18
	},
	{#State 181
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 189,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 182
		DEFAULT => -72
	},
	{#State 183
		ACTIONS => {
			'AND' => 83,
			".." => 84,
			"*" => 85,
			'OR' => 86,
			"+" => 87,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			"==" => 91,
			">" => 93,
			">=" => 94,
			"^" => 95,
			"/" => 96,
			"~=" => 97
		},
		DEFAULT => -95
	},
	{#State 184
		DEFAULT => -82
	},
	{#State 185
		ACTIONS => {
			'FUNCTION' => 33,
			'NUMBER' => 36,
			'NAME' => 7,
			'NOT' => 37,
			'LITERAL' => 39,
			"{" => 21,
			"-" => 41,
			'FALSE' => 43,
			'TRUE' => 45,
			'NIL' => 46,
			"(" => 47
		},
		GOTOS => {
			'function' => 40,
			'functioncall' => 35,
			'var' => 34,
			'exp' => 190,
			'primary' => 38,
			'tableconstructor' => 44
		}
	},
	{#State 186
		DEFAULT => -4,
		GOTOS => {
			'block' => 191,
			'chunk' => 48
		}
	},
	{#State 187
		DEFAULT => -21
	},
	{#State 188
		ACTIONS => {
			'END' => 192
		}
	},
	{#State 189
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			"-" => 90,
			'AND' => 83,
			'THEN' => 193,
			"==" => 91,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 190
		ACTIONS => {
			"*" => 85,
			"+" => 87,
			'OR' => 86,
			"<=" => 88,
			"<" => 89,
			'AND' => 83,
			"-" => 90,
			"==" => 91,
			'DO' => 194,
			">" => 93,
			"/" => 96,
			"^" => 95,
			">=" => 94,
			".." => 84,
			"~=" => 97
		}
	},
	{#State 191
		ACTIONS => {
			'END' => 195
		}
	},
	{#State 192
		DEFAULT => -17
	},
	{#State 193
		DEFAULT => -4,
		GOTOS => {
			'block' => 196,
			'chunk' => 48
		}
	},
	{#State 194
		DEFAULT => -4,
		GOTOS => {
			'block' => 197,
			'chunk' => 48
		}
	},
	{#State 195
		DEFAULT => -20
	},
	{#State 196
		DEFAULT => -26
	},
	{#State 197
		ACTIONS => {
			'END' => 198
		}
	},
	{#State 198
		DEFAULT => -19
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
#line 46 "Lua\lua50.yp"
{
			BuildMain($_[0], $_[1]);
		}
	],
	[#Rule 2
		 'program', 1,
sub
#line 50 "Lua\lua50.yp"
{
			print "Error (program)\n";
		}
	],
	[#Rule 3
		 'chunk', 3,
sub
#line 57 "Lua\lua50.yp"
{
			[@{$_[1]}, @{$_[2]}];
		}
	],
	[#Rule 4
		 'chunk', 0,
sub
#line 61 "Lua\lua50.yp"
{
			[];
		}
	],
	[#Rule 5
		 '_semicolon_opt', 1, undef
	],
	[#Rule 6
		 '_semicolon_opt', 0, undef
	],
	[#Rule 7
		 'block', 1, undef
	],
	[#Rule 8
		 'block', 3,
sub
#line 77 "Lua\lua50.yp"
{
			[@{$_[1]}, @{$_[2]}];
		}
	],
	[#Rule 9
		 '_end_block', 2,
sub
#line 84 "Lua\lua50.yp"
{
			BuildReturn($_[0], $_[2]);
		}
	],
	[#Rule 10
		 '_end_block', 1,
sub
#line 88 "Lua\lua50.yp"
{
			BuildReturn($_[0], []);
		}
	],
	[#Rule 11
		 '_end_block', 1,
sub
#line 92 "Lua\lua50.yp"
{
			BuildBreak($_[0]);
		}
	],
	[#Rule 12
		 'stat', 3,
sub
#line 99 "Lua\lua50.yp"
{
			BuildAssigns($_[0], $_[1], $_[3])
		}
	],
	[#Rule 13
		 'stat', 1,
sub
#line 103 "Lua\lua50.yp"
{
			get_void($_[0], $_[1]);
		}
	],
	[#Rule 14
		 'stat', 3,
sub
#line 107 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 15
		 'stat', 5,
sub
#line 111 "Lua\lua50.yp"
{
			BuildWhile($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 16
		 'stat', 4,
sub
#line 115 "Lua\lua50.yp"
{
			BuildRepeat($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 17
		 'stat', 8,
sub
#line 119 "Lua\lua50.yp"
{
			BuildIf($_[0], $_[2], $_[4], $_[5], $_[7]);
		}
	],
	[#Rule 18
		 'stat', 6,
sub
#line 123 "Lua\lua50.yp"
{
			BuildIf($_[0], $_[2], $_[4], $_[5], undef);
		}
	],
	[#Rule 19
		 'stat', 11,
sub
#line 127 "Lua\lua50.yp"
{
			BuildForNum($_[0], $_[2], $_[4], $_[6], $_[8], $_[10]);
		}
	],
	[#Rule 20
		 'stat', 9,
sub
#line 131 "Lua\lua50.yp"
{
			BuildForNum($_[0], $_[2], $_[4], $_[6], undef, $_[8]);
		}
	],
	[#Rule 21
		 'stat', 7,
sub
#line 135 "Lua\lua50.yp"
{
			BuildForList($_[0], $_[2], $_[4], $_[6]);
		}
	],
	[#Rule 22
		 'stat', 3,
sub
#line 139 "Lua\lua50.yp"
{
			my $var = BuildVariable($_[0], $_[2]); 
			BuildAssigns($_[0], [$var], [$_[3]])
		}
	],
	[#Rule 23
		 'stat', 4,
sub
#line 144 "Lua\lua50.yp"
{
			my $var = BuildLocalVariable($_[0], $_[3]); 
			BuildAssigns($_[0], [$var], [$_[4]])
		}
	],
	[#Rule 24
		 'stat', 4,
sub
#line 149 "Lua\lua50.yp"
{
			BuildAssigns($_[0], $_[2], $_[4])
		}
	],
	[#Rule 25
		 'stat', 2,
sub
#line 153 "Lua\lua50.yp"
{
			BuildAssigns($_[0], $_[2], [])
		}
	],
	[#Rule 26
		 '_elseif_star', 5,
sub
#line 160 "Lua\lua50.yp"
{
			[@{$_[1]}, [$_[3], $_[5]]];
		}
	],
	[#Rule 27
		 '_elseif_star', 0,
sub
#line 164 "Lua\lua50.yp"
{
			[];
		}
	],
	[#Rule 28
		 'funcname', 1, undef
	],
	[#Rule 29
		 'funcname', 3, undef
	],
	[#Rule 30
		 '_funcname', 3,
sub
#line 177 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 31
		 '_funcname', 1,
sub
#line 181 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 32
		 'varlist1', 3,
sub
#line 188 "Lua\lua50.yp"
{
			[
				@{$_[1]}, 
				BuildVariable($_[0], $_[3])
			]
		}
	],
	[#Rule 33
		 'varlist1', 1,
sub
#line 195 "Lua\lua50.yp"
{
			[
				BuildVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 34
		 'var', 1,
sub
#line 204 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 35
		 'var', 4, undef
	],
	[#Rule 36
		 'var', 2, undef
	],
	[#Rule 37
		 'var', 2,
sub
#line 210 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[2]];
		}
	],
	[#Rule 38
		 'key', 3,
sub
#line 217 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 39
		 'key', 2,
sub
#line 221 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[2], 'string');
		}
	],
	[#Rule 40
		 'namelist', 3,
sub
#line 228 "Lua\lua50.yp"
{
			[
				@{$_[1]},
				BuildLocalVariable($_[0], $_[3])
			];
		}
	],
	[#Rule 41
		 'namelist', 1,
sub
#line 235 "Lua\lua50.yp"
{
			[
				BuildLocalVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 42
		 'explist1', 3,
sub
#line 244 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 43
		 'explist1', 1,
sub
#line 248 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 44
		 'exp', 1, undef
	],
	[#Rule 45
		 'exp', 1,
sub
#line 257 "Lua\lua50.yp"
{
			BuildCallVariable($_[0], $_[1]);
		}
	],
	[#Rule 46
		 'exp', 1, undef
	],
	[#Rule 47
		 'exp', 3,
sub
#line 263 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 48
		 'exp', 3,
sub
#line 267 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 49
		 'exp', 3,
sub
#line 271 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 50
		 'exp', 3,
sub
#line 275 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 51
		 'exp', 3,
sub
#line 279 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 52
		 'exp', 3,
sub
#line 283 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 53
		 'exp', 3,
sub
#line 287 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 54
		 'exp', 3,
sub
#line 291 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 55
		 'exp', 3,
sub
#line 295 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 56
		 'exp', 3,
sub
#line 299 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 57
		 'exp', 3,
sub
#line 303 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 58
		 'exp', 3,
sub
#line 307 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 59
		 'exp', 3,
sub
#line 311 "Lua\lua50.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 60
		 'exp', 3,
sub
#line 315 "Lua\lua50.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 61
		 'exp', 2,
sub
#line 319 "Lua\lua50.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 62
		 'exp', 2,
sub
#line 323 "Lua\lua50.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 63
		 'primary', 1,
sub
#line 330 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'nil');
		}
	],
	[#Rule 64
		 'primary', 1,
sub
#line 334 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 65
		 'primary', 1,
sub
#line 338 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 66
		 'primary', 1,
sub
#line 342 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'number');
		}
	],
	[#Rule 67
		 'primary', 1,
sub
#line 346 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'string');
		}
	],
	[#Rule 68
		 'primary', 1, undef
	],
	[#Rule 69
		 'primary', 1, undef
	],
	[#Rule 70
		 'primary', 3,
sub
#line 354 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 71
		 'functioncall', 4,
sub
#line 361 "Lua\lua50.yp"
{
			BuildCallFunction($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 72
		 'functioncall', 6, undef
	],
	[#Rule 73
		 'functioncall', 2,
sub
#line 366 "Lua\lua50.yp"
{
			my $fct = BuildCallVariable($_[0], $_[1]);
			BuildCallFunction($_[0], $fct, $_[2]);
		}
	],
	[#Rule 74
		 'functioncall', 4, undef
	],
	[#Rule 75
		 'functioncall', 2,
sub
#line 372 "Lua\lua50.yp"
{
			BuildCallFunction($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 76
		 'functioncall', 4, undef
	],
	[#Rule 77
		 'args', 3,
sub
#line 380 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 78
		 'args', 2,
sub
#line 384 "Lua\lua50.yp"
{
			[];
		}
	],
	[#Rule 79
		 'args', 1,
sub
#line 388 "Lua\lua50.yp"
{
			[
				$_[1]
			]
		}
	],
	[#Rule 80
		 'args', 1,
sub
#line 394 "Lua\lua50.yp"
{
			[
				BuildLiteral($_[0], $_[1], 'string')
			]
		}
	],
	[#Rule 81
		 'function', 2,
sub
#line 403 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 82
		 'funcbody', 5,
sub
#line 410 "Lua\lua50.yp"
{
			BuildFunctionBody($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 83
		 'funcbody', 4,
sub
#line 414 "Lua\lua50.yp"
{
			BuildFunctionBody($_[0], [], $_[3]);
		}
	],
	[#Rule 84
		 'parlist1', 3,
sub
#line 421 "Lua\lua50.yp"
{
			[
				@{$_[1]},
				BuildParam($_[0], $_[3])
			];
		}
	],
	[#Rule 85
		 'parlist1', 1, undef
	],
	[#Rule 86
		 'parlist1', 1,
sub
#line 430 "Lua\lua50.yp"
{
			[
				BuildParam($_[0], $_[1])
			];
		}
	],
	[#Rule 87
		 'parlist', 3,
sub
#line 439 "Lua\lua50.yp"
{
			[
				@{$_[1]},
				BuildParam($_[0], $_[3])
			];
		}
	],
	[#Rule 88
		 'parlist', 1,
sub
#line 446 "Lua\lua50.yp"
{
			[
				BuildParam($_[0], $_[1])
			]
		}
	],
	[#Rule 89
		 'tableconstructor', 3,
sub
#line 455 "Lua\lua50.yp"
{
			BuildTable($_[0], $_[2]);
		}
	],
	[#Rule 90
		 'tableconstructor', 2,
sub
#line 459 "Lua\lua50.yp"
{
			BuildTable($_[0], []);
		}
	],
	[#Rule 91
		 'fieldlist', 2, undef
	],
	[#Rule 92
		 'fieldlist', 1, undef
	],
	[#Rule 93
		 '_field_plus', 3,
sub
#line 473 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 94
		 '_field_plus', 1,
sub
#line 477 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 95
		 'field', 5,
sub
#line 484 "Lua\lua50.yp"
{
			[$_[2], $_[5]]
		}
	],
	[#Rule 96
		 'field', 3,
sub
#line 488 "Lua\lua50.yp"
{
			[BuildLiteral($_[0], $_[1], 'string'), $_[3]]
		}
	],
	[#Rule 97
		 'field', 1,
sub
#line 492 "Lua\lua50.yp"
{
			[$_[1]]
		}
	],
	[#Rule 98
		 'fieldsep', 1, undef
	],
	[#Rule 99
		 'fieldsep', 1, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 504 "Lua\lua50.yp"


package Lua::parser;

use strict;

use Lua::lexer;
use Lua::build;
use Lua::symbtab;
use Lua::pir;


sub Run {
	my $parser = shift;
	my ($srcname) = @_;

	open $parser->YYData->{fh}, $srcname
			or die "can't open $srcname ($!).\n";

	$parser->YYData->{shebang} = 1;
	$parser->YYData->{srcname} = $srcname;
	my @st = stat($parser->YYData->{srcname});
	$parser->YYData->{srcname_size} = $st[7];
	$parser->YYData->{srcname_mtime} = $st[9];
	$parser->_InitLexico();
	$parser->YYData->{functs} = [];
	$parser->YYData->{symbtab} = new SymbTabVar($parser);
	$parser->YYData->{symbtab_cst} = new SymbTabConst($parser);
	$parser->YYData->{idx_tmp} = 0;
	$parser->YYData->{idx_lbl} = 0;
	$parser->YYData->{idx_fct} = 0;
	$parser->YYParse(
			yylex	=> \&_Lexer,
			yyerror	=> sub { return; },
#			yydebug	=> 0x17,
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
}

sub Generate {
	my $parser = shift;

	my $filename = $parser->YYData->{srcname};
	$filename =~ s/\.lua$/\.pir/i;
	open FH, "> $filename"
			or die "can't open $filename ($!).\n";

	my $generator = new pirVisitor(\*FH);
	print FH $generator->{prologue};
	foreach my $fct (@{$parser->YYData->{functs}}) {
		foreach (@{$fct}) {
#			if (ref $_) {
			if (ref($_) =~ /(Dir|Op)$/) {
				$_->visit($generator);
			} else {
				print $_,"\n";
				die;
			}
		}
	}
}


1;
