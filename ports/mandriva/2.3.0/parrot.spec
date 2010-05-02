%define name    parrot
%define version 2.3.0
%define release %mkrel 2

%define libname        %mklibname %{name}
%define libname_devel  %mklibname -d %{name} 

%define _requires_exceptions perl(Parrot::Pmc2c::.*)
%define _provides_exceptions perl(File::Which)

Name:          %name
Version:       %version
Release:       %release

Summary:       Parrot Virtual Machine
License:       Artistic 2.0
Group:         Development/Perl
Url:           http://www.parrot.org/
Source0:       ftp://ftp.parrot.org/pub/parrot/releases/devel/%{version}/%{name}-%{version}.tar.gz
Patch0:        parrot-2.3.0-remove_md2_upstream_r45824.patch

BuildRequires: gdbm-devel
BuildRequires: gmp-devel
BuildRequires: libicu-devel
BuildRequires: ncurses-devel
BuildRequires: perl-doc
BuildRequires: readline-devel

BuildRoot:     %{_tmppath}/%{name}-%{version}-%{release}

%description
Parrot is a virtual machine designed to efficiently compile and execute 
bytecode for interpreted languages. Parrot will be the target for the final 
Perl 6 compiler, and is already usable as a backend for Pugs, as well as 
variety of other languages

#--

%package -n %libname
Summary:    Parrot Virtual Machine run time library
License:    Artistic 2.0
Group:      Development/Perl
Provides:   lib%{name} = %{version}-%{release}
Requires:   %{name} = %{version}-%{release}
Requires:   %{_libdir}/pkgconfig

%description -n %libname
Run time library for %{name}.

#--

%package -n %{name}-doc
Summary:    Parrot Virtual Machine documentation
License:    Artistic 2.0
Group:      Development/Perl

%description -n %{name}-doc
Documentation for %{name}.

#--

%package -n %libname_devel
Summary:    Parrot Virtual Machine development headers and libraries
License:    Artistic 2.0
Group:      Development/Perl
Provides:   %{name}-devel = %{version}-%{release}
Requires:   %libname = %{version}

%description -n %libname_devel
Development files for %{name}.

#--

%package -n %{name}-src
Summary:    Parrot Virtual Machine sources
License:    Artistic 2.0
Group:      Development/Perl
Provides:   %{name}-src = %{version}-%{release}

%description -n %{name}-src
Sources of %{name}.


%prep
%setup -q
%patch0 -p1 -b .md2
%{__perl} -pi -e 's,"lib/,"%{_lib}/, if (/CONST_STRING\(interp,/)' \
    src/library.c
%{__perl} -pi -e "s,'/usr/lib','%{_libdir}',;s,runtime/lib/,runtime/%{_lib}/," \
    tools/dev/install_files.pl \
    tools/dev/mk_manifest_and_skip.pl

%build
%{__perl} Configure.pl \
    --prefix=%{_usr} \
    --libdir=%{_libdir} \
    --sysconfdir=%{_sysconfdir} \
    --infodir=%{_datadir}/info \
    --mandir=%{_mandir} \
    --cc="%{__cc}" \
    --parrot_is_shared \
    --lex=/usr/bin/flex \
    --yacc=/usr/bin/yacc \
    --libs='-lcurses -lm -lrt'

    #--cxx=%{__cxx} \
# the following Configure.pl flag makes the compile goes boom
    #--optimize="$RPM_OPT_FLAGS -maccumulate-outgoing-args" \

%make
export LD_LIBRARY_PATH=$( pwd )/blib/lib
%make parrot_utils
%make installable
%make html


%install
rm -rf $RPM_BUILD_ROOT

export LD_LIBRARY_PATH=$( pwd )/blib/lib
make install DESTDIR=$RPM_BUILD_ROOT

# Drop the docs so rpm can pick them up itself.
rm -rf $RPM_BUILD_ROOT/%{_docdir}/parrot

# Force permissions on doc directories.
find docs examples -type d -exec chmod 755 {} \;
find docs examples -type f -exec chmod 644 {} \;

