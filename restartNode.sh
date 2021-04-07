#!/bin/bash    

cd /home/jason/golem-node

#out=$(docker-compose exec node golemsp status)
#make status
#test -t 1 && USE_TTY="-T" 
out=$(make status)
# echo $out >> out.txt
# cat out.txt
echo $out


# if echo $out | grep -q *'ERROR golemsp'*; then
#    echo "Restarting..."
#    make restart
# else
#     echo "No need to restart, displaying status..."
#     make status
# fi


if [[ $out != *'No service registered under given address'* ]]; then
    echo "No need to restart, displaying status..."
    make status
else
    echo "Restarting..."
    make restart
fi
