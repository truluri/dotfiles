{pkgs, ...}: {
    programs.zsh.enable = true;
    programs.fish.enable = true;
    environment.shells = with pkgs; [ fish zsh bash ];
    nix.extraOptions = ''
        experimental-features = nix-command flakes
    '';
    environment = {
        systemPackages = [ pkgs.coreutils ];
        systemPath = [ "/opt/homebrew/bin/" ];
        pathsToLink = [ "/Applications" ];
    };
    fonts.packages = [ pkgs.nerd-fonts.fira-code ];
    services.nix-daemon.enable = true;
    system.defaults.dock.autohide = true;
    system.keyboard.enableKeyMapping = true;
    system.keyboard.remapCapsLockToEscape = true;
    system.stateVersion = 4;
    homebrew = {
        enable = true;
        caskArgs.no_quarantine = true;
        global.brewfile = true;
        brews = [
        ];
        casks = [
            "spotify"
        ];
    };
}
