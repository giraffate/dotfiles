#!/bin/zsh

DOT_FILES=( .gitconfig .gitignore_global .emacs.d )
for file in ${DOT_FILES[@]}
do
  ln -sf $HOME/dotfiles/$file $HOME/$file
done