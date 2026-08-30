# dotfiles

dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## First-run install

```sh
chezmoi init https://github.com/to4iki/dotfiles.git

# Apply files not managed by 1password
make apply

# Apply secrets managed by 1password
make secrets-apply

# Install dependencies
make install-gh-extensions
make install-yazi-packages
make install-herdr-plugins
mise install
cd ~/.apm && apm install -g
```

`dot_apm/apm.yml` sets `targets: [agent-skills, claude]` and pins skill refs with `#commit`. Self-authored Agent Skills live in [to4iki/skills](https://github.com/to4iki/skills) and are consumed from there via APM. `~/.apm/apm.lock.yaml` is generated locally by APM and is not managed by chezmoi.

## Updating

### APM-managed skills

Deps in `dot_apm/apm.yml` are pinned with `#commit` (full SHA). `apm update` only rewrites those pins when the upstream has an **annotated semver tag**; it refuses to move a SHA pin to a branch tip or lightweight tag. Repos without annotated tags (e.g. `to4iki/skills`) make `apm update` fail with:

```
No annotated tag found for revision-pinned dependency.
```

So bump the SHA in `apm.yml` yourself, apply, then reinstall:

```sh
# 1. Edit #commit pins in dot_apm/apm.yml
make apply
cd ~/.apm && apm install -g
```

`apm.lock.yaml` under `~/.apm/` stays local; the `#commit` in `apm.yml` is the version recorded in git.
