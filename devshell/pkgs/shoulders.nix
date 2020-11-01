{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "shoulders";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "gobuffalo";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-59AzROhat2zw1cWtaQmD+iVFLf26Kglb6xJ0brz1zSM=";
  };

  vendorSha256 = "sha256-L3+MlQfthH2cdYWM/kYXVctuiIArg9ueusUsPs1TG30=";

  doCheck = false;

  meta = with lib; {
    description = "SHOULDERS.md generator.";
    longDescription = ''
      This tool will create a custom SHOULDERS.md file for any given Go
      project allowing OSS maintainers to recognize those who's OSS
      contributions helped them.
    '';
    homepage = "https://github.com/gobuffalo/shoulders";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

