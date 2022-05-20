[
# python pkgs overlays
  (self: super: {

    pythonOverrides = python-self: python-super: {
      devito = python-super.devito.overridePythonAttrs (oldAttrs: {
        doCheck = false;
        src = super.fetchFromGitHub {
          owner = "AtilaSaraiva";
          repo = "devito";
          rev = "4a0d553";
          sha256 = "sha256-cXzsFGP684Qe8Bx316aXnanRaXok+B3Hp759gscjgmQ=";
        };
      });
    };

    python3 =
      super.python3.override { packageOverrides = self.pythonOverrides; };
  })
]
