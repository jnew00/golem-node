#!/usr/bin/sh    

cd /home/jason/golem-node

#docker-compose exec -T node golemsp status >> out.txt 2>&1
docker exec -i $(docker-compose ps -q node) golemsp status >> out.txt 2>&1
#make status
#test -t 1 && USE_TTY="-t" 
#out=$(make status)
#echo $out >> out.txt 2>&1
# cat out.txt
# echo $out

#
# if echo $out | grep -q *'ERROR'*; then
#    echo "Restarting..."
#    make restart
# else
#     echo "No need to restart, displaying status..."
#     # make status
# fi


if grep -q "ERROR" out.txt; then
    echo "Restarting..."
    make restart
else
    echo "No need to restart, displaying status..."
 #   make status
fi
rm out.txt
#
# if [[ $out != *'No service registered under given address'* ]]; then
#     echo "No need to restart, displaying status..."
#     # make status
# else
#     echo "Restarting..."
#     make restart
# fi

# if echo $out | grep -q "ERROR"
# then
#     echo "Restarting..."
#     make restart
# else
#     echo "No need to restart, displaying status..."
#     make status
# fi
