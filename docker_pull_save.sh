#!/bin/bash

#name=($@)
name=(`cat Docker_pull_list`)

for (( i=0;i<${#name[@]}; i++ ))
        do
                docker pull ${name[$i]}
                if [ $? -eq 0 ]; then
                        rename=$(sed 's/\//_/g' <<< ${name[$i]} | sed 's/:/#/g' )
                        echo $rename
                        docker save ${name[$i]} > ./docker-local-images/$rename.tar
                fi
done
