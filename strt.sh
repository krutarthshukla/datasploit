#!/bin/bash
service rabbitmq-server start &
mongod --dbpath /datasploit/datasploitDb --smallfiles &
sh ./cl.sh &
python /datasploit/core/manage.py migrate &
python /datasploit/core/manage.py runserver 0.0.0.0:8000 &
