# Instalattion

## Brew

> MacOS

**Link:** [brew.sh](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## zsh

**Link:** [zsh.org](https://www.zsh.org/)

```bash
# MacOs
brew install zsh

# Ubuntu/Debian
sudo apt install zsh


# Configure zsh as default shell
chsh -s $(which zsh)

# Log out and log back in again to use your new default shell
echo $SHELL
```

## Stow

**Link:** [Stow](https://www.gnu.org/software/stow/)

```bash
# MacOs
brew install stow

# Ubuntu/Debian
sudo apt install stow
```

## Oh My Zsh

**Link:** [ohmyz.sh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Starship

**Link:** [starship.rs](https://starship.rs/)

- Need a font from [nerdfonts.com](https://www.nerdfonts.com/). I recommend: _Hack Nerd Font_

- Install Starship

```bash
# MacOs
brew install starship

# Ubuntu/Debian
curl -sS https://starship.rs/install.sh | sh
```

- Configure starship with zsh

```bash
# Add to .zshrc file
eval "$(starship init zsh)"
```

- Configure and customize starship: [starship.rs/config](https://starship.rs/config/)
