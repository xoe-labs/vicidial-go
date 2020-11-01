{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "goreleaser";
  version = "0.146.0";

  src = fetchFromGitHub {
    owner = "goreleaser";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-vm5Jj5haVozHLf+GAkJcw1EoQ52BWLg6klVz6giSD0E=";
  };

  vendorSha256 = "sha256-KKLbROoIAYG2bgUIsz5qLaD0zicnChnwGHaxU80DCyQ=";

  doCheck = false;
  buildFlagsArray = [ "-ldflags=-s -w -X main.version=${version} -X main.builtBy=nix" ];

  meta = with lib; {
    description = "Deliver Go binaries as fast and easily as possible";
    longDescription = ''
      GoReleaser builds Go binaries for several platforms, creates a
      GitHub release and then pushes a Homebrew formula to a tap
      repository. All that wrapped in your favorite CI.
    '';
    homepage = "https://goreleaser.com/";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

