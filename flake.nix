{
  description = "Local LLM with openvino";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; # Or latest
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "openvino";

          buildInputs = with pkgs; [
            python314
            python314Packages.openvino
            python314Packages.optimum
            python314Packages.transformers
            python314Packages.accelerate
            python314Packages.sentencepiece

          ];

          shellHook = ''
            echo "Now enjoy your system"
          '';
        };
      });
}

