####################################################################
#
#    This file was generated using Parse::Yapp version 1.04.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package Regex::Grammar;
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

$VERSION = '1.04';
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


#line 1 "lib/Regex/Grammar.y"


use constant TRUE => "TRUE";
use constant FALSE => 0;

sub tokenize {
    my $data = shift;
    my @tokens = split(//, $data);
    my @types = map { /[a-zA-Z_]/ ? 'CHAR' : (/\d/ ? 'NUM' : $_) } @tokens;
    return \@tokens, \@types;
}

sub op {
    Regex::Ops::Tree->op(@_);
}



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.04',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			"(" => 4,
			"^" => 3,
			'CHAR' => 1,
			"[" => 8,
			"." => 9
		},
		GOTOS => {
			'charclass' => 6,
			'expr' => 5,
			'regex' => 7,
			'regex1' => 2
		}
	},
	{#State 1
		DEFAULT => -7
	},
	{#State 2
		ACTIONS => {
			"\$" => 10
		},
		DEFAULT => -1
	},
	{#State 3
		ACTIONS => {
			"(" => 4,
			'CHAR' => 1,
			"[" => 8,
			"." => 9
		},
		GOTOS => {
			'expr' => 11,
			'charclass' => 6
		}
	},
	{#State 4
		ACTIONS => {
			"?" => 12
		},
		DEFAULT => -17,
		GOTOS => {
			'@1-1' => 13
		}
	},
	{#State 5
		ACTIONS => {
			"?" => 14,
			'CHAR' => 1,
			"+" => 15,
			"{" => 16,
			"(" => 4,
			"|" => 18,
			"*" => 19,
			"[" => 8,
			"." => 9
		},
		DEFAULT => -4,
		GOTOS => {
			'expr' => 20,
			'charclass' => 6,
			'range' => 17
		}
	},
	{#State 6
		DEFAULT => -8
	},
	{#State 7
		ACTIONS => {
			'' => 21
		}
	},
	{#State 8
		ACTIONS => {
			"-" => 23,
			"^" => 24
		},
		DEFAULT => -30,
		GOTOS => {
			'classpieces' => 22
		}
	},
	{#State 9
		DEFAULT => -28
	},
	{#State 10
		DEFAULT => -2
	},
	{#State 11
		ACTIONS => {
			"?" => 14,
			'CHAR' => 1,
			"+" => 15,
			"{" => 16,
			"(" => 4,
			"|" => 18,
			"*" => 19,
			"[" => 8,
			"." => 9
		},
		DEFAULT => -3,
		GOTOS => {
			'expr' => 20,
			'charclass' => 6,
			'range' => 17
		}
	},
	{#State 12
		ACTIONS => {
			":" => 25
		}
	},
	{#State 13
		ACTIONS => {
			"(" => 4,
			'CHAR' => 1,
			"[" => 8,
			"." => 9
		},
		GOTOS => {
			'expr' => 26,
			'charclass' => 6
		}
	},
	{#State 14
		ACTIONS => {
			"?" => undef
		},
		DEFAULT => -13
	},
	{#State 15
		ACTIONS => {
			"?" => 28
		},
		DEFAULT => -11
	},
	{#State 16
		ACTIONS => {
			'NUM' => 31,
			"," => 30
		},
		GOTOS => {
			'number' => 29
		}
	},
	{#State 17
		ACTIONS => {
			"?" => 32
		},
		DEFAULT => -15
	},
	{#State 18
		ACTIONS => {
			"(" => 4,
			'CHAR' => 1,
			"[" => 8,
			"." => 9
		},
		GOTOS => {
			'expr' => 33,
			'charclass' => 6
		}
	},
	{#State 19
		ACTIONS => {
			"?" => 34
		},
		DEFAULT => -9
	},
	{#State 20
		ACTIONS => {
			"?" => 14,
			'CHAR' => 1,
			"+" => 15,
			"{" => 16,
			"(" => 4,
			"*" => 19,
			"[" => 8,
			"." => 9
		},
		DEFAULT => -6,
		GOTOS => {
			'expr' => 20,
			'charclass' => 6,
			'range' => 17
		}
	},
	{#State 21
		DEFAULT => 0
	},
	{#State 22
		ACTIONS => {
			'CHAR' => 35,
			"]" => 37
		},
		GOTOS => {
			'classpiece' => 36
		}
	},
	{#State 23
		DEFAULT => -30,
		GOTOS => {
			'classpieces' => 38
		}
	},
	{#State 24
		DEFAULT => -30,
		GOTOS => {
			'classpieces' => 39
		}
	},
	{#State 25
		ACTIONS => {
			"(" => 4,
			'CHAR' => 1,
			"[" => 8,
			"." => 9
		},
		GOTOS => {
			'expr' => 40,
			'charclass' => 6
		}
	},
	{#State 26
		ACTIONS => {
			"?" => 14,
			'CHAR' => 1,
			"+" => 15,
			"{" => 16,
			"(" => 4,
			"|" => 18,
			"*" => 19,
			"[" => 8,
			")" => 41,
			"." => 9
		},
		GOTOS => {
			'expr' => 20,
			'charclass' => 6,
			'range' => 17
		}
	},
	{#State 27
		DEFAULT => -14
	},
	{#State 28
		DEFAULT => -12
	},
	{#State 29
		ACTIONS => {
			'NUM' => 43,
			"," => 42
		}
	},
	{#State 30
		ACTIONS => {
			'NUM' => 31
		},
		GOTOS => {
			'number' => 44
		}
	},
	{#State 31
		DEFAULT => -24
	},
	{#State 32
		DEFAULT => -16
	},
	{#State 33
		ACTIONS => {
			"?" => 14,
			'CHAR' => 1,
			"+" => 15,
			"{" => 16,
			"(" => 4,
			"*" => 19,
			"[" => 8,
			"." => 9
		},
		DEFAULT => -5,
		GOTOS => {
			'expr' => 20,
			'charclass' => 6,
			'range' => 17
		}
	},
	{#State 34
		DEFAULT => -10
	},
	{#State 35
		ACTIONS => {
			"-" => 45
		},
		DEFAULT => -32
	},
	{#State 36
		DEFAULT => -29
	},
	{#State 37
		DEFAULT => -27
	},
	{#State 38
		ACTIONS => {
			'CHAR' => 35,
			"]" => 46
		},
		GOTOS => {
			'classpiece' => 36
		}
	},
	{#State 39
		ACTIONS => {
			'CHAR' => 35,
			"]" => 47
		},
		GOTOS => {
			'classpiece' => 36
		}
	},
	{#State 40
		ACTIONS => {
			"?" => 14,
			'CHAR' => 1,
			"+" => 15,
			"{" => 16,
			"(" => 4,
			"|" => 18,
			"*" => 19,
			"[" => 8,
			")" => 48,
			"." => 9
		},
		GOTOS => {
			'expr' => 20,
			'charclass' => 6,
			'range' => 17
		}
	},
	{#State 41
		DEFAULT => -18
	},
	{#State 42
		ACTIONS => {
			'NUM' => 31,
			"}" => 49
		},
		GOTOS => {
			'number' => 50
		}
	},
	{#State 43
		DEFAULT => -23
	},
	{#State 44
		ACTIONS => {
			'NUM' => 43,
			"}" => 51
		}
	},
	{#State 45
		ACTIONS => {
			'CHAR' => 52
		}
	},
	{#State 46
		DEFAULT => -26
	},
	{#State 47
		DEFAULT => -25
	},
	{#State 48
		DEFAULT => -19
	},
	{#State 49
		DEFAULT => -22
	},
	{#State 50
		ACTIONS => {
			'NUM' => 43,
			"}" => 53
		}
	},
	{#State 51
		DEFAULT => -21
	},
	{#State 52
		DEFAULT => -31
	},
	{#State 53
		DEFAULT => -20
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'regex', 1,
sub
#line 27 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 2
		 'regex', 2,
sub
#line 29 "lib/Regex/Grammar.y"
{ return op('seq' => [ $_[1], op('atend') ]); }
	],
	[#Rule 3
		 'regex1', 2,
sub
#line 33 "lib/Regex/Grammar.y"
{ return $_[2]; }
	],
	[#Rule 4
		 'regex1', 1,
sub
#line 35 "lib/Regex/Grammar.y"
{ return op('scan' => [ $_[1] ]); }
	],
	[#Rule 5
		 'expr', 3,
sub
#line 39 "lib/Regex/Grammar.y"
{ return op('alternate' => [ $_[1], $_[3] ]); }
	],
	[#Rule 6
		 'expr', 2,
sub
#line 41 "lib/Regex/Grammar.y"
{ return op('seq' => [ $_[1], $_[2] ]); }
	],
	[#Rule 7
		 'expr', 1,
sub
#line 43 "lib/Regex/Grammar.y"
{ return op('match' => [ ord($_[1]) ]); }
	],
	[#Rule 8
		 'expr', 1,
sub
#line 45 "lib/Regex/Grammar.y"
{ return op('charclass' => [ $_[1] ]); }
	],
	[#Rule 9
		 'expr', 2,
sub
#line 47 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, -1, TRUE, $_[1] ]); }
	],
	[#Rule 10
		 'expr', 3,
sub
#line 49 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, -1, FALSE, $_[1] ]); }
	],
	[#Rule 11
		 'expr', 2,
sub
#line 51 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 1, -1, TRUE, $_[1] ]); }
	],
	[#Rule 12
		 'expr', 3,
sub
#line 53 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 1, -1, FALSE, $_[1] ]); }
	],
	[#Rule 13
		 'expr', 2,
sub
#line 55 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, 1, TRUE, $_[1] ]); }
	],
	[#Rule 14
		 'expr', 3,
sub
#line 57 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, 1, FALSE, $_[1] ]); }
	],
	[#Rule 15
		 'expr', 2,
sub
#line 59 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ $_[2]->{min}, $_[2]->{max}, TRUE, $_[1] ]); }
	],
	[#Rule 16
		 'expr', 3,
sub
#line 61 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ $_[2]->{min}, $_[2]->{max}, FALSE, $_[1] ]); }
	],
	[#Rule 17
		 '@1-1', 0,
sub
#line 62 "lib/Regex/Grammar.y"
{ ++$::paren }
	],
	[#Rule 18
		 'expr', 4,
sub
#line 63 "lib/Regex/Grammar.y"
{ return op('group' => [ $_[3], $_[2] ]) }
	],
	[#Rule 19
		 'expr', 5,
sub
#line 65 "lib/Regex/Grammar.y"
{ return $_[4]; }
	],
	[#Rule 20
		 'range', 5,
sub
#line 69 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => $_[4] }; }
	],
	[#Rule 21
		 'range', 4,
sub
#line 71 "lib/Regex/Grammar.y"
{ return { min => 0, max => $_[3] }; }
	],
	[#Rule 22
		 'range', 4,
sub
#line 73 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => -1 }; }
	],
	[#Rule 23
		 'number', 2,
sub
#line 76 "lib/Regex/Grammar.y"
{ return $_[1] * 10 + $_[2]; }
	],
	[#Rule 24
		 'number', 1,
sub
#line 77 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 25
		 'charclass', 4,
sub
#line 80 "lib/Regex/Grammar.y"
{ return [ 'neg', $_[3] ]; }
	],
	[#Rule 26
		 'charclass', 4,
sub
#line 81 "lib/Regex/Grammar.y"
{ push @{$_[3]}, '-'; return $_[3]; }
	],
	[#Rule 27
		 'charclass', 3,
sub
#line 82 "lib/Regex/Grammar.y"
{ return $_[2]; }
	],
	[#Rule 28
		 'charclass', 1,
sub
#line 83 "lib/Regex/Grammar.y"
{ return [ 'neg', [] ]; }
	],
	[#Rule 29
		 'classpieces', 2,
sub
#line 86 "lib/Regex/Grammar.y"
{ push @{$_[1]}, $_[2]; return $_[1]; }
	],
	[#Rule 30
		 'classpieces', 0,
sub
#line 87 "lib/Regex/Grammar.y"
{ return []; }
	],
	[#Rule 31
		 'classpiece', 3,
sub
#line 91 "lib/Regex/Grammar.y"
{ return [ $_[1], $_[3] ] }
	],
	[#Rule 32
		 'classpiece', 1,
sub
#line 93 "lib/Regex/Grammar.y"
{ return $_[1]; }
	]
],
                                  @_);
    bless($self,$class);
}

#line 96 "lib/Regex/Grammar.y"


1;
