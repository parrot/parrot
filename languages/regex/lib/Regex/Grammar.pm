####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
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


#line 1 "lib/Regex/Grammar.y"


use constant TRUE => "TRUE";
use constant FALSE => 0;

sub tokenize {
    my $data = shift;
    my @tokens = $data =~ /(\\.|.)/g;
    my @types;
    foreach (@tokens) {
        if (/^\\(.)/) {
            $_ = $1;
            push @types, 'CHAR';
        } elsif (/\d/) {
            push @types, 'NUM';
        } elsif (/[\w\s]/) {
            push @types, 'CHAR';
        } else {
            push @types, $_;
        }
    }
    return \@tokens, \@types;
}

sub op {
    Regex::Ops::Tree->op(@_);
}

$::paren = 0;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		DEFAULT => -2,
		GOTOS => {
			'rules' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 2,
			'CHAR' => 4,
			"<" => 3,
			"&" => 5,
			"^" => 8,
			"(" => 9,
			"[" => 13,
			"." => 14
		},
		GOTOS => {
			'charclass' => 11,
			'expr' => 10,
			'regex' => 12,
			'rule' => 7,
			'regex1' => 6
		}
	},
	{#State 2
		DEFAULT => 0
	},
	{#State 3
		ACTIONS => {
			"?" => 15
		},
		DEFAULT => -27,
		GOTOS => {
			'rulename' => 16
		}
	},
	{#State 4
		DEFAULT => -11
	},
	{#State 5
		DEFAULT => -27,
		GOTOS => {
			'rulename' => 17
		}
	},
	{#State 6
		DEFAULT => -6
	},
	{#State 7
		DEFAULT => -1
	},
	{#State 8
		ACTIONS => {
			"(" => 9,
			'CHAR' => 4,
			"<" => 3,
			"[" => 13,
			"." => 14
		},
		GOTOS => {
			'expr' => 10,
			'charclass' => 11,
			'regex1' => 18
		}
	},
	{#State 9
		ACTIONS => {
			"?" => 19
		},
		DEFAULT => -21,
		GOTOS => {
			'@1-1' => 20
		}
	},
	{#State 10
		ACTIONS => {
			"?" => 21,
			'CHAR' => 4,
			"<" => 3,
			"+" => 22,
			"{" => 23,
			"(" => 9,
			"|" => 25,
			"*" => 26,
			"\$" => 28,
			"[" => 13,
			"." => 14
		},
		DEFAULT => -7,
		GOTOS => {
			'expr' => 27,
			'charclass' => 11,
			'range' => 24
		}
	},
	{#State 11
		DEFAULT => -12
	},
	{#State 12
		DEFAULT => -4
	},
	{#State 13
		ACTIONS => {
			"-" => 30,
			"^" => 31
		},
		DEFAULT => -39,
		GOTOS => {
			'classpieces' => 29
		}
	},
	{#State 14
		DEFAULT => -37
	},
	{#State 15
		DEFAULT => -27,
		GOTOS => {
			'rulename' => 32
		}
	},
	{#State 16
		ACTIONS => {
			'CHAR' => 33,
			">" => 34
		}
	},
	{#State 17
		ACTIONS => {
			'CHAR' => 33,
			"=" => 35
		}
	},
	{#State 18
		DEFAULT => -5
	},
	{#State 19
		ACTIONS => {
			":" => 36
		}
	},
	{#State 20
		ACTIONS => {
			"(" => 9,
			'CHAR' => 4,
			"<" => 3,
			"[" => 13,
			"." => 14
		},
		GOTOS => {
			'expr' => 37,
			'charclass' => 11
		}
	},
	{#State 21
		ACTIONS => {
			"?" => undef
		},
		DEFAULT => -17
	},
	{#State 22
		ACTIONS => {
			"?" => 39
		},
		DEFAULT => -15
	},
	{#State 23
		ACTIONS => {
			'NUM' => 42,
			"," => 41
		},
		GOTOS => {
			'number' => 40
		}
	},
	{#State 24
		ACTIONS => {
			"?" => 43
		},
		DEFAULT => -19
	},
	{#State 25
		ACTIONS => {
			"(" => 9,
			'CHAR' => 4,
			"<" => 3,
			"[" => 13,
			"." => 14
		},
		GOTOS => {
			'expr' => 44,
			'charclass' => 11
		}
	},
	{#State 26
		ACTIONS => {
			"?" => 45
		},
		DEFAULT => -13
	},
	{#State 27
		ACTIONS => {
			"?" => 21,
			'CHAR' => 4,
			"<" => 3,
			"+" => 22,
			"{" => 23,
			"(" => 9,
			"*" => 26,
			"[" => 13,
			"." => 14
		},
		DEFAULT => -10,
		GOTOS => {
			'expr' => 27,
			'charclass' => 11,
			'range' => 24
		}
	},
	{#State 28
		DEFAULT => -8
	},
	{#State 29
		ACTIONS => {
			'NUM' => 48,
			'CHAR' => 46,
			"]" => 49
		},
		GOTOS => {
			'classpiece' => 47
		}
	},
	{#State 30
		DEFAULT => -39,
		GOTOS => {
			'classpieces' => 50
		}
	},
	{#State 31
		DEFAULT => -39,
		GOTOS => {
			'classpieces' => 51
		}
	},
	{#State 32
		ACTIONS => {
			'CHAR' => 33,
			">" => 52
		}
	},
	{#State 33
		DEFAULT => -26
	},
	{#State 34
		DEFAULT => -24
	},
	{#State 35
		ACTIONS => {
			"^" => 8,
			"(" => 9,
			'CHAR' => 4,
			"<" => 3,
			"[" => 13,
			"." => 14
		},
		GOTOS => {
			'expr' => 10,
			'charclass' => 11,
			'regex' => 53,
			'regex1' => 6
		}
	},
	{#State 36
		ACTIONS => {
			"(" => 9,
			'CHAR' => 4,
			"<" => 3,
			"[" => 13,
			"." => 14
		},
		GOTOS => {
			'expr' => 54,
			'charclass' => 11
		}
	},
	{#State 37
		ACTIONS => {
			"?" => 21,
			'CHAR' => 4,
			"<" => 3,
			"+" => 22,
			"{" => 23,
			"(" => 9,
			"|" => 25,
			"*" => 26,
			"[" => 13,
			")" => 55,
			"." => 14
		},
		GOTOS => {
			'expr' => 27,
			'charclass' => 11,
			'range' => 24
		}
	},
	{#State 38
		DEFAULT => -18
	},
	{#State 39
		DEFAULT => -16
	},
	{#State 40
		ACTIONS => {
			'NUM' => 58,
			"}" => 56,
			"," => 57
		}
	},
	{#State 41
		ACTIONS => {
			'NUM' => 42
		},
		GOTOS => {
			'number' => 59
		}
	},
	{#State 42
		DEFAULT => -33
	},
	{#State 43
		DEFAULT => -20
	},
	{#State 44
		ACTIONS => {
			"?" => 21,
			'CHAR' => 4,
			"<" => 3,
			"+" => 22,
			"{" => 23,
			"(" => 9,
			"*" => 26,
			"[" => 13,
			"." => 14
		},
		DEFAULT => -9,
		GOTOS => {
			'expr' => 27,
			'charclass' => 11,
			'range' => 24
		}
	},
	{#State 45
		DEFAULT => -14
	},
	{#State 46
		ACTIONS => {
			"-" => 60
		},
		DEFAULT => -41
	},
	{#State 47
		DEFAULT => -38
	},
	{#State 48
		ACTIONS => {
			"-" => 61
		},
		DEFAULT => -43
	},
	{#State 49
		DEFAULT => -36
	},
	{#State 50
		ACTIONS => {
			'NUM' => 48,
			'CHAR' => 46,
			"]" => 62
		},
		GOTOS => {
			'classpiece' => 47
		}
	},
	{#State 51
		ACTIONS => {
			'NUM' => 48,
			'CHAR' => 46,
			"]" => 63
		},
		GOTOS => {
			'classpiece' => 47
		}
	},
	{#State 52
		DEFAULT => -25
	},
	{#State 53
		DEFAULT => -3
	},
	{#State 54
		ACTIONS => {
			"?" => 21,
			'CHAR' => 4,
			"<" => 3,
			"+" => 22,
			"{" => 23,
			"(" => 9,
			"|" => 25,
			"*" => 26,
			"[" => 13,
			")" => 64,
			"." => 14
		},
		GOTOS => {
			'expr' => 27,
			'charclass' => 11,
			'range' => 24
		}
	},
	{#State 55
		DEFAULT => -22
	},
	{#State 56
		DEFAULT => -30
	},
	{#State 57
		ACTIONS => {
			'NUM' => 42,
			"}" => 65
		},
		GOTOS => {
			'number' => 66
		}
	},
	{#State 58
		DEFAULT => -32
	},
	{#State 59
		ACTIONS => {
			'NUM' => 58,
			"}" => 67
		}
	},
	{#State 60
		ACTIONS => {
			'CHAR' => 68
		}
	},
	{#State 61
		ACTIONS => {
			'NUM' => 69
		}
	},
	{#State 62
		DEFAULT => -35
	},
	{#State 63
		DEFAULT => -34
	},
	{#State 64
		DEFAULT => -23
	},
	{#State 65
		DEFAULT => -31
	},
	{#State 66
		ACTIONS => {
			'NUM' => 58,
			"}" => 70
		}
	},
	{#State 67
		DEFAULT => -29
	},
	{#State 68
		DEFAULT => -40
	},
	{#State 69
		DEFAULT => -42
	},
	{#State 70
		DEFAULT => -28
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'rules', 2,
sub
#line 41 "lib/Regex/Grammar.y"
{ return [ @{ $_[1] }, $_[2] ] }
	],
	[#Rule 2
		 'rules', 0,
sub
#line 43 "lib/Regex/Grammar.y"
{ return []; }
	],
	[#Rule 3
		 'rule', 4,
sub
#line 47 "lib/Regex/Grammar.y"
{ my ($name, $tree) = @_[2,4];
     # This is really not the place for this...
     if ($tree->{name} eq 'scan' && $name ne 'default') {
         $tree = $tree->{args}->[0];
     }
     my $op = op('rule' => [ $name, $tree, 1 + $::paren ]);
     $::paren = 0; # FIXME!
     return $op;
   }
	],
	[#Rule 4
		 'rule', 1,
sub
#line 57 "lib/Regex/Grammar.y"
{
     my $op = op('rule' => [ 'default', $_[1], 1 + $::paren ]);
     $::paren = 0; # FIXME!
     return $op;
   }
	],
	[#Rule 5
		 'regex', 2,
sub
#line 65 "lib/Regex/Grammar.y"
{ return $_[2]; }
	],
	[#Rule 6
		 'regex', 1,
sub
#line 67 "lib/Regex/Grammar.y"
{ return op('scan' => [ $_[1] ]); }
	],
	[#Rule 7
		 'regex1', 1,
sub
#line 71 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 8
		 'regex1', 2,
sub
#line 73 "lib/Regex/Grammar.y"
{ return op('seq' => [ $_[1], op('atend') ]); }
	],
	[#Rule 9
		 'expr', 3,
sub
#line 77 "lib/Regex/Grammar.y"
{ return op('alternate' => [ $_[1], $_[3] ]); }
	],
	[#Rule 10
		 'expr', 2,
sub
#line 79 "lib/Regex/Grammar.y"
{ return op('seq' => [ $_[1], $_[2] ]); }
	],
	[#Rule 11
		 'expr', 1,
sub
#line 81 "lib/Regex/Grammar.y"
{ return op('match' => [ ord($_[1]) ]); }
	],
	[#Rule 12
		 'expr', 1,
sub
#line 83 "lib/Regex/Grammar.y"
{ return op('classpieces' => [ $_[1] ]); }
	],
	[#Rule 13
		 'expr', 2,
sub
#line 85 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, -1, TRUE, $_[1] ]); }
	],
	[#Rule 14
		 'expr', 3,
sub
#line 87 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, -1, FALSE, $_[1] ]); }
	],
	[#Rule 15
		 'expr', 2,
sub
#line 89 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 1, -1, TRUE, $_[1] ]); }
	],
	[#Rule 16
		 'expr', 3,
sub
#line 91 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 1, -1, FALSE, $_[1] ]); }
	],
	[#Rule 17
		 'expr', 2,
sub
#line 93 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, 1, TRUE, $_[1] ]); }
	],
	[#Rule 18
		 'expr', 3,
sub
#line 95 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ 0, 1, FALSE, $_[1] ]); }
	],
	[#Rule 19
		 'expr', 2,
sub
#line 97 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ $_[2]->{min}, $_[2]->{max}, TRUE, $_[1] ]); }
	],
	[#Rule 20
		 'expr', 3,
sub
#line 99 "lib/Regex/Grammar.y"
{ return op('multi_match' => [ $_[2]->{min}, $_[2]->{max}, FALSE, $_[1] ]); }
	],
	[#Rule 21
		 '@1-1', 0,
sub
#line 100 "lib/Regex/Grammar.y"
{ ++$::paren }
	],
	[#Rule 22
		 'expr', 4,
sub
#line 101 "lib/Regex/Grammar.y"
{ return op('group' => [ $_[3], $_[2] ]) }
	],
	[#Rule 23
		 'expr', 5,
sub
#line 103 "lib/Regex/Grammar.y"
{ return $_[4]; }
	],
	[#Rule 24
		 'expr', 3,
sub
#line 105 "lib/Regex/Grammar.y"
{ return op('call' => [ $_[2], 0 ]) }
	],
	[#Rule 25
		 'expr', 4,
sub
#line 107 "lib/Regex/Grammar.y"
{ return op('group', [ op('call' => [ $_[3], 1 ]), ++$::paren ]) }
	],
	[#Rule 26
		 'rulename', 2,
sub
#line 111 "lib/Regex/Grammar.y"
{ return $_[1] . $_[2]; }
	],
	[#Rule 27
		 'rulename', 0,
sub
#line 113 "lib/Regex/Grammar.y"
{ return '' }
	],
	[#Rule 28
		 'range', 5,
sub
#line 117 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => $_[4] }; }
	],
	[#Rule 29
		 'range', 4,
sub
#line 119 "lib/Regex/Grammar.y"
{ return { min => 0, max => $_[3] }; }
	],
	[#Rule 30
		 'range', 3,
sub
#line 121 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => $_[2] }; }
	],
	[#Rule 31
		 'range', 4,
sub
#line 123 "lib/Regex/Grammar.y"
{ return { min => $_[2], max => -1 }; }
	],
	[#Rule 32
		 'number', 2,
sub
#line 126 "lib/Regex/Grammar.y"
{ return $_[1] * 10 + $_[2]; }
	],
	[#Rule 33
		 'number', 1,
sub
#line 127 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 34
		 'charclass', 4,
sub
#line 130 "lib/Regex/Grammar.y"
{ return [ 'neg', $_[3] ]; }
	],
	[#Rule 35
		 'charclass', 4,
sub
#line 131 "lib/Regex/Grammar.y"
{ push @{$_[3]}, '-'; return $_[3]; }
	],
	[#Rule 36
		 'charclass', 3,
sub
#line 132 "lib/Regex/Grammar.y"
{ return $_[2]; }
	],
	[#Rule 37
		 'charclass', 1,
sub
#line 133 "lib/Regex/Grammar.y"
{ return [ 'neg', [] ]; }
	],
	[#Rule 38
		 'classpieces', 2,
sub
#line 136 "lib/Regex/Grammar.y"
{ push @{$_[1]}, $_[2]; return $_[1]; }
	],
	[#Rule 39
		 'classpieces', 0,
sub
#line 137 "lib/Regex/Grammar.y"
{ return []; }
	],
	[#Rule 40
		 'classpiece', 3,
sub
#line 141 "lib/Regex/Grammar.y"
{ return [ $_[1], $_[3] ] }
	],
	[#Rule 41
		 'classpiece', 1,
sub
#line 143 "lib/Regex/Grammar.y"
{ return $_[1]; }
	],
	[#Rule 42
		 'classpiece', 3,
sub
#line 145 "lib/Regex/Grammar.y"
{ return [ $_[1], $_[3] ] }
	],
	[#Rule 43
		 'classpiece', 1,
sub
#line 147 "lib/Regex/Grammar.y"
{ return $_[1]; }
	]
],
                                  @_);
    bless($self,$class);
}

#line 150 "lib/Regex/Grammar.y"


1;
