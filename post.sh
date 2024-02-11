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
        read -p "Enter the number of the quiz: " number
    done
    
    while [ ! "$lang" ] || [ "$lang" == "" ] ;
    do
        read -p "Enter the language of the solution(Python): " lang
    done
    
    read -p "Is it unsolved problem?(Y/n): " unsolved
    
    unsolved=$(echo "$unsolved" | tr '[:upper:]' '[:lower:]')
    
    if [[ "$unsolved" == "y" ]]; then
        file="./_posts/2024-02-11-leetcode_Unsolved.md"
        
        read -p "Enter the algorithm type of the solution: " algorithm 
        read -p "Enter the difficulty of the problem(Easy, Medium, Hard): " difficulty 
        read -p "Enter the title of the problem: " title 
        read -p "Enter the url of the problem: " url
        
        echo "**${algorithm}(${difficulty})**" >> "$file"
        echo "" >> "$file"
        echo "[${content} - ${number}. ${title}](${url})" >> "$file"
        echo "" >> "$file"
    
    else
        
        template="./_posts/template/codingtest.md"
        file="./_posts/${currentYear}-${currentMonth}-${currentDay}-${content}${number}_${lang}.md"
        
        cp "${template}" "${file}"
    
        echo "Successfully created: ${file}"
    fi
    
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
    