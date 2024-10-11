{ buildGoModule }:
buildGoModule {
  pname = "libscanner";
  version = "0.1.0";
  src = ./.;
  vendorHash = null;

  buildPhase = ''
    go build -buildmode=c-archive
  '';

  installPhase = ''
    install -Dm644 libscanner.h $out/include/libscanner.h
    install -Dm644 libscanner.a $out/lib/libscanner.a
  '';
}
