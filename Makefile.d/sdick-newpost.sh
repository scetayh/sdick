#!/bin/bash
# SPDX-License-Identifier: GPL-3.0-only

# debug

# do not uncomment unless necessary
#set -x

# functions

function print_usage () {
	echo "$0 20250816"
	echo "(C) 2025 Tarikko-ScetayhChan."
	echo "Released under the GNU GPLv3."
	echo
	echo "usage: $0 <scaffold> <post name> [ <image number> ]"
	echo "Create a post of a scaffold with a certain number of images."
	echo
	echo "<scaffold>        filename in scaffolds/ without extension"
	echo "                  e.g. \`scaffolds/myscaffold.md' -> \`myscaffold'"
	echo "<post name>       name of the post, containing [a-z] [0-9] \`-' only"
	echo "                  e.g. my-post-1"
	echo "<image number>    number of images contained in the post, an integer between 0 and 999;"
	echo "                  if specified, image tag(s) will be appended in the post like this:"
	echo "                      {% image 001.jpeg download:true width: padding: bg: fancybox: %}"
	echo "                      $"
	echo "                      {% image 002.jpeg download:true width: padding: bg: fancybox: %}"
	echo "                      $"
	echo "                      ..."
	echo "                  if not specified or being 0, no tags will be appended"
}

# parameter check

[ $# -eq 0 ] && \
	print_usage && \
	exit 1

declare SCAFFOLD="$1"

[ $# -eq 1 ] && \
	echo "$0: missing post name after \`$SCAFFOLD'" && \
	exit 2

declare POST_NAME="$2"

[ $# -ge 3 ] && \
	declare IMAGE_NUMBER="$3"

[ $# -ge 4 ] && \
	echo "$0: too many arguments" && \
	exit 3

# variable check

[ ! -f "scaffolds/$SCAFFOLD.md" ] && \
	echo "$0: error: \`$SCAFFOLD' is not an valid scaffold" && \
	exit 4

[[ ! "$POST_NAME" =~ [a-z0-9\-]*$ ]] && \
	echo "$0: error: \`$POST_NAME' is not an valid post name" && \
	exit 5

[ ! "$IMAGE_NUMBER" -ge 0 ] || [ ! "$IMAGE_NUMBER" -le 999 ] && \
	echo "$0: error: \`$IMAGE_NUMBER' is not an valid image number" && \
	exit 6

# create post

cp "scaffolds/$SCAFFOLD.md" "source/_posts/$POST_NAME.md"

if [ $IMAGE_NUMBER -ne 0 ] ; then {
	{
		for (( i=1 ; i<=$IMAGE_NUMBER ; i++ )) ; do {
			if [ $i -le 9 ] ; then {
				printf "{%% image 00%s.jpeg download:true width: padding: bg: fancybox: %%}\n\n" $i
			}
			elif [ $i -le 99 ] ; then {
				printf "{%% image 0%s.jpeg download:true width: padding: bg: fancybox: %%}\n\n" $i
			}
			else {
				printf "{%% image %s.jpeg download:true width: padding: bg: fancybox: %%}\n\n" $i
			}
			fi
		} 
		done
	} >> "source/_posts/$POST_NAME.md"
}
fi

mkdir "source/_posts/$POST_NAME"
