#! perl -w

use strict;
use lib qw(lib);

my $template = "tcl.imc_template";

open(TEMPLATE,$template) or die;
local $/ = undef;
my $contents = <TEMPLATE>;
close(TEMPLATE);

my $command_dir = "lib/commands";
opendir(CMDDIR,$command_dir) or die;
my @cmd_files = readdir(CMDDIR);
closedir(CMDDIR);

my $op_dir = "lib/ops";
opendir(OPDIR,$op_dir) or die;
my @op_files = readdir(OPDIR);
closedir(OPDIR);

my $math_dir = "lib/functions";
opendir(FUNCDIR,$math_dir) or die;
my @math_files = readdir(FUNCDIR);
closedir(FUNCDIR);

my @cmd_includes = map {"$command_dir/$_"} grep {m/\.imc$/} @cmd_files;
my @op_includes = map {"$op_dir/$_"} grep {m/\.imc$/} @op_files;
my @math_includes = map {"$math_dir/$_"} grep {m/\.imc$/} @math_files;
my @commands = grep {s/\.imc$//} @cmd_files;
my @functions = grep {s/\.imc$//} @math_files;

my $commands;
foreach my $command (@commands) {
  $commands .= "  newsub a_sub, .Sub, __cmd_$command\n";
  $commands .= "  commands[\"$command\"] = a_sub\n";
}

my $functions;
foreach my $function (@functions) {
  $functions .= "  newsub a_sub, .Sub, __math_$function\n";
  $functions .= "  math_funcs[\"$function\"] = a_sub\n";
}

my $lib_dir = "lib";
opendir(LIBDIR,$lib_dir) or die;
my @libs = map {"$lib_dir/$_"} grep {m/\.imc$/} readdir(LIBDIR);
closedir(LIBDIR);

my $includes;
foreach my $file (sort(@cmd_includes, @libs, @op_includes, @math_includes)) {
  $includes .= "  .include \"languages/tcl/$file\"\n";
}

$contents =~ s/\${COMMANDS}/$commands/;
$contents =~ s/\${INCLUDES}/$includes/;
$contents =~ s/\${FUNCTIONS}/$functions/;

print $contents;
