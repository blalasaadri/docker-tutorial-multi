#!/bin/bash
set -euxo pipefail

#github_org=lgtm
#my_repos="general client nginx server worker"
my_repos="general"
src_dir=./
git checkout -b monorepo-migration

for repo in $(echo $my_repos); do
  git remote add $repo file:///Users/acollinson/workspaces/workspace-schulungen/docker-and-kubernetes/114-Checkpoint/$repo
  git fetch $repo
  git read-tree --prefix=$src_dir/$repo -u $repo
  git add $src_dir/$repo
  git commit -m "Migrated $repo to $src_dir/$repo"
done

git push -u origin HEAD
