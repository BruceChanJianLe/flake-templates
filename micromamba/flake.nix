{
  description = "Development environment with micromamba";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.micromamba
          ];

          shellHook = ''
            # Set up micromamba in the shell
            export MAMBA_ROOT_PREFIX="$PWD/.micromamba"
            mkdir -p "$MAMBA_ROOT_PREFIX"

            # Initialize micromamba for the current shell
            # This only works with bash shell as shellHook is bash
            CURR_SHELL=$(basename "$SHELL")
            eval "$(micromamba shell hook --shell $CURR_SHELL)"

            echo "Micromamba development environment"
            echo "Micromamba version: $(micromamba --version)"
          '';
        };
      });
    };
}
