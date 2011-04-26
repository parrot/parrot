Name:           parrot
Version:        3.3.0
Release:        1%{?dist}
Summary:        A virtual machine
License:        Artistic 2.0
Group:          Development/Libraries
URL:            http://www.parrot.org/

Source0:        ftp://ftp.parrot.org/pub/parrot/releases/stable/%{version}/parrot-%{version}.tar.gz
Source1:        %{name}.desk.in.tar.gz

BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires:  readline-devel
BuildRequires:  ncurses-devel
BuildRequires:  gmp-devel
BuildRequires:  gdbm-devel
BuildRequires:  libicu-devel
BuildRequires:  perl(Test::Harness)
BuildRequires:  perl(Test::Simple)
BuildRequires:  perl(Devel::Cover)
BuildRequires:  perl(JSON)
BuildRequires:  procps
BuildRequires:  ctags
BuildRequires:  openssl-devel
BuildRequires:  flex
BuildRequires:  bison
# Needed to generate the Parrot PDF book
BuildRequires:  perl(Pod::PseudoPod::LaTeX), texlive-latex
# Needed to desktop-file-install usage
BuildRequires:  desktop-file-utils


# Needs to build with OpenGL
#BuildRequires:  mesa-libGL
#BuildRequires:  mesa-libGLU-devel
#BuildRequires:  freeglut-devel
 

%package docs
Summary:        Parrot Virtual Machine documentation
Group:          Documentation
Requires:       perl(strict)
Requires:       perl(warnings)
# Provides the executable in the desktop file (xdg-open)
Requires:       xdg-utils
BuildArch:      noarch

#--

%package devel
Summary:        Parrot Virtual Machine development headers and libraries
Group:          Development/Libraries
Requires:       %{name} = %{version}-%{release}
Requires:       vim-common

#--

%package tools
Summary:        Parrot Virtual Machine development for languages
Group:          Development/Libraries
Requires:       %{name} = %{version}-%{release}
Requires:       perl(Pod::Simple)
Requires:       perl(File::Which) >= 0.05
Requires:       perl(Parrot::OpLib::core)
# It is necessary to have installed the package "perl-Perl-Critic" to install
# the parrot-tools
Provides:       perl(Parrot::Pmc2c) = %{version}
Provides:       perl(Parrot::Pmc2c::MethodEmitter) = %{version}
Provides:       perl(Parrot::Pmc2c::PCCMETHOD_BITS) = %{version}
Provides:       perl(Parrot::Pmc2c::PMCEmitter) = %{version}
Provides:       perl(Parrot::OpLib::core) = %{version}


%description
Parrot is a virtual machine designed to efficiently compile and execute
bytecode for dynamic languages. Parrot is the target for Rakudo Perl 6,
as well as variety of other languages.

#--

%description docs
Documentation in text-, POD- and HTML-format (docs/html-subdirectory) and also
examples about the Parrot Virtual Machine.

#--

%description devel
Parrot Virtual Machine development headers and libraries.

#--

%description tools
Parrot Virtual Machine development files for building languages.


%prep
%setup -q


cat << \EOF > %{name}-prov
#!/bin/sh
%{__perl_provides} $* | %{__sed} -e '/perl(A)/d' -e '/perl(B)/d' \
                            -e '/perl(DB)/d' -e '/perl(Parrot::OpLib::core)/d'
EOF

%global __perl_provides %{_builddir}/%{name}-%{version}/%{name}-prov
chmod +x %{__perl_provides}


%build
%ifarch %{ix86} x86_64
    RPM_OPT_FLAGS="$RPM_OPT_FLAGS -maccumulate-outgoing-args"
%else
# The PowerPC-architecture do not build with the '-maccumulate-outgoing-args'
# option.
    RPM_OPT_FLAGS="$RPM_OPT_FLAGS"
%endif

# there are problems in this version with the optimize="-O2" option building on
# ppc64 and ppc with nqp-rx
#%%ifarch ppc64 ppc
#    RPM_OPT_FLAGS=`echo "$RPM_OPT_FLAGS" | %%{__perl} -pi -e 's/-O2//'`
#%%endif

%{__perl} Configure.pl \
    --prefix=%{_usr} \
    --libdir=%{_libdir} \
    --sysconfdir=%{_sysconfdir} \
    --infodir=%{_datadir}/info \
    --mandir=%{_mandir} \
    --cc="%{__cc}" \
    --optimize="$RPM_OPT_FLAGS" \
    --parrot_is_shared \
    --disable-rpath \
    --lex=%{_bindir}/flex

