<div align="center">

# asdf-fga-cli [![Build](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/build.yml/badge.svg)](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/build.yml) [![Lint](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/lint.yml/badge.svg)](https://github.com/rhamzeh/asdf-fga-cli/actions/workflows/lint.yml)

[fga-cli](https://github.com/openfga/cli) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add fga-cli
# or
asdf plugin add fga-cli https://github.com/rhamzeh/asdf-fga-cli.git
```

fga-cli:

```shell
# Show all installable versions
asdf list-all fga-cli

# Install specific version
asdf install fga-cli latest

# Set a version globally (on your ~/.tool-versions file)
asdf global fga-cli latest

# Now fga-cli commands are available
fga --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/rhamzeh/asdf-fga-cli/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Raghd Hamzeh](https://github.com/rhamzeh/)
