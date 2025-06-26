############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

rebuild: 
  nh os switch .

debug: 
  nixos-rebuild switch --flake . --sudo --show-trace --verbose

up: 
  nix flake update

upp: 
  nix flake update $(i)

history: 
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs

clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc: 
  sudo nix store gc

gcc: 
  sudo nix-collect-garbage -d