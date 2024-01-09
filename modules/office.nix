{ pkgs, ... }: {


  environment.systemPackages = with pkgs; [

    libreoffice

    hunspell
    hunspellDicts.pl-pl
  ];
}
