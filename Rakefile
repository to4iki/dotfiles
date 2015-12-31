# -*- coding: utf-8 -*-
require 'rake/clean'

HOME = ENV["HOME"]
CONFIG = "#{HOME}/.config"
VIM = "#{HOME}/.vim"

ETC_ROOT  = File.join(File.dirname(__FILE__), "etc")
GIT_ROOT  = File.join(File.dirname(__FILE__), "git")
PECO_ROOT = File.join(File.dirname(__FILE__), "peco")
TMUX_ROOT = File.join(File.dirname(__FILE__), "tmux")
VIM_ROOT  = File.join(File.dirname(__FILE__), "vim")
FISH_ROOT = File.join(File.dirname(__FILE__), "fish")

ETC_DOT_FILES = Dir.glob("etc" +  "/*").map{ |path| File.basename(path) }

cleans = [
          ".agignore",
          ".gemrc",
          ".tigrc",
          ".gitconfig",
          ".config/peco",
          ".tmux.conf",
          ".vimrc",
          ".ideavimrc",
          ".xvimrc",
          ".config/fish"
         ]

CLEAN.concat(cleans.map { |c| File.join(HOME, c) })

task :default => :all
task :all => ["etc:link", "peco:link", "git:link", "tmux:link", "vim:link", "fish:link"]

namespace :etc do
  task :link do
    same_name_symlinks ETC_ROOT, ETC_DOT_FILES
  end
end

namespace :git do
  desc "Create symbolic link to HOME"
  task :link do
    same_name_symlinks GIT_ROOT, ["gitconfig"]
  end
end

namespace :peco do
  desc "Create symbolic link to CONFIG"
  task :link do
    symlink_ PECO_ROOT, File.join(CONFIG, "peco")
  end
end

namespace :tmux do
  desc "Create symbolic link to HOME"
  task :link do
    same_name_symlinks TMUX_ROOT, ["tmux.conf"]
  end
end

namespace :vim do
  desc "Create symbolic link to HOME"
  task :link do
    same_name_symlinks VIM_ROOT, ["vimrc", "ideavimrc", "xvimrc"]
    symlink_ File.join(VIM_ROOT, "vimrcs"), File.join(VIM, "vimrcs")
  end
end

namespace :fish do
  desc "Create symbolic link to CONFIG"
  task :link do
    symlink_ FISH_ROOT, File.join(CONFIG, "fish")
  end
end

def symlink_ file, dest
  symlink file, dest if not File.exist?(dest)
end

def same_name_symlinks root, files
  files.each do |file|
    symlink_ File.join(root, file), File.join(HOME, "." + file)
  end
end
