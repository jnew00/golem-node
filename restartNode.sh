#!/bin/bash    

cd /home/jason/golem-node

#out=$(docker-compose exec node golemsp status)
#make status
out=$(docker-compose exec node golemsp status)
# echo $out >> out.txt
# cat out.txt


# if docker-compose exec node golemsp status | grep -q *'ERROR golemsp'*; then
#    echo "Restarting..."
#    make restart
# else
#     echo "No need to restart, displaying status..."
#     make status
# fi


if [[ $out == *"No service registered under given address"* ]]; then
   make restart
fi