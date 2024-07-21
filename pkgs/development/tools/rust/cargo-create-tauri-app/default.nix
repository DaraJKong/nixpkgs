{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "create-tauri-app";
  version = "4.0.3";

  src = fetchFromGitHub {
    owner = "tauri-apps";
    repo = pname;
    rev = "create-tauri-app-v${version}";
    fetchSubmodules = false;
    sha256 = "sha256-aNOvivtoe9YI8daxriRkZE9fR9ELKbBr/RFPZp4aOxk=";
  };

  cargoHash = "sha256-4/nwhkn6iYdytDD4P4WNUkiKI525G6pHi1qTpVmiyGQ=";

  meta = with lib; {
    description = "Rapidly scaffold out a new tauri app project.";
    homepage = "https://tauri.app/";
    license = with licenses; [
      asl20
      /*
      or
      */
      mit
    ];
    maintainers = with maintainers; [DaraJKong];
  };
}
