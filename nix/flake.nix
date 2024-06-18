{
	description = "Flake with Home Manager";

	inputs = {
		# NixOS official package source, using nixos-23.11 branch here.
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
        
        # home-manager
        home-manager = {
            url = "github:nix-community/home-manager/release-23.11";
            # The `follows` keyword in inputs is used for inheritance.
            # Here, `inputs.nixpkgs` of home-manager is kept consistent with
            # the `inputs.nixpkgs` of the current flake,
            # to avoid problems caused by different versions of nixpkgs.
            inputs.nixpkgs.follows = "nixpkgs";
        };
	};

	outputs = inputs@{ nixpkgs, home-manager, ...}: {
		# nixosConfigurations.<hostname>
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				# Import the previous configuration.nix we used,
				# so the old configuration file still takes effect
				./configuration.nix
                
                # fonts
                ./fonts.nix

                # environment
                ./environment/default.nix

                # programming languages
                ./languages/default.nix

                # packages
                # ./packages/salesforce-cli/default.nix

                # make home-manager as a module of nixos so
                # that home-manager config will be deployed
                # automatically
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    # import home configs
                    home-manager.users = {
                        lemonsir = import ./users/lemonsir.nix;
                        # work = import ./work.nix;
                    };
                    home-manager.extraSpecialArgs = { inherit inputs; };
                }
			];
		};
	};
}
