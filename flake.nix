{
  description = "My dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self }:
    {
      homeModules.default =
        { config, pkgs, ... }:
        {
          # home.file.".config/nvim".source = ./nvim; # Replaced by nvf
          home.file.".config/niri".source = ../niri;
          home.file.".config/waybar".source = ../waybar;
          # home.file.".config/mako".source = ./mako; # Replaced by programs.mako
          home.file.".zshenv.unix".source = ../.zshenv;
          home.file.".zshrc.unix".source = ../.zshrc;
        };
    };
}
