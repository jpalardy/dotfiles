#!/bin/sh

tidy -q -e $1
error_code_tidy=$?

if [ $error_code_tidy -ne 0 ]; then
  echo "-------------------------------------------------"
fi

xmllint --html $1 > /dev/null
error_code_xmllint=$?

if [ $error_code_tidy -eq 0 -a $error_code_xmllint -eq 0 ]; then
  echo "OK"
fi

