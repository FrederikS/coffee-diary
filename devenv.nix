{ pkgs, ... }:

{
  dotenv.enable = true;
  packages = [ pkgs.openspec pkgs.act ];
}
