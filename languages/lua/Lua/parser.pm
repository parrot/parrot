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
			'' => -4,
			'NAME' => -4,
			'REPEAT' => -4,
			'FOR' => -4,
			"(" => -4,
			'IF' => -4,
			'error' => 1,
			'FUNCTION' => -4,
			'DO' => -4,
			'LOCAL' => -4,
			'WHILE' => -4
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
			'NAME' => 4,
			'REPEAT' => 5,
			'FOR' => 6,
			"(" => 8,
			'IF' => 10,
			'FUNCTION' => 12,
			'DO' => 15,
			'WHILE' => 16,
			'LOCAL' => 17
		},
		DEFAULT => -1,
		GOTOS => {
			'functioncall' => 9,
			'var' => 11,
			'_if_then' => 14,
			'varlist1' => 13,
			'stat' => 7
		}
	},
	{#State 3
		ACTIONS => {
			'' => 18
		}
	},
	{#State 4
		DEFAULT => -45
	},
	{#State 5
		DEFAULT => -18,
		GOTOS => {
			'@3-1' => 19
		}
	},
	{#State 6
		ACTIONS => {
			'NAME' => 20
		},
		GOTOS => {
			'namelist' => 21
		}
	},
	{#State 7
		ACTIONS => {
			";" => 22
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 23
		}
	},
	{#State 8
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 37,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 9
		ACTIONS => {
			":" => 40,
			'LITERAL' => 42,
			"[" => 45,
			"{" => 38,
			"(" => 46,
			"." => 47
		},
		DEFAULT => -13,
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 41,
			'key' => 43
		}
	},
	{#State 10
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 48,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 11
		ACTIONS => {
			":" => 49,
			"{" => 38,
			'LITERAL' => 42,
			"(" => 46,
			"[" => 45,
			"." => 47
		},
		DEFAULT => -44,
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 50,
			'key' => 51
		}
	},
	{#State 12
		DEFAULT => -29,
		GOTOS => {
			'@8-1' => 52
		}
	},
	{#State 13
		ACTIONS => {
			"," => 53,
			"=" => 54
		}
	},
	{#State 14
		DEFAULT => -4,
		GOTOS => {
			'block' => 56,
			'chunk' => 55
		}
	},
	{#State 15
		DEFAULT => -14,
		GOTOS => {
			'@1-1' => 57
		}
	},
	{#State 16
		DEFAULT => -16,
		GOTOS => {
			'@2-1' => 58
		}
	},
	{#State 17
		ACTIONS => {
			'NAME' => 60,
			'FUNCTION' => 59
		},
		GOTOS => {
			'namelist' => 61
		}
	},
	{#State 18
		DEFAULT => 0
	},
	{#State 19
		DEFAULT => -4,
		GOTOS => {
			'block' => 62,
			'chunk' => 55
		}
	},
	{#State 20
		ACTIONS => {
			"=" => 63
		},
		DEFAULT => -52
	},
	{#State 21
		ACTIONS => {
			"," => 64,
			'IN' => 65
		}
	},
	{#State 22
		DEFAULT => -5
	},
	{#State 23
		DEFAULT => -3
	},
	{#State 24
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 66,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 25
		DEFAULT => -76
	},
	{#State 26
		DEFAULT => -79
	},
	{#State 27
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 67,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 28
		DEFAULT => -55
	},
	{#State 29
		DEFAULT => -78
	},
	{#State 30
		DEFAULT => -74
	},
	{#State 31
		ACTIONS => {
			":" => 40,
			"[" => 45,
			"(" => 46,
			"." => 47,
			'LITERAL' => 42,
			"{" => 38
		},
		DEFAULT => -57,
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 41,
			'key' => 43
		}
	},
	{#State 32
		DEFAULT => -80
	},
	{#State 33
		DEFAULT => -75
	},
	{#State 34
		DEFAULT => -92,
		GOTOS => {
			'@11-1' => 68
		}
	},
	{#State 35
		ACTIONS => {
			":" => 49,
			"[" => 45,
			"(" => 46,
			"." => 47,
			'LITERAL' => 42,
			"{" => 38
		},
		DEFAULT => -56,
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 50,
			'key' => 51
		}
	},
	{#State 36
		DEFAULT => -77
	},
	{#State 37
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			"<=" => 82,
			'OR' => 81,
			")" => 78,
			">" => 83
		}
	},
	{#State 38
		ACTIONS => {
			"}" => 84,
			"-" => 24,
			'NAME' => 88,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			"[" => 85,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 87,
			'function' => 26,
			'primary' => 28,
			'fieldlist' => 89,
			'functioncall' => 31,
			'tableconstructor' => 32,
			'var' => 35,
			'_field_plus' => 90,
			'field' => 86
		}
	},
	{#State 39
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 91,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 40
		ACTIONS => {
			'NAME' => 92
		}
	},
	{#State 41
		DEFAULT => -86
	},
	{#State 42
		DEFAULT => -91
	},
	{#State 43
		DEFAULT => -47
	},
	{#State 44
		DEFAULT => -90
	},
	{#State 45
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 93,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 46
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36,
			")" => 95
		},
		GOTOS => {
			'exp' => 96,
			'functioncall' => 31,
			'explist1' => 94,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 47
		ACTIONS => {
			'NAME' => 97
		}
	},
	{#State 48
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			'THEN' => 98,
			"<=" => 82,
			'OR' => 81,
			">" => 83
		}
	},
	{#State 49
		ACTIONS => {
			'NAME' => 99
		}
	},
	{#State 50
		DEFAULT => -84
	},
	{#State 51
		DEFAULT => -48
	},
	{#State 52
		ACTIONS => {
			'NAME' => 100
		},
		GOTOS => {
			'funcname' => 101,
			'_funcname' => 102
		}
	},
	{#State 53
		ACTIONS => {
			"(" => 8,
			'NAME' => 4
		},
		GOTOS => {
			'functioncall' => 103,
			'var' => 104
		}
	},
	{#State 54
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 96,
			'functioncall' => 31,
			'explist1' => 105,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 55
		ACTIONS => {
			'NAME' => 4,
			'BREAK' => 106,
			'REPEAT' => 5,
			'FOR' => 6,
			"(" => 8,
			'IF' => 10,
			'RETURN' => 108,
			'FUNCTION' => 12,
			'DO' => 15,
			'LOCAL' => 17,
			'WHILE' => 16
		},
		DEFAULT => -7,
		GOTOS => {
			'functioncall' => 9,
			'var' => 11,
			'_end_block' => 107,
			'varlist1' => 13,
			'_if_then' => 14,
			'stat' => 7
		}
	},
	{#State 56
		DEFAULT => -38,
		GOTOS => {
			'_elseif_star' => 109
		}
	},
	{#State 57
		DEFAULT => -4,
		GOTOS => {
			'block' => 110,
			'chunk' => 55
		}
	},
	{#State 58
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 111,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 59
		DEFAULT => -31,
		GOTOS => {
			'@9-2' => 112
		}
	},
	{#State 60
		DEFAULT => -52
	},
	{#State 61
		ACTIONS => {
			"," => 64,
			"=" => 113
		},
		DEFAULT => -34
	},
	{#State 62
		ACTIONS => {
			'UNTIL' => 114
		}
	},
	{#State 63
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 115,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 64
		ACTIONS => {
			'NAME' => 116
		}
	},
	{#State 65
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 96,
			'functioncall' => 31,
			'explist1' => 117,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 66
		ACTIONS => {
			"^" => 76
		},
		DEFAULT => -72
	},
	{#State 67
		ACTIONS => {
			"^" => 76
		},
		DEFAULT => -73
	},
	{#State 68
		ACTIONS => {
			"(" => 119
		},
		GOTOS => {
			'funcbody' => 118
		}
	},
	{#State 69
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 120,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 70
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 121,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 71
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 122,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 72
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 123,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 73
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 124,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 74
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 125,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 75
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 126,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 76
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 127,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 77
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 128,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 78
		ACTIONS => {
			":" => 129,
			"(" => 46,
			"{" => 38,
			"[" => 45,
			'LITERAL' => 42,
			"." => 47
		},
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 130,
			'key' => 131
		}
	},
	{#State 79
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 132,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 80
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 133,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 81
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 134,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 82
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 135,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 83
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 136,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 84
		DEFAULT => -102
	},
	{#State 85
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 137,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 86
		DEFAULT => -106
	},
	{#State 87
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"==" => 74,
			">=" => 75,
			"^" => 76,
			"*" => 77,
			"/" => 79,
			'AND' => 80,
			'OR' => 81,
			"<=" => 82,
			">" => 83
		},
		DEFAULT => -109
	},
	{#State 88
		ACTIONS => {
			"=" => 138
		},
		DEFAULT => -45
	},
	{#State 89
		ACTIONS => {
			"}" => 139
		}
	},
	{#State 90
		ACTIONS => {
			";" => 141,
			"," => 142
		},
		DEFAULT => -104,
		GOTOS => {
			'fieldsep' => 140
		}
	},
	{#State 91
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			"<=" => 82,
			'OR' => 81,
			")" => 143,
			">" => 83
		}
	},
	{#State 92
		ACTIONS => {
			"(" => 46,
			"{" => 38,
			'LITERAL' => 42
		},
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 144
		}
	},
	{#State 93
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			"<=" => 82,
			'OR' => 81,
			"]" => 145,
			">" => 83
		}
	},
	{#State 94
		ACTIONS => {
			"," => 146,
			")" => 147
		}
	},
	{#State 95
		DEFAULT => -89
	},
	{#State 96
		ACTIONS => {
			"-" => 70,
			"<" => 72,
			"==" => 74,
			">=" => 75,
			"*" => 77,
			'AND' => 80,
			'OR' => 81,
			"<=" => 82,
			">" => 83,
			".." => 69,
			"~=" => 71,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -54
	},
	{#State 97
		DEFAULT => -50
	},
	{#State 98
		DEFAULT => -35
	},
	{#State 99
		ACTIONS => {
			"(" => 46,
			"{" => 38,
			'LITERAL' => 42
		},
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 148
		}
	},
	{#State 100
		DEFAULT => -42
	},
	{#State 101
		ACTIONS => {
			"(" => 119
		},
		GOTOS => {
			'funcbody' => 149
		}
	},
	{#State 102
		ACTIONS => {
			":" => 150,
			"." => 151
		},
		DEFAULT => -39
	},
	{#State 103
		ACTIONS => {
			":" => 40,
			"(" => 46,
			"{" => 38,
			"[" => 45,
			'LITERAL' => 42,
			"." => 47
		},
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 41,
			'key' => 43
		}
	},
	{#State 104
		ACTIONS => {
			":" => 49,
			"{" => 38,
			'LITERAL' => 42,
			"(" => 46,
			"[" => 45,
			"." => 47
		},
		DEFAULT => -43,
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 50,
			'key' => 51
		}
	},
	{#State 105
		ACTIONS => {
			"," => 146
		},
		DEFAULT => -12
	},
	{#State 106
		DEFAULT => -11
	},
	{#State 107
		ACTIONS => {
			";" => 22
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 152
		}
	},
	{#State 108
		ACTIONS => {
			"-" => 24,
			'TRUE' => 25,
			'NOT' => 27,
			'LITERAL' => 29,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36,
			'NAME' => 4,
			"{" => 38,
			"(" => 39
		},
		DEFAULT => -10,
		GOTOS => {
			'exp' => 96,
			'functioncall' => 31,
			'explist1' => 153,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 109
		ACTIONS => {
			'ELSE' => 154,
			'ELSEIF' => 156,
			'END' => 155
		}
	},
	{#State 110
		ACTIONS => {
			'END' => 157
		}
	},
	{#State 111
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			'DO' => 158,
			"<=" => 82,
			'OR' => 81,
			">" => 83
		}
	},
	{#State 112
		ACTIONS => {
			'NAME' => 159
		}
	},
	{#State 113
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 96,
			'functioncall' => 31,
			'explist1' => 160,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 114
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 161,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 115
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"," => 162,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			"<=" => 82,
			'OR' => 81,
			">" => 83
		}
	},
	{#State 116
		DEFAULT => -51
	},
	{#State 117
		ACTIONS => {
			"," => 146,
			'DO' => 163
		}
	},
	{#State 118
		DEFAULT => -93
	},
	{#State 119
		ACTIONS => {
			'NAME' => 166,
			"..." => 167,
			")" => 165
		},
		GOTOS => {
			'parlist' => 164,
			'parlist1' => 168
		}
	},
	{#State 120
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -63
	},
	{#State 121
		ACTIONS => {
			"*" => 77,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -59
	},
	{#State 122
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			".." => 69,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -69
	},
	{#State 123
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			".." => 69,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -64
	},
	{#State 124
		ACTIONS => {
			"*" => 77,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -58
	},
	{#State 125
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			".." => 69,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -68
	},
	{#State 126
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			".." => 69,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -67
	},
	{#State 127
		ACTIONS => {
			"^" => 76
		},
		DEFAULT => -62
	},
	{#State 128
		ACTIONS => {
			"^" => 76
		},
		DEFAULT => -60
	},
	{#State 129
		ACTIONS => {
			'NAME' => 169
		}
	},
	{#State 130
		DEFAULT => -82
	},
	{#State 131
		DEFAULT => -46
	},
	{#State 132
		ACTIONS => {
			"^" => 76
		},
		DEFAULT => -61
	},
	{#State 133
		ACTIONS => {
			"-" => 70,
			"<" => 72,
			"==" => 74,
			">=" => 75,
			"*" => 77,
			"<=" => 82,
			">" => 83,
			".." => 69,
			"~=" => 71,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -70
	},
	{#State 134
		ACTIONS => {
			"-" => 70,
			"<" => 72,
			"==" => 74,
			">=" => 75,
			"*" => 77,
			"<=" => 82,
			">" => 83,
			".." => 69,
			"~=" => 71,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -71
	},
	{#State 135
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			".." => 69,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -65
	},
	{#State 136
		ACTIONS => {
			"-" => 70,
			"*" => 77,
			".." => 69,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -66
	},
	{#State 137
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			"<=" => 82,
			'OR' => 81,
			"]" => 170,
			">" => 83
		}
	},
	{#State 138
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 171,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 139
		DEFAULT => -101
	},
	{#State 140
		ACTIONS => {
			"-" => 24,
			'NAME' => 88,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			"[" => 85,
			'NUMBER' => 36
		},
		DEFAULT => -103,
		GOTOS => {
			'exp' => 87,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28,
			'field' => 172
		}
	},
	{#State 141
		DEFAULT => -111
	},
	{#State 142
		DEFAULT => -110
	},
	{#State 143
		ACTIONS => {
			":" => 129,
			"[" => 45,
			"(" => 46,
			"." => 47,
			'LITERAL' => 42,
			"{" => 38
		},
		DEFAULT => -81,
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 130,
			'key' => 131
		}
	},
	{#State 144
		DEFAULT => -87
	},
	{#State 145
		DEFAULT => -49
	},
	{#State 146
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 173,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 147
		DEFAULT => -88
	},
	{#State 148
		DEFAULT => -85
	},
	{#State 149
		DEFAULT => -30
	},
	{#State 150
		ACTIONS => {
			'NAME' => 174
		}
	},
	{#State 151
		ACTIONS => {
			'NAME' => 175
		}
	},
	{#State 152
		DEFAULT => -8
	},
	{#State 153
		ACTIONS => {
			"," => 146
		},
		DEFAULT => -9
	},
	{#State 154
		DEFAULT => -20,
		GOTOS => {
			'@4-4' => 176
		}
	},
	{#State 155
		DEFAULT => -22
	},
	{#State 156
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 177,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 157
		DEFAULT => -15
	},
	{#State 158
		DEFAULT => -4,
		GOTOS => {
			'block' => 178,
			'chunk' => 55
		}
	},
	{#State 159
		ACTIONS => {
			"(" => 119
		},
		GOTOS => {
			'funcbody' => 179
		}
	},
	{#State 160
		ACTIONS => {
			"," => 146
		},
		DEFAULT => -33
	},
	{#State 161
		ACTIONS => {
			"-" => 70,
			"<" => 72,
			"==" => 74,
			">=" => 75,
			"*" => 77,
			'AND' => 80,
			'OR' => 81,
			"<=" => 82,
			">" => 83,
			".." => 69,
			"~=" => 71,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -19
	},
	{#State 162
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 180,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 163
		DEFAULT => -27,
		GOTOS => {
			'@7-5' => 181
		}
	},
	{#State 164
		ACTIONS => {
			"," => 182
		},
		DEFAULT => -97
	},
	{#State 165
		DEFAULT => -4,
		GOTOS => {
			'block' => 183,
			'chunk' => 55
		}
	},
	{#State 166
		DEFAULT => -100
	},
	{#State 167
		DEFAULT => -98
	},
	{#State 168
		ACTIONS => {
			")" => 184
		}
	},
	{#State 169
		ACTIONS => {
			"(" => 46,
			"{" => 38,
			'LITERAL' => 42
		},
		GOTOS => {
			'tableconstructor' => 44,
			'args' => 185
		}
	},
	{#State 170
		ACTIONS => {
			"=" => 186
		}
	},
	{#State 171
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"==" => 74,
			">=" => 75,
			"^" => 76,
			"*" => 77,
			"/" => 79,
			'AND' => 80,
			'OR' => 81,
			"<=" => 82,
			">" => 83
		},
		DEFAULT => -108
	},
	{#State 172
		DEFAULT => -105
	},
	{#State 173
		ACTIONS => {
			"-" => 70,
			"<" => 72,
			"==" => 74,
			">=" => 75,
			"*" => 77,
			'AND' => 80,
			'OR' => 81,
			"<=" => 82,
			">" => 83,
			".." => 69,
			"~=" => 71,
			"+" => 73,
			"^" => 76,
			"/" => 79
		},
		DEFAULT => -53
	},
	{#State 174
		DEFAULT => -40
	},
	{#State 175
		DEFAULT => -41
	},
	{#State 176
		DEFAULT => -4,
		GOTOS => {
			'block' => 187,
			'chunk' => 55
		}
	},
	{#State 177
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			'THEN' => 188,
			"<=" => 82,
			'OR' => 81,
			">" => 83
		}
	},
	{#State 178
		ACTIONS => {
			'END' => 189
		}
	},
	{#State 179
		DEFAULT => -32
	},
	{#State 180
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"," => 190,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			'DO' => 191,
			"<=" => 82,
			'OR' => 81,
			">" => 83
		}
	},
	{#State 181
		DEFAULT => -4,
		GOTOS => {
			'block' => 192,
			'chunk' => 55
		}
	},
	{#State 182
		ACTIONS => {
			'NAME' => 193,
			"..." => 194
		}
	},
	{#State 183
		ACTIONS => {
			'END' => 195
		}
	},
	{#State 184
		DEFAULT => -4,
		GOTOS => {
			'block' => 196,
			'chunk' => 55
		}
	},
	{#State 185
		DEFAULT => -83
	},
	{#State 186
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 197,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 187
		ACTIONS => {
			'END' => 198
		}
	},
	{#State 188
		DEFAULT => -36,
		GOTOS => {
			'@10-4' => 199
		}
	},
	{#State 189
		DEFAULT => -17
	},
	{#State 190
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			'LITERAL' => 29,
			"(" => 39,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 200,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 191
		DEFAULT => -25,
		GOTOS => {
			'@6-7' => 201
		}
	},
	{#State 192
		ACTIONS => {
			'END' => 202
		}
	},
	{#State 193
		DEFAULT => -99
	},
	{#State 194
		DEFAULT => -96
	},
	{#State 195
		DEFAULT => -95
	},
	{#State 196
		ACTIONS => {
			'END' => 203
		}
	},
	{#State 197
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"==" => 74,
			">=" => 75,
			"^" => 76,
			"*" => 77,
			"/" => 79,
			'AND' => 80,
			'OR' => 81,
			"<=" => 82,
			">" => 83
		},
		DEFAULT => -107
	},
	{#State 198
		DEFAULT => -21
	},
	{#State 199
		DEFAULT => -4,
		GOTOS => {
			'block' => 204,
			'chunk' => 55
		}
	},
	{#State 200
		ACTIONS => {
			"-" => 70,
			".." => 69,
			"<" => 72,
			"~=" => 71,
			"+" => 73,
			"/" => 79,
			"==" => 74,
			">=" => 75,
			'AND' => 80,
			"^" => 76,
			"*" => 77,
			'DO' => 205,
			"<=" => 82,
			'OR' => 81,
			">" => 83
		}
	},
	{#State 201
		DEFAULT => -4,
		GOTOS => {
			'block' => 206,
			'chunk' => 55
		}
	},
	{#State 202
		DEFAULT => -28
	},
	{#State 203
		DEFAULT => -94
	},
	{#State 204
		DEFAULT => -37
	},
	{#State 205
		DEFAULT => -23,
		GOTOS => {
			'@5-9' => 207
		}
	},
	{#State 206
		ACTIONS => {
			'END' => 208
		}
	},
	{#State 207
		DEFAULT => -4,
		GOTOS => {
			'block' => 209,
			'chunk' => 55
		}
	},
	{#State 208
		DEFAULT => -26
	},
	{#State 209
		ACTIONS => {
			'END' => 210
		}
	},
	{#State 210
		DEFAULT => -24
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
		 'block', 1,
sub
#line 75 "Lua\lua50.yp"
{
			PopScope($_[0]);
			$_[1];
		}
	],
	[#Rule 8
		 'block', 3,
sub
#line 80 "Lua\lua50.yp"
{
			PopScope($_[0]);
			[@{$_[1]}, @{$_[2]}];
		}
	],
	[#Rule 9
		 '_end_block', 2,
sub
#line 88 "Lua\lua50.yp"
{
			BuildReturn($_[0], $_[2]);
		}
	],
	[#Rule 10
		 '_end_block', 1,
sub
#line 92 "Lua\lua50.yp"
{
			BuildReturn($_[0], []);
		}
	],
	[#Rule 11
		 '_end_block', 1,
sub
#line 96 "Lua\lua50.yp"
{
			BuildBreak($_[0]);
		}
	],
	[#Rule 12
		 'stat', 3,
sub
#line 103 "Lua\lua50.yp"
{
			BuildAssigns($_[0], $_[1], $_[3])
		}
	],
	[#Rule 13
		 'stat', 1,
sub
#line 107 "Lua\lua50.yp"
{
			BuildVoidFunctionCall($_[0], $_[1]);
		}
	],
	[#Rule 14
		 '@1-1', 0,
sub
#line 111 "Lua\lua50.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 15
		 'stat', 4,
sub
#line 115 "Lua\lua50.yp"
{
			$_[3];
		}
	],
	[#Rule 16
		 '@2-1', 0,
sub
#line 119 "Lua\lua50.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 17
		 'stat', 6,
sub
#line 123 "Lua\lua50.yp"
{
			BuildWhile($_[0], $_[3], $_[5]);
		}
	],
	[#Rule 18
		 '@3-1', 0,
sub
#line 127 "Lua\lua50.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 19
		 'stat', 5,
sub
#line 131 "Lua\lua50.yp"
{
			BuildRepeat($_[0], $_[3], $_[5]);
		}
	],
	[#Rule 20
		 '@4-4', 0,
sub
#line 135 "Lua\lua50.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 21
		 'stat', 7,
sub
#line 139 "Lua\lua50.yp"
{
			BuildIf($_[0], $_[1], $_[2], $_[3], $_[6]);
		}
	],
	[#Rule 22
		 'stat', 4,
sub
#line 143 "Lua\lua50.yp"
{
			BuildIf($_[0], $_[1], $_[2], $_[3], undef);
		}
	],
	[#Rule 23
		 '@5-9', 0,
sub
#line 147 "Lua\lua50.yp"
{
			PushScope($_[0]);
			my $var = BuildLocalVariable($_[0], $_[2]);
			Insert($_[0], $var);
		}
	],
	[#Rule 24
		 'stat', 12,
sub
#line 153 "Lua\lua50.yp"
{
			BuildForNum($_[0], $_[10], $_[4], $_[6], $_[8], $_[11]);
		}
	],
	[#Rule 25
		 '@6-7', 0,
sub
#line 157 "Lua\lua50.yp"
{
			PushScope($_[0]);
			my $var = BuildLocalVariable($_[0], $_[2]);
			Insert($_[0], $var);
		}
	],
	[#Rule 26
		 'stat', 10,
sub
#line 163 "Lua\lua50.yp"
{
			BuildForNum($_[0], $_[8], $_[4], $_[6], undef, $_[9]);
		}
	],
	[#Rule 27
		 '@7-5', 0,
sub
#line 167 "Lua\lua50.yp"
{
			PushScope($_[0]);
			InsertList($_[0], $_[2]);
		}
	],
	[#Rule 28
		 'stat', 8,
sub
#line 172 "Lua\lua50.yp"
{
			BuildForList($_[0], $_[2], $_[4], $_[7]);
		}
	],
	[#Rule 29
		 '@8-1', 0,
sub
#line 176 "Lua\lua50.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 30
		 'stat', 4,
sub
#line 181 "Lua\lua50.yp"
{
			my $var = BuildVariable($_[0], $_[3]); 
			BuildAssigns($_[0], [$var], [$_[4]])
		}
	],
	[#Rule 31
		 '@9-2', 0,
sub
#line 186 "Lua\lua50.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 32
		 'stat', 5,
sub
#line 191 "Lua\lua50.yp"
{
			my $var = BuildLocalVariable($_[0], $_[4]);
			Insert($_[0], $var);
			BuildAssigns($_[0], [$var], [$_[5]])
		}
	],
	[#Rule 33
		 'stat', 4,
sub
#line 197 "Lua\lua50.yp"
{
			InsertList($_[0], $_[2]);
			BuildAssigns($_[0], $_[2], $_[4])
		}
	],
	[#Rule 34
		 'stat', 2,
sub
#line 202 "Lua\lua50.yp"
{
			InsertList($_[0], $_[2]);
			BuildAssigns($_[0], $_[2], [])
		}
	],
	[#Rule 35
		 '_if_then', 3,
sub
#line 210 "Lua\lua50.yp"
{
			PushScope($_[0]);
			$_[2];
		}
	],
	[#Rule 36
		 '@10-4', 0,
sub
#line 218 "Lua\lua50.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 37
		 '_elseif_star', 6,
sub
#line 222 "Lua\lua50.yp"
{
			[@{$_[1]}, [$_[3], $_[6]]];
		}
	],
	[#Rule 38
		 '_elseif_star', 0,
sub
#line 226 "Lua\lua50.yp"
{
			[];
		}
	],
	[#Rule 39
		 'funcname', 1, undef
	],
	[#Rule 40
		 'funcname', 3, undef
	],
	[#Rule 41
		 '_funcname', 3,
sub
#line 239 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 42
		 '_funcname', 1,
sub
#line 243 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 43
		 'varlist1', 3,
sub
#line 250 "Lua\lua50.yp"
{
			[
				@{$_[1]}, 
				BuildVariable($_[0], $_[3])
			]
		}
	],
	[#Rule 44
		 'varlist1', 1,
sub
#line 257 "Lua\lua50.yp"
{
			[
				BuildVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 45
		 'var', 1,
sub
#line 266 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 46
		 'var', 4, undef
	],
	[#Rule 47
		 'var', 2, undef
	],
	[#Rule 48
		 'var', 2,
sub
#line 272 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[2]];
		}
	],
	[#Rule 49
		 'key', 3,
sub
#line 279 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 50
		 'key', 2,
sub
#line 283 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[2], 'key');
		}
	],
	[#Rule 51
		 'namelist', 3,
sub
#line 290 "Lua\lua50.yp"
{
			[
				@{$_[1]},
				BuildLocalVariable($_[0], $_[3])
			];
		}
	],
	[#Rule 52
		 'namelist', 1,
sub
#line 297 "Lua\lua50.yp"
{
			[
				BuildLocalVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 53
		 'explist1', 3,
sub
#line 306 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 54
		 'explist1', 1,
sub
#line 310 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 55
		 'exp', 1, undef
	],
	[#Rule 56
		 'exp', 1,
sub
#line 319 "Lua\lua50.yp"
{
			BuildCallVariable($_[0], $_[1]);
		}
	],
	[#Rule 57
		 'exp', 1, undef
	],
	[#Rule 58
		 'exp', 3,
sub
#line 325 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 59
		 'exp', 3,
sub
#line 329 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 60
		 'exp', 3,
sub
#line 333 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 61
		 'exp', 3,
sub
#line 337 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 62
		 'exp', 3,
sub
#line 341 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 63
		 'exp', 3,
sub
#line 345 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 64
		 'exp', 3,
sub
#line 349 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 65
		 'exp', 3,
sub
#line 353 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 66
		 'exp', 3,
sub
#line 357 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 67
		 'exp', 3,
sub
#line 361 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 68
		 'exp', 3,
sub
#line 365 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 69
		 'exp', 3,
sub
#line 369 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 70
		 'exp', 3,
sub
#line 373 "Lua\lua50.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 71
		 'exp', 3,
sub
#line 377 "Lua\lua50.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 72
		 'exp', 2,
sub
#line 381 "Lua\lua50.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 73
		 'exp', 2,
sub
#line 385 "Lua\lua50.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 74
		 'primary', 1,
sub
#line 392 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'nil');
		}
	],
	[#Rule 75
		 'primary', 1,
sub
#line 396 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 76
		 'primary', 1,
sub
#line 400 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 77
		 'primary', 1,
sub
#line 404 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'number');
		}
	],
	[#Rule 78
		 'primary', 1,
sub
#line 408 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'string');
		}
	],
	[#Rule 79
		 'primary', 1, undef
	],
	[#Rule 80
		 'primary', 1, undef
	],
	[#Rule 81
		 'primary', 3,
sub
#line 416 "Lua\lua50.yp"
{
			BuildParenthesedExpression($_[0], $_[2]);
		}
	],
	[#Rule 82
		 'functioncall', 4,
sub
#line 423 "Lua\lua50.yp"
{
			BuildCallFunction($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 83
		 'functioncall', 6, undef
	],
	[#Rule 84
		 'functioncall', 2,
sub
#line 428 "Lua\lua50.yp"
{
			my $fct = BuildCallVariable($_[0], $_[1]);
			BuildCallFunction($_[0], $fct, $_[2]);
		}
	],
	[#Rule 85
		 'functioncall', 4, undef
	],
	[#Rule 86
		 'functioncall', 2,
sub
#line 434 "Lua\lua50.yp"
{
			BuildCallFunction($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 87
		 'functioncall', 4, undef
	],
	[#Rule 88
		 'args', 3,
sub
#line 442 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 89
		 'args', 2,
sub
#line 446 "Lua\lua50.yp"
{
			[];
		}
	],
	[#Rule 90
		 'args', 1,
sub
#line 450 "Lua\lua50.yp"
{
			[
				$_[1]
			]
		}
	],
	[#Rule 91
		 'args', 1,
sub
#line 456 "Lua\lua50.yp"
{
			[
				BuildLiteral($_[0], $_[1], 'string')
			]
		}
	],
	[#Rule 92
		 '@11-1', 0,
sub
#line 465 "Lua\lua50.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 93
		 'function', 3,
sub
#line 470 "Lua\lua50.yp"
{
			$_[3];
		}
	],
	[#Rule 94
		 'funcbody', 5,
sub
#line 477 "Lua\lua50.yp"
{
			PopScopeF($_[0]);
			BuildFunctionBody($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 95
		 'funcbody', 4,
sub
#line 482 "Lua\lua50.yp"
{
			PopScopeF($_[0]);
			BuildFunctionBody($_[0], [], $_[3]);
		}
	],
	[#Rule 96
		 'parlist1', 3,
sub
#line 490 "Lua\lua50.yp"
{
			[
				@{$_[1]},
				BuildParam($_[0], $_[3])
			];
		}
	],
	[#Rule 97
		 'parlist1', 1, undef
	],
	[#Rule 98
		 'parlist1', 1,
sub
#line 499 "Lua\lua50.yp"
{
			[
				BuildParam($_[0], $_[1])
			];
		}
	],
	[#Rule 99
		 'parlist', 3,
sub
#line 508 "Lua\lua50.yp"
{
			[
				@{$_[1]},
				BuildParam($_[0], $_[3])
			];
		}
	],
	[#Rule 100
		 'parlist', 1,
sub
#line 515 "Lua\lua50.yp"
{
			[
				BuildParam($_[0], $_[1])
			]
		}
	],
	[#Rule 101
		 'tableconstructor', 3,
sub
#line 524 "Lua\lua50.yp"
{
			BuildTable($_[0], $_[2]);
		}
	],
	[#Rule 102
		 'tableconstructor', 2,
sub
#line 528 "Lua\lua50.yp"
{
			BuildTable($_[0], []);
		}
	],
	[#Rule 103
		 'fieldlist', 2, undef
	],
	[#Rule 104
		 'fieldlist', 1, undef
	],
	[#Rule 105
		 '_field_plus', 3,
sub
#line 542 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 106
		 '_field_plus', 1,
sub
#line 546 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 107
		 'field', 5,
sub
#line 553 "Lua\lua50.yp"
{
			[$_[2], $_[5]]
		}
	],
	[#Rule 108
		 'field', 3,
sub
#line 557 "Lua\lua50.yp"
{
			[BuildLiteral($_[0], $_[1], 'key'), $_[3]]
		}
	],
	[#Rule 109
		 'field', 1,
sub
#line 561 "Lua\lua50.yp"
{
			[$_[1]]
		}
	],
	[#Rule 110
		 'fieldsep', 1, undef
	],
	[#Rule 111
		 'fieldsep', 1, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 573 "Lua\lua50.yp"


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
	$parser->YYData->{scope} = [];
	$parser->YYData->{scopef} = [];
	$parser->YYData->{symbtab} = new SymbTabVar($parser);
	$parser->YYData->{symbtab_cst} = new SymbTabConst($parser);
	$parser->YYData->{_G} = undef;
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
#	my $generator = new pirVisitor(\*STDOUT);
	print FH $generator->{prologue};
	foreach my $fct (@{$parser->YYData->{functs}}) {
		foreach (@{$fct}) {
#			if (ref $_) {
			if (ref($_) =~ /(Dir|Op)$/) {
				$_->visit($generator) if (exists $_->{prolog});
#				$_->visit($generator);
			} else {
				print $_,"\n";
				die;
			}
		}
		print FH "  # end of prolog\n";
		foreach (@{$fct}) {
			$_->visit($generator) unless (exists $_->{prolog});
		}
	}
}


1;
