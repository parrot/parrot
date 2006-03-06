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
			'varlist1' => 15,
			'_if_then' => 17
		}
	},
	{#State 3
		ACTIONS => {
			'' => 18
		}
	},
	{#State 4
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"." => 24,
			":" => 19,
			"(" => 27,
			"[" => 20
		},
		DEFAULT => -44,
		GOTOS => {
			'args' => 22,
			'key' => 25,
			'tableconstructor' => 26
		}
	},
	{#State 5
		DEFAULT => -26,
		GOTOS => {
			'@8-1' => 28
		}
	},
	{#State 6
		ACTIONS => {
			'STRING' => 23,
			"(" => 27,
			":" => 29,
			"[" => 20,
			"{" => 21,
			"." => 24
		},
		DEFAULT => -10,
		GOTOS => {
			'args' => 30,
			'key' => 31,
			'tableconstructor' => 26
		}
	},
	{#State 7
		DEFAULT => -45
	},
	{#State 8
		DEFAULT => -13,
		GOTOS => {
			'@2-1' => 32
		}
	},
	{#State 9
		DEFAULT => -15,
		GOTOS => {
			'@3-1' => 33
		}
	},
	{#State 10
		ACTIONS => {
			'NAME' => 34
		},
		GOTOS => {
			'namelist' => 35
		}
	},
	{#State 11
		ACTIONS => {
			'FUNCTION' => 36,
			'NAME' => 37
		},
		GOTOS => {
			'namelist' => 38
		}
	},
	{#State 12
		ACTIONS => {
			";" => 40
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 39
		}
	},
	{#State 13
		DEFAULT => -11,
		GOTOS => {
			'@1-1' => 41
		}
	},
	{#State 14
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 54,
			'primary' => 52,
			'tableconstructor' => 57
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
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 61,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 17
		DEFAULT => -4,
		GOTOS => {
			'block' => 63,
			'chunk' => 62
		}
	},
	{#State 18
		DEFAULT => 0
	},
	{#State 19
		ACTIONS => {
			'NAME' => 64
		}
	},
	{#State 20
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 65,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 21
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 67,
			'NOT' => 44,
			"#" => 45,
			"[" => 69,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			"}" => 71,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'functioncall' => 51,
			'fieldlist' => 66,
			'var' => 42,
			'primary' => 52,
			'_field_plus' => 68,
			'function' => 53,
			'exp' => 70,
			'field' => 72,
			'tableconstructor' => 57
		}
	},
	{#State 22
		DEFAULT => -87
	},
	{#State 23
		DEFAULT => -94
	},
	{#State 24
		ACTIONS => {
			'NAME' => 73
		}
	},
	{#State 25
		DEFAULT => -48
	},
	{#State 26
		DEFAULT => -93
	},
	{#State 27
		ACTIONS => {
			'FUNCTION' => 50,
			")" => 74,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 75,
			'explist1' => 76,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 28
		ACTIONS => {
			'NAME' => 77
		},
		GOTOS => {
			'funcname' => 79,
			'_funcname' => 78
		}
	},
	{#State 29
		ACTIONS => {
			'NAME' => 80
		}
	},
	{#State 30
		DEFAULT => -89
	},
	{#State 31
		DEFAULT => -47
	},
	{#State 32
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 81,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 33
		DEFAULT => -4,
		GOTOS => {
			'block' => 82,
			'chunk' => 62
		}
	},
	{#State 34
		ACTIONS => {
			"=" => 83
		},
		DEFAULT => -52
	},
	{#State 35
		ACTIONS => {
			'IN' => 84,
			"," => 85
		}
	},
	{#State 36
		DEFAULT => -28,
		GOTOS => {
			'@9-2' => 86
		}
	},
	{#State 37
		DEFAULT => -52
	},
	{#State 38
		ACTIONS => {
			"," => 85,
			"=" => 87
		},
		DEFAULT => -31
	},
	{#State 39
		DEFAULT => -3
	},
	{#State 40
		DEFAULT => -5
	},
	{#State 41
		DEFAULT => -4,
		GOTOS => {
			'block' => 88,
			'chunk' => 62
		}
	},
	{#State 42
		ACTIONS => {
			"(" => 27,
			"[" => 20,
			"{" => 21,
			"." => 24,
			'STRING' => 23,
			":" => 19
		},
		DEFAULT => -56,
		GOTOS => {
			'args' => 22,
			'key' => 25,
			'tableconstructor' => 26
		}
	},
	{#State 43
		DEFAULT => -79
	},
	{#State 44
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 89,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 45
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 90,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 46
		DEFAULT => -80
	},
	{#State 47
		DEFAULT => -81
	},
	{#State 48
		DEFAULT => -76
	},
	{#State 49
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 91,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 50
		DEFAULT => -95,
		GOTOS => {
			'@11-1' => 92
		}
	},
	{#State 51
		ACTIONS => {
			"(" => 27,
			"[" => 20,
			"{" => 21,
			"." => 24,
			'STRING' => 23,
			":" => 29
		},
		DEFAULT => -57,
		GOTOS => {
			'args' => 30,
			'key' => 31,
			'tableconstructor' => 26
		}
	},
	{#State 52
		DEFAULT => -55
	},
	{#State 53
		DEFAULT => -82
	},
	{#State 54
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			'THEN' => 95,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 55
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 109,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 56
		DEFAULT => -77
	},
	{#State 57
		DEFAULT => -83
	},
	{#State 58
		DEFAULT => -78
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
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 75,
			'explist1' => 112,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 61
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			")" => 113,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 62
		ACTIONS => {
			'FUNCTION' => 5,
			'NAME' => 7,
			'RETURN' => 114,
			'WHILE' => 8,
			'REPEAT' => 9,
			'FOR' => 10,
			'BREAK' => 116,
			'LOCAL' => 11,
			'DO' => 13,
			'IF' => 14,
			"(" => 16
		},
		DEFAULT => -7,
		GOTOS => {
			'functioncall' => 6,
			'var' => 4,
			'stat' => 12,
			'laststat' => 115,
			'varlist1' => 15,
			'_if_then' => 17
		}
	},
	{#State 63
		DEFAULT => -35,
		GOTOS => {
			'_elseif_star' => 117
		}
	},
	{#State 64
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"(" => 27
		},
		GOTOS => {
			'args' => 118,
			'tableconstructor' => 26
		}
	},
	{#State 65
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			"]" => 119,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 66
		ACTIONS => {
			"}" => 120
		}
	},
	{#State 67
		ACTIONS => {
			"=" => 121
		},
		DEFAULT => -45
	},
	{#State 68
		ACTIONS => {
			";" => 123,
			"," => 124
		},
		DEFAULT => -107,
		GOTOS => {
			'fieldsep' => 122
		}
	},
	{#State 69
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 125,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 70
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		},
		DEFAULT => -112
	},
	{#State 71
		DEFAULT => -105
	},
	{#State 72
		DEFAULT => -109
	},
	{#State 73
		DEFAULT => -50
	},
	{#State 74
		DEFAULT => -92
	},
	{#State 75
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		},
		DEFAULT => -54
	},
	{#State 76
		ACTIONS => {
			")" => 126,
			"," => 127
		}
	},
	{#State 77
		DEFAULT => -42
	},
	{#State 78
		ACTIONS => {
			"." => 129,
			":" => 128
		},
		DEFAULT => -39
	},
	{#State 79
		ACTIONS => {
			"(" => 130
		},
		GOTOS => {
			'funcbody' => 131
		}
	},
	{#State 80
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"(" => 27
		},
		GOTOS => {
			'args' => 132,
			'tableconstructor' => 26
		}
	},
	{#State 81
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			'DO' => 133,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 82
		ACTIONS => {
			'UNTIL' => 134
		}
	},
	{#State 83
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 135,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 84
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 75,
			'explist1' => 136,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 85
		ACTIONS => {
			'NAME' => 137
		}
	},
	{#State 86
		ACTIONS => {
			'NAME' => 138
		}
	},
	{#State 87
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 75,
			'explist1' => 139,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 88
		ACTIONS => {
			'END' => 140
		}
	},
	{#State 89
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -75
	},
	{#State 90
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -74
	},
	{#State 91
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			")" => 141,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 92
		ACTIONS => {
			"(" => 130
		},
		GOTOS => {
			'funcbody' => 142
		}
	},
	{#State 93
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 143,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 94
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 144,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 95
		DEFAULT => -32
	},
	{#State 96
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 145,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 97
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 146,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 98
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 147,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 99
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 148,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 100
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 149,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 101
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 150,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 102
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 151,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 103
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 152,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 104
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 153,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 105
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 154,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 106
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 155,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 107
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 156,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 108
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 157,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 109
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -73
	},
	{#State 110
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"." => 24,
			":" => 19,
			"[" => 20,
			"(" => 27
		},
		DEFAULT => -43,
		GOTOS => {
			'args' => 22,
			'key' => 25,
			'tableconstructor' => 26
		}
	},
	{#State 111
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"." => 24,
			":" => 29,
			"[" => 20,
			"(" => 27
		},
		GOTOS => {
			'args' => 30,
			'key' => 31,
			'tableconstructor' => 26
		}
	},
	{#State 112
		ACTIONS => {
			"," => 127
		},
		DEFAULT => -9
	},
	{#State 113
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"." => 24,
			":" => 160,
			"[" => 20,
			"(" => 27
		},
		GOTOS => {
			'args' => 158,
			'key' => 159,
			'tableconstructor' => 26
		}
	},
	{#State 114
		ACTIONS => {
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			'STRING' => 46,
			"..." => 47,
			"(" => 49,
			'NIL' => 48,
			'FUNCTION' => 50,
			"{" => 21,
			"-" => 55,
			'FALSE' => 56,
			'TRUE' => 58
		},
		DEFAULT => -37,
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 75,
			'explist1' => 161,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 115
		ACTIONS => {
			";" => 40
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 162
		}
	},
	{#State 116
		DEFAULT => -38
	},
	{#State 117
		ACTIONS => {
			'ELSEIF' => 165,
			'ELSE' => 163,
			'END' => 164
		}
	},
	{#State 118
		DEFAULT => -88
	},
	{#State 119
		DEFAULT => -49
	},
	{#State 120
		DEFAULT => -104
	},
	{#State 121
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 166,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 122
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 67,
			'NOT' => 44,
			"#" => 45,
			"[" => 69,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			"(" => 49,
			'NIL' => 48
		},
		DEFAULT => -106,
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 70,
			'field' => 167,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 123
		DEFAULT => -114
	},
	{#State 124
		DEFAULT => -113
	},
	{#State 125
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			"]" => 168,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 126
		DEFAULT => -91
	},
	{#State 127
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 169,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 128
		ACTIONS => {
			'NAME' => 170
		}
	},
	{#State 129
		ACTIONS => {
			'NAME' => 171
		}
	},
	{#State 130
		ACTIONS => {
			")" => 175,
			'NAME' => 172,
			"..." => 174
		},
		GOTOS => {
			'parlist' => 173,
			'parlist1' => 176
		}
	},
	{#State 131
		DEFAULT => -27
	},
	{#State 132
		DEFAULT => -90
	},
	{#State 133
		DEFAULT => -4,
		GOTOS => {
			'block' => 177,
			'chunk' => 62
		}
	},
	{#State 134
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 178,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 135
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"," => 179,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 136
		ACTIONS => {
			'DO' => 180,
			"," => 127
		}
	},
	{#State 137
		DEFAULT => -51
	},
	{#State 138
		ACTIONS => {
			"(" => 130
		},
		GOTOS => {
			'funcbody' => 181
		}
	},
	{#State 139
		ACTIONS => {
			"," => 127
		},
		DEFAULT => -30
	},
	{#State 140
		DEFAULT => -12
	},
	{#State 141
		ACTIONS => {
			"(" => 27,
			"[" => 20,
			"{" => 21,
			"." => 24,
			'STRING' => 23,
			":" => 160
		},
		DEFAULT => -84,
		GOTOS => {
			'args' => 158,
			'key' => 159,
			'tableconstructor' => 26
		}
	},
	{#State 142
		DEFAULT => -96
	},
	{#State 143
		ACTIONS => {
			"*" => 97,
			"<=" => 100,
			">=" => 105,
			"~=" => 108,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -71
	},
	{#State 144
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -63
	},
	{#State 145
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -64
	},
	{#State 146
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -60
	},
	{#State 147
		ACTIONS => {
			"*" => 97,
			"<=" => 100,
			">=" => 105,
			"~=" => 108,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -72
	},
	{#State 148
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -58
	},
	{#State 149
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -66
	},
	{#State 150
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -65
	},
	{#State 151
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -59
	},
	{#State 152
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -69
	},
	{#State 153
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -67
	},
	{#State 154
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -68
	},
	{#State 155
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -62
	},
	{#State 156
		ACTIONS => {
			"^" => 106
		},
		DEFAULT => -61
	},
	{#State 157
		ACTIONS => {
			"*" => 97,
			"%" => 94,
			".." => 96,
			"+" => 99,
			"-" => 102,
			"/" => 107,
			"^" => 106
		},
		DEFAULT => -70
	},
	{#State 158
		DEFAULT => -85
	},
	{#State 159
		DEFAULT => -46
	},
	{#State 160
		ACTIONS => {
			'NAME' => 182
		}
	},
	{#State 161
		ACTIONS => {
			"," => 127
		},
		DEFAULT => -36
	},
	{#State 162
		DEFAULT => -8
	},
	{#State 163
		DEFAULT => -17,
		GOTOS => {
			'@4-4' => 183
		}
	},
	{#State 164
		DEFAULT => -19
	},
	{#State 165
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 184,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 166
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		},
		DEFAULT => -111
	},
	{#State 167
		DEFAULT => -108
	},
	{#State 168
		ACTIONS => {
			"=" => 185
		}
	},
	{#State 169
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		},
		DEFAULT => -53
	},
	{#State 170
		DEFAULT => -40
	},
	{#State 171
		DEFAULT => -41
	},
	{#State 172
		DEFAULT => -103
	},
	{#State 173
		ACTIONS => {
			"," => 186
		},
		DEFAULT => -100
	},
	{#State 174
		DEFAULT => -101
	},
	{#State 175
		DEFAULT => -4,
		GOTOS => {
			'block' => 187,
			'chunk' => 62
		}
	},
	{#State 176
		ACTIONS => {
			")" => 188
		}
	},
	{#State 177
		ACTIONS => {
			'END' => 189
		}
	},
	{#State 178
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		},
		DEFAULT => -16
	},
	{#State 179
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 190,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 180
		DEFAULT => -24,
		GOTOS => {
			'@7-5' => 191
		}
	},
	{#State 181
		DEFAULT => -29
	},
	{#State 182
		ACTIONS => {
			"{" => 21,
			'STRING' => 23,
			"(" => 27
		},
		GOTOS => {
			'args' => 192,
			'tableconstructor' => 26
		}
	},
	{#State 183
		DEFAULT => -4,
		GOTOS => {
			'block' => 193,
			'chunk' => 62
		}
	},
	{#State 184
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			'THEN' => 194,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 185
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 195,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 186
		ACTIONS => {
			'NAME' => 196,
			"..." => 197
		}
	},
	{#State 187
		ACTIONS => {
			'END' => 198
		}
	},
	{#State 188
		DEFAULT => -4,
		GOTOS => {
			'block' => 199,
			'chunk' => 62
		}
	},
	{#State 189
		DEFAULT => -14
	},
	{#State 190
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"," => 200,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			'DO' => 201,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 191
		DEFAULT => -4,
		GOTOS => {
			'block' => 202,
			'chunk' => 62
		}
	},
	{#State 192
		DEFAULT => -86
	},
	{#State 193
		ACTIONS => {
			'END' => 203
		}
	},
	{#State 194
		DEFAULT => -33,
		GOTOS => {
			'@10-4' => 204
		}
	},
	{#State 195
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		},
		DEFAULT => -110
	},
	{#State 196
		DEFAULT => -102
	},
	{#State 197
		DEFAULT => -99
	},
	{#State 198
		DEFAULT => -98
	},
	{#State 199
		ACTIONS => {
			'END' => 205
		}
	},
	{#State 200
		ACTIONS => {
			'FUNCTION' => 50,
			'NUMBER' => 43,
			'NAME' => 7,
			'NOT' => 44,
			"#" => 45,
			"{" => 21,
			"-" => 55,
			'STRING' => 46,
			'FALSE' => 56,
			"..." => 47,
			'TRUE' => 58,
			'NIL' => 48,
			"(" => 49
		},
		GOTOS => {
			'function' => 53,
			'functioncall' => 51,
			'var' => 42,
			'exp' => 206,
			'primary' => 52,
			'tableconstructor' => 57
		}
	},
	{#State 201
		DEFAULT => -22,
		GOTOS => {
			'@6-7' => 207
		}
	},
	{#State 202
		ACTIONS => {
			'END' => 208
		}
	},
	{#State 203
		DEFAULT => -18
	},
	{#State 204
		DEFAULT => -4,
		GOTOS => {
			'block' => 209,
			'chunk' => 62
		}
	},
	{#State 205
		DEFAULT => -97
	},
	{#State 206
		ACTIONS => {
			'AND' => 93,
			"%" => 94,
			".." => 96,
			"*" => 97,
			'OR' => 98,
			"+" => 99,
			"<=" => 100,
			"<" => 101,
			"-" => 102,
			"==" => 103,
			'DO' => 210,
			">" => 104,
			">=" => 105,
			"^" => 106,
			"/" => 107,
			"~=" => 108
		}
	},
	{#State 207
		DEFAULT => -4,
		GOTOS => {
			'block' => 211,
			'chunk' => 62
		}
	},
	{#State 208
		DEFAULT => -25
	},
	{#State 209
		DEFAULT => -34
	},
	{#State 210
		DEFAULT => -20,
		GOTOS => {
			'@5-9' => 212
		}
	},
	{#State 211
		ACTIONS => {
			'END' => 213
		}
	},
	{#State 212
		DEFAULT => -4,
		GOTOS => {
			'block' => 214,
			'chunk' => 62
		}
	},
	{#State 213
		DEFAULT => -23
	},
	{#State 214
		ACTIONS => {
			'END' => 215
		}
	},
	{#State 215
		DEFAULT => -21
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
			BuildMain($_[0], $_[1]);
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
			[@{$_[1]}, @{$_[2]}];
		}
	],
	[#Rule 4
		 'chunk', 0,
sub
#line 61 "Lua\lua51.yp"
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
#line 75 "Lua\lua51.yp"
{
			PopScope($_[0]);
			$_[1];
		}
	],
	[#Rule 8
		 'block', 3,
sub
#line 80 "Lua\lua51.yp"
{
			PopScope($_[0]);
			[@{$_[1]}, @{$_[2]}];
		}
	],
	[#Rule 9
		 'stat', 3,
sub
#line 88 "Lua\lua51.yp"
{
			BuildAssigns($_[0], $_[1], $_[3])
		}
	],
	[#Rule 10
		 'stat', 1,
sub
#line 92 "Lua\lua51.yp"
{
			BuildVoidFunctionCall($_[0], $_[1]);
		}
	],
	[#Rule 11
		 '@1-1', 0,
sub
#line 96 "Lua\lua51.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 12
		 'stat', 4,
sub
#line 100 "Lua\lua51.yp"
{
			$_[3];
		}
	],
	[#Rule 13
		 '@2-1', 0,
sub
#line 104 "Lua\lua51.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 14
		 'stat', 6,
sub
#line 108 "Lua\lua51.yp"
{
			BuildWhile($_[0], $_[3], $_[5]);
		}
	],
	[#Rule 15
		 '@3-1', 0,
sub
#line 112 "Lua\lua51.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 16
		 'stat', 5,
sub
#line 116 "Lua\lua51.yp"
{
			BuildRepeat($_[0], $_[3], $_[5]);
		}
	],
	[#Rule 17
		 '@4-4', 0,
sub
#line 120 "Lua\lua51.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 18
		 'stat', 7,
sub
#line 124 "Lua\lua51.yp"
{
			BuildIf($_[0], $_[1], $_[2], $_[3], $_[6]);
		}
	],
	[#Rule 19
		 'stat', 4,
sub
#line 128 "Lua\lua51.yp"
{
			BuildIf($_[0], $_[1], $_[2], $_[3], undef);
		}
	],
	[#Rule 20
		 '@5-9', 0,
sub
#line 132 "Lua\lua51.yp"
{
			PushScope($_[0]);
			my $var = BuildLocalVariable($_[0], $_[2]);
			Insert($_[0], $var);
		}
	],
	[#Rule 21
		 'stat', 12,
sub
#line 138 "Lua\lua51.yp"
{
			BuildForNum($_[0], $_[10], $_[4], $_[6], $_[8], $_[11]);
		}
	],
	[#Rule 22
		 '@6-7', 0,
sub
#line 142 "Lua\lua51.yp"
{
			PushScope($_[0]);
			my $var = BuildLocalVariable($_[0], $_[2]);
			Insert($_[0], $var);
		}
	],
	[#Rule 23
		 'stat', 10,
sub
#line 148 "Lua\lua51.yp"
{
			BuildForNum($_[0], $_[8], $_[4], $_[6], undef, $_[9]);
		}
	],
	[#Rule 24
		 '@7-5', 0,
sub
#line 152 "Lua\lua51.yp"
{
			PushScope($_[0]);
			InsertList($_[0], $_[2]);
		}
	],
	[#Rule 25
		 'stat', 8,
sub
#line 157 "Lua\lua51.yp"
{
			BuildForList($_[0], $_[2], $_[4], $_[7]);
		}
	],
	[#Rule 26
		 '@8-1', 0,
sub
#line 161 "Lua\lua51.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 27
		 'stat', 4,
sub
#line 166 "Lua\lua51.yp"
{
			my $var = BuildVariable($_[0], $_[3]); 
			BuildAssigns($_[0], [$var], [$_[4]])
		}
	],
	[#Rule 28
		 '@9-2', 0,
sub
#line 171 "Lua\lua51.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 29
		 'stat', 5,
sub
#line 176 "Lua\lua51.yp"
{
			my $var = BuildLocalVariable($_[0], $_[4]);
			Insert($_[0], $var);
			BuildAssigns($_[0], [$var], [$_[5]])
		}
	],
	[#Rule 30
		 'stat', 4,
sub
#line 182 "Lua\lua51.yp"
{
			InsertList($_[0], $_[2]);
			BuildAssigns($_[0], $_[2], $_[4])
		}
	],
	[#Rule 31
		 'stat', 2,
sub
#line 187 "Lua\lua51.yp"
{
			InsertList($_[0], $_[2]);
			BuildAssigns($_[0], $_[2], [])
		}
	],
	[#Rule 32
		 '_if_then', 3,
sub
#line 195 "Lua\lua51.yp"
{
			PushScope($_[0]);
			$_[2];
		}
	],
	[#Rule 33
		 '@10-4', 0,
sub
#line 203 "Lua\lua51.yp"
{
			PushScope($_[0]);
		}
	],
	[#Rule 34
		 '_elseif_star', 6,
sub
#line 207 "Lua\lua51.yp"
{
			[@{$_[1]}, [$_[3], $_[6]]];
		}
	],
	[#Rule 35
		 '_elseif_star', 0,
sub
#line 211 "Lua\lua51.yp"
{
			[];
		}
	],
	[#Rule 36
		 'laststat', 2,
sub
#line 218 "Lua\lua51.yp"
{
			BuildReturn($_[0], $_[2]);
		}
	],
	[#Rule 37
		 'laststat', 1,
sub
#line 222 "Lua\lua51.yp"
{
			BuildReturn($_[0], []);
		}
	],
	[#Rule 38
		 'laststat', 1,
sub
#line 226 "Lua\lua51.yp"
{
			BuildBreak($_[0]);
		}
	],
	[#Rule 39
		 'funcname', 1, undef
	],
	[#Rule 40
		 'funcname', 3,
sub
#line 235 "Lua\lua51.yp"
{
			PrepareMethod($_[0]);
			[
				@{$_[1]},
				BuildLiteral($_[0], $_[3], 'key'),
			];
		}
	],
	[#Rule 41
		 '_funcname', 3,
sub
#line 246 "Lua\lua51.yp"
{
			[
				@{$_[1]},
				BuildLiteral($_[0], $_[3], 'key'),
			];
		}
	],
	[#Rule 42
		 '_funcname', 1,
sub
#line 253 "Lua\lua51.yp"
{
			[$_[1]];
		}
	],
	[#Rule 43
		 'varlist1', 3,
sub
#line 260 "Lua\lua51.yp"
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
#line 267 "Lua\lua51.yp"
{
			[
				BuildVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 45
		 'var', 1,
sub
#line 276 "Lua\lua51.yp"
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
#line 282 "Lua\lua51.yp"
{
			[@{$_[1]}, $_[2]];
		}
	],
	[#Rule 49
		 'key', 3,
sub
#line 289 "Lua\lua51.yp"
{
			$_[2];
		}
	],
	[#Rule 50
		 'key', 2,
sub
#line 293 "Lua\lua51.yp"
{
			BuildLiteral($_[0], $_[2], 'key');
		}
	],
	[#Rule 51
		 'namelist', 3,
sub
#line 300 "Lua\lua51.yp"
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
#line 307 "Lua\lua51.yp"
{
			[
				BuildLocalVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 53
		 'explist1', 3,
sub
#line 316 "Lua\lua51.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 54
		 'explist1', 1,
sub
#line 320 "Lua\lua51.yp"
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
#line 329 "Lua\lua51.yp"
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
#line 335 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 59
		 'exp', 3,
sub
#line 339 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 60
		 'exp', 3,
sub
#line 343 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 61
		 'exp', 3,
sub
#line 347 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 62
		 'exp', 3,
sub
#line 351 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 63
		 'exp', 3,
sub
#line 355 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 64
		 'exp', 3,
sub
#line 359 "Lua\lua51.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 65
		 'exp', 3,
sub
#line 363 "Lua\lua51.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 66
		 'exp', 3,
sub
#line 367 "Lua\lua51.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 67
		 'exp', 3,
sub
#line 371 "Lua\lua51.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 68
		 'exp', 3,
sub
#line 375 "Lua\lua51.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 69
		 'exp', 3,
sub
#line 379 "Lua\lua51.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 70
		 'exp', 3,
sub
#line 383 "Lua\lua51.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 71
		 'exp', 3,
sub
#line 387 "Lua\lua51.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 72
		 'exp', 3,
sub
#line 391 "Lua\lua51.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 73
		 'exp', 2,
sub
#line 395 "Lua\lua51.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 74
		 'exp', 2,
sub
#line 399 "Lua\lua51.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 75
		 'exp', 2,
sub
#line 403 "Lua\lua51.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 76
		 'primary', 1,
sub
#line 410 "Lua\lua51.yp"
{
			BuildLiteral($_[0], $_[1], 'nil');
		}
	],
	[#Rule 77
		 'primary', 1,
sub
#line 414 "Lua\lua51.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 78
		 'primary', 1,
sub
#line 418 "Lua\lua51.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 79
		 'primary', 1,
sub
#line 422 "Lua\lua51.yp"
{
			BuildLiteral($_[0], $_[1], 'number');
		}
	],
	[#Rule 80
		 'primary', 1,
sub
#line 426 "Lua\lua51.yp"
{
			BuildLiteral($_[0], $_[1], 'string');
		}
	],
	[#Rule 81
		 'primary', 1,
sub
#line 430 "Lua\lua51.yp"
{
			BuildCallVararg($_[0]);
		}
	],
	[#Rule 82
		 'primary', 1, undef
	],
	[#Rule 83
		 'primary', 1, undef
	],
	[#Rule 84
		 'primary', 3,
sub
#line 438 "Lua\lua51.yp"
{
			BuildParenthesedExpression($_[0], $_[2]);
		}
	],
	[#Rule 85
		 'functioncall', 4,
sub
#line 445 "Lua\lua51.yp"
{
			BuildCallFunction($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 86
		 'functioncall', 6,
sub
#line 449 "Lua\lua51.yp"
{
			BuildCallMethod($_[0], $_[2], $_[5], $_[6]);
		}
	],
	[#Rule 87
		 'functioncall', 2,
sub
#line 453 "Lua\lua51.yp"
{
			my $fct = BuildCallVariable($_[0], $_[1]);
			BuildCallFunction($_[0], $fct, $_[2]);
		}
	],
	[#Rule 88
		 'functioncall', 4,
sub
#line 458 "Lua\lua51.yp"
{
			my $obj = BuildCallVariable($_[0], $_[1]);
			BuildCallMethod($_[0], $obj, $_[3], $_[4]);
		}
	],
	[#Rule 89
		 'functioncall', 2,
sub
#line 463 "Lua\lua51.yp"
{
			BuildCallFunction($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 90
		 'functioncall', 4,
sub
#line 467 "Lua\lua51.yp"
{
			BuildCallMethod($_[0], $_[1], $_[3], $_[4]);
		}
	],
	[#Rule 91
		 'args', 3,
sub
#line 474 "Lua\lua51.yp"
{
			$_[2];
		}
	],
	[#Rule 92
		 'args', 2,
sub
#line 478 "Lua\lua51.yp"
{
			[];
		}
	],
	[#Rule 93
		 'args', 1,
sub
#line 482 "Lua\lua51.yp"
{
			[
				$_[1]
			]
		}
	],
	[#Rule 94
		 'args', 1,
sub
#line 488 "Lua\lua51.yp"
{
			[
				BuildLiteral($_[0], $_[1], 'string')
			]
		}
	],
	[#Rule 95
		 '@11-1', 0,
sub
#line 497 "Lua\lua51.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 96
		 'function', 3,
sub
#line 502 "Lua\lua51.yp"
{
			$_[3];
		}
	],
	[#Rule 97
		 'funcbody', 5,
sub
#line 509 "Lua\lua51.yp"
{
			PopScopeF($_[0]);
			BuildFunctionBody($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 98
		 'funcbody', 4,
sub
#line 514 "Lua\lua51.yp"
{
			PopScopeF($_[0]);
			BuildFunctionBody($_[0], [], $_[3]);
		}
	],
	[#Rule 99
		 'parlist1', 3,
sub
#line 522 "Lua\lua51.yp"
{
			[
				@{$_[1]},
				BuildParam($_[0], $_[3])
			];
		}
	],
	[#Rule 100
		 'parlist1', 1, undef
	],
	[#Rule 101
		 'parlist1', 1,
sub
#line 531 "Lua\lua51.yp"
{
			[
				BuildParam($_[0], $_[1])
			];
		}
	],
	[#Rule 102
		 'parlist', 3,
sub
#line 540 "Lua\lua51.yp"
{
			[
				@{$_[1]},
				BuildParam($_[0], $_[3])
			];
		}
	],
	[#Rule 103
		 'parlist', 1,
sub
#line 547 "Lua\lua51.yp"
{
			[
				BuildParam($_[0], $_[1])
			]
		}
	],
	[#Rule 104
		 'tableconstructor', 3,
sub
#line 556 "Lua\lua51.yp"
{
			BuildTable($_[0], $_[2]);
		}
	],
	[#Rule 105
		 'tableconstructor', 2,
sub
#line 560 "Lua\lua51.yp"
{
			BuildTable($_[0], []);
		}
	],
	[#Rule 106
		 'fieldlist', 2, undef
	],
	[#Rule 107
		 'fieldlist', 1, undef
	],
	[#Rule 108
		 '_field_plus', 3,
sub
#line 574 "Lua\lua51.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 109
		 '_field_plus', 1,
sub
#line 578 "Lua\lua51.yp"
{
			[$_[1]];
		}
	],
	[#Rule 110
		 'field', 5,
sub
#line 585 "Lua\lua51.yp"
{
			[$_[2], $_[5]]
		}
	],
	[#Rule 111
		 'field', 3,
sub
#line 589 "Lua\lua51.yp"
{
			[BuildLiteral($_[0], $_[1], 'key'), $_[3]]
		}
	],
	[#Rule 112
		 'field', 1,
sub
#line 593 "Lua\lua51.yp"
{
			[$_[1]]
		}
	],
	[#Rule 113
		 'fieldsep', 1, undef
	],
	[#Rule 114
		 'fieldsep', 1, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 605 "Lua\lua51.yp"


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
	$parser->YYData->{self} = undef;
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
