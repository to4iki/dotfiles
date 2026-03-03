# dotfiles

dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Installation

```bash
chezmoi init https://github.com/to4iki/dotfiles.git
```

## Usage

```bash
# Apply the file without 1Password integration.
make apply

# Apply the secret file linked with 1Password.
make secrets-apply
```
