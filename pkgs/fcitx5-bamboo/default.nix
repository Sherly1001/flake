{ lib
, stdenv
, fetchFromGitHub
, cmake
, extra-cmake-modules
, fcitx5
, go
, gettext
}:

stdenv.mkDerivation rec {
  pname = "fcitx5-bamboo";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "fcitx";
    repo = "fcitx5-bamboo";
    rev = version;
    fetchSubmodules = true;
    sha256 = "1sp9arahchscmmjj32x9gisfv1x1dkq08814pb9a2lw9vmj6xjhi";
  };

  nativeBuildInputs = [ go cmake extra-cmake-modules gettext ];

  buildInputs = [ fcitx5 ];

  preConfigure = ''
    export GOCACHE="$TMPDIR/go-cache"
  '';

  meta = with lib; {
    description = "Bamboo (Vietnamese Input Method) engine support for Fcitx";
    homepage = "https://github.com/fcitx/fcitx5-bamboo";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ berberman ];
    platforms = platforms.linux;
  };
}
