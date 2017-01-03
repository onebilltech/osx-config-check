#!/usr/bin/env nix-env -ibrf
#
# Developer dependencies
{ pkgs ? import <nixpkgs> {}
}:
{
  inherit (pkgs)
    cacert
    direnv
    fzf
    git-crypt
    #gnupg
    neovim
    nix-repl
    nixStable
    silver-searcher
    ;

  inherit (pkgs.gitAndTools)
    hub
    ;
}
