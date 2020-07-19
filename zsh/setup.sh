#!/bin/bash


if [[ $SHELL != *"zsh" ]]; then
  echo "shell is not zsh"
  exit
fi

for f in .??* $(uname)/.??*; do
  [ $f == ".git" ] && continue
  [ $f == ".gitignore" ] && continue

  ln -fnsv $PWD/$f ~/$(basename $f)
done
