{ pkgs, ... }: {
    nixpkgs.config = {
        allowUnfree = true;
    };
    services = { nix-daemon = { enable = true; }; };
    nix.package = pkgs.nix;
    nix.settings.trusted-users = [ "root" "mko" "korff"];
    system.stateVersion = 5;
    # Don't send analytics data
    environment.variables.HOMEBREW_NO_ANALYTICS = "1";

    homebrew = {
        enable = true;
        casks = [
                "discord"
                "signal"
                "slack"
                "vlc"
        ];
        masApps = {
            "Prime Video"           = 545519333;
            "DaVinci Resolve"       = 571213070;
        };
    };
    
    system = {
        defaults = {
            dock = {
                autohide = true;
                autohide-delay = 0.0;
                orientation = "bottom";
                tilesize = 42;
                showhidden = true;
                show-recents = false;
                show-process-indicators = true;
                expose-animation-duration = 0.1;
                expose-group-by-app = false;
                launchanim = false;
                mineffect = "genie";
                mru-spaces = false;
            };
            CustomUserPreferences = {
                "com.apple.finder" = {
                    ShowExternalHardDrivesOnDesktop = false;
                    ShowRemovableMediaOnDesktop = false;
                    WarnOnEmptyTrash = false;
                };
                "com.apple.dock" = {
                    size-immutable = true;
                };
            };
        };
    };
}
