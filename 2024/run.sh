#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

if [ -z "$1" ]; then
  echo "Provide a day number (1-25)";
  exit 1;
fi

if ! [[ $1 =~ ^[0-9]+$ ]]; then
  echo "Input is not a valid number";
  exit 1;
fi

DAY_NUMBER=$1

if [ "$DAY_NUMBER" -le 0 ] || [ "$DAY_NUMBER" -ge 25 ]; then
  echo "Day number ($1) is not between 1-25";
  exit 1;
fi

BASENAME="day-$1"

if [ ! -e "$SCRIPT_DIR/$BASENAME" ]; then
  echo "Day $1 has not been completed"
  exit 1;
fi

echo "Compiling $BASENAME";
echo "Compiling with: clang -I$SCRIPT_DIR/utils $SCRIPT_DIR/$BASENAME/main.c $SCRIPT_DIR/utils/path_util.c -o $SCRIPT_DIR/$BASENAME/main"
clang -I"$SCRIPT_DIR/utils" "$SCRIPT_DIR/$BASENAME/main.c" "$SCRIPT_DIR/utils/path_util.c" -o "$SCRIPT_DIR/$BASENAME/main"

if [ $? -eq 0 ]; then
  echo "Compilation successful. Running $BASENAME...";
  echo "$SCRIPT_DIR/$BASENAME/main"
  "$SCRIPT_DIR/$BASENAME/main";
else
  echo "Compilation failed"
fi

