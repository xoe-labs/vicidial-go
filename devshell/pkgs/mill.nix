{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "mill";
  version = "1.1.1";

  src = fetchFromGitHub {
    owner = "ThreeDotsLabs";
    repo = "watermill";
    rev = "v${version}";
    sha256 = "sha256-j8EPtkMadKB2yIFfwuo77EojkG/qOlnwWhr+DlksWFw=";
  };

  modRoot = "tools/mill";
  vendorSha256 = "sha256-g34BH5E65le5YR8Xj8CPV913iIyh3GqiiY2j6/6mQN4=";

  doCheck = false;

  meta = with lib; {
    description = "A simple CLI tool for Watermill.";
    longDescription = ''
      It has two basic functionalities, namely producing and
      consuming messages on the following Pub/Subs:
        - Kafka
        - Google Cloud Pub/Sub
        - RabbitMQ
    '';
    homepage = "https://github.com/ThreeDotsLabs/watermill/tree/master/tools/mill";
    license = licenses.mit;
    maintainers = with maintainers; [ blaggacao ];
  };
}

