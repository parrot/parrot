    sub load_data ($filename ; $version, *@dirpath) {
        $version //= 1;
        @dirpath //= @last_dirpath // @std_dirpath // '.';
        @dirpath ^=~ s{([^/])$}{$1/};

        my %data;
        foreach my $prefix (@dirpath) {
            my $filepath = $prefix _ $filename;
            if (-w -r -e $filepath  and  100 < -s $filepath <= 1e6) {
                my $fh = open $filepath : mode=>'rw' 
                    or die "Something screwy with $filepath: $!";
                my ($name, $vers, $status, $costs) = <$fh>;
                next if $vers < $version;
                $costs = [split /\s+/, $costs];
                %data{$filepath}{qw(fh name vers stat costs)} = <$fh>;
                next if $vers < $version;
                $costs = [split /\s+/, $costs];
                %data{$filepath}{qw(fh name vers stat costs)} =
                                ($fh, $name, $vers, $status, $costs);
            }
        }
        return %data;
    }

    my @StartOfFile is const = (0,0);

    sub save_data ( %data) {
        foreach my $data (values %data) {
# XXX: undef
#            my $rest = <$data.{fh}.irs(undef)>;
            seek $data.{fh}: *@StartOfFile;
            truncate $data.{fh}: 0;
            $data.{fh}.ofs("\n");
            print $data.{fh}: $data.{qw(name vers stat)}, _@{$data.{costs}}, $rest;
         }
    }

    my %data = load_data(filename=>'weblog', version=>1);

    my $is_active_bit is const = 0x0080;

    foreach my $file (keys %data) {
        print "$file contains data on %data{$file}{name}\n";

        %data{$file}{stat} = %data{$file}{stat} ~ $is_active_bit;

        my @costs := @%data{$file}{costs};

        my $inflation;
# XXX: NaN
#        print "Inflation rate: " and $inflation = +<>
#            until $inflation != NaN;

        @costs = map  { $_.value }
                 sort { $a.key <=> $b.key }
                 map  { amortize($_) => $_ }
                        @costs ^* $inflation;

# XXX: 'sum' should be unicode char
# XXX: reduce not defined (missing , below?)
# XXX: can't parse \&operator:+($)
#         my sub operator:sum is prec(\&operator:+($))
#                                   (*@list : $filter //= undef) {
#            reduce {$^a+$^b}  ($filter ?? grep &$filter, @list :: @list);
#         }

        print "Total expenditure: $( sum @costs )\n";
        print "Major expenditure: $( sum @costs : {$^_ >= 1000} )\n";
        print "Minor expenditure: $( sum @costs : {$^_ < 1000} )\n";

# XXX: Inf
#        print "Odd expenditures: @costs[1..Inf:2]\n"; 
    }

    save_data(%data, log => {name=>'metalog', vers=>1, costs=>[], stat=>0});
