# -*- coding: utf-8 -*-
require 'rake/clean'

HOME = ENV["HOME"]
OS = `uname`

ETC_ROOT    =  File.join(File.dirname(__FILE__), "etc")
GIT_ROOT    =  File.join(File.dirname(__FILE__), "git")
TMUX_ROOT   =  File.join(File.dirname(__FILE__), "tmux")
VIM_ROOT    =  File.join(File.dirname(__FILE__), "vim")
ZSH_ROOT    =  File.join(File.dirname(__FILE__), "zsh")

ZSH_DOT_FILES  =  %w{ zshrc zshenv }
ETC_DOT_FILES  =  Dir.glob("etc" +  "/*").map{|path| File.basename(path)}

cleans = [
          ".agignore",
          ".gemrc",
          ".jshintrc",
          ".pryrc",
          ".tigrc",
          ".gitconfig",
          ".tmux.conf",
          ".vimrc",
          ".zshrc",
          ".zshenv",
          ".oh-my-zsh",
          ".oh-my-zsh-custom"
         ]

CLEAN.concat(cleans.map{|c| File.join(HOME,c)})

task :default => :all
task :all => ["etc:link", "git:link", "tmux:link", "vim:link", "zsh:link"]

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

namespace :tmux do
  desc "Create symbolic link to HOME"
  task :link do
    same_name_symlinks TMUX_ROOT, ["tmux.conf"]
  end
end

namespace :vim do
  desc "Create symbolic link to HOME"
  task :link do
    same_name_symlinks VIM_ROOT, ["vimrc"]
  end
end

namespace :zsh do
  desc "Create symbolic link to HOME/.zsh"
  task :link => [File.join(HOME,".oh-my-zsh")] do
    symlink_ File.join(ZSH_ROOT, "zshrc"), File.join(HOME, ".zshrc")
    symlink_ File.join(ZSH_ROOT, "zshenv"), File.join(HOME, ".zshenv")
    symlink_ File.join(ZSH_ROOT, "oh-my-zsh-custom"), File.join(HOME, ".oh-my-zsh-custom")
    symlink_ File.join(ZSH_ROOT, "oh-my-zsh-theme","beer.zsh-theme"), File.join(HOME,".oh-my-zsh","themes","beer.zsh-theme")
  end

  desc "Download oh-my-zsh"
  file File.join(HOME,".oh-my-zsh") do |f|
    sh "git clone https://github.com/robbyrussell/oh-my-zsh.git #{f.name}"
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
