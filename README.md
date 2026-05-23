# dotfiles

dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## First-run install

```sh
chezmoi init https://github.com/to4iki/dotfiles.git

# Apply files not managed by 1password
make apply

# Apply secrets managed by 1password
make secrets-apply

# From this repo (apm is already installed)
apm install -g
```

`dot_apm/apm.yml` sets `targets: [claude]` and pins skill refs with `#commit`. `~/.apm/apm.lock.yaml` is generated locally by APM and is not managed by chezmoi.

## Updating

### APM-managed skills

Bump a pinned ref in `dot_apm/apm.yml`, then:

```sh
chezmoi apply
cd ~/.apm && apm update --yes
```

Or refresh to the latest matching refs without editing `apm.yml` first:

```sh
cd ~/.apm && apm update --yes
```

`apm.lock.yaml` under `~/.apm/` stays local; bump `#commit` in `apm.yml` when you want that version recorded in git.
