#! /bin/bash
while [ $# -gt 0 ]; do
  case "$1" in
    --domain=*)
      domainvariable="${1#*=}"
      ;;
    -d=*)
      domainvariable="${1#*=}"
      ;;
    --keyword=*)
      keywordvariable="${1#*=}"
      ;;
    -k=*)
      keywordvariable="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

echo "domain is";
echo $domainvariable
echo "keyword is"
echo $keywordvariable

RESULT="`wget -qO- $domainvariable`"
echo $RESULT


## CHECK IF THE KEYWORD EXISTS IN THE VARIABLE $RESULT

[[ ${RESULT,,} =~ $keywordvariable ]] && echo -n "success" || echo -n "fail"
