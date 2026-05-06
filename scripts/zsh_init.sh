#!/usr/bin/env bash

if [ -n "${BASH_VERSION:-}" ]; then
  script_path="${BASH_SOURCE[0]}"
elif [ -n "${ZSH_VERSION:-}" ]; then
  script_path="${(%):-%x}"
else
  script_path="$0"
fi

script_dir="$(cd -- "$(dirname -- "$script_path")" && pwd)"
bash "$script_dir/setup.sh" zsh-init
