# $Id$

use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'Language::m4',
      license         => 'perl',
      script_files    => { m4          => 1 },
    )->create_build_script();
