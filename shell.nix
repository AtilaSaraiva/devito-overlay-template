{ sources ? import ./nix/sources.nix }:
with import sources.nixpkgs {
  overlays = import ./overlay.nix;
};

let
  my-python-packages = python-packages: with python-packages; [
    matplotlib
    devito
    # other python packages you want
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
mkShell {
  buildInputs = [
    python-with-my-packages
    jupyter
  ];

  shellHooks = ''
  '';
}
