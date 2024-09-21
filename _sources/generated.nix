# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  cmp-skkeleton = {
    pname = "cmp-skkeleton";
    version = "2c268a407e9e843abd03c6fa77485541a4ddcd9a";
    src = fetchFromGitHub {
      owner = "uga-rosa";
      repo = "cmp-skkeleton";
      rev = "2c268a407e9e843abd03c6fa77485541a4ddcd9a";
      fetchSubmodules = false;
      sha256 = "sha256-Odg0cmLML2L4YVcrMt7Lrie1BAl7aNEq6xqJN3/JhZs=";
    };
    date = "2023-11-26";
  };
  gitmoji-nvim = {
    pname = "gitmoji-nvim";
    version = "326ddf01cbf3425566a089126ece7e8bd2560601";
    src = fetchFromGitHub {
      owner = "Dynge";
      repo = "gitmoji.nvim";
      rev = "326ddf01cbf3425566a089126ece7e8bd2560601";
      fetchSubmodules = false;
      sha256 = "sha256-EZHclDtuyZWXTBOVU4C+Km/YNM1oAIazQT4wBI5K7vo=";
    };
    date = "2023-11-16";
  };
  hlchunk-nvim = {
    pname = "hlchunk-nvim";
    version = "1.3.0";
    src = fetchurl {
      url = "https://github.com/shellRaining/hlchunk.nvim/archive/refs/tags/v1.3.0.tar.gz";
      sha256 = "sha256-eYwifigTRrXrW6xpFqLlqYFAftt64yweRGvvAvE7o5U=";
    };
  };
  skkeleton = {
    pname = "skkeleton";
    version = "1035184420cfff705770a5b04aabe0ed0acb4db8";
    src = fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "1035184420cfff705770a5b04aabe0ed0acb4db8";
      fetchSubmodules = false;
      sha256 = "sha256-u1Bd/tNpftheBkIRunu29h3VWISGcu38dbRdui8WRqc=";
    };
    date = "2024-09-20";
  };
  vimdoc-ja = {
    pname = "vimdoc-ja";
    version = "c35b922fb0528b5a2729dc3b722aaa55d5e956d7";
    src = fetchFromGitHub {
      owner = "vim-jp";
      repo = "vimdoc-ja";
      rev = "c35b922fb0528b5a2729dc3b722aaa55d5e956d7";
      fetchSubmodules = false;
      sha256 = "sha256-kS/ry45pwOLX1pWR1MkAqrGlzLEaY09XXrqiy1bREe0=";
    };
    date = "2024-09-16";
  };
}
