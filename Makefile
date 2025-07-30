# Variables
HOME := $(HOME)
CONFIG := $(HOME)/.config
FISH := $(CONFIG)/fish
GH := $(CONFIG)/gh
GHOSTY := $(CONFIG)/ghostty

ETC_ROOT := $(CURDIR)/etc
GH_ROOT := $(CURDIR)/gh
GIT_ROOT := $(CURDIR)/git
VIM_ROOT := $(CURDIR)/vim
FISH_ROOT := $(CURDIR)/fish
GHOSTTY_ROOT := $(CURDIR)/ghostty
CLAUDE_ROOT := $(CURDIR)/claude

# Targets to clean
CLEAN_TARGETS := \
	$(HOME)/.gemrc \
	$(HOME)/.tigrc \
	$(HOME)/.gitconfig \
	$(HOME)/.gitconfig-work \
	$(HOME)/.tmux.conf \
	$(HOME)/.vimrc \
	$(HOME)/.ideavimrc \
	$(CONFIG)/fish/config.fish \
	$(CONFIG)/fish/fish_plugins \
	$(CONFIG)/gh/config.yml \
	$(CONFIG)/ghostty/config \
	$(HOME)/.claude/CLAUDE.md \
	$(HOME)/.claude/settings.json \
	$(HOME)/.claude/commands

.PHONY: default link boot clean bootstrap etc git gh vim fish ghostty claude

default: link

link: etc git gh tmux vim fish ghostty claude

boot: bootstrap

bootstrap:
	@mkdir -p $(FISH)
	@mkdir -p $(GH)
	@mkdir -p $(GHOSTY)
	@mkdir -p $(HOME)/.claude/commands
	@echo "Bootstrap completed. Run 'make link' to create symlinks."

clean:
	@rm -f $(CLEAN_TARGETS)
	@for file in $(FISH_ROOT)/functions/*.fish; do \
		[ -f "$$file" ] && rm -f $(FISH)/functions/$$(basename "$$file"); \
	done
	@echo "Cleaned dotfiles."

etc:
	@ln -sf $(ETC_ROOT)/gemrc $(HOME)/.gemrc
	@ln -sf $(ETC_ROOT)/tigrc $(HOME)/.tigrc
	@ln -sf $(ETC_ROOT)/tmux.conf $(HOME)/.tmux.conf

git:
	@ln -sf $(GIT_ROOT)/gitconfig $(HOME)/.gitconfig
	@ln -sf $(GIT_ROOT)/gitconfig-work $(HOME)/.gitconfig-work

gh:
	@ln -sf $(GH_ROOT)/config.yml $(GH)/config.yml

vim:
	@ln -sf $(VIM_ROOT)/vimrc $(HOME)/.vimrc
	@ln -sf $(VIM_ROOT)/ideavimrc $(HOME)/.ideavimrc

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
	@ln -sf $(CLAUDE_ROOT)/commands $(HOME)/.claude/commands
