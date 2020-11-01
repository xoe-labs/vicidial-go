{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "sqlc";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "kyleconroy";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-/PMb4KGiIz/fxEPyxCGLM5OqW+tUi3ElrIn5sG81tDE=";
  };

  vendorSha256 = "sha256-VsWpUx1wrwVAemlraFhptxcjS1HkXL8obXAP2QHt4F4=";

  doCheck = false;
  subPackages = [ "cmd/sqlc" ];
  # https://github.com/lfittl/pg_query_go/tree/master/parser/include
  # has no .go file and would else not be vendored by clasical `go mot vendor`
  runVend = true;

  meta = with lib; {
    description = "Generate type safe Go from SQL.";
    longDescription = ''
      sqlc generates fully type-safe idiomatic Go code from SQL.
      1. You write SQL queries
      2. You run sqlc to generate Go code that presents type-safe interfaces to those queries
      3. You write application code that calls the methods sqlc generated
    '';
    homepage = "https://sqlc.dev/";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

