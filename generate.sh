#!/bin/bash

main(){
  local num=$1

  if [ -z "$num" ]; then
    echo "Usage: $0 <day-number>"
    exit 1
  fi

  cp -r template "day_$num" \
  && rename -e "s/template/day_$num/" "day_$num"/**/* \
  && sed -i '' "s/00/$num/" "day_$num"/**/*
}
main "$@"
