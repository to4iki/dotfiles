# -*- coding: utf-8 -*-
require 'rake/clean'

HOME = ENV['HOME']
CONFIG = "#{HOME}/.config"
VIM = "#{HOME}/.vim"

ETC_ROOT  = File.join(File.dirname(__FILE__), 'etc')
GIT_ROOT  = File.join(File.dirname(__FILE__), 'git')
PECO_ROOT = File.join(File.dirname(__FILE__), 'peco')
TMUX_ROOT = File.join(File.dirname(__FILE__), 'tmux')
VIM_ROOT  = File.join(File.dirname(__FILE__), 'vim')
FISH_ROOT = File.join(File.dirname(__FILE__), 'fish')
OMF_ROOT = File.join(File.dirname(__FILE__), 'omf')

ETC_DOT_FILES = Dir.glob('etc' +  '/*').map { |path| File.basename(path) }

cleans = %w(
    .agignore
    .gemrc
    .tigrc
    .gitconfig
    .config/peco
    .tmux.conf
    .vimrc
    .ideavimrc
    .xvimrc
    .vim/vimrcs
    .config/fish/config.fish
    .config/fish/functions
    .config/omf
)

CLEAN.concat(cleans.map { |c| File.join(HOME, c) })

task :default => :all
task :all => %w(etc:link peco:link git:link tmux:link vim:link fish:link omf:link)

namespace :etc do
  task :link do
    same_name_symlinks ETC_ROOT, ETC_DOT_FILES
  end
end

namespace :git do
  desc 'Create symbolic link to HOME'
  task :link do
    same_name_symlinks GIT_ROOT, ['gitconfig']
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
    symlink_ File.join(VIM_ROOT, 'vimrcs'), File.join(VIM, 'vimrcs')
  end
end

namespace :fish do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ File.join(FISH_ROOT, 'config.fish'), File.join("#{CONFIG}/fish", 'config.fish')
    symlink_ File.join(FISH_ROOT, 'functions'), File.join("#{CONFIG}/fish", 'functions')
  end
end

namespace :omf do
  desc 'Create symbolic link to CONFIG'
  task :link do
    symlink_ OMF_ROOT, File.join(CONFIG, 'omf')
  end
end

def symlink_ file, dest
  symlink file, dest if not File.exist?(dest)
end

def same_name_symlinks root, files
  files.each do |file|
    symlink_ File.join(root, file), File.join(HOME, '.' + file)
  end
end
