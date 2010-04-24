#
# spec file for package parrot (Version 2.2.0)
#
# Copyright (c) 2010 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#



Name:           parrot
Version:        2.2.0
Release:        1.10
%define pversion 2_2_0
Summary:        Parrot Virtual Machine
License:        Artistic 2.0
Group:          Development/Libraries
Url:            http://www.parrot.org/
Source0:        parrot-%{version}.tar.bz2
Patch0:         parrot.diff
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildRequires:  readline-devel
BuildRequires:  ncurses-devel
BuildRequires:  gmp-devel
BuildRequires:  gdbm-devel
BuildRequires:  libicu-devel
%if ! 0%{?suse_version}
BuildRequires:  perl-Test-Harness
%endif

%package docs
Summary:        Parrot Virtual Machine documentation
License:        Artistic 2.0
Group:          Development/Libraries
%if ! 0%{?suse_version}
BuildRequires:  /usr/bin/perldoc
%endif

%package -n libparrot%pversion


Summary:        Parrot Virtual Machine Library
License:        Artistic 2.0
Group:          Development/Libraries

%package devel
Summary:        Parrot Virtual Machine development headers and libraries
License:        Artistic 2.0
Group:          Development/Libraries
Requires:       %{name} = %{version}
Requires:       readline-devel
Requires:       ncurses-devel
Requires:       gmp-devel
Requires:       gdbm-devel
Requires:       libicu-devel
%if ! 0%{?suse_version}
Requires:       %{_libdir}/pkgconfig
%endif

%description
Parrot is a virtual machine designed to efficiently compile and execute
bytecode for dynamic languages. Parrot is the target for Rakudo Perl 6,
as well as variety of other languages.

%description -n libparrot%pversion
Parrot is a virtual machine designed to efficiently compile and execute
bytecode for dynamic languages. Parrot is the target for Rakudo Perl 6,
as well as variety of other languages.

%description docs
Documentation in text-, POD- and HTML-format (docs/html-subdirectory) and also
examples about the Parrot Virtual Machine

%description devel
Parrot Virtual Machine development headers and libraries.

%prep
%setup -q
%patch0
%{__perl} -pi -e 's,"lib/,"%{_lib}/, if (/CONST_STRING\(interp,/)' \
    src/library.c
%{__perl} -pi -e "s,'/usr/lib','%{_libdir}',;s,runtime/lib/,runtime/%{_lib}/," \
    tools/dev/install_files.pl
%{__perl} -pi -e "s,'/usr/lib','%{_libdir}',;s,runtime/lib/,runtime/%{_lib}/," \
    tools/dev/install_dev_files.pl

%build
if test "%{_vendor}" = "suse"
then
    LIBS='-lncurses -lm -lrt'
else
    LIBS='-lcurses -lm -lrt'
fi
OPTIMIZE="$RPM_OPT_FLAGS -fno-strict-aliasing"
OPTIMIZE="$RPM_OPT_FLAGS"
%ifarch %ix86 %x86_64
OPTIMIZE="$OPTIMIZE -maccumulate-outgoing-args"
%endif
%ifarch ppc ia64
OPTIMIZE="-O0"
%endif
%{__perl} Configure.pl \
    --prefix=%{_usr} \
    --libdir=%{_libdir} \
    --sysconfdir=%{_sysconfdir} \
    --infodir=%{_datadir}/info \
    --mandir=%{_mandir} \
    --cc="%{__cc}" \
    --cxx=%{__cxx} \
    --optimize="$OPTIMIZE" \
    --parrot_is_shared \
    --disable-rpath \
    --lex=/usr/bin/flex \
    --yacc=/usr/bin/yacc \
    --libs="$LIBS"
export LD_LIBRARY_PATH=$( pwd )/blib/lib
make
make parrot_utils
make installable
make html

