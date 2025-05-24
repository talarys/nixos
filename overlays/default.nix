{...}: [
  # First overlay: Add new packages
  (final: _prev: import ../pkgs final.pkgs)

  # Second overlay: Modify existing packages
  (final: prev: {
    # Example modification:
    # some-package = prev.some-package.override { ... };
  })
]
