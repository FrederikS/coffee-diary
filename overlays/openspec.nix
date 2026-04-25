# devenv overlay: bump openspec 1.3.0 → 1.3.1
#
# Drop this file anywhere in your repo (e.g. ./overlays/openspec.nix)
# and wire it up in devenv.nix:
#
#   { pkgs, ... }:
#   {
#     devenv.overlays = [ (import ./overlays/openspec.nix) ];
#   }
#
# OR, if you're using a plain flake without devenv's overlay helper:
#
#   nixpkgs.overlays = [ (import ./overlays/openspec.nix) ];
#
# ─────────────────────────────────────────────────────────────────
# BEFORE USING: you need the correct npmDepsHash for 1.3.1.
#
# Run the following once to get it:
#
#   nix-prefetch-github Fission-AI OpenSpec --rev v1.3.1
#
# Then build with a fake hash first, let Nix tell you the real one:
#
#   nix build --impure --expr '
#     let pkgs = import <nixpkgs> { overlays = [ (import ./overlays/openspec.nix) ]; };
#     in pkgs.openspec
#   '
#
# Nix will error with the correct hash — paste it in below.
# ─────────────────────────────────────────────────────────────────

final: prev: {
  openspec = prev.openspec.overrideAttrs (oldAttrs: rec {
    version = "1.3.1";

    src = prev.fetchFromGitHub {
      owner = "Fission-AI";
      repo  = "OpenSpec";
      rev   = "v${version}";

      # Replace with the real hash. Get it by running:
      #   nix-prefetch-github Fission-AI OpenSpec --rev v1.3.1
      # or let Nix tell you after a failed build with the fake hash below.
      hash  = "sha256-L4LBHVVtgMhSJm+IzZSYOR0UXPbvIRg4xiEV5urYxdI=";
    };

    # The npm dependency lockfile hash WILL change between versions.
    # Replace with the real hash by letting Nix error on the fake one first.
    npmDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  });
}