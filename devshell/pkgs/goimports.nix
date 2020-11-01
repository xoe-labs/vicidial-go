{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "goimports";
  version = "master";

  src = fetchFromGitHub {
    owner = "golang";
    repo = "tools";
    rev = "582c62ec74d06936c88d4b760c63cbc2925e69c7";
    sha256 = "sha256-iOudzSj+155cShUQlUMUV47LAtIWsYm/oBYkXOsoQO0=";
  };

  vendorSha256 = "sha256-37v3/tMxNVpv9bD62y48++pB73SKBeS2E2LMK2uVF6M=";

  doCheck = false;
  subPackages = [ "cmd/goimports" ];

  meta = with lib; {
    description = "Formats your code and fixes imports.";
    longDescription = ''
      Command goimports updates your Go import lines,
      adding missing ones and removing unreferenced ones.
      In addition to fixing imports, goimports also formats
      your code in the same style as gofmt so it can be used
      as a replacement for your editor's gofmt-on-save hook.
    '';
    homepage = "https://github.com/golang/tools";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

