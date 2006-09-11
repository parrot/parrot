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
		DEFAULT => -15,
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
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
			":" => 42,
			'STRING' => 44,
			"[" => 47,
			"{" => 38,
			"(" => 48,
			"." => 49
		},
		DEFAULT => -10,
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 43,
			'key' => 45
		}
	},
	{#State 10
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 50,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 11
		ACTIONS => {
			":" => 51,
			"{" => 38,
			'STRING' => 44,
			"(" => 48,
			"[" => 47,
			"." => 49
		},
		DEFAULT => -44,
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 52,
			'key' => 53
		}
	},
	{#State 12
		DEFAULT => -26,
		GOTOS => {
			'@8-1' => 54
		}
	},
	{#State 13
		ACTIONS => {
			"," => 55,
			"=" => 56
		}
	},
	{#State 14
		DEFAULT => -4,
		GOTOS => {
			'block' => 58,
			'chunk' => 57
		}
	},
	{#State 15
		DEFAULT => -11,
		GOTOS => {
			'@1-1' => 59
		}
	},
	{#State 16
		DEFAULT => -13,
		GOTOS => {
			'@2-1' => 60
		}
	},
	{#State 17
		ACTIONS => {
			'NAME' => 62,
			'FUNCTION' => 61
		},
		GOTOS => {
			'namelist' => 63
		}
	},
	{#State 18
		DEFAULT => 0
	},
	{#State 19
		DEFAULT => -4,
		GOTOS => {
			'block' => 64,
			'chunk' => 57
		}
	},
	{#State 20
		ACTIONS => {
			"=" => 65
		},
		DEFAULT => -52
	},
	{#State 21
		ACTIONS => {
			"," => 66,
			'IN' => 67
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
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 68,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 25
		DEFAULT => -78
	},
	{#State 26
		DEFAULT => -82
	},
	{#State 27
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 69,
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
		DEFAULT => -80
	},
	{#State 30
		DEFAULT => -76
	},
	{#State 31
		ACTIONS => {
			":" => 42,
			"[" => 47,
			"(" => 48,
			"." => 49,
			'STRING' => 44,
			"{" => 38
		},
		DEFAULT => -57,
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 43,
			'key' => 45
		}
	},
	{#State 32
		DEFAULT => -83
	},
	{#State 33
		DEFAULT => -77
	},
	{#State 34
		DEFAULT => -95,
		GOTOS => {
			'@11-1' => 70
		}
	},
	{#State 35
		ACTIONS => {
			":" => 51,
			"[" => 47,
			"(" => 48,
			"." => 49,
			'STRING' => 44,
			"{" => 38
		},
		DEFAULT => -56,
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 52,
			'key' => 53
		}
	},
	{#State 36
		DEFAULT => -79
	},
	{#State 37
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			"<=" => 85,
			'OR' => 84,
			")" => 81,
			">" => 86
		}
	},
	{#State 38
		ACTIONS => {
			"}" => 87,
			"-" => 24,
			'NAME' => 91,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			"[" => 88,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 90,
			'function' => 26,
			'primary' => 28,
			'fieldlist' => 92,
			'functioncall' => 31,
			'tableconstructor' => 32,
			'var' => 35,
			'_field_plus' => 93,
			'field' => 89
		}
	},
	{#State 39
		DEFAULT => -81
	},
	{#State 40
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 94,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 41
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 95,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 42
		ACTIONS => {
			'NAME' => 96
		}
	},
	{#State 43
		DEFAULT => -89
	},
	{#State 44
		DEFAULT => -94
	},
	{#State 45
		DEFAULT => -47
	},
	{#State 46
		DEFAULT => -93
	},
	{#State 47
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 97,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 48
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36,
			")" => 99
		},
		GOTOS => {
			'exp' => 100,
			'functioncall' => 31,
			'explist1' => 98,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 49
		ACTIONS => {
			'NAME' => 101
		}
	},
	{#State 50
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			'THEN' => 102,
			"<=" => 85,
			'OR' => 84,
			">" => 86
		}
	},
	{#State 51
		ACTIONS => {
			'NAME' => 103
		}
	},
	{#State 52
		DEFAULT => -87
	},
	{#State 53
		DEFAULT => -48
	},
	{#State 54
		ACTIONS => {
			'NAME' => 104
		},
		GOTOS => {
			'funcname' => 105,
			'_funcname' => 106
		}
	},
	{#State 55
		ACTIONS => {
			"(" => 8,
			'NAME' => 4
		},
		GOTOS => {
			'functioncall' => 107,
			'var' => 108
		}
	},
	{#State 56
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 100,
			'functioncall' => 31,
			'explist1' => 109,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 57
		ACTIONS => {
			'NAME' => 4,
			'REPEAT' => 5,
			'BREAK' => 110,
			'FOR' => 6,
			"(" => 8,
			'RETURN' => 112,
			'IF' => 10,
			'FUNCTION' => 12,
			'DO' => 15,
			'LOCAL' => 17,
			'WHILE' => 16
		},
		DEFAULT => -7,
		GOTOS => {
			'functioncall' => 9,
			'var' => 11,
			'laststat' => 111,
			'varlist1' => 13,
			'_if_then' => 14,
			'stat' => 7
		}
	},
	{#State 58
		DEFAULT => -35,
		GOTOS => {
			'_elseif_star' => 113
		}
	},
	{#State 59
		DEFAULT => -4,
		GOTOS => {
			'block' => 114,
			'chunk' => 57
		}
	},
	{#State 60
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 61
		DEFAULT => -28,
		GOTOS => {
			'@9-2' => 116
		}
	},
	{#State 62
		DEFAULT => -52
	},
	{#State 63
		ACTIONS => {
			"," => 66,
			"=" => 117
		},
		DEFAULT => -31
	},
	{#State 64
		ACTIONS => {
			'UNTIL' => 118
		}
	},
	{#State 65
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 119,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 66
		ACTIONS => {
			'NAME' => 120
		}
	},
	{#State 67
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 100,
			'functioncall' => 31,
			'explist1' => 121,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 68
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -73
	},
	{#State 69
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -75
	},
	{#State 70
		ACTIONS => {
			"(" => 123
		},
		GOTOS => {
			'funcbody' => 122
		}
	},
	{#State 71
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 72
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 73
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 74
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 75
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 76
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 129,
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
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 130,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 78
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 131,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 79
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
			":" => 134,
			"(" => 48,
			"{" => 38,
			"[" => 47,
			"." => 49,
			'STRING' => 44
		},
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 135,
			'key' => 136
		}
	},
	{#State 82
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
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
	{#State 83
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 138,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 84
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 139,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 85
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 140,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 86
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 141,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 87
		DEFAULT => -105
	},
	{#State 88
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 142,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 89
		DEFAULT => -109
	},
	{#State 90
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"^" => 79,
			"*" => 80,
			"/" => 82,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			">" => 86
		},
		DEFAULT => -112
	},
	{#State 91
		ACTIONS => {
			"=" => 143
		},
		DEFAULT => -45
	},
	{#State 92
		ACTIONS => {
			"}" => 144
		}
	},
	{#State 93
		ACTIONS => {
			";" => 146,
			"," => 147
		},
		DEFAULT => -107,
		GOTOS => {
			'fieldsep' => 145
		}
	},
	{#State 94
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			"<=" => 85,
			'OR' => 84,
			")" => 148,
			">" => 86
		}
	},
	{#State 95
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -74
	},
	{#State 96
		ACTIONS => {
			"(" => 48,
			"{" => 38,
			'STRING' => 44
		},
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 149
		}
	},
	{#State 97
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			"<=" => 85,
			'OR' => 84,
			"]" => 150,
			">" => 86
		}
	},
	{#State 98
		ACTIONS => {
			"," => 151,
			")" => 152
		}
	},
	{#State 99
		DEFAULT => -92
	},
	{#State 100
		ACTIONS => {
			"-" => 72,
			"<" => 74,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"*" => 80,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			">" => 86,
			".." => 71,
			"~=" => 73,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -54
	},
	{#State 101
		DEFAULT => -50
	},
	{#State 102
		DEFAULT => -32
	},
	{#State 103
		ACTIONS => {
			"(" => 48,
			"{" => 38,
			'STRING' => 44
		},
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 153
		}
	},
	{#State 104
		DEFAULT => -42
	},
	{#State 105
		ACTIONS => {
			"(" => 123
		},
		GOTOS => {
			'funcbody' => 154
		}
	},
	{#State 106
		ACTIONS => {
			":" => 155,
			"." => 156
		},
		DEFAULT => -39
	},
	{#State 107
		ACTIONS => {
			":" => 42,
			"(" => 48,
			"{" => 38,
			"[" => 47,
			"." => 49,
			'STRING' => 44
		},
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 43,
			'key' => 45
		}
	},
	{#State 108
		ACTIONS => {
			":" => 51,
			"{" => 38,
			'STRING' => 44,
			"(" => 48,
			"[" => 47,
			"." => 49
		},
		DEFAULT => -43,
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 52,
			'key' => 53
		}
	},
	{#State 109
		ACTIONS => {
			"," => 151
		},
		DEFAULT => -9
	},
	{#State 110
		DEFAULT => -38
	},
	{#State 111
		ACTIONS => {
			";" => 22
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 157
		}
	},
	{#State 112
		ACTIONS => {
			"-" => 24,
			'TRUE' => 25,
			'NOT' => 27,
			'STRING' => 29,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36,
			'NAME' => 4,
			"{" => 38,
			"..." => 39,
			"(" => 40,
			"#" => 41
		},
		DEFAULT => -37,
		GOTOS => {
			'exp' => 100,
			'functioncall' => 31,
			'explist1' => 158,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 113
		ACTIONS => {
			'ELSE' => 159,
			'ELSEIF' => 161,
			'END' => 160
		}
	},
	{#State 114
		ACTIONS => {
			'END' => 162
		}
	},
	{#State 115
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			'DO' => 163,
			"<=" => 85,
			'OR' => 84,
			">" => 86
		}
	},
	{#State 116
		ACTIONS => {
			'NAME' => 164
		}
	},
	{#State 117
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 100,
			'functioncall' => 31,
			'explist1' => 165,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 118
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 166,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 119
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"," => 167,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			"<=" => 85,
			'OR' => 84,
			">" => 86
		}
	},
	{#State 120
		DEFAULT => -51
	},
	{#State 121
		ACTIONS => {
			"," => 151,
			'DO' => 168
		}
	},
	{#State 122
		DEFAULT => -96
	},
	{#State 123
		ACTIONS => {
			'NAME' => 171,
			"..." => 172,
			")" => 170
		},
		GOTOS => {
			'parlist' => 169,
			'parlist1' => 173
		}
	},
	{#State 124
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -64
	},
	{#State 125
		ACTIONS => {
			"%" => 76,
			"*" => 80,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -59
	},
	{#State 126
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			".." => 71,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -70
	},
	{#State 127
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			".." => 71,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -65
	},
	{#State 128
		ACTIONS => {
			"%" => 76,
			"*" => 80,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -58
	},
	{#State 129
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -63
	},
	{#State 130
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			".." => 71,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -69
	},
	{#State 131
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			".." => 71,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -68
	},
	{#State 132
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -62
	},
	{#State 133
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -60
	},
	{#State 134
		ACTIONS => {
			'NAME' => 174
		}
	},
	{#State 135
		DEFAULT => -85
	},
	{#State 136
		DEFAULT => -46
	},
	{#State 137
		ACTIONS => {
			"^" => 79
		},
		DEFAULT => -61
	},
	{#State 138
		ACTIONS => {
			"-" => 72,
			"<" => 74,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"*" => 80,
			"<=" => 85,
			">" => 86,
			".." => 71,
			"~=" => 73,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -71
	},
	{#State 139
		ACTIONS => {
			"-" => 72,
			"<" => 74,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"*" => 80,
			"<=" => 85,
			">" => 86,
			".." => 71,
			"~=" => 73,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -72
	},
	{#State 140
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			".." => 71,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -66
	},
	{#State 141
		ACTIONS => {
			"-" => 72,
			"%" => 76,
			"*" => 80,
			".." => 71,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -67
	},
	{#State 142
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			"<=" => 85,
			'OR' => 84,
			"]" => 175,
			">" => 86
		}
	},
	{#State 143
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 176,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 144
		DEFAULT => -104
	},
	{#State 145
		ACTIONS => {
			"-" => 24,
			'TRUE' => 25,
			'NOT' => 27,
			'STRING' => 29,
			'NIL' => 30,
			'FALSE' => 33,
			'FUNCTION' => 34,
			"[" => 88,
			'NUMBER' => 36,
			'NAME' => 91,
			"{" => 38,
			"..." => 39,
			"(" => 40,
			"#" => 41
		},
		DEFAULT => -106,
		GOTOS => {
			'exp' => 90,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28,
			'field' => 177
		}
	},
	{#State 146
		DEFAULT => -114
	},
	{#State 147
		DEFAULT => -113
	},
	{#State 148
		ACTIONS => {
			":" => 134,
			"[" => 47,
			"(" => 48,
			"." => 49,
			'STRING' => 44,
			"{" => 38
		},
		DEFAULT => -84,
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 135,
			'key' => 136
		}
	},
	{#State 149
		DEFAULT => -90
	},
	{#State 150
		DEFAULT => -49
	},
	{#State 151
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 178,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 152
		DEFAULT => -91
	},
	{#State 153
		DEFAULT => -88
	},
	{#State 154
		DEFAULT => -27
	},
	{#State 155
		ACTIONS => {
			'NAME' => 179
		}
	},
	{#State 156
		ACTIONS => {
			'NAME' => 180
		}
	},
	{#State 157
		DEFAULT => -8
	},
	{#State 158
		ACTIONS => {
			"," => 151
		},
		DEFAULT => -36
	},
	{#State 159
		DEFAULT => -17,
		GOTOS => {
			'@4-4' => 181
		}
	},
	{#State 160
		DEFAULT => -19
	},
	{#State 161
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 182,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 162
		DEFAULT => -12
	},
	{#State 163
		DEFAULT => -4,
		GOTOS => {
			'block' => 183,
			'chunk' => 57
		}
	},
	{#State 164
		ACTIONS => {
			"(" => 123
		},
		GOTOS => {
			'funcbody' => 184
		}
	},
	{#State 165
		ACTIONS => {
			"," => 151
		},
		DEFAULT => -30
	},
	{#State 166
		ACTIONS => {
			"-" => 72,
			"<" => 74,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"*" => 80,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			">" => 86,
			".." => 71,
			"~=" => 73,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -16
	},
	{#State 167
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 185,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 168
		DEFAULT => -24,
		GOTOS => {
			'@7-5' => 186
		}
	},
	{#State 169
		ACTIONS => {
			"," => 187
		},
		DEFAULT => -100
	},
	{#State 170
		DEFAULT => -4,
		GOTOS => {
			'block' => 188,
			'chunk' => 57
		}
	},
	{#State 171
		DEFAULT => -103
	},
	{#State 172
		DEFAULT => -101
	},
	{#State 173
		ACTIONS => {
			")" => 189
		}
	},
	{#State 174
		ACTIONS => {
			"(" => 48,
			"{" => 38,
			'STRING' => 44
		},
		GOTOS => {
			'tableconstructor' => 46,
			'args' => 190
		}
	},
	{#State 175
		ACTIONS => {
			"=" => 191
		}
	},
	{#State 176
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"^" => 79,
			"*" => 80,
			"/" => 82,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			">" => 86
		},
		DEFAULT => -111
	},
	{#State 177
		DEFAULT => -108
	},
	{#State 178
		ACTIONS => {
			"-" => 72,
			"<" => 74,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"*" => 80,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			">" => 86,
			".." => 71,
			"~=" => 73,
			"+" => 75,
			"^" => 79,
			"/" => 82
		},
		DEFAULT => -53
	},
	{#State 179
		DEFAULT => -40
	},
	{#State 180
		DEFAULT => -41
	},
	{#State 181
		DEFAULT => -4,
		GOTOS => {
			'block' => 192,
			'chunk' => 57
		}
	},
	{#State 182
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			'THEN' => 193,
			"<=" => 85,
			'OR' => 84,
			">" => 86
		}
	},
	{#State 183
		ACTIONS => {
			'END' => 194
		}
	},
	{#State 184
		DEFAULT => -29
	},
	{#State 185
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"," => 195,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"^" => 79,
			"*" => 80,
			"/" => 82,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			'DO' => 196,
			">" => 86
		}
	},
	{#State 186
		DEFAULT => -4,
		GOTOS => {
			'block' => 197,
			'chunk' => 57
		}
	},
	{#State 187
		ACTIONS => {
			'NAME' => 198,
			"..." => 199
		}
	},
	{#State 188
		ACTIONS => {
			'END' => 200
		}
	},
	{#State 189
		DEFAULT => -4,
		GOTOS => {
			'block' => 201,
			'chunk' => 57
		}
	},
	{#State 190
		DEFAULT => -86
	},
	{#State 191
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 202,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 192
		ACTIONS => {
			'END' => 203
		}
	},
	{#State 193
		DEFAULT => -33,
		GOTOS => {
			'@10-4' => 204
		}
	},
	{#State 194
		DEFAULT => -14
	},
	{#State 195
		ACTIONS => {
			"-" => 24,
			'NAME' => 4,
			'TRUE' => 25,
			"{" => 38,
			'NOT' => 27,
			"..." => 39,
			'STRING' => 29,
			"(" => 40,
			'NIL' => 30,
			"#" => 41,
			'FALSE' => 33,
			'FUNCTION' => 34,
			'NUMBER' => 36
		},
		GOTOS => {
			'exp' => 205,
			'functioncall' => 31,
			'function' => 26,
			'tableconstructor' => 32,
			'var' => 35,
			'primary' => 28
		}
	},
	{#State 196
		DEFAULT => -22,
		GOTOS => {
			'@6-7' => 206
		}
	},
	{#State 197
		ACTIONS => {
			'END' => 207
		}
	},
	{#State 198
		DEFAULT => -102
	},
	{#State 199
		DEFAULT => -99
	},
	{#State 200
		DEFAULT => -98
	},
	{#State 201
		ACTIONS => {
			'END' => 208
		}
	},
	{#State 202
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			"^" => 79,
			"*" => 80,
			"/" => 82,
			'AND' => 83,
			'OR' => 84,
			"<=" => 85,
			">" => 86
		},
		DEFAULT => -110
	},
	{#State 203
		DEFAULT => -18
	},
	{#State 204
		DEFAULT => -4,
		GOTOS => {
			'block' => 209,
			'chunk' => 57
		}
	},
	{#State 205
		ACTIONS => {
			"-" => 72,
			".." => 71,
			"<" => 74,
			"~=" => 73,
			"+" => 75,
			"/" => 82,
			"%" => 76,
			"==" => 77,
			">=" => 78,
			'AND' => 83,
			"^" => 79,
			"*" => 80,
			'DO' => 210,
			"<=" => 85,
			'OR' => 84,
			">" => 86
		}
	},
	{#State 206
		DEFAULT => -4,
		GOTOS => {
			'block' => 211,
			'chunk' => 57
		}
	},
	{#State 207
		DEFAULT => -25
	},
	{#State 208
		DEFAULT => -97
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
			'chunk' => 57
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
            PopScope( $_[0] );
            $_[1];
        }
	],
	[#Rule 8
		 'block', 3,
sub
#line 80 "Lua\lua51.yp"
{
            PopScope( $_[0] );
            [ @{ $_[1] }, @{ $_[2] } ];
        }
	],
	[#Rule 9
		 'stat', 3,
sub
#line 88 "Lua\lua51.yp"
{
            BuildAssigns( $_[0], $_[1], $_[3] );
        }
	],
	[#Rule 10
		 'stat', 1,
sub
#line 92 "Lua\lua51.yp"
{
            BuildVoidFunctionCall( $_[0], $_[1] );
        }
	],
	[#Rule 11
		 '@1-1', 0,
sub
#line 96 "Lua\lua51.yp"
{
            PushScope( $_[0] );
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
            PushScope( $_[0] );
        }
	],
	[#Rule 14
		 'stat', 6,
sub
#line 108 "Lua\lua51.yp"
{
            BuildWhile( $_[0], $_[3], $_[5] );
        }
	],
	[#Rule 15
		 '@3-1', 0,
sub
#line 112 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 16
		 'stat', 5,
sub
#line 116 "Lua\lua51.yp"
{
            BuildRepeat( $_[0], $_[3], $_[5] );
        }
	],
	[#Rule 17
		 '@4-4', 0,
sub
#line 120 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 18
		 'stat', 7,
sub
#line 124 "Lua\lua51.yp"
{
            BuildIf( $_[0], $_[1], $_[2], $_[3], $_[6] );
        }
	],
	[#Rule 19
		 'stat', 4,
sub
#line 128 "Lua\lua51.yp"
{
            BuildIf( $_[0], $_[1], $_[2], $_[3], undef );
        }
	],
	[#Rule 20
		 '@5-9', 0,
sub
#line 132 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            my $var = BuildLocalVariable( $_[0], $_[2] );
            Insert( $_[0], $var );
        }
	],
	[#Rule 21
		 'stat', 12,
sub
#line 138 "Lua\lua51.yp"
{
            BuildForNum( $_[0], $_[10], $_[4], $_[6], $_[8], $_[11] );
        }
	],
	[#Rule 22
		 '@6-7', 0,
sub
#line 142 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            my $var = BuildLocalVariable( $_[0], $_[2] );
            Insert( $_[0], $var );
        }
	],
	[#Rule 23
		 'stat', 10,
sub
#line 148 "Lua\lua51.yp"
{
            BuildForNum( $_[0], $_[8], $_[4], $_[6], undef, $_[9] );
        }
	],
	[#Rule 24
		 '@7-5', 0,
sub
#line 152 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            InsertList( $_[0], $_[2] );
        }
	],
	[#Rule 25
		 'stat', 8,
sub
#line 157 "Lua\lua51.yp"
{
            BuildForList( $_[0], $_[2], $_[4], $_[7] );
        }
	],
	[#Rule 26
		 '@8-1', 0,
sub
#line 161 "Lua\lua51.yp"
{
            PushScopeF( $_[0] );
            PushScope( $_[0] );
        }
	],
	[#Rule 27
		 'stat', 4,
sub
#line 166 "Lua\lua51.yp"
{
            my $var = BuildVariable( $_[0], $_[3] );
            BuildAssigns( $_[0], [$var], [ $_[4] ] );
        }
	],
	[#Rule 28
		 '@9-2', 0,
sub
#line 171 "Lua\lua51.yp"
{
            PushScopeF( $_[0] );
            PushScope( $_[0] );
        }
	],
	[#Rule 29
		 'stat', 5,
sub
#line 176 "Lua\lua51.yp"
{
            my $var = BuildLocalVariable( $_[0], $_[4] );
            Insert( $_[0], $var );
            BuildAssigns( $_[0], [$var], [ $_[5] ] );
        }
	],
	[#Rule 30
		 'stat', 4,
sub
#line 182 "Lua\lua51.yp"
{
            InsertList( $_[0], $_[2] );
            BuildAssigns( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 31
		 'stat', 2,
sub
#line 187 "Lua\lua51.yp"
{
            InsertList( $_[0], $_[2] );
            BuildAssigns( $_[0], $_[2], [] );
        }
	],
	[#Rule 32
		 '_if_then', 3,
sub
#line 195 "Lua\lua51.yp"
{
            PushScope( $_[0] );
            $_[2];
        }
	],
	[#Rule 33
		 '@10-4', 0,
sub
#line 203 "Lua\lua51.yp"
{
            PushScope( $_[0] );
        }
	],
	[#Rule 34
		 '_elseif_star', 6,
sub
#line 207 "Lua\lua51.yp"
{
            [ @{ $_[1] }, [ $_[3], $_[6] ] ];
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
            BuildReturn( $_[0], $_[2] );
        }
	],
	[#Rule 37
		 'laststat', 1,
sub
#line 222 "Lua\lua51.yp"
{
            BuildReturn( $_[0], [] );
        }
	],
	[#Rule 38
		 'laststat', 1,
sub
#line 226 "Lua\lua51.yp"
{
            BuildBreak( $_[0] );
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
            PrepareMethod( $_[0] );
            [
                @{ $_[1] },
                BuildLiteral( $_[0], $_[3], 'key' ),
            ];
        }
	],
	[#Rule 41
		 '_funcname', 3,
sub
#line 246 "Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildLiteral( $_[0], $_[3], 'key' ),
            ];
        }
	],
	[#Rule 42
		 '_funcname', 1,
sub
#line 253 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 43
		 'varlist1', 3,
sub
#line 260 "Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildVariable( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 44
		 'varlist1', 1,
sub
#line 267 "Lua\lua51.yp"
{
            [
                BuildVariable( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 45
		 'var', 1,
sub
#line 276 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 46
		 'var', 4,
sub
#line 280 "Lua\lua51.yp"
{
            [ $_[2], $_[4] ];
        }
	],
	[#Rule 47
		 'var', 2,
sub
#line 284 "Lua\lua51.yp"
{
            [ $_[1], $_[2] ];
        }
	],
	[#Rule 48
		 'var', 2,
sub
#line 288 "Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[2] ];
        }
	],
	[#Rule 49
		 'key', 3,
sub
#line 295 "Lua\lua51.yp"
{
            $_[2];
        }
	],
	[#Rule 50
		 'key', 2,
sub
#line 299 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[2], 'key' );
        }
	],
	[#Rule 51
		 'namelist', 3,
sub
#line 306 "Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildLocalVariable( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 52
		 'namelist', 1,
sub
#line 313 "Lua\lua51.yp"
{
            [
                BuildLocalVariable( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 53
		 'explist1', 3,
sub
#line 322 "Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[3] ];
        }
	],
	[#Rule 54
		 'explist1', 1,
sub
#line 326 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 55
		 'exp', 1, undef
	],
	[#Rule 56
		 'exp', 1,
sub
#line 335 "Lua\lua51.yp"
{
            BuildCallVariable( $_[0], $_[1] );
        }
	],
	[#Rule 57
		 'exp', 1, undef
	],
	[#Rule 58
		 'exp', 3,
sub
#line 341 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 59
		 'exp', 3,
sub
#line 345 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 60
		 'exp', 3,
sub
#line 349 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 61
		 'exp', 3,
sub
#line 353 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 62
		 'exp', 3,
sub
#line 357 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 63
		 'exp', 3,
sub
#line 361 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 64
		 'exp', 3,
sub
#line 365 "Lua\lua51.yp"
{
            BuildBinop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 65
		 'exp', 3,
sub
#line 369 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 66
		 'exp', 3,
sub
#line 373 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 67
		 'exp', 3,
sub
#line 377 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 68
		 'exp', 3,
sub
#line 381 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 69
		 'exp', 3,
sub
#line 385 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 70
		 'exp', 3,
sub
#line 389 "Lua\lua51.yp"
{
            BuildRelop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 71
		 'exp', 3,
sub
#line 393 "Lua\lua51.yp"
{
            BuildLogop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 72
		 'exp', 3,
sub
#line 397 "Lua\lua51.yp"
{
            BuildLogop( $_[0], $_[1], $_[2], $_[3] );
        }
	],
	[#Rule 73
		 'exp', 2,
sub
#line 401 "Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 74
		 'exp', 2,
sub
#line 405 "Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 75
		 'exp', 2,
sub
#line 409 "Lua\lua51.yp"
{
            BuildUnop( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 76
		 'primary', 1,
sub
#line 416 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'nil' );
        }
	],
	[#Rule 77
		 'primary', 1,
sub
#line 420 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'boolean' );
        }
	],
	[#Rule 78
		 'primary', 1,
sub
#line 424 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'boolean' );
        }
	],
	[#Rule 79
		 'primary', 1,
sub
#line 428 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'number' );
        }
	],
	[#Rule 80
		 'primary', 1,
sub
#line 432 "Lua\lua51.yp"
{
            BuildLiteral( $_[0], $_[1], 'string' );
        }
	],
	[#Rule 81
		 'primary', 1,
sub
#line 436 "Lua\lua51.yp"
{
            BuildCallVararg( $_[0] );
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
#line 444 "Lua\lua51.yp"
{
            BuildParenthesedExpression( $_[0], $_[2] );
        }
	],
	[#Rule 85
		 'functioncall', 4,
sub
#line 451 "Lua\lua51.yp"
{
            BuildCallFunction( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 86
		 'functioncall', 6,
sub
#line 455 "Lua\lua51.yp"
{
            BuildCallMethod( $_[0], $_[2], $_[5], $_[6] );
        }
	],
	[#Rule 87
		 'functioncall', 2,
sub
#line 459 "Lua\lua51.yp"
{
            my $fct = BuildCallVariable( $_[0], $_[1] );
            BuildCallFunction( $_[0], $fct, $_[2] );
        }
	],
	[#Rule 88
		 'functioncall', 4,
sub
#line 464 "Lua\lua51.yp"
{
            my $obj = BuildCallVariable( $_[0], $_[1] );
            BuildCallMethod( $_[0], $obj, $_[3], $_[4] );
        }
	],
	[#Rule 89
		 'functioncall', 2,
sub
#line 469 "Lua\lua51.yp"
{
            BuildCallFunction( $_[0], $_[1], $_[2] );
        }
	],
	[#Rule 90
		 'functioncall', 4,
sub
#line 473 "Lua\lua51.yp"
{
            BuildCallMethod( $_[0], $_[1], $_[3], $_[4] );
        }
	],
	[#Rule 91
		 'args', 3,
sub
#line 480 "Lua\lua51.yp"
{
            $_[2];
        }
	],
	[#Rule 92
		 'args', 2,
sub
#line 484 "Lua\lua51.yp"
{
            [];
        }
	],
	[#Rule 93
		 'args', 1,
sub
#line 488 "Lua\lua51.yp"
{
            [
                $_[1],
            ];
        }
	],
	[#Rule 94
		 'args', 1,
sub
#line 494 "Lua\lua51.yp"
{
            [
                BuildLiteral( $_[0], $_[1], 'string' ),
            ];
        }
	],
	[#Rule 95
		 '@11-1', 0,
sub
#line 503 "Lua\lua51.yp"
{
            PushScopeF( $_[0] );
            PushScope( $_[0] );
        }
	],
	[#Rule 96
		 'function', 3,
sub
#line 508 "Lua\lua51.yp"
{
            $_[3];
        }
	],
	[#Rule 97
		 'funcbody', 5,
sub
#line 515 "Lua\lua51.yp"
{
            PopScopeF( $_[0] );
            BuildFunctionBody( $_[0], $_[2], $_[4] );
        }
	],
	[#Rule 98
		 'funcbody', 4,
sub
#line 520 "Lua\lua51.yp"
{
            PopScopeF( $_[0] );
            BuildFunctionBody( $_[0], [], $_[3] );
        }
	],
	[#Rule 99
		 'parlist1', 3,
sub
#line 528 "Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildParam( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 100
		 'parlist1', 1, undef
	],
	[#Rule 101
		 'parlist1', 1,
sub
#line 537 "Lua\lua51.yp"
{
            [
                BuildParam( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 102
		 'parlist', 3,
sub
#line 546 "Lua\lua51.yp"
{
            [
                @{ $_[1] },
                BuildParam( $_[0], $_[3] ),
            ];
        }
	],
	[#Rule 103
		 'parlist', 1,
sub
#line 553 "Lua\lua51.yp"
{
            [
                BuildParam( $_[0], $_[1] ),
            ];
        }
	],
	[#Rule 104
		 'tableconstructor', 3,
sub
#line 562 "Lua\lua51.yp"
{
            BuildTable( $_[0], $_[2] );
        }
	],
	[#Rule 105
		 'tableconstructor', 2,
sub
#line 566 "Lua\lua51.yp"
{
            BuildTable( $_[0], [] );
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
#line 580 "Lua\lua51.yp"
{
            [ @{ $_[1] }, $_[3] ];
        }
	],
	[#Rule 109
		 '_field_plus', 1,
sub
#line 584 "Lua\lua51.yp"
{
            [ $_[1] ];
        }
	],
	[#Rule 110
		 'field', 5,
sub
#line 591 "Lua\lua51.yp"
{
            [ $_[2], $_[5] ];
        }
	],
	[#Rule 111
		 'field', 3,
sub
#line 595 "Lua\lua51.yp"
{
            [ BuildLiteral( $_[0], $_[1], 'key' ), $_[3] ];
        }
	],
	[#Rule 112
		 'field', 1,
sub
#line 599 "Lua\lua51.yp"
{
            [ $_[1] ];
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

#line 611 "Lua\lua51.yp"


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
}

sub Generate {
    my $parser = shift;

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
        print {$FH} "  # end of prolog\n";
        foreach my $op ( @{$fct} ) {
            $op->visit($generator) unless ( exists $op->{prolog} );
        }
    }
    close $FH;
}



1;