%install
rm -rf $RPM_BUILD_ROOT
mkdir $RPM_BUILD_ROOT
export LD_LIBRARY_PATH=$( pwd )/blib/lib
make install-dev DESTDIR=$RPM_BUILD_ROOT
PARROT_LIB=%{_libdir}`./parrot_config versiondir`
PARROT_INC=%{_includedir}`./parrot_config versiondir`
wd=`pwd`
for i in $RPM_BUILD_ROOT$PARROT_LIB/tools/build/* ; do
    perl -pi -e "s@$wd/include@$PARROT_INC@g" $i
    perl -pi -e "s@$wd/src/pmc@$PARROT_INC/pmc@g" $i
    perl -pi -e "s@(-Wl,)?-L$wd/blib/lib@@" $i
    perl -pi -e "s@$wd@$PARROT_LIB@g" $i
done
perl -pi -e 's@^(use lib ..FindBin::Bin/\.\./)\.\."@$1lib"@' $RPM_BUILD_ROOT$PARROT_LIB/tools/build/dynpmc.pl
# Drop the docs so rpm can pick them up itself.
rm -rf $RPM_BUILD_ROOT%{_usr}/share/doc/parrot    # necessary for SuSE
#rm -rf $RPM_BUILD_ROOT/%{_docdir}/parrot         # for Solaris?
# Force permissions on doc directories.
find docs examples -type d -exec chmod 755 {} \;
find docs examples -type f -exec chmod 644 {} \;
# Force permissions on shared libs so they get stripped.
find $RPM_BUILD_ROOT%{_libdir} -type f \( -name '*.so' -o -name '*.so.*' \) \
    -exec chmod 755 {} \;
# make libparrot.so a symlink
(cd $RPM_BUILD_ROOT%{_libdir} ; ln -fs libparrot.so.* libparrot.so)

%check
export LD_LIBRARY_PATH=$( pwd )/blib/lib
# make test < /dev/null
# %{?_with_fulltest:make fulltest < /dev/null}
# make test || :
# %{?_with_fulltest:make fulltest || :}

%clean
rm -rf $RPM_BUILD_ROOT

%post -n libparrot%pversion -p /sbin/ldconfig

%postun -n libparrot%pversion -p /sbin/ldconfig

%files
%defattr(-,root,root,-)
%exclude %{_bindir}/parrot_config
%exclude %{_bindir}/parrot_debugger
%exclude %{_bindir}/pbc_*
%{_bindir}/*

%files -n libparrot%pversion
%defattr(-,root,root,-)
%dir %{_libdir}/parrot
%dir %{_libdir}/parrot/*
%{_libdir}/parrot/*/[^st]*
%{_libdir}/libparrot.so.*

%files docs
%defattr(-,root,root,-)
%doc ChangeLog CREDITS NEWS PBC_COMPAT PLATFORMS README
%doc RESPONSIBLE_PARTIES TODO
%doc docs examples

%files devel
%defattr(-,root,root,-)
%{_bindir}/parrot_config
%{_bindir}/parrot_debugger
%{_bindir}/pbc_disassemble
%{_bindir}/pbc_merge
%{_bindir}/pbc_to_exe
%{_bindir}/pbc_dump
%{_includedir}/parrot
%{_libdir}/libparrot.so
%{_libdir}/libparrot.a
%{_libdir}/pkgconfig/*
%{_libdir}/parrot/*/[st]*
%{_usrsrc}/parrot

%changelog
* Wed Mar 17 2010 mls@suse.de
- update to parrot-2.2.0
  * Most internal allocations now use the GC
  * RNG non-randomness fixes
  * Elimination of much dead code
* Fri Feb 19 2010 mls@suse.de
- update to parrot-2.1.1
* Fri Oct 23 2009 mls@suse.de
- update to October version
* Mon Sep 21 2009 mls@suse.de
- update to September version
* Thu Aug 27 2009 mls@suse.de
- update to August version
* Fri Jun 26 2009 mls@suse.de
- update to June version
* Thu Apr 23 2009 mls@suse.de
- update to April version
* Fri Apr  3 2009 mls@suse.de
- initial revision
