{ pkgs, ... }:

{
  languages.java = {
    enable = true;
    jdk.package = pkgs.temurin-bin-25;
    maven.enable = true;
  };

  packages = [ pkgs.quarkus ];
}
