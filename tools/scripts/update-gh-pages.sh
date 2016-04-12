#!/usr/bin/env bash

# Go to top of tree
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../
cd "$dir" || exit 1

# What's our current rev?
cur=$(git rev-parse HEAD)

# Clone the current GitHub repo
git clone $(git config --get remote.origin.url language)

# Hard reset to $cur on the clone (in case of fast-forwards)
cd language || exit 1
git reset --hard $cur

# Switch branches
git checkout gh-pages

# Automerge
git merge master -m "OpenBEL Build Server gh-pages autoupdate"

# And push
git push origin gh-pages

