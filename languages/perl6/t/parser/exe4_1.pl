    class Err::BadData is Exception {...}
    
    module Calc;
    
    my class NoData is Exception {
        method warn(*@args) { die @args }
    }
    
    my %var;
    
    my sub get_data ($data) {
        given $data {
            when /^\d+$/    { return %var{""} = $_ }
            when 'previous' { return %var{""} // fail NoData }
            when %var       { return %var{""} = %var{$_} }
            default         { die Err::BadData : msg=>"Don't understand $_" }
        }  
    }
    
    sub calc (str $expr, int $i) {
        our %operator is private //= (
            '*'  => { $^a * $^b },
            '/'  => { $^a / $^b },
            '~'  => { ($^a + $^b) / 2 },
        );
        
        my @stack;
        my $toknum = 1;
        for split /\s+/, $expr -> $token {
            try {
                when %operator {
                    my @args = splice @stack, -2;
                    push @stack, %operator{$token}(*@args)
                }
                when '.', ';', '=' {
                    last
                }
                
                use fatal;
                push @stack, get_data($token);
                
                CATCH {
# XXX: missing Err::Reportable, Err::BadData, NoData
#                    when Err::Reportable     { warn $!; continue }
#                    when Err::BadData        { $!.fail(at=>$toknum) }
#                    when NoData              { push @stack, 0 }
# XXX: Inf
#                    when /division by zero/  { push @stack, Inf }
                }
            }
            
            NEXT { $toknum++ }
        }

        fail Err::BadData: msg=>"Too many operands" if @stack > 1;
        return %var{'$' _ $i} = pop(@stack) but true;
    }
    
    module main;

# XXX: Inf    
#    for 1..Inf -> $i {
    for 1..10000 -> $i {
        print "$i> ";
        my $expr = <> err last;  
        print "$i> $( Calc::calc(i=>$i, expr=>$expr) )\n";
    }
