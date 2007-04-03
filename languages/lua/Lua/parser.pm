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
		ACTIONS => {
			'NAME' => 59
		},
		GOTOS => {
			'funcname' => 60,
			'_funcname' => 61
		}
	},
	{#State 14
		ACTIONS => {
			"," => 62,
			"=" => 63
		}
	},
	{#State 15
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 65,
			'chunk' => 64
		}
	},
	{#State 16
		ACTIONS => {
			'NAME' => 67,
			'FUNCTION' => 66
		},
		GOTOS => {
			'namelist' => 68
		}
	},
	{#State 17
		DEFAULT => -14,
		GOTOS => {
			'@2-1' => 69
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
			'_semicolon_opt' => 70
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
			'exp' => 71,
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
			'@1-1' => 72
		}
	},
	{#State 22
		DEFAULT => 0
	},
	{#State 23
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 73,
			'chunk' => 64
		}
	},
	{#State 24
		ACTIONS => {
			"=" => 74
		},
		DEFAULT => -53
	},
	{#State 25
		ACTIONS => {
			"," => 75,
			'IN' => 76
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
			'NAME' => 77
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
			'exp' => 78,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 34
		ACTIONS => {
			"}" => 79,
			"-" => 37,
			'NAME' => 83,
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
			"[" => 80,
			'NUMBER' => 50
		},
		GOTOS => {
			'exp' => 82,
			'function' => 40,
			'primary' => 42,
			'fieldlist' => 84,
			'functioncall' => 45,
			'tableconstructor' => 46,
			'var' => 49,
			'_field_plus' => 85,
			'field' => 81
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
			")" => 87
		},
		GOTOS => {
			'exp' => 51,
			'functioncall' => 45,
			'explist1' => 86,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 36
		ACTIONS => {
			'NAME' => 88
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
			'exp' => 89,
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
			"," => 90
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
			'exp' => 91,
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
			'@11-1' => 92
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
			"-" => 94,
			"<" => 96,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"*" => 102,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			">" => 107,
			".." => 93,
			"~=" => 95,
			"+" => 97,
			"^" => 101,
			"/" => 103
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
			'exp' => 108,
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
			'exp' => 109,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 55
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			'THEN' => 110,
			"<=" => 106,
			'OR' => 105,
			">" => 107
		}
	},
	{#State 56
		ACTIONS => {
			'NAME' => 111
		}
	},
	{#State 57
		DEFAULT => -88
	},
	{#State 58
		DEFAULT => -49
	},
	{#State 59
		DEFAULT => -43
	},
	{#State 60
		DEFAULT => -27,
		GOTOS => {
			'@8-2' => 112
		}
	},
	{#State 61
		ACTIONS => {
			":" => 113,
			"." => 114
		},
		DEFAULT => -40
	},
	{#State 62
		ACTIONS => {
			"(" => 20,
			'NAME' => 18
		},
		GOTOS => {
			'functioncall' => 115,
			'var' => 116
		}
	},
	{#State 63
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
			'explist1' => 117,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 64
		DEFAULT => -9
	},
	{#State 65
		DEFAULT => -36,
		GOTOS => {
			'_elseif_star' => 118
		}
	},
	{#State 66
		ACTIONS => {
			'NAME' => 119
		}
	},
	{#State 67
		DEFAULT => -53
	},
	{#State 68
		ACTIONS => {
			"," => 75,
			"=" => 120
		},
		DEFAULT => -32
	},
	{#State 69
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
			'exp' => 121,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 70
		DEFAULT => -5
	},
	{#State 71
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			"<=" => 106,
			'OR' => 105,
			")" => 122,
			">" => 107
		}
	},
	{#State 72
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 123,
			'chunk' => 64
		}
	},
	{#State 73
		ACTIONS => {
			'UNTIL' => 124
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
			'exp' => 125,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 75
		ACTIONS => {
			'NAME' => 126
		}
	},
	{#State 76
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
			'explist1' => 127,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 77
		ACTIONS => {
			"(" => 35,
			"{" => 34,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 128
		}
	},
	{#State 78
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			"<=" => 106,
			'OR' => 105,
			"]" => 129,
			">" => 107
		}
	},
	{#State 79
		DEFAULT => -106
	},
	{#State 80
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
			'exp' => 130,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 81
		DEFAULT => -110
	},
	{#State 82
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"^" => 101,
			"*" => 102,
			"/" => 103,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			">" => 107
		},
		DEFAULT => -113
	},
	{#State 83
		ACTIONS => {
			"=" => 131
		},
		DEFAULT => -46
	},
	{#State 84
		ACTIONS => {
			"}" => 132
		}
	},
	{#State 85
		ACTIONS => {
			";" => 134,
			"," => 135
		},
		DEFAULT => -108,
		GOTOS => {
			'fieldsep' => 133
		}
	},
	{#State 86
		ACTIONS => {
			"," => 90,
			")" => 136
		}
	},
	{#State 87
		DEFAULT => -93
	},
	{#State 88
		DEFAULT => -51
	},
	{#State 89
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -74
	},
	{#State 90
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
			'exp' => 137,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 91
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -76
	},
	{#State 92
		ACTIONS => {
			"(" => 139
		},
		GOTOS => {
			'funcbody' => 138
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
			'exp' => 153,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 107
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
			'exp' => 154,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 108
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			"<=" => 106,
			'OR' => 105,
			")" => 155,
			">" => 107
		}
	},
	{#State 109
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -75
	},
	{#State 110
		DEFAULT => -33
	},
	{#State 111
		ACTIONS => {
			"(" => 35,
			"{" => 34,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 156
		}
	},
	{#State 112
		ACTIONS => {
			"(" => 139
		},
		GOTOS => {
			'funcbody' => 157
		}
	},
	{#State 113
		ACTIONS => {
			'NAME' => 158
		}
	},
	{#State 114
		ACTIONS => {
			'NAME' => 159
		}
	},
	{#State 115
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
	{#State 116
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
	{#State 117
		ACTIONS => {
			"," => 90
		},
		DEFAULT => -10
	},
	{#State 118
		ACTIONS => {
			'ELSE' => 160,
			'ELSEIF' => 162,
			'END' => 161
		}
	},
	{#State 119
		DEFAULT => -29,
		GOTOS => {
			'@9-3' => 163
		}
	},
	{#State 120
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
			'explist1' => 164,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 121
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			'DO' => 165,
			"<=" => 106,
			'OR' => 105,
			">" => 107
		}
	},
	{#State 122
		ACTIONS => {
			":" => 166,
			"(" => 35,
			"{" => 34,
			"[" => 33,
			"." => 36,
			'STRING' => 30
		},
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 167,
			'key' => 168
		}
	},
	{#State 123
		ACTIONS => {
			'END' => 169
		}
	},
	{#State 124
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
			'exp' => 170,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 125
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"," => 171,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			"<=" => 106,
			'OR' => 105,
			">" => 107
		}
	},
	{#State 126
		DEFAULT => -52
	},
	{#State 127
		ACTIONS => {
			"," => 90,
			'DO' => 172
		}
	},
	{#State 128
		DEFAULT => -91
	},
	{#State 129
		DEFAULT => -50
	},
	{#State 130
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			"<=" => 106,
			'OR' => 105,
			"]" => 173,
			">" => 107
		}
	},
	{#State 131
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
			'exp' => 174,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42
		}
	},
	{#State 132
		DEFAULT => -105
	},
	{#State 133
		ACTIONS => {
			"-" => 37,
			'TRUE' => 38,
			'NOT' => 41,
			'STRING' => 43,
			'NIL' => 44,
			'FALSE' => 47,
			'FUNCTION' => 48,
			"[" => 80,
			'NUMBER' => 50,
			'NAME' => 83,
			"{" => 34,
			"..." => 52,
			"(" => 53,
			"#" => 54
		},
		DEFAULT => -107,
		GOTOS => {
			'exp' => 82,
			'functioncall' => 45,
			'function' => 40,
			'tableconstructor' => 46,
			'var' => 49,
			'primary' => 42,
			'field' => 175
		}
	},
	{#State 134
		DEFAULT => -115
	},
	{#State 135
		DEFAULT => -114
	},
	{#State 136
		DEFAULT => -92
	},
	{#State 137
		ACTIONS => {
			"-" => 94,
			"<" => 96,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"*" => 102,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			">" => 107,
			".." => 93,
			"~=" => 95,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -54
	},
	{#State 138
		DEFAULT => -97
	},
	{#State 139
		ACTIONS => {
			'NAME' => 178,
			"..." => 179,
			")" => 177
		},
		GOTOS => {
			'parlist' => 176,
			'parlist1' => 180
		}
	},
	{#State 140
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -65
	},
	{#State 141
		ACTIONS => {
			"%" => 98,
			"*" => 102,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -60
	},
	{#State 142
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			".." => 93,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -71
	},
	{#State 143
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			".." => 93,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -66
	},
	{#State 144
		ACTIONS => {
			"%" => 98,
			"*" => 102,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -59
	},
	{#State 145
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -64
	},
	{#State 146
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			".." => 93,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -70
	},
	{#State 147
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			".." => 93,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -69
	},
	{#State 148
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -63
	},
	{#State 149
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -61
	},
	{#State 150
		ACTIONS => {
			"^" => 101
		},
		DEFAULT => -62
	},
	{#State 151
		ACTIONS => {
			"-" => 94,
			"<" => 96,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"*" => 102,
			"<=" => 106,
			">" => 107,
			".." => 93,
			"~=" => 95,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -72
	},
	{#State 152
		ACTIONS => {
			"-" => 94,
			"<" => 96,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"*" => 102,
			"<=" => 106,
			">" => 107,
			".." => 93,
			"~=" => 95,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -73
	},
	{#State 153
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			".." => 93,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -67
	},
	{#State 154
		ACTIONS => {
			"-" => 94,
			"%" => 98,
			"*" => 102,
			".." => 93,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -68
	},
	{#State 155
		ACTIONS => {
			":" => 166,
			"[" => 33,
			"(" => 35,
			"." => 36,
			'STRING' => 30,
			"{" => 34
		},
		DEFAULT => -85,
		GOTOS => {
			'tableconstructor' => 32,
			'args' => 167,
			'key' => 168
		}
	},
	{#State 156
		DEFAULT => -89
	},
	{#State 157
		DEFAULT => -28
	},
	{#State 158
		DEFAULT => -41
	},
	{#State 159
		DEFAULT => -42
	},
	{#State 160
		DEFAULT => -18,
		GOTOS => {
			'@4-4' => 181
		}
	},
	{#State 161
		DEFAULT => -20
	},
	{#State 162
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
	{#State 163
		ACTIONS => {
			"(" => 139
		},
		GOTOS => {
			'funcbody' => 183
		}
	},
	{#State 164
		ACTIONS => {
			"," => 90
		},
		DEFAULT => -31
	},
	{#State 165
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 184,
			'chunk' => 64
		}
	},
	{#State 166
		ACTIONS => {
			'NAME' => 185
		}
	},
	{#State 167
		DEFAULT => -86
	},
	{#State 168
		DEFAULT => -47
	},
	{#State 169
		DEFAULT => -13
	},
	{#State 170
		ACTIONS => {
			"-" => 94,
			"<" => 96,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"*" => 102,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			">" => 107,
			".." => 93,
			"~=" => 95,
			"+" => 97,
			"^" => 101,
			"/" => 103
		},
		DEFAULT => -17
	},
	{#State 171
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
	{#State 172
		DEFAULT => -25,
		GOTOS => {
			'@7-5' => 187
		}
	},
	{#State 173
		ACTIONS => {
			"=" => 188
		}
	},
	{#State 174
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"^" => 101,
			"*" => 102,
			"/" => 103,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			">" => 107
		},
		DEFAULT => -112
	},
	{#State 175
		DEFAULT => -109
	},
	{#State 176
		ACTIONS => {
			"," => 189
		},
		DEFAULT => -101
	},
	{#State 177
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 190,
			'chunk' => 64
		}
	},
	{#State 178
		DEFAULT => -104
	},
	{#State 179
		DEFAULT => -102
	},
	{#State 180
		ACTIONS => {
			")" => 191
		}
	},
	{#State 181
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 192,
			'chunk' => 64
		}
	},
	{#State 182
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			'THEN' => 193,
			"<=" => 106,
			'OR' => 105,
			">" => 107
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
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"," => 196,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"^" => 101,
			"*" => 102,
			"/" => 103,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			'DO' => 197,
			">" => 107
		}
	},
	{#State 187
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 198,
			'chunk' => 64
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
			'chunk' => 64
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
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			"^" => 101,
			"*" => 102,
			"/" => 103,
			'AND' => 104,
			'OR' => 105,
			"<=" => 106,
			">" => 107
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
			'chunk' => 64
		}
	},
	{#State 206
		ACTIONS => {
			"-" => 94,
			".." => 93,
			"<" => 96,
			"~=" => 95,
			"+" => 97,
			"/" => 103,
			"%" => 98,
			"==" => 99,
			">=" => 100,
			'AND' => 104,
			"^" => 101,
			"*" => 102,
			'DO' => 211,
			"<=" => 106,
			'OR' => 105,
			">" => 107
		}
	},
	{#State 207
		DEFAULT => -6,
		GOTOS => {
			'_stat' => 1,
			'block' => 212,
			'chunk' => 64
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
			'chunk' => 64
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
#line 46 "Lua\lua51.yp"
{
            BuildMain( $_[0], $_[1] );
        }
	],
	[#Rule 2
		 'program', 1,
sub
#line 50 "Lua\lua51.yp"
{
            print "Error (program)\n";
        }
	],
	[#Rule 3
		 'chunk', 3,
sub
#line 57 "Lua\lua51.yp"
{
            [ @{ $_[1] }, @{ $_[2] } ];
        }
	],
	[#Rule 4
		 'chunk', 1,
sub
#line 61 "Lua\lua51.yp"
{
            $_[1];
        }
	],
	[#Rule 5
		 '_stat', 3,
sub
#line 68 "Lua\lua51.yp"
{
            [ @{ $_[1] }, @{ $_[2] } ];
        }
	],
	[#Rule 6
		 '_stat', 0,
sub
#line 72 "Lua\lua51.yp"
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
#line 86 "Lua\lua51.yp"
{
            PopScope( $_[0] );
            $_[1];
        }
	],
	[#Rule 10
		 'stat', 3,
sub
#line 94 "Lua\lua51.yp"
{
            BuildAssigns( $_[0], $_[1], $_[3] );
        }
	],
	[#Rule 11
		 'stat', 1,
sub
#line 98 "Lua\lua51.yp"
{
            BuildVoidFunctionCall( $_[0], $_[1] );
        }
	],
	[#Rule 12
		 '@1-1', 0,
sub
#line 102 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 13
		 'stat', 4,
sub
#line 106 "Lua\lua51.yp"
{
            $_[3];
        }
	],
	[#Rule 14
		 '@2-1', 0,
sub
#line 110 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 15
		 'stat', 6,
sub
#line 114 "Lua\lua51.yp"
{
            BuildWhile( $_[0], $_[3], $_[5] );
        }
	],
	[#Rule 16
		 '@3-1', 0,
sub
#line 118 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 17
		 'stat', 5,
sub
#line 122 "Lua\lua51.yp"
{
            BuildRepeat( $_[0], $_[3], $_[5] );
        }
	],
	[#Rule 18
		 '@4-4', 0,
sub
#line 126 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 19
		 'stat', 7,
sub
#line 130 "Lua\lua51.yp"
{
            BuildIf( $_[0], $_[1], $_[2], $_[3], $_[6] );
        }
	],
	[#Rule 20
		 'stat', 4,
sub
#line 134 "Lua\lua51.yp"
{
            BuildIf( $_[0], $_[1], $_[2], $_[3], undef );
        }
	],
	[#Rule 21
		 '@5-9', 0,
sub
#line 138 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            my $var = BuildLocalVariable( $_[0], $_[2] );
            Insert( $_[0], $var );
        }
	],
	[#Rule 22
		 'stat', 12,
sub
#line 144 "Lua\lua51.yp"
{
            BuildForNum( $_[0], $_[10], $_[4], $_[6], $_[8], $_[11] );
        }
	],
	[#Rule 23
		 '@6-7', 0,
sub
#line 148 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            my $var = BuildLocalVariable( $_[0], $_[2] );
            Insert( $_[0], $var );
        }
	],
	[#Rule 24
		 'stat', 10,
sub
#line 154 "Lua\lua51.yp"
{
            BuildForNum( $_[0], $_[8], $_[4], $_[6], undef, $_[9] );
        }
	],
	[#Rule 25
		 '@7-5', 0,
sub
#line 158 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            InsertList( $_[0], $_[2] );
        }
	],
	[#Rule 26
		 'stat', 8,
sub
#line 163 "Lua\lua51.yp"
{
            BuildForList( $_[0], $_[2], $_[4], $_[7] );
        }
	],
	[#Rule 27
		 '@8-2', 0,
sub
#line 167 "Lua\lua51.yp"
{
            my $var = BuildVariable( $_[0], $_[2] );
            PushScopeF( $_[0] );
            PushScope( $_[0] );
            return $var;
        }
	],
	[#Rule 28
		 'stat', 4,
sub
#line 174 "Lua\lua51.yp"
{
            BuildAssigns( $_[0], [ $_[3] ], [ $_[4] ] );
        }
	],
	[#Rule 29
		 '@9-3', 0,
sub
#line 178 "Lua\lua51.yp"
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
#line 186 "Lua\lua51.yp"
{
            BuildAssigns( $_[0], [ $_[4] ], [ $_[5] ] );
        }
	],
	[#Rule 31
		 'stat', 4,
sub
#line 190 "Lua\lua51.yp"
{
            InsertList( $_[0], $_[2] );
            BuildAssigns( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 32
		 'stat', 2,
sub
#line 195 "Lua\lua51.yp"
{
            InsertList( $_[0], $_[2] );
            BuildAssigns( $_[0], $_[2], [] );
        }
	],
	[#Rule 33
		 '_if_then', 3,
sub
#line 203 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            $_[2];
        }
	],
	[#Rule 34
		 '@10-4', 0,
sub
#line 211 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 35
		 '_elseif_star', 6,
sub
#line 215 "Lua\lua51.yp"
{
            [ @{ $_[1] }, [ $_[3], $_[6] ] ];
        }
	],
	[#Rule 36
		 '_elseif_star', 0,
sub
#line 219 "Lua\lua51.yp"
{
            [];
        }
	],
	[#Rule 37
		 'laststat', 2,
sub
#line 226 "Lua\lua51.yp"
{
            BuildReturn( $_[0], $_[2] );
        }
	],
	[#Rule 38
		 'laststat', 1,
sub
#line 230 "Lua\lua51.yp"
{
            BuildReturn( $_[0], [] );
        }
	],
	[#Rule 39
		 'laststat', 1,
sub
#line 234 "Lua\lua51.yp"
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
#line 243 "Lua\lua51.yp"
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
#line 254 "Lua\lua51.yp"
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
#line 261 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 44
		 'varlist1', 3,
sub
#line 268 "Lua\lua51.yp"
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
#line 275 "Lua\lua51.yp"
{
            [
                BuildVariable( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 46
		 'var', 1,
sub
#line 284 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 47
		 'var', 4,
sub
#line 288 "Lua\lua51.yp"
{
            [ $_[2], $_[4] ];
        }
	],
	[#Rule 48
		 'var', 2,
sub
#line 292 "Lua\lua51.yp"
{
            [ $_[1], $_[2] ];
        }
	],
	[#Rule 49
		 'var', 2,
sub
#line 296 "Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[2] ];
        }
	],
	[#Rule 50
		 'key', 3,
sub
#line 303 "Lua\lua51.yp"
{
            $_[2];
        }
	],
	[#Rule 51
		 'key', 2,
sub
#line 307 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[2], 'key' );
        }
	],
	[#Rule 52
		 'namelist', 3,
sub
#line 314 "Lua\lua51.yp"
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
#line 321 "Lua\lua51.yp"
{
            [
                BuildLocalVariable( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 54
		 'explist1', 3,
sub
#line 330 "Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[3] ];
        }
	],
	[#Rule 55
		 'explist1', 1,
sub
#line 334 "Lua\lua51.yp"
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
#line 343 "Lua\lua51.yp"
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
#line 349 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 60
		 'exp', 3,
sub
#line 353 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 61
		 'exp', 3,
sub
#line 357 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 62
		 'exp', 3,
sub
#line 361 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 63
		 'exp', 3,
sub
#line 365 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 64
		 'exp', 3,
sub
#line 369 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 65
		 'exp', 3,
sub
#line 373 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 66
		 'exp', 3,
sub
#line 377 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 67
		 'exp', 3,
sub
#line 381 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 68
		 'exp', 3,
sub
#line 385 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 69
		 'exp', 3,
sub
#line 389 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 70
		 'exp', 3,
sub
#line 393 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 71
		 'exp', 3,
sub
#line 397 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 72
		 'exp', 3,
sub
#line 401 "Lua\lua51.yp"
{
            BuildLogop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 73
		 'exp', 3,
sub
#line 405 "Lua\lua51.yp"
{
            BuildLogop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 74
		 'exp', 2,
sub
#line 409 "Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 75
		 'exp', 2,
sub
#line 413 "Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 76
		 'exp', 2,
sub
#line 417 "Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 77
		 'primary', 1,
sub
#line 424 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'nil' );
        }
	],
	[#Rule 78
		 'primary', 1,
sub
#line 428 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'boolean' );
        }
	],
	[#Rule 79
		 'primary', 1,
sub
#line 432 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'boolean' );
        }
	],
	[#Rule 80
		 'primary', 1,
sub
#line 436 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'number' );
        }
	],
	[#Rule 81
		 'primary', 1,
sub
#line 440 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'string' );
        }
	],
	[#Rule 82
		 'primary', 1,
sub
#line 444 "Lua\lua51.yp"
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
#line 452 "Lua\lua51.yp"
{
            BuildParenthesedExpression( $_[0], $_[2] );
        }
	],
	[#Rule 86
		 'functioncall', 4,
sub
#line 459 "Lua\lua51.yp"
{
            BuildCallFunction( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 87
		 'functioncall', 6,
sub
#line 463 "Lua\lua51.yp"
{
            BuildCallMethod( $_[0], $_[2], $_[5], $_[6] );
        }
	],
	[#Rule 88
		 'functioncall', 2,
sub
#line 467 "Lua\lua51.yp"
{
            my $fct = BuildCallVariable( $_[0], $_[1] );
            BuildCallFunction( $_[0], $fct, $_[2] );
        }
	],
	[#Rule 89
		 'functioncall', 4,
sub
#line 472 "Lua\lua51.yp"
{
            my $obj = BuildCallVariable( $_[0], $_[1] );
            BuildCallMethod( $_[0], $obj, $_[3], $_[4] );
        }
	],
	[#Rule 90
		 'functioncall', 2,
sub
#line 477 "Lua\lua51.yp"
{
            BuildCallFunction( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 91
		 'functioncall', 4,
sub
#line 481 "Lua\lua51.yp"
{
            BuildCallMethod( $_[0], $_[1], $_[3], $_[4] );
        }
	],
	[#Rule 92
		 'args', 3,
sub
#line 488 "Lua\lua51.yp"
{
            $_[2];
        }
	],
	[#Rule 93
		 'args', 2,
sub
#line 492 "Lua\lua51.yp"
{
            [];
        }
	],
	[#Rule 94
		 'args', 1,
sub
#line 496 "Lua\lua51.yp"
{
            [
                $_[1],
            ];
        }
	],
	[#Rule 95
		 'args', 1,
sub
#line 502 "Lua\lua51.yp"
{
            [
                BuildLiteral( $_[0], $_[1], 'string' ),
            ];
        }
	],
	[#Rule 96
		 '@11-1', 0,
sub
#line 511 "Lua\lua51.yp"
{
            PushScopeF( $_[0] );
            PushScope( $_[0] );
        }
	],
	[#Rule 97
		 'function', 3,
sub
#line 516 "Lua\lua51.yp"
{
            $_[3];
        }
	],
	[#Rule 98
		 'funcbody', 5,
sub
#line 523 "Lua\lua51.yp"
{
            PopScopeF( $_[0] );
            BuildFunctionBody( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 99
		 'funcbody', 4,
sub
#line 528 "Lua\lua51.yp"
{
            PopScopeF( $_[0] );
            BuildFunctionBody( $_[0], [], $_[3] );
        }
	],
	[#Rule 100
		 'parlist1', 3,
sub
#line 536 "Lua\lua51.yp"
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
#line 545 "Lua\lua51.yp"
{
            [
                BuildParam( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 103
		 'parlist', 3,
sub
#line 554 "Lua\lua51.yp"
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
#line 561 "Lua\lua51.yp"
{
            [
                BuildParam( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 105
		 'tableconstructor', 3,
sub
#line 570 "Lua\lua51.yp"
{
            BuildTable( $_[0], $_[2] );
        }
	],
	[#Rule 106
		 'tableconstructor', 2,
sub
#line 574 "Lua\lua51.yp"
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
#line 588 "Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[3] ];
        }
	],
	[#Rule 110
		 '_field_plus', 1,
sub
#line 592 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 111
		 'field', 5,
sub
#line 599 "Lua\lua51.yp"
{
            [ $_[2], $_[5] ];
        }
	],
	[#Rule 112
		 'field', 3,
sub
#line 603 "Lua\lua51.yp"
{
            [ BuildLiteral( $_[0], $_[1], 'key' ), $_[3] ];
        }
	],
	[#Rule 113
		 'field', 1,
sub
#line 607 "Lua\lua51.yp"
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

#line 619 "Lua\lua51.yp"


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
    $parser->_InitLexico();
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
        yylex   => \&_Lexer,
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
    my $prologue = $generator->{prologue};
    $filename =~ s/\.pir$//;
    $prologue =~ s/tmp/$filename/gm;
    print {$FH} $prologue;
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
        print {$FH} "  # end of prolog\n";
        foreach my $op ( @{$fct} ) {
            $op->visit($generator) unless ( exists $op->{prolog} );
        }
    }
    close $FH;
    return;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:


1;
