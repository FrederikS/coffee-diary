{ pkgs, ... }:

{
  dotenv.enable = true;
  overlays = [ (import ./overlays/openspec.nix) ];
  packages = [ pkgs.openspec pkgs.act ];
}
