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
    version = "954f2f96e74a0c409f12315278fb1bbef0286b60";
    src = fetchFromGitHub {
      owner = "vim-skk";
      repo = "skkeleton";
      rev = "954f2f96e74a0c409f12315278fb1bbef0286b60";
      fetchSubmodules = false;
      sha256 = "sha256-ThS6i0KfHxMGTuF8rzCmK7hemVzdYZA6mlqNtOX4a+k=";
    };
    date = "2024-12-31";
  };
  vimdoc-ja = {
    pname = "vimdoc-ja";
    version = "e0eddbe28ab12ea331cd4935fc7387429a689575";
    src = fetchFromGitHub {
      owner = "vim-jp";
      repo = "vimdoc-ja";
      rev = "e0eddbe28ab12ea331cd4935fc7387429a689575";
      fetchSubmodules = false;
      sha256 = "sha256-cOGbHdUgmFyMKdnzPFP6XNiHFI/XIAgbuQBWC+Cq9QA=";
    };
    date = "2024-12-29";
  };
}
