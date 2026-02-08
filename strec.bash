#!/bin/bash

FOLDER=~/.recinstall
MDEXT=md

# Add Markdown code blocks
addmkcb(){
  histoname=${1:-".histo"}
  if [ -f "${FOLDER}/${histoname}" ]
  then
    fname=${2:-".session1"}
    fname=${fname}.${MDEXT}
    cblang=${3:-"powershell"} # code block language
    if [ "$cblang" = "bash" ]
    then
      cblang="powershell"
    fi
    tcblang='```'${cblang}
    echo "${tcblang}" > ${FOLDER}/${fname}
    cat ${FOLDER}/${histoname} >> ${FOLDER}/${fname}
    echo '```' >> ${FOLDER}/${fname}
  fi
}

# Copy history session from RAM history buffer to input file
cphisto(){
  histoname=${1:-".histo"}
  if [ ! -d  "${FOLDER}" ]
  then
    echo "THEN  ${FOLDER}/${histoname}"
    mkdir ${FOLDER}
    touch ${FOLDER}/${histoname}
  else
    echo "ELSE  ${FOLDER}/${histoname}"
    touch  ${FOLDER}/${histoname}
  fi
  history -d 1 && history -d -1
  history -a ${FOLDER}/${histoname}
}
