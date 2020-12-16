#!/bin/sh

source .scripts/spec.sh --source-only

DATE=`date "+%Y/%m/%d %T"`
ID=02
ID_CODE=":two:"
FILE="programme"
OK="| ${ID_CODE} | [:bookmark:](${ID}/${FILE}.py) | :tada: | ${DATE} | "
KO="| ${ID_CODE} | [:bookmark:](${ID}/${FILE}.py) | :x:    | ${DATE} | "
if [ -f "${FILE}.py" ]; then
    generate_spec
    pytest .scripts/${FILE}0000.py 2>&1 >  /dev/null
    RES=`echo $?`
    if [ $RES = 0 ]; then
        echo ${OK}
    else
        echo ${KO}
    fi
else
    echo ${KO}
fi

