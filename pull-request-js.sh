# Opens a PR window in the browser for each JS template from the branch with the
# latest onsenui to master.

set -e

VERSION=$(npm info onsenui@latest version)

for i in $(ls -1 js)
do
  URL="https://github.com/monaca-templates/$i/compare/master...onsenui-$VERSION"
  echo $URL
  firefox $URL
done
