%define version 0.3.1
%define devel -devel
%define prefix /usr/local/parrot/%{version}
%define exec_prefix %{prefix}
%define bindir %{exec_prefix}/bin
%define libdir %{exec_prefix}/lib
%define includedir %{exec_prefix}/include

Summary: Parrot
Name: parrot
Version: %{version}
Release: 1
Source0: %{name}-%{version}%{devel}.tar.gz
License: Artistic/GPL
Group: Development/Languages
BuildRoot: %{_tmppath}/%{name}-root

%description

%prep
%setup -q -n %{name}-%{version}%{devel}

%build
perl Configure.pl --optimize
make CC="ccache gcc" parrot pdb pdump
make -C imcc
perl tools/dev/mk_manifests.pl --prefix=%{prefix} --exec-prefix=%{exec_prefix} --bindir=%{bindir} --libdir=%{libdir} --includedir=%{includedir} MANIFEST.detailed

%install
rm -rf $RPM_BUILD_ROOT

make install BUILDPREFIX=$RPM_BUILD_ROOT PREFIX=%{prefix} EXEC_PREFIX=%{exec_prefix} BINDIR=%{bindir} LIBDIR=%{libdir} INCLUDEDIR=%{includedir} MANIFEST.detailed

# Create directories
#perl -MFile::Basename=dirname -lne 'next if /\[\]/; my($meta,$src,$dest)=split(/\s+/); $dest ||= $src; print "install -d ".dirname("$ENV{RPM_BUILD_ROOT}%{prefix}/$dest")' MANIFEST.detailed | sort -u | sh

# Copy over files
#perl -lne 'next if /\[\]/; my($meta,$src,$dest)=split(/\s+/); $dest ||= $src; print "install -c $src $ENV{RPM_BUILD_ROOT}%{prefix}/$dest"' MANIFEST.detailed | sh

%clean
rm -rf $RPM_BUILD_ROOT

%package devel
Summary: Parrot devel package
Group: unknown

%description devel
Parrot sub-package

%package BASIC
Summary: Parrot BASIC package
Group: unknown

%description BASIC
Parrot sub-package

%package befunge
Summary: Parrot befunge package
Group: unknown

%description befunge
Parrot sub-package

%package bf
Summary: Parrot bf package
Group: unknown

%description bf
Parrot sub-package

%package cola
Summary: Parrot cola package
Group: unknown

%description cola
Parrot sub-package

%package forth
Summary: Parrot forth package
Group: unknown

%description forth
Parrot sub-package

%package jako
Summary: Parrot jako package
Group: unknown

%description jako
Parrot sub-package

%package ook
Summary: Parrot ook package
Group: unknown

%description ook
Parrot sub-package

%package perl6
Summary: Parrot perl6 package
Group: unknown

%description perl6
Parrot sub-package

%package regex
Summary: Parrot regex package
Group: unknown

%description regex
Parrot sub-package

%package ruby
Summary: Parrot ruby package
Group: unknown

%description ruby
Parrot sub-package

%package scheme
Summary: Parrot scheme package
Group: unknown

%description scheme
Parrot sub-package


%files -f MANIFEST.main
%defattr(-,root,root)

%files -f MANIFEST.devel devel
%defattr(-,root,root)

%files -f MANIFEST.BASIC BASIC
%defattr(-,root,root)

%files -f MANIFEST.befunge befunge
%defattr(-,root,root)

%files -f MANIFEST.bf bf
%defattr(-,root,root)

%files -f MANIFEST.cola cola
%defattr(-,root,root)

%files -f MANIFEST.forth forth
%defattr(-,root,root)

%files -f MANIFEST.jako jako
%defattr(-,root,root)

%files -f MANIFEST.ook ook
%defattr(-,root,root)

%files -f MANIFEST.perl6 perl6
%defattr(-,root,root)

%files -f MANIFEST.regex regex
%defattr(-,root,root)

%files -f MANIFEST.ruby ruby
%defattr(-,root,root)

%files -f MANIFEST.scheme scheme
%defattr(-,root,root)


%changelog
* Tue Mar 18 2003  <sfink@foxglove.localdomain>
- Initial build.


