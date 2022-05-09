# Downloads the latest version of onsenui from npm and commits it to each JS
# template in a new branch.
#
# After running this check that each template is working properly then push.

set -e

VERSION=$(npm info onsenui@latest version)

npm i -g --prefix . onsenui@latest

for i in js/*
do
  pushd $i
  git checkout -b "onsenui-$VERSION"
  rm -r www/lib/onsenui
  cp -r ../../lib/node_modules/onsenui www/lib
  git add www
  git commit -m "Bump onsenui $VERSION"
  popd
done

rm -r lib
