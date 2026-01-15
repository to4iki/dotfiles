# Variables
HOME := $(HOME)
CONFIG := $(HOME)/.config
FISH := $(CONFIG)/fish
GH := $(CONFIG)/gh
GHOSTY := $(CONFIG)/ghostty

GH_ROOT := $(CURDIR)/gh
FISH_ROOT := $(CURDIR)/fish
GHOSTTY_ROOT := $(CURDIR)/ghostty
CLAUDE_ROOT := $(CURDIR)/claude

# Targets to clean
CLEAN_TARGETS := \
	$(HOME)/.gemrc \
	$(HOME)/.tigrc \
	$(HOME)/.gitconfig \
	$(HOME)/.gitconfig-work \
	$(HOME)/.vimrc \
	$(HOME)/.ideavimrc \
	$(CONFIG)/fish/config.fish \
	$(CONFIG)/fish/fish_plugins \
	$(CONFIG)/gh/config.yml \
	$(CONFIG)/ghostty/config \
	$(HOME)/.claude/CLAUDE.md \
	$(HOME)/.claude/settings.json

.PHONY: link bootstrap clean dotfiles gh fish ghostty claude

link: dotfiles gh fish ghostty claude

bootstrap:
	@mkdir -p $(FISH)
	@mkdir -p $(GH)
	@mkdir -p $(GHOSTY)
	@echo "Bootstrap completed. Run 'make link' to create symlinks."

clean:
	@rm -f $(CLEAN_TARGETS)
	@for file in $(FISH_ROOT)/functions/*.fish; do \
		[ -f "$$file" ] && rm -f $(FISH)/functions/$$(basename "$$file"); \
	done
	@echo "Cleaned dotfiles."

dotfiles:
	@ln -sf $(CURDIR)/gemrc $(HOME)/.gemrc
	@ln -sf $(CURDIR)/tigrc $(HOME)/.tigrc
	@ln -sf $(CURDIR)/gitconfig $(HOME)/.gitconfig
	@ln -sf $(CURDIR)/gitconfig-work $(HOME)/.gitconfig-work
	@ln -sf $(CURDIR)/vimrc $(HOME)/.vimrc
	@ln -sf $(CURDIR)/ideavimrc $(HOME)/.ideavimrc

gh:
	@ln -sf $(GH_ROOT)/config.yml $(GH)/config.yml

fish:
	@ln -sf $(FISH_ROOT)/config.fish $(FISH)/config.fish
	@ln -sf $(FISH_ROOT)/fish_plugins $(FISH)/fish_plugins
	@for file in $(FISH_ROOT)/functions/*.fish; do \
		[ -f "$$file" ] && ln -sf "$$file" $(FISH)/functions/$$(basename "$$file"); \
	done

ghostty:
	@ln -sf $(GHOSTTY_ROOT)/config $(GHOSTY)/config

claude:
	@ln -sf $(CLAUDE_ROOT)/CLAUDE.md $(HOME)/.claude/CLAUDE.md
	@ln -sf $(CLAUDE_ROOT)/settings.json $(HOME)/.claude/settings.json
