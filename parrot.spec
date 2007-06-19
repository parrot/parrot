Name:           parrot
Version:        0.4.13
Release:        1%{?dist}
Summary:        Parrot Virtual Machine
License:        Artistic 2.0
Group:          Development/Libraries
URL:            http://www.parrotcode.org/
Source0:        http://www.cpan.org/authors/id/A/AR/ARANDAL/parrot-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires:  readline-devel
BuildRequires:  ncurses-devel
BuildRequires:  gmp-devel
BuildRequires:  gdbm-devel
BuildRequires:  /usr/bin/perldoc
BuildRequires:  bc
BuildRequires:  m4
BuildRequires:  libicu-devel
BuildRequires:  perl-SVK

%package devel
Summary:        Parrot Virtual Machine development headers and libraries
License:        Artistic 2.0
Group:          Development/Libraries
Requires:       %{name} = %{version}-%{release}
Requires:       %{_libdir}/pkgconfig

%description
Parrot is a virtual machine designed to efficiently compile and
execute bytecode for interpreted languages. Parrot will be a target
for the Perl 6 compiler, and is already usable as a backend for
Pugs, as well as variety of other languages.

%description devel
Parrot Virtual Machine development headers and libraries.

%prep
%setup -q

%{__perl} -pi -e 's,"lib/,"%{_lib}/, if (/CONST_STRING\(interp,/)' \
    src/library.c
%{__perl} -pi -e "s,'/usr/lib','%{_libdir}',;s,runtime/lib/,runtime/%{_lib}/," \
    tools/dev/install_files.pl \
    tools/dev/mk_manifests.pl

%build
%{__perl} Configure.pl \
    --prefix=%{_usr} \
    --libdir=%{_libdir} \
    --sysconfdir=%{_sysconfdir} \
    --infodir=%{_datadir}/info \
    --mandir=%{_mandir} \
    --cc=%{__cc} \
    --cxx=%{__cxx} \
    --optimize="$RPM_OPT_FLAGS -maccumulate-outgoing-args" \
    --parrot_is_shared \
    --lex=/usr/bin/flex \
    --yacc=/usr/bin/yacc \
    --libs='-lcurses -lm'

export LD_LIBRARY_PATH=$( pwd )/blib/lib
make

%install
rm -rf $RPM_BUILD_ROOT

export LD_LIBRARY_PATH=$( pwd )/blib/lib
make reallyinstall DESTDIR=$RPM_BUILD_ROOT

# Drop the docs so rpm can pick them up itself.
rm -rf $RPM_BUILD_ROOT/%{_docdir}/parrot

# Force permissions on doc directories.
find LICENSES docs examples -type d -exec chmod 755 {} \;
find LICENSES docs examples -type f -exec chmod 644 {} \;

# Force permissions on shared libs so they get stripped.
find $RPM_BUILD_ROOT%{_libdir} -type f \( -name '*.so' -o -name '*.so.*' \) \
    -exec chmod 755 {} \;

# These files *probably* aren't needed.
rm -rf $RPM_BUILD_ROOT%{_usr}/compilers \
    $RPM_BUILD_ROOT%{_usr}/config \
    $RPM_BUILD_ROOT%{_includedir}/src \
    $RPM_BUILD_ROOT%{_usr}/src

%check
export LD_LIBRARY_PATH=$( pwd )/blib/lib
# make test < /dev/null
# %{?_with_fulltest:make fulltest < /dev/null}
# make test || :
# %{?_with_fulltest:make fulltest || :}

%clean
rm -rf $RPM_BUILD_ROOT

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(-,root,root,-)
%doc ABI_CHANGES ChangeLog CREDITS NEWS PBC_COMPAT PLATFORMS README
%doc RESPONSIBLE_PARTIES TODO
%doc LICENSES docs examples
%exclude %{_bindir}/parrot-config
%{_bindir}/*
%{_libdir}/parrot
%{_libdir}/libparrot.so.*

%files devel
%defattr(-,root,root,-)
%{_bindir}/parrot-config
%{_includedir}/parrot
%{_libdir}/libparrot.so
%{_libdir}/libparrot.a
%{_libdir}/pkgconfig/*

%changelog
* Fri May 25 2007 David Fetter <david@fetter.org> 0.4.12-1
- Update to 0.4.12.

* Wed Apr 18 2007 Steven Pritchard <steve@kspei.com> 0.4.11-1
- Update to 0.4.11.

* Wed Mar 21 2007 Steven Pritchard <steve@kspei.com> 0.4.10-1
- Update to 0.4.10.

* Sat Mar 10 2007 Steven Pritchard <steve@kspei.com> 0.4.9-1
- Update to 0.4.9.
- BR ncurses-devel.
- For some reason now I need to force -lm too.
- Remove some files/directories that shouldn't be included.

* Wed Jan 17 2007 Steven Pritchard <steve@kspei.com> 0.4.8-1
- Attempt update to 0.4.8.

* Fri Jun 30 2006 Steven Pritchard <steve@kspei.com> 0.4.5-5
- Override lib_dir and make various substitutions to try to fix multilib.
- Remove rpath use from Makefile.
- Fix a pod error in src/ops/experimental.ops.
- Enable "make test" since t/doc/pod.t won't fail now.

* Wed Jun 28 2006 Steven Pritchard <steve@kspei.com> 0.4.5-4
- Force permissions on shared libraries so rpmbuild strips them.

* Wed Jun 28 2006 Steven Pritchard <steve@kspei.com> 0.4.5-3
- Fix URL, description, summary, etc.
- Add post/postun.
- Move parrot-config to the devel sub-package.
- Force permissions on the doc directories.

* Tue Jun 27 2006 Steven Pritchard <steve@kspei.com> 0.4.5-2
- Add -lcurses to get readline detection to work.
- BR libicu-devel.

* Tue Jun 27 2006 Steven Pritchard <steve@kspei.com> 0.4.5-1
- Initial packaging attempt.

* Tue Mar 18 2003 Steve Fink <sfink@foxglove.localdomain> 0.0.11
- first .spec file created
