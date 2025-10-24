{
  description = "A collection of nix templates";

  outputs = { self }: {
    templates = {
      micromamba = {
        path = ./micromamba;
        description = "Provide a micromamba environment for local project.";
      };
      shell = {
        path = ./shell;
        description = "Common packages you need all from nixpkgs";
      };
    };
    defaultTemplate = self.templates.shell;
    };
}
