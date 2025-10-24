{
  description = "A shell with all you need!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-24.05";
  };

  outputs = { self, nixpkgs, }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
  {
    devShells = forEachSystem ( { pkgs }: {
        default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            neofetch
            htop-vim
          ];
        };
      }
    );
  };
}
