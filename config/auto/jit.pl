package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step qw(copy_if_diff);


$description = "Determining architecture, OS and JIT capability...";

@args=qw(jitcapable miniparrot);

sub runstep {
    my ($set_jitcapable, $miniparrot) = @_;

    if (defined $miniparrot) {
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

  if($osname =~ /darwin/) {
    $cpuarch = 'ppc';
  }

  if($cpuarch =~ /MSWin32/) {
    $cpuarch = 'i386';
    $osname  = 'MSWin32';
  }
  elsif($osname =~ /cygwin/i or $cpuarch =~ /cygwin/i) {
    $cpuarch = 'i386';
  }

  $cpuarch               =~ s/armv[34]l?/arm/i;

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
    if ($cpuarch =~ /sun4|sparc64/ &&
	Configure::Data->get('intvalsize') > Configure::Data->get('ptrsize')) {
	    $jitcapable = 0;
	}
  }

  if (-e "config/gen/platform/$cpuarch.s") {
    copy_if_diff("config/gen/platform/$cpuarch.s", "asmfun.s");

    Configure::Data->set(asmfun_o => 'asmfun$(O)');
  }

  $jitcapable = $set_jitcapable if defined $set_jitcapable;

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

    # test for some instructions
    if ($jitcpuarch eq 'i386') {
      cc_gen('config/auto/jit/test_c.in');
      eval { cc_build(); };
      unless ($@ || cc_run() !~ /ok/) {
	Configure::Data->set(
	  jit_i386 => 'fcomip'
	);
      }
      cc_clean();
    }
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
