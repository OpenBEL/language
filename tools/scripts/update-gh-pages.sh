#!/usr/bin/env bash

# Go to top of tree
dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/../../
cd "$dir" || exit 1

# What's our current rev?
cur=$(git rev-parse HEAD) || exit 1

# Clone the current GitHub repo
git clone github.com:OpenBEL/language.git language || exit 1

# Hard reset to $cur on the clone (in case of later commits)
cd language || exit 1
git reset --hard $cur || exit 1

# Switch branches
git checkout gh-pages || exit 1

# Merge
git merge master -m "OpenBEL Build Server merge from master" || exit 1

# Build artifacts
./tools/scripts/build-using-asciidoctor.sh || exit 1

# Update artifacts
git add *
git commit --all -m "OpenBEL Build Server gh-pages update" || exit 1

# And push
git push origin gh-pages || exit 1

# Cleanup, back to top of tree
cd "$dir" || exit 1
rm -fr "language"
