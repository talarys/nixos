{
  self,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      (import "${self}/overlays" {inherit inputs;})
    ];
  };
}
