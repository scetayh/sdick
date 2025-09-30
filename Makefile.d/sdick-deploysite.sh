#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-only

set -ex

hexo clean
hexo generate
hexo deploy
hexo clean
for i in .deploy_git/* ; do {
	rm -rf $i
}
done
