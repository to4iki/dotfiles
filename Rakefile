# -*- coding: utf-8 -*-
require 'rake/clean'

# destination
HOME = ENV['HOME']
CONFIG = "#{HOME}/.config"
NVIM = "#{CONFIG}/nvim"
FISH = "#{CONFIG}/fish"

# source
ETC_ROOT  = File.join(File.dirname(__FILE__), 'etc')
GIT_ROOT  = File.join(File.dirname(__FILE__), 'git')
PECO_ROOT = File.join(File.dirname(__FILE__), 'peco')
TMUX_ROOT = File.join(File.dirname(__FILE__), 'tmux')
VIM_ROOT  = File.join(File.dirname(__FILE__), 'vim')
NVIM_ROOT  = File.join(File.dirname(__FILE__), 'nvim')
FISH_ROOT = File.join(File.dirname(__FILE__), 'fish')
ETC_DOT_FILES = Dir.glob('etc' + '/*').map { |path| File.basename(path) }

cleans = %w(
    .gemrc
    .tigrc
    .gitconfig
    .gitconfig-work
    .config/peco
    .tmux.conf
    .ideavimrc
    .xvimrc
    .config/nvim/init.vim
    .config/nvim/plugins.toml
    .config/nvim/plugins_lazy.toml
    .config/fish/config.fish
    .config/fish/fishfile
)

CLEAN.concat(cleans.map { |c| File.join(HOME, c) })

task :default => :link
task :link => %w(etc:link peco:link git:link tmux:link vim:link nvim:link fish:link)
task :boot => %w(bootstrap:mkdir bootstrap:install)

namespace :bootstrap do
  desc 'Make directory for initialization'
  task :mkdir do
    mkdir_if_needed(NVIM)
    mkdir_if_needed(FISH)
    mkdir_if_needed("#{NVIM}/dein")
  end

  desc 'Install dependent libraries'
  task :install do
    # TODO: impl
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

namespace :peco do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ PECO_ROOT, File.join(CONFIG, 'peco')
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
    same_name_symlinks VIM_ROOT, ['ideavimrc', 'xvimrc']
  end
end

namespace :nvim do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ File.join(NVIM_ROOT, 'init.vim'), File.join(NVIM, 'init.vim')
    symlink_ File.join(NVIM_ROOT, 'plugins.toml'), File.join(NVIM, 'plugins.toml')
    symlink_ File.join(NVIM_ROOT, 'plugins_lazy.toml'), File.join(NVIM, 'plugins_lazy.toml')
  end
end

namespace :fish do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ File.join(FISH_ROOT, 'config.fish'), File.join(FISH, 'config.fish')
    symlink_ File.join(FISH_ROOT, 'fishfile'), File.join(FISH, 'fishfile')
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
