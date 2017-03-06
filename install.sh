#!/bin/bash -eux

log() {
  echo "******************************************************************"
  echo "  $*"
  echo "******************************************************************"
}

clear_tmpdir() {
  cd /
  rm -rf "$tmpdir"
}
tmpdir=$(mktemp -d)
trap clear_tmpdir EXIT

cd "$tmpdir" || exit

git clone https://github.com/onebilltech/osx-config-check.git
cd osx-config-check

log Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

log Installing Apps
brew bundle

log Configuring Security checks
python app.py --disable-prompt
