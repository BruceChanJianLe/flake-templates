> A collection of nix flake templates for generic use cases!

## Usage

### Initialize a template

Navigate to your project directory and run `nix flake init` with the template name. For example, to use `cpp_env`:

```bash
nix flake init -t github:brucechanjianle/flake-templates#cpp_env
```

This clones both `flake.nix` and `flake.lock` into your project directory.

### Activate the shell environment

```bash
nix develop
```

> for **zsh users**, please specify your shell explicitly:
> ```bash
> nix develop -c $SHELL
> ```

## Reference

[link](https://github.com/liyangau/flake-templates)
