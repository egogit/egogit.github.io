#!/bin/bash

currentYear=$(date '+%Y')
currentMonth=$(date '+%m')
currentDay=$(date '+%d')

read -p "Enter the content(leetcode,FintechMan,Error,programmers): " content

if [ "${content}" == "leetcode" ] || [ "${content}" == "programmers" ]; then
    number=0
    lang=""
    
    while [ ! $number ] || [ $number -le 0 ] ;
    do
        read -p "Enter the number of quiz: " number
    done
    
    while [ ! "$lang" ] || [ "$lang" == "" ] ;
    do
        read -p "Enter the language of solution(Python): " lang
    done
    
    template="./_posts/template/codingtest.md"
    file="./_posts/${currentYear}-${currentMonth}-${currentDay}-${content}${number}_${lang}.md"
    
    cp "${template}" "${file}"
    echo "Successfully created: ${file}" 
    
    
elif [ "${content}" == "FintechMan" ]; then
    number=0
    
    while [ ! $number ] || [ $number -le 0 ] ;
    do
        read -p "Enter the number of post: " number
    done
    
    template="./_posts/template/fintechman.md"
    file="./_posts/${currentYear}-${currentMonth}-${currentDay}-${content}_${number}.md"
    
    cp "${template}" "${file}"
    echo "Successfully created: ${file}" 
    
    
elif [ "${content}" == "Error" ]; then
    number=0
    
    while [ ! $number ] || [ $number -le 0 ] ;
    do
        read -p "Enter the number of post: " number
    done
    
    template="./_posts/template/error.md"
    file="./_posts/${currentYear}-${currentMonth}-${currentDay}-${content}_${number}.md"
    
    cp "${template}" "${file}"
    echo "Successfully created: ${file}" 
    
    
else
    read -p "Enter the name of post: " filename
    
    file="./_posts/${filename}.md"
    
    touch "${file}"
    echo "Successfully created: ${file}" 
    
fi
    
