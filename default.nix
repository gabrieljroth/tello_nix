let nixpkgs = fetchTarball {
    url = https://github.com/NixOS/nixpkgs/tarball/f6dac8083874408fe287525007d3da9decd9bf44;
    sha256 = "13hxl8gcyqrpranh12fa14sg2lxx2glbgzkx10z4i2x3gh59yl1n";
  };
in (import nixpkgs {}).callPackage ./derivation.nix {}
