package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Setting up Configure's data structures...";

@args=();

sub runstep {
  package Configure::Data;
  use Config;
  use Data::Dumper;
  
  my(%c)=(
    cc            => $Config{cc},
    ccflags       => $Config{ccflags},
    ld            => $Config{ld},
    ldflags       => $Config{ldflags},
    
    cc_inc	  => "-I./include",
    cc_debug      => '-g',
    cc_warn       => '',
    o             => '.o',                # object files extension
    exe           => $Config{_exe},       # executable files extension
    cc_o_out      => '-o ',               # cc object output file
    cc_exe_out    => '-o ',               # cc executable output file (different on Win32)
    
    cc_ldflags    => '',                  # prefix for ldflags (necessary for Win32)
    
    ld_out        => '-o ',               # ld output file
    ld_debug      => '',                  # include debug info in executable
    ld_shared     => '-shared',
    
    perl          => $^X,
    test_prog     => 'parrot',
    rm_f          => 'rm -f',
    rm_rf         => 'rm -rf',
    make          => $Config{make},
    make_set_make => $Config{make_set_make},
    
    cp            => 'cp',
    slash         => '/',
    
    VERSION       => $main::parrot_version,
    MAJOR         => $main::parrot_version[0],
    MINOR         => $main::parrot_version[1],
    PATCH         => $main::parrot_version[2],
    DEVEL         => (-e 'DEVELOPING' ? '-devel' : ''),
    
    configdate    => scalar localtime,
    PQ            => "'",
  );
  
  *get=sub {
    shift;
    @c{@_};
  };
  
  *set=sub {
    shift;
    %c=(%c, @_);
  };
  
  *keys=sub {
    return keys %c;
  };
  
  *dump=sub {
    Data::Dumper->Dump([\%c], ['*PConfig']);
  };
}

1;