#!/bin/bash

if [[ $SHELL != *"bash" ]]; then
  echo "Shell is not bash."
  exit
fi

for fname in .??*; do
  if [[ -e ${HOME}/${fname} ]]; then
    cp -fv ${HOME}/${fname} ${HOME}/${fname}.backup
  fi

  ln -fnsv ${PWD}/${fname} ${HOME}/${fname}
done

. ~/.bash_profile
