let
    poetry2nix = import "${builtins.fetchGit { url = "https://github.com/nix-community/poetry2nix.git"; ref = "refs/tags/2023.12.2614813"; }}" {};
in
poetry2nix.mkPoetryApplication {
        projectDir = "${builtins.fetchGit {
            url = "https://github.com/bergercookie/syncall.git";
            ref = "refs/tags/v1.5.0";
         }}";
    }

