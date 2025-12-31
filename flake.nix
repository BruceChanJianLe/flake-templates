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
      cpp_env = {
        path = ./cpp_env;
        description = "Provide a cpp development environment for local project.";
      };
    };
    defaultTemplate = self.templates.shell;
    };
}
