{ pkgs, mach-nix }:

with pkgs.mach-nix;
{
  commitizen = mkPython {
    inherit pkgs;
    python = nixpkgs.python38;
    requirements = ''
      commitizen
      commitizen-emoji
    '';
  };
}
