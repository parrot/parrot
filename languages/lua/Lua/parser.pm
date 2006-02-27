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
			":" => 19,
			'LITERAL' => 20,
			"[" => 21,
			"{" => 22,
			"." => 24,
			"(" => 27
		},
		DEFAULT => -44,
		GOTOS => {
			'args' => 23,
			'key' => 25,
			'tableconstructor' => 26
		}
	},
	{#State 5
		DEFAULT => -29,
		GOTOS => {
			'@8-1' => 28
		}
	},
	{#State 6
		ACTIONS => {
			"(" => 27,
			":" => 29,
			'LITERAL' => 20,
			"[" => 21,
			"{" => 22,
			"." => 24
		},
		DEFAULT => -13,
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
		DEFAULT => -16,
		GOTOS => {
			'@2-1' => 32
		}
	},
	{#State 9
		DEFAULT => -18,
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
		DEFAULT => -14,
		GOTOS => {
			'@1-1' => 41
		}
	},
	{#State 14
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			"(" => 56,
			'NIL' => 55,
			'TRUE' => 54
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 51,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 15
		ACTIONS => {
			"=" => 58,
			"," => 57
		}
	},
	{#State 16
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			"(" => 56,
			'NIL' => 55,
			'TRUE' => 54
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 59,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 17
		DEFAULT => -4,
		GOTOS => {
			'block' => 61,
			'chunk' => 60
		}
	},
	{#State 18
		DEFAULT => 0
	},
	{#State 19
		ACTIONS => {
			'NAME' => 62
		}
	},
	{#State 20
		DEFAULT => -91
	},
	{#State 21
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			"(" => 56,
			'NIL' => 55,
			'TRUE' => 54
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 63,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 22
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 65,
			'NOT' => 46,
			'LITERAL' => 48,
			"[" => 67,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			"}" => 69,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'functioncall' => 44,
			'fieldlist' => 64,
			'var' => 43,
			'primary' => 47,
			'_field_plus' => 66,
			'function' => 49,
			'exp' => 68,
			'field' => 70,
			'tableconstructor' => 53
		}
	},
	{#State 23
		DEFAULT => -84
	},
	{#State 24
		ACTIONS => {
			'NAME' => 71
		}
	},
	{#State 25
		DEFAULT => -48
	},
	{#State 26
		DEFAULT => -90
	},
	{#State 27
		ACTIONS => {
			'FUNCTION' => 42,
			")" => 72,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 73,
			'explist1' => 74,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 28
		ACTIONS => {
			'NAME' => 75
		},
		GOTOS => {
			'funcname' => 77,
			'_funcname' => 76
		}
	},
	{#State 29
		ACTIONS => {
			'NAME' => 78
		}
	},
	{#State 30
		DEFAULT => -86
	},
	{#State 31
		DEFAULT => -47
	},
	{#State 32
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 79,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 33
		DEFAULT => -4,
		GOTOS => {
			'block' => 80,
			'chunk' => 60
		}
	},
	{#State 34
		ACTIONS => {
			"=" => 81
		},
		DEFAULT => -52
	},
	{#State 35
		ACTIONS => {
			'IN' => 82,
			"," => 83
		}
	},
	{#State 36
		DEFAULT => -31,
		GOTOS => {
			'@9-2' => 84
		}
	},
	{#State 37
		DEFAULT => -52
	},
	{#State 38
		ACTIONS => {
			"," => 83,
			"=" => 85
		},
		DEFAULT => -34
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
			'block' => 86,
			'chunk' => 60
		}
	},
	{#State 42
		DEFAULT => -92,
		GOTOS => {
			'@11-1' => 87
		}
	},
	{#State 43
		ACTIONS => {
			"(" => 27,
			'LITERAL' => 20,
			"[" => 21,
			"{" => 22,
			"." => 24,
			":" => 19
		},
		DEFAULT => -56,
		GOTOS => {
			'args' => 23,
			'key' => 25,
			'tableconstructor' => 26
		}
	},
	{#State 44
		ACTIONS => {
			"(" => 27,
			'LITERAL' => 20,
			"[" => 21,
			"{" => 22,
			"." => 24,
			":" => 29
		},
		DEFAULT => -57,
		GOTOS => {
			'args' => 30,
			'key' => 31,
			'tableconstructor' => 26
		}
	},
	{#State 45
		DEFAULT => -77
	},
	{#State 46
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 88,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 47
		DEFAULT => -55
	},
	{#State 48
		DEFAULT => -78
	},
	{#State 49
		DEFAULT => -79
	},
	{#State 50
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 89,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 51
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			'AND' => 90,
			'THEN' => 91,
			"==" => 99,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 52
		DEFAULT => -75
	},
	{#State 53
		DEFAULT => -80
	},
	{#State 54
		DEFAULT => -76
	},
	{#State 55
		DEFAULT => -74
	},
	{#State 56
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 105,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 57
		ACTIONS => {
			'NAME' => 7,
			"(" => 16
		},
		GOTOS => {
			'functioncall' => 107,
			'var' => 106
		}
	},
	{#State 58
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 73,
			'explist1' => 108,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 59
		ACTIONS => {
			")" => 109,
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			'AND' => 90,
			"==" => 99,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 60
		ACTIONS => {
			'FUNCTION' => 5,
			'NAME' => 7,
			'RETURN' => 111,
			'WHILE' => 8,
			'REPEAT' => 9,
			'FOR' => 10,
			'BREAK' => 112,
			'LOCAL' => 11,
			'DO' => 13,
			'IF' => 14,
			"(" => 16
		},
		DEFAULT => -7,
		GOTOS => {
			'functioncall' => 6,
			'var' => 4,
			'_end_block' => 110,
			'stat' => 12,
			'varlist1' => 15,
			'_if_then' => 17
		}
	},
	{#State 61
		DEFAULT => -38,
		GOTOS => {
			'_elseif_star' => 113
		}
	},
	{#State 62
		ACTIONS => {
			"{" => 22,
			'LITERAL' => 20,
			"(" => 27
		},
		GOTOS => {
			'args' => 114,
			'tableconstructor' => 26
		}
	},
	{#State 63
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			'AND' => 90,
			"-" => 98,
			"==" => 99,
			"]" => 115,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
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
		DEFAULT => -45
	},
	{#State 66
		ACTIONS => {
			";" => 119,
			"," => 120
		},
		DEFAULT => -104,
		GOTOS => {
			'fieldsep' => 118
		}
	},
	{#State 67
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 121,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 68
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -109
	},
	{#State 69
		DEFAULT => -102
	},
	{#State 70
		DEFAULT => -106
	},
	{#State 71
		DEFAULT => -50
	},
	{#State 72
		DEFAULT => -89
	},
	{#State 73
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -54
	},
	{#State 74
		ACTIONS => {
			")" => 122,
			"," => 123
		}
	},
	{#State 75
		DEFAULT => -42
	},
	{#State 76
		ACTIONS => {
			"." => 125,
			":" => 124
		},
		DEFAULT => -39
	},
	{#State 77
		ACTIONS => {
			"(" => 126
		},
		GOTOS => {
			'funcbody' => 127
		}
	},
	{#State 78
		ACTIONS => {
			"{" => 22,
			'LITERAL' => 20,
			"(" => 27
		},
		GOTOS => {
			'args' => 128,
			'tableconstructor' => 26
		}
	},
	{#State 79
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			'AND' => 90,
			"-" => 98,
			"==" => 99,
			'DO' => 129,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 80
		ACTIONS => {
			'UNTIL' => 130
		}
	},
	{#State 81
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 131,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 82
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 73,
			'explist1' => 132,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 83
		ACTIONS => {
			'NAME' => 133
		}
	},
	{#State 84
		ACTIONS => {
			'NAME' => 134
		}
	},
	{#State 85
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 73,
			'explist1' => 135,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 86
		ACTIONS => {
			'END' => 136
		}
	},
	{#State 87
		ACTIONS => {
			"(" => 126
		},
		GOTOS => {
			'funcbody' => 137
		}
	},
	{#State 88
		ACTIONS => {
			"^" => 102
		},
		DEFAULT => -73
	},
	{#State 89
		ACTIONS => {
			"^" => 102
		},
		DEFAULT => -72
	},
	{#State 90
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 138,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 91
		DEFAULT => -35
	},
	{#State 92
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 139,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 93
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 140,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 94
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 141,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 95
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 142,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 96
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 143,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 97
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 144,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 98
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 145,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 99
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 146,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 100
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 147,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 101
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 148,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 102
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 149,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 103
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 150,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 104
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 151,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 105
		ACTIONS => {
			")" => 152,
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			'AND' => 90,
			"==" => 99,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 106
		ACTIONS => {
			":" => 19,
			'LITERAL' => 20,
			"[" => 21,
			"{" => 22,
			"." => 24,
			"(" => 27
		},
		DEFAULT => -43,
		GOTOS => {
			'args' => 23,
			'key' => 25,
			'tableconstructor' => 26
		}
	},
	{#State 107
		ACTIONS => {
			"{" => 22,
			"." => 24,
			":" => 29,
			'LITERAL' => 20,
			"[" => 21,
			"(" => 27
		},
		GOTOS => {
			'args' => 30,
			'key' => 31,
			'tableconstructor' => 26
		}
	},
	{#State 108
		ACTIONS => {
			"," => 123
		},
		DEFAULT => -12
	},
	{#State 109
		ACTIONS => {
			"{" => 22,
			"." => 24,
			":" => 155,
			'LITERAL' => 20,
			"[" => 21,
			"(" => 27
		},
		GOTOS => {
			'args' => 153,
			'key' => 154,
			'tableconstructor' => 26
		}
	},
	{#State 110
		ACTIONS => {
			";" => 40
		},
		DEFAULT => -6,
		GOTOS => {
			'_semicolon_opt' => 156
		}
	},
	{#State 111
		ACTIONS => {
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'NIL' => 55,
			"(" => 56,
			'FUNCTION' => 42,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54
		},
		DEFAULT => -10,
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 73,
			'explist1' => 157,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 112
		DEFAULT => -11
	},
	{#State 113
		ACTIONS => {
			'ELSEIF' => 160,
			'ELSE' => 158,
			'END' => 159
		}
	},
	{#State 114
		DEFAULT => -85
	},
	{#State 115
		DEFAULT => -49
	},
	{#State 116
		DEFAULT => -101
	},
	{#State 117
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 161,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 118
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 65,
			'NOT' => 46,
			'LITERAL' => 48,
			"[" => 67,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		DEFAULT => -103,
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 68,
			'field' => 162,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 119
		DEFAULT => -111
	},
	{#State 120
		DEFAULT => -110
	},
	{#State 121
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			'AND' => 90,
			"-" => 98,
			"==" => 99,
			"]" => 163,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 122
		DEFAULT => -88
	},
	{#State 123
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 164,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 124
		ACTIONS => {
			'NAME' => 165
		}
	},
	{#State 125
		ACTIONS => {
			'NAME' => 166
		}
	},
	{#State 126
		ACTIONS => {
			")" => 170,
			'NAME' => 167,
			"..." => 169
		},
		GOTOS => {
			'parlist' => 168,
			'parlist1' => 171
		}
	},
	{#State 127
		DEFAULT => -30
	},
	{#State 128
		DEFAULT => -87
	},
	{#State 129
		DEFAULT => -4,
		GOTOS => {
			'block' => 172,
			'chunk' => 60
		}
	},
	{#State 130
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 173,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 131
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"," => 174,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			'AND' => 90,
			"==" => 99,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 132
		ACTIONS => {
			'DO' => 175,
			"," => 123
		}
	},
	{#State 133
		DEFAULT => -51
	},
	{#State 134
		ACTIONS => {
			"(" => 126
		},
		GOTOS => {
			'funcbody' => 176
		}
	},
	{#State 135
		ACTIONS => {
			"," => 123
		},
		DEFAULT => -33
	},
	{#State 136
		DEFAULT => -15
	},
	{#State 137
		DEFAULT => -93
	},
	{#State 138
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -70
	},
	{#State 139
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -63
	},
	{#State 140
		ACTIONS => {
			"^" => 102
		},
		DEFAULT => -60
	},
	{#State 141
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -71
	},
	{#State 142
		ACTIONS => {
			"*" => 93,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -58
	},
	{#State 143
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -65
	},
	{#State 144
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -64
	},
	{#State 145
		ACTIONS => {
			"*" => 93,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -59
	},
	{#State 146
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -68
	},
	{#State 147
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -66
	},
	{#State 148
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -67
	},
	{#State 149
		ACTIONS => {
			"^" => 102
		},
		DEFAULT => -62
	},
	{#State 150
		ACTIONS => {
			"^" => 102
		},
		DEFAULT => -61
	},
	{#State 151
		ACTIONS => {
			".." => 92,
			"*" => 93,
			"+" => 95,
			"-" => 98,
			"^" => 102,
			"/" => 103
		},
		DEFAULT => -69
	},
	{#State 152
		ACTIONS => {
			"(" => 27,
			'LITERAL' => 20,
			"[" => 21,
			"{" => 22,
			"." => 24,
			":" => 155
		},
		DEFAULT => -81,
		GOTOS => {
			'args' => 153,
			'key' => 154,
			'tableconstructor' => 26
		}
	},
	{#State 153
		DEFAULT => -82
	},
	{#State 154
		DEFAULT => -46
	},
	{#State 155
		ACTIONS => {
			'NAME' => 177
		}
	},
	{#State 156
		DEFAULT => -8
	},
	{#State 157
		ACTIONS => {
			"," => 123
		},
		DEFAULT => -9
	},
	{#State 158
		DEFAULT => -20,
		GOTOS => {
			'@4-4' => 178
		}
	},
	{#State 159
		DEFAULT => -22
	},
	{#State 160
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 179,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 161
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -108
	},
	{#State 162
		DEFAULT => -105
	},
	{#State 163
		ACTIONS => {
			"=" => 180
		}
	},
	{#State 164
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -53
	},
	{#State 165
		DEFAULT => -40
	},
	{#State 166
		DEFAULT => -41
	},
	{#State 167
		DEFAULT => -100
	},
	{#State 168
		ACTIONS => {
			"," => 181
		},
		DEFAULT => -97
	},
	{#State 169
		DEFAULT => -98
	},
	{#State 170
		DEFAULT => -4,
		GOTOS => {
			'block' => 182,
			'chunk' => 60
		}
	},
	{#State 171
		ACTIONS => {
			")" => 183
		}
	},
	{#State 172
		ACTIONS => {
			'END' => 184
		}
	},
	{#State 173
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -19
	},
	{#State 174
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 185,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 175
		DEFAULT => -27,
		GOTOS => {
			'@7-5' => 186
		}
	},
	{#State 176
		DEFAULT => -32
	},
	{#State 177
		ACTIONS => {
			"{" => 22,
			'LITERAL' => 20,
			"(" => 27
		},
		GOTOS => {
			'args' => 187,
			'tableconstructor' => 26
		}
	},
	{#State 178
		DEFAULT => -4,
		GOTOS => {
			'block' => 188,
			'chunk' => 60
		}
	},
	{#State 179
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			'AND' => 90,
			'THEN' => 189,
			"==" => 99,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 180
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 190,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 181
		ACTIONS => {
			'NAME' => 191,
			"..." => 192
		}
	},
	{#State 182
		ACTIONS => {
			'END' => 193
		}
	},
	{#State 183
		DEFAULT => -4,
		GOTOS => {
			'block' => 194,
			'chunk' => 60
		}
	},
	{#State 184
		DEFAULT => -17
	},
	{#State 185
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"," => 195,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			'DO' => 196,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		}
	},
	{#State 186
		DEFAULT => -4,
		GOTOS => {
			'block' => 197,
			'chunk' => 60
		}
	},
	{#State 187
		DEFAULT => -83
	},
	{#State 188
		ACTIONS => {
			'END' => 198
		}
	},
	{#State 189
		DEFAULT => -36,
		GOTOS => {
			'@10-4' => 199
		}
	},
	{#State 190
		ACTIONS => {
			'AND' => 90,
			".." => 92,
			"*" => 93,
			'OR' => 94,
			"+" => 95,
			"<=" => 96,
			"<" => 97,
			"-" => 98,
			"==" => 99,
			">" => 100,
			">=" => 101,
			"^" => 102,
			"/" => 103,
			"~=" => 104
		},
		DEFAULT => -107
	},
	{#State 191
		DEFAULT => -99
	},
	{#State 192
		DEFAULT => -96
	},
	{#State 193
		DEFAULT => -95
	},
	{#State 194
		ACTIONS => {
			'END' => 200
		}
	},
	{#State 195
		ACTIONS => {
			'FUNCTION' => 42,
			'NUMBER' => 45,
			'NAME' => 7,
			'NOT' => 46,
			'LITERAL' => 48,
			"{" => 22,
			"-" => 50,
			'FALSE' => 52,
			'TRUE' => 54,
			'NIL' => 55,
			"(" => 56
		},
		GOTOS => {
			'function' => 49,
			'functioncall' => 44,
			'var' => 43,
			'exp' => 201,
			'primary' => 47,
			'tableconstructor' => 53
		}
	},
	{#State 196
		DEFAULT => -25,
		GOTOS => {
			'@6-7' => 202
		}
	},
	{#State 197
		ACTIONS => {
			'END' => 203
		}
	},
	{#State 198
		DEFAULT => -21
	},
	{#State 199
		DEFAULT => -4,
		GOTOS => {
			'block' => 204,
			'chunk' => 60
		}
	},
	{#State 200
		DEFAULT => -94
	},
	{#State 201
		ACTIONS => {
			"*" => 93,
			"+" => 95,
			'OR' => 94,
			"<=" => 96,
			"<" => 97,
			'AND' => 90,
			"-" => 98,
			"==" => 99,
			'DO' => 205,
			">" => 100,
			"/" => 103,
			"^" => 102,
			">=" => 101,
			".." => 92,
			"~=" => 104
		}
	},
	{#State 202
		DEFAULT => -4,
		GOTOS => {
			'block' => 206,
			'chunk' => 60
		}
	},
	{#State 203
		DEFAULT => -28
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
			'chunk' => 60
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
		 'funcname', 3,
sub
#line 235 "Lua\lua50.yp"
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
#line 246 "Lua\lua50.yp"
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
#line 253 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 43
		 'varlist1', 3,
sub
#line 260 "Lua\lua50.yp"
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
#line 267 "Lua\lua50.yp"
{
			[
				BuildVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 45
		 'var', 1,
sub
#line 276 "Lua\lua50.yp"
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
#line 282 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[2]];
		}
	],
	[#Rule 49
		 'key', 3,
sub
#line 289 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 50
		 'key', 2,
sub
#line 293 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[2], 'key');
		}
	],
	[#Rule 51
		 'namelist', 3,
sub
#line 300 "Lua\lua50.yp"
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
#line 307 "Lua\lua50.yp"
{
			[
				BuildLocalVariable($_[0], $_[1])
			]
		}
	],
	[#Rule 53
		 'explist1', 3,
sub
#line 316 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 54
		 'explist1', 1,
sub
#line 320 "Lua\lua50.yp"
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
#line 329 "Lua\lua50.yp"
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
#line 335 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 59
		 'exp', 3,
sub
#line 339 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 60
		 'exp', 3,
sub
#line 343 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 61
		 'exp', 3,
sub
#line 347 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 62
		 'exp', 3,
sub
#line 351 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 63
		 'exp', 3,
sub
#line 355 "Lua\lua50.yp"
{
			BuildBinop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 64
		 'exp', 3,
sub
#line 359 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 65
		 'exp', 3,
sub
#line 363 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 66
		 'exp', 3,
sub
#line 367 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 67
		 'exp', 3,
sub
#line 371 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 68
		 'exp', 3,
sub
#line 375 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 69
		 'exp', 3,
sub
#line 379 "Lua\lua50.yp"
{
			BuildRelop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 70
		 'exp', 3,
sub
#line 383 "Lua\lua50.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 71
		 'exp', 3,
sub
#line 387 "Lua\lua50.yp"
{
			BuildLogop($_[0], $_[1], $_[2], $_[3]);
		}
	],
	[#Rule 72
		 'exp', 2,
sub
#line 391 "Lua\lua50.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 73
		 'exp', 2,
sub
#line 395 "Lua\lua50.yp"
{
			BuildUnop($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 74
		 'primary', 1,
sub
#line 402 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'nil');
		}
	],
	[#Rule 75
		 'primary', 1,
sub
#line 406 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 76
		 'primary', 1,
sub
#line 410 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'boolean');
		}
	],
	[#Rule 77
		 'primary', 1,
sub
#line 414 "Lua\lua50.yp"
{
			BuildLiteral($_[0], $_[1], 'number');
		}
	],
	[#Rule 78
		 'primary', 1,
sub
#line 418 "Lua\lua50.yp"
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
#line 426 "Lua\lua50.yp"
{
			BuildParenthesedExpression($_[0], $_[2]);
		}
	],
	[#Rule 82
		 'functioncall', 4,
sub
#line 433 "Lua\lua50.yp"
{
			BuildCallFunction($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 83
		 'functioncall', 6,
sub
#line 437 "Lua\lua50.yp"
{
			BuildCallMethod($_[0], $_[2], $_[5], $_[6]);
		}
	],
	[#Rule 84
		 'functioncall', 2,
sub
#line 441 "Lua\lua50.yp"
{
			my $fct = BuildCallVariable($_[0], $_[1]);
			BuildCallFunction($_[0], $fct, $_[2]);
		}
	],
	[#Rule 85
		 'functioncall', 4,
sub
#line 446 "Lua\lua50.yp"
{
			my $obj = BuildCallVariable($_[0], $_[1]);
			BuildCallMethod($_[0], $obj, $_[3], $_[4]);
		}
	],
	[#Rule 86
		 'functioncall', 2,
sub
#line 451 "Lua\lua50.yp"
{
			BuildCallFunction($_[0], $_[1], $_[2]);
		}
	],
	[#Rule 87
		 'functioncall', 4,
sub
#line 455 "Lua\lua50.yp"
{
			BuildCallMethod($_[0], $_[1], $_[3], $_[4]);
		}
	],
	[#Rule 88
		 'args', 3,
sub
#line 462 "Lua\lua50.yp"
{
			$_[2];
		}
	],
	[#Rule 89
		 'args', 2,
sub
#line 466 "Lua\lua50.yp"
{
			[];
		}
	],
	[#Rule 90
		 'args', 1,
sub
#line 470 "Lua\lua50.yp"
{
			[
				$_[1]
			]
		}
	],
	[#Rule 91
		 'args', 1,
sub
#line 476 "Lua\lua50.yp"
{
			[
				BuildLiteral($_[0], $_[1], 'string')
			]
		}
	],
	[#Rule 92
		 '@11-1', 0,
sub
#line 485 "Lua\lua50.yp"
{
			PushScopeF($_[0]);
			PushScope($_[0]);
		}
	],
	[#Rule 93
		 'function', 3,
sub
#line 490 "Lua\lua50.yp"
{
			$_[3];
		}
	],
	[#Rule 94
		 'funcbody', 5,
sub
#line 497 "Lua\lua50.yp"
{
			PopScopeF($_[0]);
			BuildFunctionBody($_[0], $_[2], $_[4]);
		}
	],
	[#Rule 95
		 'funcbody', 4,
sub
#line 502 "Lua\lua50.yp"
{
			PopScopeF($_[0]);
			BuildFunctionBody($_[0], [], $_[3]);
		}
	],
	[#Rule 96
		 'parlist1', 3,
sub
#line 510 "Lua\lua50.yp"
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
#line 519 "Lua\lua50.yp"
{
			[
				BuildParam($_[0], $_[1])
			];
		}
	],
	[#Rule 99
		 'parlist', 3,
sub
#line 528 "Lua\lua50.yp"
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
#line 535 "Lua\lua50.yp"
{
			[
				BuildParam($_[0], $_[1])
			]
		}
	],
	[#Rule 101
		 'tableconstructor', 3,
sub
#line 544 "Lua\lua50.yp"
{
			BuildTable($_[0], $_[2]);
		}
	],
	[#Rule 102
		 'tableconstructor', 2,
sub
#line 548 "Lua\lua50.yp"
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
#line 562 "Lua\lua50.yp"
{
			[@{$_[1]}, $_[3]];
		}
	],
	[#Rule 106
		 '_field_plus', 1,
sub
#line 566 "Lua\lua50.yp"
{
			[$_[1]];
		}
	],
	[#Rule 107
		 'field', 5,
sub
#line 573 "Lua\lua50.yp"
{
			[$_[2], $_[5]]
		}
	],
	[#Rule 108
		 'field', 3,
sub
#line 577 "Lua\lua50.yp"
{
			[BuildLiteral($_[0], $_[1], 'key'), $_[3]]
		}
	],
	[#Rule 109
		 'field', 1,
sub
#line 581 "Lua\lua50.yp"
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

#line 593 "Lua\lua50.yp"


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
