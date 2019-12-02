{ callPackage, stdenv, python2Packages, fetchFromGitHub, makeWrapper }:

let
  h264decoder =
    let
      objectFile = callPackage ./h264decoder {};
    in
      stdenv.mkDerivation {
        name = "h264decoder-py";

        phases = [ "installPhase" ];

        installPhase = ''
          mkdir -p $out/lib/python2.7/site-packages/
          cp ${objectFile}/libh264decoder.so $out/lib/python2.7/site-packages/
        '';
      };
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

  patchPhase = ''
    sed -i '1i #!/usr/bin/env python' Tello_Video/main.py
  '';

  installPhase = ''
    mkdir -p $out/
    cp Tello_Video/{main,tello,tello_control_ui}.py $out/
    chmod +x $out/main.py
  '';

  postFixup = ''
    wrapProgram $out/main.py --prefix PYTHONPATH : "$PYTHONPATH"
  '';

  nativeBuildInputs = [ makeWrapper ];

  propagatedBuildInputs = with python2Packages; [
    boost
    h264decoder
    numpy
    opencv
    pillow
    tkinter
  ];
}