# Force permissions on shared libs so they get stripped.
find $RPM_BUILD_ROOT%{_libdir} -type f \( -name '*.so' -o -name '*.so.*' \) \
    -exec chmod 755 {} \;

%check
export LD_LIBRARY_PATH=$( pwd )/blib/lib
#make test

%clean
rm -rf $RPM_BUILD_ROOT

%if %mdkversion < 200900
%post -n %libname -p /sbin/ldconfig
%endif

%if %mdkversion < 200900
%postun -n %libname -p /sbin/ldconfig
%endif

%files
%defattr(-,root,root,-)
%doc ChangeLog CREDITS NEWS PBC_COMPAT PLATFORMS README
%doc RESPONSIBLE_PARTIES TODO
%exclude %{_bindir}/parrot_config
%exclude %{_bindir}/parrot_debugger
%exclude %{_bindir}/pbc_*
%{_bindir}/*

%files -n %{name}-doc
%defattr(-,root,root,-)
%doc docs examples

%files -n %libname
%defattr(-,root,root,-)
%{_libdir}/parrot
%{_libdir}/*.so.*

%files -n %libname_devel
%defattr(-,root,root,-)
%{_bindir}/parrot_config
%{_bindir}/parrot_debugger
%{_bindir}/pbc_disassemble
%{_bindir}/pbc_merge
%{_bindir}/pbc_to_exe
%{_bindir}/pbc_dump
%{_includedir}/*
%{_libdir}/pkgconfig/*
%{_libdir}/*.so
%{_libdir}/*.a

%files -n %{name}-src
%defattr(-,root,root,-)
/usr/src/parrot


%changelog
* Wed Apr 21 2010 Jérôme Quelin <jquelin@mandriva.org> 2.3.0-2mdv2010.1
+ Revision: 537554
- update to 2.3.0

* Sun Mar 21 2010 Funda Wang <fwang@mandriva.org> 2.2.0-2mdv2010.1
+ Revision: 526122
- rebuild for new icu

* Wed Mar 17 2010 Jérôme Quelin <jquelin@mandriva.org> 2.2.0-1mdv2010.1
+ Revision: 523422
- update to new version 2.2.0

* Fri Feb 19 2010 Jérôme Quelin <jquelin@mandriva.org> 2.1.1-1mdv2010.1
+ Revision: 507974
- update to new version 2.1.1

* Tue Feb 09 2010 Funda Wang <fwang@mandriva.org> 2.0.0-2mdv2010.1
+ Revision: 503382
- rebuild for new gmp

* Thu Jan 21 2010 Jérôme Quelin <jquelin@mandriva.org> 2.0.0-1mdv2010.1
+ Revision: 494465
- update to 2.0.0

* Wed Dec 16 2009 Jérôme Quelin <jquelin@mandriva.org> 1.9.0-2mdv2010.1
+ Revision: 479530
- bump mkrel
- remove weird requires

* Wed Dec 16 2009 Jérôme Quelin <jquelin@mandriva.org> 1.9.0-1mdv2010.1
+ Revision: 479220
- update to new version 1.9.0

* Tue Dec 08 2009 Jérôme Quelin <jquelin@mandriva.org> 1.8.0-5mdv2010.1
+ Revision: 474872
- splitting -src from -devel

* Tue Dec 08 2009 Jérôme Quelin <jquelin@mandriva.org> 1.8.0-4mdv2010.1
+ Revision: 474853
- shipping parrot src, needed for rakudo

* Mon Nov 23 2009 Jérôme Quelin <jquelin@mandriva.org> 1.8.0-3mdv2010.1
+ Revision: 469206
- fix #55891: parrot was providing perl(file::which)

* Wed Nov 18 2009 Jérôme Quelin <jquelin@mandriva.org> 1.8.0-2mdv2010.1
+ Revision: 467209
- bump mkrel
- removing a bogus requires auto-extracted

* Tue Nov 17 2009 Jérôme Quelin <jquelin@mandriva.org> 1.8.0-1mdv2010.1
+ Revision: 467002
- update to new version 1.8.0

* Fri Nov 06 2009 Jérôme Quelin <jquelin@mandriva.org> 1.7.0-1mdv2010.1
+ Revision: 460705
- update to new version 1.7.0

* Tue Sep 15 2009 Jérôme Quelin <jquelin@mandriva.org> 1.6.0-1mdv2010.0
+ Revision: 443097
- update to 1.6.0

* Fri Sep 04 2009 Jérôme Quelin <jquelin@mandriva.org> 1.5.0-2mdv2010.0
+ Revision: 431070
- rebuild

* Sun Aug 23 2009 Jérôme Quelin <jquelin@mandriva.org> 1.5.0-1mdv2010.0
+ Revision: 419770
- forgot to commit tarball
- update to 1.5.0

* Wed Jul 22 2009 Jérôme Quelin <jquelin@mandriva.org> 1.4.0-1mdv2010.0
+ Revision: 398641
- update to 1.4.0

* Thu Jun 18 2009 Jérôme Quelin <jquelin@mandriva.org> 1.3.0-1mdv2010.0
+ Revision: 386942
- update to new version 1.3.0

* Sun May 31 2009 Funda Wang <fwang@mandriva.org> 1.2.0-2mdv2010.0
+ Revision: 381586
- rebuild for new icu libmajor

* Sat May 30 2009 Jérôme Quelin <jquelin@mandriva.org> 1.2.0-1mdv2010.0
+ Revision: 381426
- update to 1.2.0

* Sun Mar 22 2009 Jérôme Quelin <jquelin@mandriva.org> 1.0.0-1mdv2009.1
+ Revision: 360489
- removing make languages, target has been removed
- update to 1.0.0

* Wed Mar 11 2009 Jérôme Quelin <jquelin@mandriva.org> 0.9.1-2mdv2009.1
+ Revision: 353832
- fixing url

* Wed Mar 11 2009 Jérôme Quelin <jquelin@mandriva.org> 0.9.1-1mdv2009.1
+ Revision: 353669
- Development/Liraries group doesn't exist. using devel/perl
- adding missing group to fix strange submit error (thanks misc++)
- fixing rpmlint warnings
- minor tweak
- version 0.9.1 - most of specfile taken from upstream project

* Wed Jul 30 2008 Thierry Vignaud <tv@mandriva.org> 0.4.17-4mdv2009.0
+ Revision: 255040
- rebuild
- kill re-definition of %%buildroot on Pixel's request

  + Pixel <pixel@mandriva.com>
    - do not call ldconfig in %%post/%%postun, it is now handled by filetriggers

  + Michael Scherer <misc@mandriva.org>
    - remove old Obsoletes, prevent rpm to compile

  + Olivier Blin <oblin@mandriva.com>
    - restore BuildRoot

* Fri Nov 23 2007 Thierry Vignaud <tv@mandriva.org> 0.4.17-2mdv2008.1
+ Revision: 111491
- rebuild for new libicu

  + Funda Wang <fwang@mandriva.org>
    - New version 0.4.17

* Sun Jul 15 2007 Funda Wang <fwang@mandriva.org> 0.4.13-2mdv2008.0
+ Revision: 52316
- Obsoletes old major

* Wed Jun 27 2007 Funda Wang <fwang@mandriva.org> 0.4.13-1mdv2008.0
+ Revision: 44826
- more BuildRequires
- remove unneeded(?) .c source files
- disable patch
  make reallyinstall
- New version


* Wed Aug 30 2006 Thierry Vignaud <tvignaud@mandriva.com> 0.4.6-1mdv2007.0
- new release

* Mon May 29 2006 Michael Scherer <misc@mandriva.org> 0.4.4-1mdv2007.0
- New release 0.4.4

* Tue Apr 18 2006 Michael Scherer <misc@mandriva.org> 0.4.3-1mdk
- New release 0.4.3

* Fri Mar 24 2006 Michael Scherer <misc@mandriva.org> 0.4.2-1mdk
- New release 0.4.2
- patch0 to compile with lib readline

* Sat Feb 11 2006 Michael Scherer <misc@mandriva.org> 0.4.1-1mdk
- Initial release