# The LD_LIBRARY_PATH hack is needed for "miniparrot"
# to find his parrot-library in "blib/lib" 
export LD_LIBRARY_PATH=$( pwd )/blib/lib

make %{_smp_mflags}
make html pdf


%install
rm -rf $RPM_BUILD_ROOT

# The LD_LIBRARY_PATH hack is needed for the command "pbc_to_exe parrot-nqp.pbc"
# to find his parrot-library in "blib/lib" 
export LD_LIBRARY_PATH=$( pwd )/blib/lib

make install DESTDIR=$RPM_BUILD_ROOT

# Generate several files for syntax-highlighting and automatic indenting.
# First they are installed in BUILD-directory with make and after that
# they needed to be copied to the RPM_BUILD_ROOT.
(  cd editor; 
   make vim-install VIM_DIR=.%{_datadir}/vim/vimfiles \
                    SKELETON=%{_datadir}/vim/vimfiles;
   cp -r ./usr $RPM_BUILD_ROOT                                )

# Creating man-pages
%{__install} -d $RPM_BUILD_ROOT%{_mandir}/man1
for var in 'parrot docs/running.pod' 'parrot_debugger src/parrot_debugger.c' \
           'pbc_disassemble src/pbc_disassemble.c' 'pbc_dump src/pbc_dump.c' \
           'pbc_merge src/pbc_merge.c' 'pbc_to_exe tools/dev/pbc_to_exe.pir' \
           'parrot_config tools/build/parrot_config_c.pl' \
           'parrot-nqp ext/nqp-rx/README'    # evtl. docs/book/pct/ch05_nqp.pod
do
    MAN_NAME=`echo $var | %{__perl} -na -e 'print $F[0]'`
    MAN_SOURCE=`echo $var | %{__perl} -na -e 'print $F[1]'`
    pod2man --section=1 --name=$MAN_NAME $MAN_SOURCE | %{__gzip} -c > $RPM_BUILD_ROOT%{_mandir}/man1/${MAN_NAME}.1.gz
done

# Drop the docs so rpm can pick them up itself.
rm -rf $RPM_BUILD_ROOT%{_defaultdocdir}/%{name}

# Force permissions on doc directories.
find docs examples -type d -exec chmod 755 {} \;
find docs examples -type f -exec chmod 644 {} \;


%define RPM_PAR_LIB_DIR $RPM_BUILD_ROOT%{_libdir}/%{name}/%{version}/


# Force permissions on shared versioned libs so they get stripped.
# The parrot-install-script don't set the permissions right
# With changed permissions the dependencies will be found
find %{RPM_PAR_LIB_DIR}dynext -type f -name '*.so' -exec chmod 755 {} \;

# Remove files that are already provided with the module: perl(File::Which)
rm -rf %{RPM_PAR_LIB_DIR}tools/lib/File

# Change the perl5 'use lib' command to find Parrot::Config in the
# subdirectory 'tools/lib' of the RPM location
%{__sed} -i -e '67 s&use lib "$Bin/../../lib"\; # build location&use lib '"'"'%{_libdir}/%{name}/%{version}/tools/lib'"'"'\; # RPM location&' ${RPM_PAR_LIB_DIR}tools/dev/mk_language_shell.pl


# Added to reduce output errors when using rpmlint

# Force permission on perl-scripts in the "tools" subdirctory
find %{RPM_PAR_LIB_DIR}tools -type f -name "*.pl" -exec chmod 755 {} \; \
    -exec %{__sed} -i -e '1 s&#! perl&#!/usr/bin/perl&' {} \;
# Set path to parrot binary and Force permission
find %{RPM_PAR_LIB_DIR}tools/dev -type f -name "pbc_to_exe.pir" \
    -exec %{__sed} -i -e '1 s&#! parrot&#!/usr/bin/parrot&' {} \; \
    -exec chmod 755 {} \;

# Remove doc-files with zero-length
find docs/html -type f -size 0 -exec rm -f {} \;
find docs -wholename 'docs/doc-prep' -type f -size 0 -exec rm -f {} \;

# Set path for installed programs in docs package
find examples -type f \( -name "*.pir" -o \
                         -wholename 'examples/shootout/random.pasm' \)  \
    -exec %{__sed} -i -e '1 s&#!.*\(parrot\)&#!/usr/bin/\1&' {} \;

