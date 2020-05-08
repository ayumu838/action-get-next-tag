#!/bin/sh

set -e

git fetch --tags
git fetch --prune --unshallow

latest_tag=$(git tag | sort -r | head -n 1)
today=$(date "+%Y%m%d")
tag_date=${latest_tag:0:8}

if [ $tag_date = $today ]; then
    tag_number=${latest_tag:9:10}
    next_number=`printf '%02d' $((tag_number + 1))`

    next_tag="${tag_date}_${next_number}"
else
    next_tag="${today}_01"
fi
echo "::set-output name=next-tag::${next_tag}"
