package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining what allocator to use ...";

# valid libc/malloc/malloc-trace/gc
@args=qw(gc);

sub runstep {
  my ($gc) = @_;

  if (!defined($gc)) {
    # default is GC in resources.c
    $gc = 'gc';
  }
  elsif ($gc eq 'libc') {
    # tests mallinfo after allocation of 128 bytes
    if (Configure::Data->get('i_malloc')) {
        Configure::Data->set('malloc_header', 'malloc.h');
    }
    else {
        Configure::Data->set('malloc_header', 'stdlib.h');
    }
    cc_gen('config/auto/gc/test_c.in');
    eval { cc_build(); };
    my $test = 0;
    unless ($@) {
      $test = cc_run();
    }
    cc_clean();
    # used size should be somewhere here
    unless ($test >= 128 && $test < 155) {
      # if not, use own copy of malloc
      $gc = 'malloc';
    }
  }

  if ($gc =~ /^malloc(?:-trace)?$/) {
    Configure::Data->set(
      gc_c          => <<"EOF",
\$(SRC)/$gc\$(O):	\$(GENERAL_H_FILES) \$(SRC)/$gc.c
\$(SRC)/res_lea\$(O):	\$(GENERAL_H_FILES) \$(SRC)/res_lea.c
EOF
      gc_o          => "\$(SRC)\/$gc\$(O) \$(SRC)/res_lea\$(O)",
      gc_flag  => '-DGC_IS_MALLOC',
    );
  }
  elsif ($gc eq 'libc') {
    Configure::Data->set(
      gc_c          => <<"EOF",
\$(SRC)/res_lea\$(O):	\$(GENERAL_H_FILES) \$(SRC)/res_lea.c
EOF
      gc_o          => "\$(SRC)/res_lea\$(O)",
      gc_flag  => '-DGC_IS_MALLOC',
    );
  }
  else {
      $gc = 'gc';
    Configure::Data->set(
      gc_c          => <<"EOF",
\$(SRC)/resources\$(O):	\$(GENERAL_H_FILES) \$(SRC)/resources.c
EOF
      gc_o          => "\$(SRC)/resources\$(O)",
      gc_flag  => '',
    );
  }
  print(" ($gc) ");
}

1;
