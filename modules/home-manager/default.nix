{ pkgs, ...}: {
    home.stateVersion = "24.11";
    home.packages = with pkgs; [
        (pass.withExtensions (ps: [ ps.pass-otp ]))
        fd
        typescript
        newcomputermodern
        nixd
        curl
        iterm2
        starship
        wget
        less
        neovim
        fzf
        htop
        tealdeer
        python311
        poetry
        todo
        cargo
        eza
        pyenv
        hurl
        himalaya
        ruff
        nodejs_20
        zoxide
        sd
    ];
    programs = {
        bat.enable = true;
        git.enable = true;
        starship.enable = true;
        zellij.enable = true;
        alacritty = {
            enable = true;
        };
    };
}
