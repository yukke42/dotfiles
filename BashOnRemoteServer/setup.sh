#!/bin/bash

if [[ $SHELL != *"bash" ]]; then
  echo "Shell is not bash."
  exit
fi

for fname in .??*; do
  diff <(grep -v '^#' ${HOME}/${fname} | grep -v '^$') <(grep -v '^#' ${fname} | grep -v '^$')
  [ $diff ] && continue
  [ -L ${HOME}/${fname} ] && continue
  if [[ -e ${HOME}/${fname} ]]; then
    cp -fv ${HOME}/${fname} ${HOME}/${fname}.backup
  fi

  ln -fnsv ${PWD}/${fname} ${HOME}/${fname}
done

. ~/.bash_profile
