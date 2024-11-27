{ ... }: {
    users.users.mko = {
        name = "mko";
        home = "/Users/mko";
    };
    imports = [
        ../shared/darwin.nix
    ];
}
