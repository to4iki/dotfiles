# Variables
HOME := $(HOME)
CONFIG := $(HOME)/.config
FISH := $(CONFIG)/fish
GH := $(CONFIG)/gh

ETC_ROOT := $(CURDIR)/etc
GH_ROOT := $(CURDIR)/gh
GIT_ROOT := $(CURDIR)/git
TMUX_ROOT := $(CURDIR)/tmux
VIM_ROOT := $(CURDIR)/vim
FISH_ROOT := $(CURDIR)/fish

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
	$(CONFIG)/gh/config.yml

.PHONY: default link boot clean bootstrap etc git gh tmux vim fish

default: link

link: etc git gh tmux vim fish

boot: bootstrap

bootstrap:
	@mkdir -p $(FISH)
	@mkdir -p $(GH)
	@echo "Bootstrap completed. Run 'make link' to create symlinks."

clean:
	@rm -f $(CLEAN_TARGETS)
	@echo "Cleaned dotfiles."

etc:
	@ln -sf $(ETC_ROOT)/gemrc $(HOME)/.gemrc
	@ln -sf $(ETC_ROOT)/tigrc $(HOME)/.tigrc

git:
	@ln -sf $(GIT_ROOT)/gitconfig $(HOME)/.gitconfig
	@ln -sf $(GIT_ROOT)/gitconfig-work $(HOME)/.gitconfig-work

gh:
	@ln -sf $(GH_ROOT)/config.yml $(GH)/config.yml

tmux:
	@ln -sf $(TMUX_ROOT)/tmux.conf $(HOME)/.tmux.conf

vim:
	@ln -sf $(VIM_ROOT)/vimrc $(HOME)/.vimrc
	@ln -sf $(VIM_ROOT)/ideavimrc $(HOME)/.ideavimrc

fish:
	@ln -sf $(FISH_ROOT)/config.fish $(FISH)/config.fish
	@ln -sf $(FISH_ROOT)/fish_plugins $(FISH)/fish_plugins
