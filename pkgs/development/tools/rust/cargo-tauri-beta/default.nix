{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  glibc,
  libsoup_3,
  cairo,
  gtk3,
  webkitgtk_4_1,
  darwin,
}: let
  inherit (darwin.apple_sdk.frameworks) CoreServices Security SystemConfiguration;
in
  rustPlatform.buildRustPackage rec {
    pname = "tauri";
    version = "2.0.0-beta.24";

    src = fetchFromGitHub {
      owner = "tauri-apps";
      repo = pname;
      rev = "tauri-v${version}";
      sha256 = "sha256-220Ji50OsNFDDw1YXN1+RIE73tjSJNdhIcfi2QxzUmo=";
    };

    # Manually specify the sourceRoot since this crate depends on other crates in the workspace. Relevant info at
    # https://discourse.nixos.org/t/difficulty-using-buildrustpackage-with-a-src-containing-multiple-cargo-workspaces/10202
    sourceRoot = "source/tooling/cli";

    cargoHash = "sha256-L9CDf/gQGo4AIpLDYWGycuaHqC98PdybG+TjTQbKYhY=";

    buildInputs =
      lib.optionals stdenv.isLinux [glibc libsoup_3 cairo gtk3 webkitgtk_4_1]
      ++ lib.optionals stdenv.isDarwin [CoreServices Security SystemConfiguration];
    nativeBuildInputs = [pkg-config];

    meta = with lib; {
      description = "Build smaller, faster, and more secure desktop applications with a web frontend";
      mainProgram = "cargo-tauri-beta";
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