find examples -type f \( -name '*.pl' -o \
                         -wholename 'examples/pir/befunge/t/basic.t' -o  \
                         -path 'examples/languages/*/harness'               \) \
    -exec %{__sed} -i -e '1 s&#! perl&#!/usr/bin/perl&' {} \;
find examples -type f -name "*.py" \
    -exec %{__sed} -i -e '1 s&#! python&#!/usr/bin/python&' {} \;
find examples -type f -name "*.rb" \
    -exec %{__sed} -i -e '1 s&#! ruby&#!/usr/bin/ruby&' {} \;

find examples -wholename 'examples/languages/abc/t/01-tests.t' \
    -exec %{__sed} -i -e '1 s&#!perl&#!/usr/bin/perl&' {} \;

find examples -wholename 'examples/languages/abc/t/harness' \
    -exec %{__perl} -pi -e 's/\r$//' {} \;

#install desktop file
%{__mkdir} ${RPM_BUILD_ROOT}%{_datadir}/applications/
%{__tar} xzf %{SOURCE1} parrot_html.desk.in --to-stdout | %{__sed} "s|@DOCDIR@|%{_docdir}/%{name}-docs-%{version}|g" > ${RPM_BUILD_ROOT}%{_datadir}/applications/parrot_html.desktop
%{__tar} xzf %{SOURCE1} parrot_pdf.desk.in --to-stdout | %{__sed} "s|@DOCDIR@|%{_docdir}/%{name}-docs-%{version}|g" > ${RPM_BUILD_ROOT}%{_datadir}/applications/parrot_pdf.desktop

desktop-file-install --delete-original --add-category="Documentation"  \
    --dir=${RPM_BUILD_ROOT}%{_datadir}/applications                    \
    ${RPM_BUILD_ROOT}%{_datadir}/applications/parrot_html.desktop
desktop-file-install --delete-original --add-category="Documentation"  \
    --dir=${RPM_BUILD_ROOT}%{_datadir}/applications                    \
    ${RPM_BUILD_ROOT}%{_datadir}/applications/parrot_pdf.desktop


%check
# 'make fulltest' is done by default; it take a lot of time
export LD_LIBRARY_PATH=$( pwd )/blib/lib
FULL='full'
%{?_without_fulltest: FULL=''}
%{?!_without_tests: make ${FULL}test; rm -f docs/doc-prep}


%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(-,root,root,-)
%doc ChangeLog CREDITS NEWS PBC_COMPAT PLATFORMS README
%doc RESPONSIBLE_PARTIES TODO LICENSE
%{_bindir}/parrot
%{_libdir}/parrot/
%exclude %{_libdir}/parrot/%{version}/tools
%exclude %{_libdir}/parrot/%{version}/VERSION
%{_libdir}/libparrot.so.*
%{_mandir}/man1/parrot.1.gz

%files docs
%defattr(-,root,root,-)
%doc docs examples LICENSE
%{_datadir}/applications/parrot_html.desktop
%{_datadir}/applications/parrot_pdf.desktop

