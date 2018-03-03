#!/bin/bash


if [[ $SHELL != *"zsh" ]]; then
  echo "shell is not zsh"
  exit
fi

for f in .??* $(uname)/.??*; do
  [ $f == ".git" ] && continue
  [ $f == ".gitignore" ] && continue
  [ $f == ".gitmodules" ] && continue

  ln -fnsv $PWD/$f ~/$(basename $f)
done

if type vim > /dev/null 2>&1; then
  vim +PluginInstall +qall
fi
