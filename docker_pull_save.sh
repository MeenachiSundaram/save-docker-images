#!/bin/bash

#name=($@)
name=(`cat Docker_pull_list`)

for (( i=0;i<${#name[@]}; i++ ))
        do
                docker pull ${name[$i]}
                if [ $? -eq 0 ]; then
                        rename=$(sed 's/-/_/g' <<< ${name[$i]} )
                        echo $rename
                        docker save ${name[$i]} $rename.tar
                fi
done
