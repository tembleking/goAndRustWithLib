{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    let
      overlays.default = final: prev: {
        libscanner = prev.callPackage ./libscanner { };
        rustApp = prev.callPackage ./rust { };
      };

      flake = flake-utils.lib.eachDefaultSystem (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ self.overlays.default ];
          };
        in
        {
          packages = {
            default = pkgs.rustApp;
          };

          devShells.default =
            with pkgs;
            mkShell {
              packages = [
                # Add here dependencies for the project.
                go
                gopls
                golangci-lint
                golangci-lint-langserver
                rustc
                cargo
                rust-analyzer
                libscanner
              ];

              inputsFrom = [
                libscanner
                rustApp
              ];
            };

          formatter = pkgs.nixfmt-rfc-style;
        }
      );

    in
    flake // { inherit overlays; };
}
