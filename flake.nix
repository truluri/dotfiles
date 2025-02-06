{
    description = "learning nix";
    inputs  = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

        home-manager.url = "github:nix-community/home-manager/master";  # for config files
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        darwin.url = "github:lnl7/nix-darwin";
        darwin.inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = inputs : {
        darwinConfigurations.askesmac = inputs.darwin.lib.darwinSystem {
            system = "x86_64-darwin";
            pkgs = import inputs.nixpkgs { system = "x86_64-darwin"; };
            modules = [
                ./modules/darwin
                inputs.home-manager.darwinModules.home-manager
                {
                    users.users.askebrunken = {
                        name = "askebrunken";
                        home = "/Users/askebrunken";
                    };
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.askebrunken.imports = [ ./modules/home-manager ];
                    };
                }
            ];
        };
    };
}
