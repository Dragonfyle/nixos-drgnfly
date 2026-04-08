{
  description = "NixOS configuration for drgnfly";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    {
		nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			modules = [
			  ./hosts/desktop

			  home-manager.nixosModules.home-manager
			  {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.michal = import ./home;
			  }
			];
		};

		nixosConfigurations.drgnfly = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			modules = [
			  ./hosts/drgnfly

			  home-manager.nixosModules.home-manager
			  {
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;
				home-manager.users.michal = import ./home;
			  }
			];
		};

		nixosConfigurations.iso = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				"${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
				./hosts/iso
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.michal = import ./home;
				}
			];
		};
    };
}
