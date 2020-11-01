self: super: rec {
  commitizen = (super.callPackage ./pkgs/python.nix { }).commitizen;
  mach-nix = super.callPackage ./pkgs/mach-nix.nix { };
  goreleaser = super.callPackage ./pkgs/goreleaser.nix { };
  depaware = super.callPackage ./pkgs/depaware.nix { };
  goimports = super.callPackage ./pkgs/goimports.nix { };
  protolint = super.callPackage ./pkgs/protolint.nix { };
  mill = super.callPackage ./pkgs/mill.nix { };
  go-cleanarch = super.callPackage ./pkgs/go-cleanarch.nix { };
  protobuf-go = super.callPackage ./pkgs/protobuf-go.nix { };
  embedmd = super.callPackage ./pkgs/embedmd.nix { };
  shoulders = super.callPackage ./pkgs/shoulders.nix { };
  sqlc = super.callPackage ./pkgs/sqlc.nix { };
  alex = (super.callPackage ./pkgs/node-packages { })."alex-9.0.1";
  mdspell = (super.callPackage ./pkgs/node-packages { })."markdown-spellcheck-1.3.1";
  remark = (super.callPackage ./pkgs/node-packages { })."remark-cli-9.0.0";
  markdownlint = (super.callPackage ./pkgs/node-packages { })."markdownlint-cli-0.24.0";
  all-contributors-cli = (super.callPackage ./pkgs/node-packages { })."all-contributors-cli-6.19.0";
}
