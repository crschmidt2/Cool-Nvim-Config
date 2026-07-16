{
	description = "Cool Neovim Configuration flake.";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		wrappers.url = "github:lassulus/wrappers";
	};

	outputs = inputs@{ flake-parts, ... }: 
		flake-parts.lib.mkFlake {inherit inputs;} {

			perSystem = {self, inputs, pkgs, system, ...}: {
				packages.neovim = inputs.wrappers.lib.wrapPackage {
					inherit pkgs;
					package = pkgs.neovim;
				};

				packages.default = self.nixosModules.${system}.neovim;
			};

		};
}
