#!/usr/bin/env bash

# Go to top of tree
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../
cd "$dir" || exit 1

# What's our current rev?
cur=$(git rev-parse HEAD) || exit 1

# Clone the current GitHub repo
git clone github.com:OpenBEL/language.git language || exit 1

# Copy web content
cp -a web/* language || exit 1

# Hard reset to $cur on the clone (in case of fast-forwards)
cd language || exit 1
git reset --hard $cur || exit 1

# Switch branches
git checkout gh-pages || exit 1

# Automerge
git merge master -m "OpenBEL Build Server gh-pages autoupdate" || exit 1

# And push
git push origin gh-pages || exit 1

# Cleanup, back to top of tree
cd "$dir" || exit 1
rm -fr "language"
