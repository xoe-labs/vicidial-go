{}:
let
  mach-nix = (
    builtins.fetchGit {
      url = "https://github.com/DavHau/mach-nix/";
      ref = "refs/tags/2.4.1";
    }
  );
in
import mach-nix
