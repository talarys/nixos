{
  appimageTools,
  fetchzip,
  lib,
}: let
  pname = "stability-matrix";
  version = "2.14.2"; # Version without 'v' prefix for consistency

  src = fetchzip {
    url = "https://github.com/LykosAI/StabilityMatrix/releases/download/v${version}/StabilityMatrix-linux-x64.zip";
    hash = "sha256-he1uGC1M/nFcKpMM9JKY4oeexJcnzV0ZRxhTjtJz6xw=";
  };

  appimageContents = appimageTools.extractType2 {
    name = "${pname}-${version}";
    src = "${src}/StabilityMatrix-linux-x64.AppImage";
  };
in
  appimageTools.wrapType2 {
    inherit pname version;
    src = "${src}/StabilityMatrix-linux-x64.AppImage";

    meta = with lib; {
      description = "Multi-Platform Interface for Stable Diffusion";
      homepage = "https://github.com/LykosAI/StabilityMatrix";
      license = licenses.agpl3Only;
      maintainers = with maintainers; [
        talarys
      ];
      platforms = ["x86_64-linux"];
    };
  }
