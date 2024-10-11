{ rustPlatform, libscanner }:
rustPlatform.buildRustPackage {
  pname = "rust";
  version = "0.1.0";
  src = ./.;

  buildInputs = [ libscanner ];

  cargoHash = "sha256-zR5ZcKBFCzTkYvHAfkG3JQdQ0ZubSTwix6jle28inyI=";

  meta.mainPackage = "rust";
}
