#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-only

set -ex

git add .
git commit -a
git push --set-upstream origin main
