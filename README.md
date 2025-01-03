<div align="center">

# asdf-fga-cli [![Build](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/build.yml/badge.svg)](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/build.yml) [![Lint](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/lint.yml/badge.svg)](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/lint.yml)

[OpenFGA CLI (fga)](https://github.com/openfga/cli) plugin for the [asdf](https://asdf-vm.com) version manager, it also works with the [mise](https://mise.jdx.dev/) dev env setup tool.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

## Add the Plugin:
### asdf
```sh
asdf plugin add fga-cli https://github.com/rhamzeh/asdf-fga-cli.git
```

### mise
```sh
mise plugin add fga-cli https://github.com/rhamzeh/asdf-fga-cli.git`
```

## The fga cli:

### asdf
```sh
# Show all installable versions
asdf list-all fga-cli

# Install specific version
asdf install fga-cli 0.6.2

# Set a version globally (on your ~/.tool-versions file)
asdf global fga-cli latest

# Now fga cli commands are available
fga --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

### mise
```sh
# Show all installable versions
mise list-all fga-cli

# Install specific version
mise use fga-cli@0.6.2

# Set a version globally (on your ~/.config/mise/config.toml file)
mise use -g fga-cli@latest

# Now fga cli commands are available
fga --version
```

Check the [mise getting started guide]([https://github.com/asdf-vm/asdf](https://mise.jdx.dev/getting-started.html)) for more.


# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/rhamzeh/asdf-fga-cli/graphs/contributors)!

# License

See [the Apache-2.0 license](LICENSE)
