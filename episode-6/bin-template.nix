{ stdenv, lib, fetchurl, runTimePackage }:

stdenv.mkDerivation rec {
  pname = "an-app-i-guess";
  version = "1.0.0";

  src = fetchurl {
    url = "http://example.com/${pname}-${version}-${stdenv.hostPlatform.system}.tar.gz";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp ${pname} $out/bin/
  '';

  propagatedBuildInputs = [ runTimePackage ]

  meta = with lib; {
    description = "A thing that does stuff, because we like stuff";
    homepage = "http://example.com";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}