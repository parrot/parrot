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

# (accept, R) : try R, accept immediately if it matches
# (atend) : return whether at end of input string
# (seq, R, S, ...) : return R && S && ...
# (advance, n, R) : advance input <n> chars, return R
# (fork, R, S) : if R fails, try S
# (bytematch, b) : return if start of input is b, advance 1 char
# (classmatch, charclass) : return if start of input is charclass, advance 1
# (start, n) : mark start of n-th paren match
# (end, n) : mark end of n-th paren match
# (scan, R) : scan for R at every position

#  my @nodes;
#  sub register {
#      my $newnode = [ @_ ];
#      push @nodes, $newnode;
#      return @nodes - 1;
#  }

sub register {
    return bless [ @_ ], 'regex_op';
}

#  sub render {
#      my $node = $nodes[shift()];
#      return $node->[0] . "(" . join(", ", @$node[1..$#$node]) . ")";
#  }

#  sub dump {
#      use Data::Dumper;
#      for my $i (reverse(0 .. $#nodes)) {
#  #	print "$i: ".Dumper($nodes[$i])."\n";
#  	print "$i: ".render($i)."\n";
#      }
#  }



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.04',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			'CHAR' => 1,
			"." => 7,
			"^" => 9,
			"(" => 10,
			"[" => 6
		},
		GOTOS => {
			'regex0' => 2,
			'expr' => 8,
			'regex1' => 3,
			'regex' => 4,
			'charclass' => 5
		}
	},
	{#State 1
		DEFAULT => -8
	},
	{#State 2
		DEFAULT => -1
	},
	{#State 3
		ACTIONS => {
			"\$" => 11
		},
		DEFAULT => -2
	},
	{#State 4
		ACTIONS => {
			'' => 12
		}
	},
	{#State 5
		DEFAULT => -9
	},
	{#State 6
		ACTIONS => {
			"-" => 13
		},
		DEFAULT => -29,
		GOTOS => {
			'classpieces' => 14
		}
	},
	{#State 7
		DEFAULT => -27
	},
	{#State 8
		ACTIONS => {
			'CHAR' => 1,
			"*" => 15,
			"+" => 16,
			"[" => 6,
			"{" => 17,
			"|" => 18,
			"." => 7,
			"?" => 21,
			"(" => 10
		},
		DEFAULT => -5,
		GOTOS => {
			'expr' => 20,
			'range' => 19,
			'charclass' => 5
		}
	},
	{#State 9
		ACTIONS => {
			'CHAR' => 1,
			"." => 7,
			"(" => 10,
			"[" => 6
		},
		GOTOS => {
			'expr' => 22,
			'charclass' => 5
		}
	},
	{#State 10
		ACTIONS => {
			'CHAR' => 1,
			"." => 7,
			"?" => 24,
			"(" => 10,
			"[" => 6
		},
		GOTOS => {
			'expr' => 23,
			'charclass' => 5
		}
	},
	{#State 11
		DEFAULT => -3
	},
	{#State 12
		DEFAULT => -0
	},
	{#State 13
		DEFAULT => -29,
		GOTOS => {
			'classpieces' => 25
		}
	},
	{#State 14
		ACTIONS => {
			'CHAR' => 26,
			"]" => 28
		},
		GOTOS => {
			'classpiece' => 27
		}
	},
	{#State 15
		ACTIONS => {
			"?" => 29
		},
		DEFAULT => -10
	},
	{#State 16
		ACTIONS => {
			"?" => 30
		},
		DEFAULT => -12
	},
	{#State 17
		ACTIONS => {
			'NUM' => 33,
			"," => 31
		},
		GOTOS => {
			'number' => 32
		}
	},
	{#State 18
		ACTIONS => {
			'CHAR' => 1,
			"." => 7,
			"(" => 10,
			"[" => 6
		},
		GOTOS => {
			'expr' => 34,
			'charclass' => 5
		}
	},
	{#State 19
		ACTIONS => {
			"?" => 35
		},
		DEFAULT => -16
	},
	{#State 20
		ACTIONS => {
			'CHAR' => 1,
			"*" => 15,
			"+" => 16,
			"[" => 6,
			"{" => 17,
			"." => 7,
			"?" => 21,
			"(" => 10
		},
		DEFAULT => -7,
		GOTOS => {
			'expr' => 20,
			'range' => 19,
			'charclass' => 5
		}
	},
	{#State 21
		ACTIONS => {
			"?" => undef
		},
		DEFAULT => -14
	},
	{#State 22
		ACTIONS => {
			'CHAR' => 1,
			"*" => 15,
			"+" => 16,
			"[" => 6,
			"{" => 17,
			"|" => 18,
			"." => 7,
			"?" => 21,
			"(" => 10
		},
		DEFAULT => -4,
		GOTOS => {
			'expr' => 20,
			'range' => 19,
			'charclass' => 5
		}
	},
	{#State 23
		ACTIONS => {
			'CHAR' => 1,
			")" => 37,
			"*" => 15,
			"+" => 16,
			"[" => 6,
			"{" => 17,
			"|" => 18,
			"." => 7,
			"?" => 21,
			"(" => 10
		},
		GOTOS => {
			'expr' => 20,
			'range' => 19,
			'charclass' => 5
		}
	},
	{#State 24
		ACTIONS => {
			":" => 38
		}
	},
	{#State 25
		ACTIONS => {
			'CHAR' => 26,
			"]" => 39
		},
		GOTOS => {
			'classpiece' => 27
		}
	},
	{#State 26
		ACTIONS => {
			"-" => 40
		},
		DEFAULT => -31
	},
	{#State 27
		DEFAULT => -28
	},
	{#State 28
		DEFAULT => -26
	},
	{#State 29
		DEFAULT => -11
	},
	{#State 30
		DEFAULT => -13
	},
	{#State 31
		ACTIONS => {
			'NUM' => 33
		},
		GOTOS => {
			'number' => 41
		}
	},
	{#State 32
		ACTIONS => {
			'NUM' => 43,
			"," => 42
		}
	},
	{#State 33
		DEFAULT => -24
	},
	{#State 34
		ACTIONS => {
			'CHAR' => 1,
			"*" => 15,
			"+" => 16,
			"[" => 6,
			"{" => 17,
			"." => 7,
			"?" => 21,
			"(" => 10
		},
		DEFAULT => -6,
		GOTOS => {
			'expr' => 20,
			'range' => 19,
			'charclass' => 5
		}
	},
	{#State 35
		DEFAULT => -17
	},
	{#State 36
		DEFAULT => -15
	},
	{#State 37
		DEFAULT => -18
	},
	{#State 38
		ACTIONS => {
			'CHAR' => 1,
			"." => 7,
			"(" => 10,
			"[" => 6
		},
		GOTOS => {
			'expr' => 44,
			'charclass' => 5
		}
	},
	{#State 39
		DEFAULT => -25
	},
	{#State 40
		ACTIONS => {
			'CHAR' => 45
		}
	},
	{#State 41
		ACTIONS => {
			'NUM' => 43,
			"}" => 46
		}
	},
	{#State 42
		ACTIONS => {
			'NUM' => 33,
			"}" => 48
		},
		GOTOS => {
			'number' => 47
		}
	},
	{#State 43
		DEFAULT => -23
	},
	{#State 44
		ACTIONS => {
			'CHAR' => 1,
			")" => 49,
			"*" => 15,
			"+" => 16,
			"[" => 6,
			"{" => 17,
			"|" => 18,
			"." => 7,
			"?" => 21,
			"(" => 10
		},
		GOTOS => {
			'expr' => 20,
			'range' => 19,
			'charclass' => 5
		}
	},
	{#State 45
		DEFAULT => -30
	},
	{#State 46
		DEFAULT => -21
	},
	{#State 47
		ACTIONS => {
			'NUM' => 43,
			"}" => 50
		}
	},
	{#State 48
		DEFAULT => -22
	},
	{#State 49
		DEFAULT => -19
	},
	{#State 50
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
#line 57 "lib/Regex/Grammar.y"
{ return register('accept', $_[1]); }
	],
	[#Rule 2
		 'regex0', 1,
sub
#line 61 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 3
		 'regex0', 2,
sub
#line 63 "lib/Regex/Grammar.y"
{ return register('seq', $_[1], register('atend')); }
	],
	[#Rule 4
		 'regex1', 2,
sub
#line 67 "lib/Regex/Grammar.y"
{ return $_[2]; }
	],
	[#Rule 5
		 'regex1', 1,
sub
#line 69 "lib/Regex/Grammar.y"
{ return register('scan', $_[1]); }
	],
	[#Rule 6
		 'expr', 3,
sub
#line 73 "lib/Regex/Grammar.y"
{ return register('alternate', $_[1], $_[3]); }
	],
	[#Rule 7
		 'expr', 2,
sub
#line 75 "lib/Regex/Grammar.y"
{ return register('seq', $_[1], $_[2]); }
	],
	[#Rule 8
		 'expr', 1,
sub
#line 77 "lib/Regex/Grammar.y"
{ return register('bytematch', $_[1]); }
	],
	[#Rule 9
		 'expr', 1,
sub
#line 79 "lib/Regex/Grammar.y"
{ return register('classmatch', $_[1]); }
	],
	[#Rule 10
		 'expr', 2,
sub
#line 81 "lib/Regex/Grammar.y"
{ return register('multi_match', 0, -1, TRUE, $_[1]); }
	],
	[#Rule 11
		 'expr', 3,
sub
#line 83 "lib/Regex/Grammar.y"
{ return register('multi_match', 0, -1, FALSE, $_[1]); }
	],
	[#Rule 12
		 'expr', 2,
sub
#line 85 "lib/Regex/Grammar.y"
{ return register('multi_match', 1, -1, TRUE, $_[1]); }
	],
	[#Rule 13
		 'expr', 3,
sub
#line 87 "lib/Regex/Grammar.y"
{ return register('multi_match', 1, -1, FALSE, $_[1]); }
	],
	[#Rule 14
		 'expr', 2,
sub
#line 89 "lib/Regex/Grammar.y"
{ return register('multi_match', 0, 1, TRUE, $_[1]); }
	],
	[#Rule 15
		 'expr', 3,
sub
#line 91 "lib/Regex/Grammar.y"
{ return register('multi_match', 0, 1, FALSE, $_[1]); }
	],
	[#Rule 16
		 'expr', 2,
sub
#line 93 "lib/Regex/Grammar.y"
{ return register('multi_match', $_[2]->{min}, $_[2]->{max}, TRUE, $_[1]); }
	],
	[#Rule 17
		 'expr', 3,
sub
#line 95 "lib/Regex/Grammar.y"
{ return register('multi_match', $_[2]->{min}, $_[2]->{max}, FALSE, $_[1]); }
	],
	[#Rule 18
		 'expr', 3,
sub
#line 97 "lib/Regex/Grammar.y"
{ return register('seq', register('start', ++$::paren), $_[2], register('end', $::paren)); }
	],
	[#Rule 19
		 'expr', 5,
sub
#line 99 "lib/Regex/Grammar.y"
{ return $_[4]; }
	],
	[#Rule 20
		 'range', 5,
sub
#line 103 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => $_[4] }; }
	],
	[#Rule 21
		 'range', 4,
sub
#line 105 "lib/Regex/Grammar.y"
{ return { min => 0, max => $_[3] }; }
	],
	[#Rule 22
		 'range', 4,
sub
#line 107 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => -1 }; }
	],
	[#Rule 23
		 'number', 2,
sub
#line 110 "lib/Regex/Grammar.y"
{ return $_[1] * 10 + $_[2]; }
	],
	[#Rule 24
		 'number', 1,
sub
#line 111 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 25
		 'charclass', 4,
sub
#line 114 "lib/Regex/Grammar.y"
{ $_[3] .= '-'; return $_[3]; }
	],
	[#Rule 26
		 'charclass', 3,
sub
#line 115 "lib/Regex/Grammar.y"
{ return $_[2]; }
	],
	[#Rule 27
		 'charclass', 1,
sub
#line 116 "lib/Regex/Grammar.y"
{ return 'ANY'; }
	],
	[#Rule 28
		 'classpieces', 2,
sub
#line 119 "lib/Regex/Grammar.y"
{ $_[1] .= $_[2]; return $_[1]; }
	],
	[#Rule 29
		 'classpieces', 0,
sub
#line 120 "lib/Regex/Grammar.y"
{ return ''; }
	],
	[#Rule 30
		 'classpiece', 3,
sub
#line 124 "lib/Regex/Grammar.y"
{ my $s = $_[1];
      my $p = $s;
      $s .= $p while ($p++ ne $_[3]);
      return $s;
    }
	],
	[#Rule 31
		 'classpiece', 1,
sub
#line 130 "lib/Regex/Grammar.y"
{ return $_[1]; }
	]
],
                                  @_);
    bless($self,$class);
}

#line 133 "lib/Regex/Grammar.y"


1;
