{ src
, preCommitExcludes ? [ ]
, repoSpecificShellHook ? ""
, localDevshellConfigs ? []
}:
let
  nixpkgs = (import ./nixpkgs-src.nix);
  overlays = [
    (import ./overlay.nix)
    # (import ./devshell-extenstions/overlay.nix)
  ];
  pkgs = (import ./devshell-src.nix) { inherit nixpkgs overlays; };

  pre-commit = (
    import ./pre-commit.nix {
      inherit pkgs src;
      excludes = preCommitExcludes;
    }
  );

in
with pkgs;
mkDevShell {
  imports = [
    (mkDevShell.importTOML ./devshell.toml)
    # ./devshell-extensions/options.nix
  ] ++ localDevshellConfigs;
  name = "${baseNameOf src}";
  env = {
    # Fix the nixpkgs version to devshell's version
    # See: https://github.com/numtide/devshell/issues/26
    # NIX_PATH = "nixpkgs=${pkgs.path}";

    # common k9s settings
    K9SCONFIG = "${toString ./k9s.d}";
  };
  bash = {
    extra = ''
      ${repoSpecificShellHook}
      ${pre-commit.shellHook}
      # Fix the nixpkgs version to devshell's version
      export NIX_PATH="nixpkgs=${pkgs.path}"
    '';
  };
}
