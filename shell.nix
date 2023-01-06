{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell rec {
  ocamlPackages = with pkgs.ocamlPackages; [ ocaml ctypes findlib utop ];
  nativeBuildInputs = (with pkgs; [ dune_3 nixfmt mdbtools pkg-config glib ])
    ++ ocamlPackages;

  shellHook = ''
    export MDBTOOLS=${pkgs.mdbtools}
  '';
}
