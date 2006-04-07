#! perl
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id: Parrot_Distribution.t 11904 2006-03-14 22:53:28Z bernhard $

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More 'tests' => 7;

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

