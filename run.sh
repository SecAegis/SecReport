#!/usr/bin/env bash

downloadSelf(){
    if [ ! -f "run.sh" ]; then
        wget https://raw.githubusercontent.com/SecAegis/SecReport/main/run.sh -O run.sh
        chmod +x run.sh
    fi
}

downloadDockerCompose(){
    if [ ! -f "docker-compose.yml" ]; then
        if curl -s http://cip.cc | grep -q "中国"; then
            wget https://raw.githubusercontent.com/SecAegis/SecReport/main/docker-compose_cn.yml -O docker-compose.yml
        else
            wget https://raw.githubusercontent.com/SecAegis/SecReport/main/docker-compose.yml -O docker-compose.yml
        fi
    fi
}

createPassword(){
    if [ ! -f "mongodb_password.txt" ]; then
        echo -n $(uuidgen |sed 's/-//g') > mongodb_password.txt
    fi
    if [ ! -f "redis_password.txt" ]; then
        echo -n $(uuidgen |sed 's/-//g') > redis_password.txt
    fi
    if [ ! -f "s3_password.txt" ]; then
        echo -n $(uuidgen |sed 's/-//g') > s3_password.txt
    fi
    if [ ! -f "editor_sync_password.txt" ]; then
        echo -n $(uuidgen |sed 's/-//g') > editor_sync_password.txt
    fi
}

exec() {
    if [ "$1" = "addUser" ]
    then
        docker compose exec sec-report /sec_report $1 $2 $3 $4 $5 $6 $7
    elif [ "$1" = "changeUserPassword" ]
    then
        docker compose exec sec-report /sec_report $1 $2 $3 $4 $5
    elif [ "$1" = "setBasisLogin" ]
    then
        docker compose exec sec-report /sec_report $1 $2 $3
    fi
}

run(){
    downloadDockerCompose
    createPassword
    docker compose up -d
}

stop(){
    docker compose down
}

update(){
    if [ -f "docker-compose.yml" ]; then
         rm docker-compose.yml
         downloadDockerCompose
    fi
    if [ -f "run.sh" ]; then
         rm run.sh
         downloadSelf
    fi
    docker compose pull
}

if [ "$1" = "stop" ]
then
    stop
    exit
elif [ "$1" = "update" ]
then
    update
    exit
elif [ "$1" = "exec" ]
then
    exec $2 $3 $4 $5 $6 $7 $8
    exit
fi

run
