{ buildGoPackage, fetchFromGitHub, lib }:

buildGoPackage rec {
  pname = "go-cleanarch";
  version = "1.2.0";

  goPackagePath = "github.com/roblaszczak/go-cleanarch";

  src = fetchFromGitHub {
    owner = "roblaszczak";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-XCvoRF4v9lL6wm3Ap3AQlnL+FmK1Irj0TQRT7Da0vZg=";
  };

  doCheck = false;

  meta = with lib; {
    description = "Clean architecture validator for go.";
    longDescription = ''
      go-cleanarch was created to keep Clean Architecture rules, like a The
      Dependency Rule and interaction between modules in your Go projects.
    '';
    homepage = "https://pkg.go.dev/gopkg.in/roblaszczak/go-cleanarch.v1";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