%files devel
%defattr(-,root,root,-)
%{_bindir}/parrot_config
%{_bindir}/parrot_debugger
%{_bindir}/parrot_nci_thunk_gen
%{_bindir}/parrot-nqp
%{_bindir}/parrot-prove
%{_bindir}/pbc_disassemble
%{_bindir}/pbc_merge
%{_bindir}/pbc_to_exe
%{_bindir}/pbc_dump
%{_bindir}/ops2c
%{_includedir}/parrot
%{_libdir}/libparrot.so
%exclude %{_libdir}/libparrot.a
%{_mandir}/man1/parrot_config.1.gz
%{_mandir}/man1/parrot_debugger.1.gz
%{_mandir}/man1/pbc_disassemble.1.gz
%{_mandir}/man1/pbc_merge.1.gz
%{_mandir}/man1/pbc_to_exe.1.gz
%{_mandir}/man1/pbc_dump.1.gz
%{_mandir}/man1/parrot-nqp.1.gz
%{_datadir}/vim/vimfiles/skeleton.pir
%{_datadir}/vim/vimfiles/plugin/parrot.vim
%{_datadir}/vim/vimfiles/syntax/*
%{_datadir}/vim/vimfiles/indent/pir.vim

%files tools
%defattr(-,root,root,-)
# Files for building languages
%{_libdir}/parrot/%{version}/tools/*
%{_libdir}/parrot/%{version}/VERSION
%{_usr}/src/parrot/*


%changelog
* Fri Apr 22 2011 Gerd Pokorra <gp@zimt.uni-siegen.de> 3.3.0-1
- updated to 3.3.0
- change to use make with _smp_mflags
- remove pkgconfig depedency, configuration and files
- remove configuration option: --cxx

* Fri Apr 15 2011 Paul Howarth <xxxxxxx@city-fan.org> 3.0.0-5
- add provides filter for rpm 4.9 onwards

* Mon Mar 07 2011 Caolán McNamara <xxxxx@redhat.com> 3.0.0-4
- rebuild for icu 4.6

* Tue Feb 08 2011 Fedora Release Engineering <xxxxxx@lists.fedoraproject.org> - 3.0.0-3
- Rebuilt for https://fedoraproject.org/wiki/Fedora_15_Mass_Rebuild

* Fri Jan 28 2011 Gerd Pokorra <gp@zimt.uni-siegen.de> 3.0.0-2
- add Provides perl(Parrot::Pmc2c)

* Wed Jan 19 2011 Gerd Pokorra <gp@zimt.uni-siegen.de> 3.0.0-1
- updated to 3.0.0

* Wed Dec 22 2010 Gerd Pokorra <gp@zimt.uni-siegen.de> 2.11.0-1
- updated to 2.11.0
- added BuildRequires perl(Devel::Cover), perl(JSON), procps

* Wed Jul 21 2010 Gerd Pokorra <gp@zimt.uni-siegen.de> 2.6.0-1
- updated to 2.6.0
- add vim files for syntax-highlighting and automatic indenting
- so requires "vim-common" is added
- add LICENSE file to docs-subpackage

* Fri Jun 18 2010 Gerd Pokorra <gp@zimt.uni-siegen.de> 2.5.0-1
- updated to 2.5.0
- add the ops2c binary
- add the parrot-prove binary

* Tue Apr 20 2010 Gerd Pokorra <gp@zimt.uni-siegen.de> 2.3.0-1
- add desktop files to access the documentation for reading
- add the parrot_nci_thunk_gen binary

* Wed Jan 20 2010 Gerd Pokorra <gp@zimt.uni-siegen.de> 2.0.0-1
- new upstream version
- add the parrot-nqp binary, with generating of the man-page

* Fri Aug 21 2009 Gerd Pokorra <gp@zimt.uni-siegen.de> 1.5.0-1
- add man pages

* Sat Aug 1 2009 Gerd Pokorra <gp@zimt.uni-siegen.de> 1.4.0-9
- include the necessary module Parrot::OpLib::core
- change the place of header files to /usr/include/parrot/<version>
- install the files /usr/src/parrot/*
- add the new disable-rpath configure option

* Wed Mar 25 2009 Gerd Pokorra <gp@zimt.uni-siegen.de> 1.0.0-6
- add a list of changes from Lubomir Rintel
- add filtering Provides
- change requires for docs-subpackage
- enable test suite
- change the group of the subpackage "-docs" to Documentation
- put the main-documentation from the docs-package to the main package
- LICENSE file added
- add Provides-lines
- add patch for the file "tools/dev/install_files.pl"
- add commands to reduce output of errors when using rpmlint
- define RPM_PAR_LIB_DIR added
- add subpackage "tools"
- exclude tools directory from main-package
- added make html

* Sun Mar 22 2009 Fabien Georget <fabien.georget@gmail.com> 1.0.0-4
- add tools

* Sun Mar 22 2009 David Fetter <david@fetter.org> 1.0.0-3
- Removed wrong prefix from pkgconfig per Christoph Wickert

* Tue Mar 17 2009 Allison Randal <allison@parrot.org> 1.0.0
- updated to 1.0.0

* Tue Jan 23 2009 Reini Urban <rurban@x-ray.at> 0.9.0
- added parrot_utils to devel

* Tue Dec 16 2008 Whiteknight <wknight8111@gmail.com> 0.8.2
- updated to 0.8.2

* Sat Mar 10 2007 Steven Pritchard <steve@kspei.com> 0.4.9-1
- BuildRequires ncurses-devel.
- For some reason now I need to force -lm too.
- Remove some files/directories that shouldn't be included.
- Override lib_dir and make various substitutions to try to fix multilib.
- Remove rpath use from Makefile.
- Fix a pod error in src/ops/experimental.ops.
- Enable "make test" since t/doc/pod.t won't fail now.
- Force permissions on shared libraries so rpmbuild strips them.
- Fix URL, description, summary, etc.
- Add post/postun.
- Move parrot-config to the devel sub-package.
- Force permissions on the doc directories.
- Add -lcurses to get readline detection to work.
- Add BuildRequires libicu-devel.
