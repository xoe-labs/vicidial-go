let
  src = ./.;
  preCommitExcludes = [];
  repoSpecificShellHook = ''
  '';

in
import ./devshell {
  inherit src preCommitExcludes repoSpecificShellHook;
}

