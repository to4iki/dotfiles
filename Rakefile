# -*- coding: utf-8 -*-
require 'rake/clean'

# destination
HOME = ENV['HOME']
CONFIG = "#{HOME}/.config"
FISH = "#{CONFIG}/fish"
GH  = "#{CONFIG}/gh"

# source
ETC_ROOT  = File.join(File.dirname(__FILE__), 'etc')
GH_ROOT  = File.join(File.dirname(__FILE__), 'gh')
GIT_ROOT  = File.join(File.dirname(__FILE__), 'git')
TMUX_ROOT = File.join(File.dirname(__FILE__), 'tmux')
VIM_ROOT  = File.join(File.dirname(__FILE__), 'vim')
FISH_ROOT = File.join(File.dirname(__FILE__), 'fish')
ETC_DOT_FILES = Dir.glob('etc' + '/*').map { |path| File.basename(path) }

cleans = %w(
  .gemrc
  .tigrc
  .gitconfig
  .gitconfig-work
  .tmux.conf
  .vimrc
  .ideavimrc
  .config/fish/config.fish
  .config/fish/fish_plugins
  .config/gh/config.yml
)

CLEAN.concat(cleans.map { |c| File.join(HOME, c) })

task :default => :link
task :link => %w(etc:link git:link gh:link tmux:link vim:link fish:link)
task :boot => %w(bootstrap:mkdir bootstrap:install)

namespace :bootstrap do
  desc 'Make directory for initialization'
  task :mkdir do
    mkdir_if_needed(FISH)
    mkdir_if_needed(GH)
  end

  desc 'Install dependent libraries'
  task :install do
    ## fisher
    # curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  end
end

namespace :etc do
  desc 'Create symbolic link to HOME'
  task :link do
    same_name_symlinks ETC_ROOT, ETC_DOT_FILES
  end
end

namespace :git do
  desc 'Create symbolic link to HOME'
  task :link do
    same_name_symlinks GIT_ROOT, ['gitconfig', 'gitconfig-work']
  end
end

namespace :gh do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ File.join(GH_ROOT, 'config.yml'), File.join(GH, 'config.yml')
  end
end

namespace :tmux do
  desc 'Create symbolic link to HOME'
  task :link do
    same_name_symlinks TMUX_ROOT, ['tmux.conf']
  end
end

namespace :vim do
  desc 'Create symbolic link to HOME'
  task :link do
    same_name_symlinks VIM_ROOT, ['vimrc', 'ideavimrc']
  end
end

namespace :fish do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ File.join(FISH_ROOT, 'config.fish'), File.join(FISH, 'config.fish')
    symlink_ File.join(FISH_ROOT, 'fish_plugins'), File.join(FISH, 'fish_plugins')
  end
end

def symlink_ file, dest
  symlink file, dest if not File.exist?(dest)
end

def same_name_symlinks root, files
  files.each do |file|
    symlink_ File.join(root, file), File.join(HOME, ".#{file}")
  end
end

def mkdir_if_needed path
  FileUtils.mkdir_p(path) unless FileTest.exist?(path)
end
