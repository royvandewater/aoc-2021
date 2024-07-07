#!/bin/bash

main(){
  local num=$1

  if [ -z "$num" ]; then
    echo "Usage: $0 <day-number>"
    exit 1
  fi

  cp -r template "day_$num" \
  && rename -e "s/00/$num/" "day_$num"/**/* \
  && find "day_$num" -type file | xargs sed -i '' "s/00/$num/"
  && pushd "day_$num"
  && mix deps.get
  && mix compile
  && pushd
}
main "$@"
