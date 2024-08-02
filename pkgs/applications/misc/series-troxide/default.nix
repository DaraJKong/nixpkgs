{
  lib,
  stdenv,
  fetchzip,
}:
stdenv.mkDerivation rec {
  pname = "series-troxide";
  version = "0.5.1";

  src = fetchzip {
    url = "https://github.com/MaarifaMaarifa/${pname}/releases/download/v${version}/${pname}-x86_64-unknown-linux-gnu.tar.xz";
    sha256 = "sha256-kMW7Jue4sILHhKxkqDSBLFal7Tjq0Ox3CUoeLjpubPs=";
  };

  buildCommand = ''
    touch $out
  '';

  meta = with lib; {
    description = "A Simple and Modern Series Tracker";
    homepage = "https://github.com/MaarifaMaarifa/series-troxide";
    license = with licenses; [
      gpl3
    ];
    maintainers = with maintainers; [DaraJKong];
  };
}
