# .zshrc

The configuration file has been split into 5 files:

- [aliases](zsh/aliases.sh): Contains all alias.
- [help](zsh/help.sh): `help` - Helper function to display description of aliases and scripts.
- [oh_my_zsh](zsh/oh_my_zsh.sh): Configuration file of Oh My Zsh.
- [packages](zsh/packages.sh): Contains all packages, like fnm (node version manager), rbenv (ruby version manager) and others.
- [scripts](zsh/scripts.sh): Contains bash scripts.

The main `.zshrc` file only contains the basic configuration and imports the mentioned files.

## Help

The [aliases](zsh/aliases.sh) and [scripts](zsh/scripts.sh) files can use comments in the following format `#@<name>#:<description>` to display a brief description of the script or alias when the user executes the `help` command.

Example:

```bash
#@dtemp#:Create a random folder temp and move to it
function dtemp {
	cd $(mktemp -d)
}
```
