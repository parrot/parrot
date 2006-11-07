#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More 'tests' => 13;

BEGIN { use_ok('Parrot::PIR::Formatter') };

die "Run these tests from the distribution root\n" unless -d 't/perl';

reformat_ok(<<'END_PIR',<<'END_FORMATTED','.sub block');
 .sub main :main
 $I0 = 2
 .end
END_PIR
.sub main :main
    $I0 = 2
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','trailing whitespace');
 .sub main :main        
 $I0 = 3          
 .end           
END_PIR
.sub main :main
    $I0 = 3
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','remove leading/trailing blank lines.');


 .sub main :main
 $I0 = 4 
 .end


END_PIR
.sub main :main
    $I0 = 4
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','collapse multiple empty lines');
 .sub main :main
 $I0 = 5



 .end
END_PIR
.sub main :main
    $I0 = 5

.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','handle pod');
 .sub main :main
 $I0 = 6

=for testing
  
 a

b

=cut

 .end
END_PIR
.sub main :main
    $I0 = 6

=for testing
  
 a

b

=cut

.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','whitespace before labels');
 .sub main :main
 $I0 = 7
 goto bork
 bork:
 .return(2)
 .end
END_PIR
.sub main :main
    $I0 = 7
    goto bork

    bork:
    .return(2)
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','multiple .sub blocks');
 .sub main :main
 $I0 = 8
 .end
 .sub secondary
 $I0 = 8
 .end
END_PIR
.sub main :main
    $I0 = 8
.end

.sub secondary
    $I0 = 8
.end
END_FORMATTED

SKIP: {
  skip ('not implemented', 5);
 
  # Once some of these tests are implemented, the un-skipped tests
  # will need to be reworked to be sure they are still tidy.

reformat_ok(<<'END_PIR',<<'END_FORMATTED','quote sub names');
.sub joe
 $I1 = 1
.end
.sub "bob"
 $I1 = 2
.end
.sub 'fred'
 $I1 = 3
.end
END_PIR
.sub 'joe'
    $I1 = 1
.end

.sub 'bob'
    $I1 = 2
.end

.sub 'fred'
    $I1 = 3
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','quote method names');
.sub joe
 $I1 = $P1.a_method()
.end
END_PIR
.sub 'joe'
    $I1 = $P1.'a_method'()
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','use single quotes instead of doubles where possible');
.sub "joe"
 $S1 = "fun"
 $S1 = "fun\n"
 $S1 = "\o11"
 $S1 = "\u11"
 $S1 = "\U11"
 $S1 = "\a"
 $S1 = "\b"
 $S1 = "\t"
 $S1 = "\v"
 $S1 = "\f"
 $S1 = "\r"
 $S1 = "\e"
 $S1 = "\\"
 $P1 = $P2."what"()
.end
END_PIR
.sub 'joe'
    $S1 = 'fun'
    $S1 = "fun\n"
    $S1 = "\o11"
    $S1 = "\u11"
    $S1 = "\U11"
    $S1 = "\a"
    $S1 = "\b"
    $S1 = "\t"
    $S1 = "\v"
    $S1 = "\f"
    $S1 = "\r"
    $S1 = "\e"
    $S1 = "\\"
    $P1 = $P2.'what'()
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','vertically align .params');
.sub joe
 .param pmc bob :slurpy :unique_reg
 .param pmc   fred :unique_reg
 .param string code_only :optional
 .param int has_code :opt_flag

.end
END_PIR
.sub 'joe'
    .param pmc    bob       :slurpy     :unique_reg
    .param pmc    fred      :unique_reg
    .param string code_only :optional
    .param int    has_code  :opt_flag
.end
END_FORMATTED

reformat_ok(<<'END_PIR',<<'END_FORMATTED','use assignment syntax for opcodes that support it.');
.sub joe
 bands $S1, $S2
 bands $S1, $S2, $S3
 bnot $I1
.end
END_PIR
.sub 'joe'
    bands $S1, $S2
    $S1 = bands $S2, $S3
    bnot $I1
.end
END_FORMATTED
}

sub reformat_ok {
  my $code = shift;
  my $expected = shift;
  my $test_name = shift;

  my $formatter = Parrot::PIR::Formatter->new();
  $formatter->add_pir($code);
  
  my $output = $formatter->get_formatted();

  is($output,$expected,$test_name);

  return; #void
}

__END__

=head1 NAME

t/perl/Parrot_PIR_Formatter.t - Parrot::PIR::Formatter unit tests

=head1 SYNOPSIS

    % prove t/perl/Parrot_PIR_Formatter.t

=head1 DESCRIPTION

=cut


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

