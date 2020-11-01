{ buildGoModule, fetchFromGitHub, fetchpatch, lib }:

buildGoModule rec {
  pname = "embedmd";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "blaggacao";
    repo = "embedmd";
    rev = "v2";
    sha256 = "sha256-4wwKKXLQSmNkIYizjK03bc68ZGDIXuFOI6aNfIoIBks=";
  };

  patches = [
    # Fix icopmlete migration to go modules
    (fetchpatch {
      url = "https://patch-diff.githubusercontent.com/raw/campoy/embedmd/pull/66.patch";
      sha256 = "sha256-DrHlHx/p2bu2OBEfBCj+tTeMur9K7jkokRXIz+Kctjg=";
    })
  ];

  vendorSha256 = "sha256-lBx5k6RikrPabrxIEuPZ9reju5ZxT9vqyXSVvFH36jU=";

  doCheck = false;

  meta = with lib; {
    description = "Embed code into markdown and keep everything in sync.";
    longDescription = ''
      `embedmd` embeds files or fractions of files into Markdown files.
      It does so by searching embedmd commands, which are a subset of
      the Markdown syntax for comments. This means they are invisible
      when Markdown is rendered, so they can be kept in the file as
      pointers to the origin of the embedded text.
    '';
    homepage = "https://github.com/campoy/embedmd";
    license = licenses.asl20;
    maintainers = with maintainers; [ blaggacao ];
  };
}


