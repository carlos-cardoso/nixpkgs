{ stdenv, fetchurl, pkgconfig, intltool, gnome3, mate, wrapGAppsHook }:

stdenv.mkDerivation rec {
  name = "mate-desktop-${version}";
  version = "1.20.0";

  src = fetchurl {
    url = "http://pub.mate-desktop.org/releases/${mate.getRelease version}/${name}.tar.xz";
    sha256 = "0y5172sbj6f4dvimf4pmz74b9cfidbpmnwwb9f6vlc6fa0kp5l1n";
  };

  nativeBuildInputs = [
    pkgconfig
    intltool
    wrapGAppsHook
  ];

  buildInputs = [
    gnome3.dconf
    gnome3.gtk
  ];

  meta = with stdenv.lib; {
    description = "Library with common API for various MATE modules";
    homepage = http://mate-desktop.org;
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = [ maintainers.romildo ];
  };
}
