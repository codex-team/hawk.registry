#!/bin/bash

DIR=$(dirname "$(readlink -f "$0")")
DEFINITIONS=$(readlink -f "$DIR/../config/rabbit.definitions.json")

docker run -d \
        --name rabbitmq \
        -p 15672:15672 \
        -p 5672:5672 \
        -v "$DEFINITIONS:/tmp/rabbit.definitions.json:ro" \
        -e RABBITMQ_SERVER_ADDITIONAL_ERL_ARGS="-rabbitmq_management load_definitions \"/tmp/rabbit.definitions.json\"" \
        rabbitmq:3-management