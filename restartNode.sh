#!/usr/bin/bash    

cd /home/jason/golem-node

out=$(docker-compose exec $USE_TTY node golemsp status)
#make status
test -t 1 && USE_TTY="-t" 
#out=$(make status)
# echo $out >> out.txt
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

#
if [[ $out != *'No service registered under given address'* ]]; then
    echo "No need to restart, displaying status..."
    # make status
else
    echo "Restarting..."
    make restart
fi

# if echo $out | grep -q "ERROR"
# then
#     echo "Restarting..."
#     make restart
# else
#     echo "No need to restart, displaying status..."
#     make status
# fi
