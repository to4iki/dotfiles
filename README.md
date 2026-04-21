# dotfiles

dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Install

```sh
chezmoi init https://github.com/to4iki/dotfiles.git
```

## Usage

```sh
# Apply files not managed by 1password
make apply

# Apply secrets managed by 1password
make secrets-apply
```
