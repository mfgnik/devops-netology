#!/bin/bash
# display command line options

count=1
for param in "$@"; do
<<<<<<< HEAD
    echo "\$@ Parameter #$count = $param"
=======
    echo "Next parameter: $param"
>>>>>>> d588f6f... git-rebase 2
    count=$(( $count + 1 ))
done

echo "====="