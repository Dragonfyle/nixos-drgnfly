{ ... }:

{
  home.file."scripts" = {
    source = ../scripts;
    recursive = true;
    executable = true;
  };
}
