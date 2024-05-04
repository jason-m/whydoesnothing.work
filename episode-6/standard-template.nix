{ stdenv, lib, fetchFromGitHub, gcc, make, pkgconfig, binutils }:

stdenv.mkDerivation rec {
  pname = "an-app";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "someone";
    repo = pname;
    rev = "v${version}";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  buildInputs = [ gcc make pkgconfig binutils ];

  meta = with lib; {
    description = "My C application";
    homepage = "https://github.com/github-owner/${pname}";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}