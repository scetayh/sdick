#!/bin/bash

set -ex

[ -f "scaffolds/$1.md" ] && \
[ -n "$2" ] && \
	cp -v "scaffolds/$1.md" "source/_posts/$2.md" && \
	mkdir -v "source/_posts/$2"
