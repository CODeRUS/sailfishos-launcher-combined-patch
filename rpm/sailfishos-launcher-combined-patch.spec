Name:       sailfishos-launcher-combined-patch

BuildArch: noarch

Summary:    Launcher combined patches
Version:    0.2.0
Release:    1
Group:      Qt/Qt
License:    TODO
Source0:    %{name}-%{version}.tar.bz2
Requires:   patchmanager
Requires:   sailfish-version >= 1.1.9

%description
A homescreen patches for changing launcher grid size and adding new icon style showing folder icons

%prep
%setup -q -n %{name}-%{version}


%build

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}/usr/share/patchmanager/patches/sailfishos-launcher-combined-patch
cp -r patch/* %{buildroot}/usr/share/patchmanager/patches/sailfishos-launcher-combined-patch
mkdir -p %{buildroot}/usr/share/lipstick-jolla-home-qt5/launcher
cp -r data/*.qml %{buildroot}/usr/share/lipstick-jolla-home-qt5/launcher
mkdir -p %{buildroot}/usr/share/jolla-settings/pages/sailfishos-launcher-combined-patch
cp -r settings/*.qml %{buildroot}/usr/share/jolla-settings/pages/sailfishos-launcher-combined-patch
cp -r settings/*.png %{buildroot}/usr/share/jolla-settings/pages/sailfishos-launcher-combined-patch
mkdir -p %{buildroot}/usr/share/jolla-settings/entries
cp -r settings/*.json %{buildroot}/usr/share/jolla-settings/entries/

%pre
if [ -d /var/lib/patchmanager/ausmt/patches/sailfishos-launcher-combined-patch ]; then
/usr/sbin/patchmanager -u sailfishos-launcher-combined-patch || true
fi

%preun
if [ -d /var/lib/patchmanager/ausmt/patches/sailfishos-launcher-combined-patch ]; then
/usr/sbin/patchmanager -u sailfishos-launcher-combined-patch || true
fi

%files
%defattr(-,root,root,-)
%{_datadir}/patchmanager/patches/sailfishos-launcher-combined-patch
%{_datadir}/lipstick-jolla-home-qt5/launcher
%{_datadir}/jolla-settings/entries
%{_datadir}/jolla-settings/pages
