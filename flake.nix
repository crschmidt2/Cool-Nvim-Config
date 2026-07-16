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
			imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

			systems = [ "x86_64-linux" "aarch64-linux" ]; 

			#Final does sort of the same thing as pkgs. It is the final packages set after overlays are applied, so it lets you add or modify packages that are a part of that
			#Here it is adding cool-neovim as a package.
			perSystem = { final, config, ...}: {
				overlayAttrs = { inherit (config.packages) cool-neovim; };

				packages.cool-neovim = inputs.wrappers.lib.wrapPackage {
					pkgs = final;
					package = final.neovim;
				};

				packages.default = config.packages.cool-neovim;
			};
		};
}
