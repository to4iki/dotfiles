# -*- coding: utf-8 -*-
require 'rake/clean'

# destination
HOME = ENV['HOME']
CONFIG = "#{HOME}/.config"
FISH = "#{CONFIG}/fish"

# source
ETC_ROOT  = File.join(File.dirname(__FILE__), 'etc')
GIT_ROOT  = File.join(File.dirname(__FILE__), 'git')
PECO_ROOT = File.join(File.dirname(__FILE__), 'peco')
TMUX_ROOT = File.join(File.dirname(__FILE__), 'tmux')
VIM_ROOT  = File.join(File.dirname(__FILE__), 'vim')
FISH_ROOT = File.join(File.dirname(__FILE__), 'fish')
ETC_DOT_FILES = Dir.glob('etc' + '/*').map { |path| File.basename(path) }

cleans = %w(
  .gemrc
  .tigrc
  .gitconfig
  .gitconfig-work
  .config/peco
  .tmux.conf
  .vimrc
  .ideavimrc
  .xvimrc
  .config/fish/config.fish
  .config/fish/fishfile
)

CLEAN.concat(cleans.map { |c| File.join(HOME, c) })

task :default => :link
task :link => %w(etc:link peco:link git:link tmux:link vim:link fish:link)
task :boot => %w(bootstrap:mkdir bootstrap:install)

namespace :bootstrap do
  desc 'Make directory for initialization'
  task :mkdir do
    mkdir_if_needed(FISH)
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
    same_name_symlinks VIM_ROOT, ['vimrc', 'ideavimrc', 'xvimrc']
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
