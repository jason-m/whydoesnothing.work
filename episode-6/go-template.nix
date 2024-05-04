{ stdenv, lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "my-go-app";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "github-owner";
    repo = pname;
    rev = "v${version}";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  vendorSha256 = "0000000000000000000000000000000000000000000000000000";

  doCheck = false;

  meta = with lib; {
    description = "My Go application";
    homepage = "https://github.com/github-owner/${pname}";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}