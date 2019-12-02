{ stdenv, cmake, fetchFromGitHub, python2Packages, boost, libav }:
stdenv.mkDerivation rec {
  name = "h264decoder-${version}";
  version = "bfbb62f";

  src = fetchFromGitHub {
    owner = "DaWelter";
    repo = "h264decoder";
    rev = version;
    sha256 = "1srcydh2bdzdi922n2dscvbah25p3q7wxm4ah0gyb3dwcd60k9x8";
  };

  patches = [ ./cmake.diff ];

  buildInputs = [
    boost
    cmake
    libav
    python2Packages.boost
    python2Packages.python
  ];

}
