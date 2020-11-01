{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "depaware";
  version = "master";


  src = fetchFromGitHub {
    owner = "tailscale";
    repo = pname;
    rev = "5d95aab075bea4f05be0b0aba8ffd63e89092838";
    sha256 = "sha256-NvPtex5cSNkr1F0QA35kaeU3E26jT8vCjIb4suePono=";
  };

  vendorSha256 = "sha256-5R4reXjkH5kTWh2pgXdEdi10UxKOV3L9jEI09FeUb2Y=";

  doCheck = false;

  meta = with lib; {
    description = "depaware makes you aware of your Go dependencies";
    longDescription = ''
      It generates a list of your dependencies which you check in
      to your repo. Then you and others can easily see what your
      dependencies are, how they vary by operating system (the
      letters L(inux), D(arwin), W(indows) in the left column),
      and whether they use unsafe/cgo (bomb icon). You can hook
      it up to your CI so that it's a build breakage if dependencies
      are not up to date.
    '';
    homepage = "https://github.com/tailscale/depaware";
    license = licenses.bsd2;
    maintainers = with maintainers; [ blaggacao ];
  };
}

