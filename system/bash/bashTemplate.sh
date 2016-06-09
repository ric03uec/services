#!/bin/bash

# -e fails if any error occurs
# -u error on undefined variables
# -o pipefail do not mask errors from piped commands
set -euo pipefail

# more predictable looping
IFS=$'\n\t'

execute() {
  true
}

main(){
  execute
}

main
