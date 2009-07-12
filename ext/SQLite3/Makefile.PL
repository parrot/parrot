use lib '../../lib';
use Parrot::Configure;
my $pc = Parrot::Configure->new();
$pc->data->get_PConfig();
$pc->genfile("Makefile.in" => "Makefile");
