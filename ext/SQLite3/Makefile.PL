use lib '../../lib';
use Parrot::Configure;
my $pc = Parrot::Configure->new();
$pc->data->slurp();
$pc->genfile("Makefile.in" => "Makefile");
