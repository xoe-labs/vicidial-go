{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "protc-gen-go";
  version = "1.25.0";

  src = fetchFromGitHub {
    owner = "protocolbuffers";
    repo = "protobuf-go";
    rev = "v${version}";
    sha256 = "sha256-Q7A6cgRECLttDXiZGSXtqSuyyN6zYPdNgs2Y0AWh7io=";
  };

  vendorSha256 = "sha256-upKrTV4EucBV+xuoSsGPq/kY2x2fSG7iaZ925X8Clzk=";
  subPackages = [ "cmd/protoc-gen-go" ];

  doCheck = false;

  meta = with lib; {
    description = "Go support for Google's protocol buffers.";
    longDescription = ''
       The protoc-gen-go binary is a protoc plugin to generate
       a Go protocol buffer package.
    '';
    homepage = "https://developers.google.com/protocol-buffers";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}


