#!/bin/bash

export TOKEN=YOUR WALLARM NODE TOKEN

sudo -E docker-compose build
sudo -E docker-compose up -d dvwa fast selenium
sudo -E docker-compose run --use-aliases --service-ports test
sudo -E docker-compose run --rm -e CI_MODE=testing -e TEST_RUN_URI=http://dvwa:80 fast
sudo -E docker-compose down
