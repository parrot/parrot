package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;


$description = "Determining architecture, OS and JIT capability...";

@args=qw(jitcapable miniparrot);

sub runstep {

    if (defined $_[1]) {
      Configure::Data->set(
        archname    => 'miniparrot',
        cpuarch     => 'unknown',
        osname      => 'ANSI',
        jitarchname => 'nojit',
        jitcpuarch  => 'i386',
        jitosname   => 'nojit',
        jitcapable  => 0,
        cc_hasjit   => '',
        jit_h       => '',
        jit_o       => ''
      );
      return;
  }

  my $archname                 =  $Config{archname};
  my ($cpuarch, $osname)       =  split('-', $archname);

  if (!defined $osname) {
    ($osname, $cpuarch) = ($cpuarch, "");
  }

  if($cpuarch =~ /MSWin32/) {
    $cpuarch = 'i386';
    $osname  = 'MSWin32';
  }
  elsif($osname =~ /cygwin/i or $cpuarch =~ /cygwin/i) {
    $cpuarch = 'i386';
  }

  Configure::Data->set(
    archname    => $archname,
    cpuarch     => $cpuarch,
    osname      => $osname,
  );

  $cpuarch                     =~ s/i[456]86/i386/i;
  my $jitarchname              =  "$cpuarch-$osname";
  $jitarchname                 =~ s/-(net|free|open)bsd$/-bsd/i;
  my $jitcapable               =  0;

  if (-e "jit/$cpuarch/core.jit") {
    $jitcapable = 1;
  }

  $jitcapable = $_[0] if defined $_[0];

  if($jitcapable) {
    my($jitcpuarch, $jitosname) =  split('-', $jitarchname);

    Configure::Data->set(
      jitarchname => $jitarchname,
      jitcpuarch  => $jitcpuarch,
      jitosname   => $jitosname,
      jitcapable  => 1,
      cc_hasjit   => " -DHAS_JIT -D\U$jitcpuarch",
      jit_h       => '$(INC)/jit.h',
      jit_o       => 'jit$(O) jit_cpu$(O)'
    );
  }
  else {
    Configure::Data->set(
      jitarchname => 'nojit',
      jitcpuarch  => 'i386',
      jitosname   => 'nojit',
      jitcapable  => 0,
      cc_hasjit   => '',
      jit_h       => '',
      jit_o       => ''
    );
  }
}

1;
