{
  description = ''Nim's Windows GUI Framework.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."wnim-master".dir   = "master";
  inputs."wnim-master".owner = "nim-nix-pkgs";
  inputs."wnim-master".ref   = "master";
  inputs."wnim-master".repo  = "wnim";
  inputs."wnim-master".type  = "github";
  inputs."wnim-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."wnim-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}