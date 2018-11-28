#!/bin/bash

#spousti a vypina docker compose - je to proste rychlejsi takhle :)

if [[ $1 == "start" ]];then
    sudo docker-compose down && sudo docker-compose up -d  && sudo docker-compose logs -f
elif [[ $1 == "stop" ]];then
    sudo docker-compose down
elif [[ $1 == "status" ]];then
    sudo docker ps -a
else
    echo " Use: stop   - docker-compose down
                start  - docker-compose up -d && logs -f
                status - docker ps -a
         "
fi
