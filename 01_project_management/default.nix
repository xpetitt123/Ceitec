{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz") {} }:

with pkgs;

let
  my-rpackages = rWrapper.override {
    packages = with rPackages; [
        R
        ggplot2 
        dplyr 
        tidyverse 
        tidymodels 
        janitor
        fda];
  };

  my-rstudio = rstudioWrapper.override {
    packages = with rPackages; [
        R 
        dplyr 
        tidyverse 
        tidymodels 
        fda
        janitor
        ggplot2
    ];
    };
in
mkShell {
  buildInputs = [my-rpackages my-rstudio];
  shellHook = ''
      echo "Welcome to the Ceitec project shell!"
      export QT_XCB_GL_INTEGRATION=none
    '';
}
