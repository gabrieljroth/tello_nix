{ callPackage, stdenv, python2Packages, fetchFromGitHub }:

let
  h264decoder = callPackage ./h264decoder {};
in
stdenv.mkDerivation rec {
  name = "Tello-Python-${version}";
  version = "693776d";

  src = fetchFromGitHub {
    owner = "dji-sdk";
    repo = "Tello-Python";
    rev = version;
    sha256 = "1paihcxvw7fj3c0naz49w9jlc06907i7m3p4gwv52mcmg37f7asb";
  };

  installPhase = ''
    lib=$out/lib/python2.7/site-packages/Tello
    mkdir -p $lib/
    cp $src/Tello_Video/{main,tello,tello_control_ui}.py $lib/
  '';

  propagatedBuildInputs = with python2Packages; [
    opencv
    numpy
    pillow
    tkinter
    h264decoder
  ];
}
