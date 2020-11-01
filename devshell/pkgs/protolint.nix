{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "protolint";
  version = "0.26.0";

  src = fetchFromGitHub {
    owner = "yoheimuta";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Dlago7HTV/S1tgjMxA0F0dZgGdzlhxaQlHjtBGwDqBo=";
  };

  vendorSha256 = "sha256-prjEBYZ9nYJzsise4gWexL7jZR6stC5p036IGqxqJdM=";
  subPackages = [ "cmd/protolint" ];

  doCheck = false;
  buildFlagsArray = [ "-ldflags=-s -w -X github.com/yoheimuta/protolint/internal/cmd.version=${version}" ];

  meta = with lib; {
    description = "A pluggable linter and fixer to enforce Protocol Buffer style and conventions.";
    longDescription = ''
      protolint is the pluggable linting utility for Protocol Buffer files (proto2+proto3)
    '';
    homepage = "https://github.com/yoheimuta/protolint";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

