#! perl -w

#use Translate::PRD;
use Translate::Perl6;

my $grammar = do { local $/; <> };
#my $prd	    = Translate::PRD->grammar( $grammar );
my $prd	    = Translate::Perl6->grammar( $grammar );

print((defined($prd) ? $prd  : "Failed"), "\n");

