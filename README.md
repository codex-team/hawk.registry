# Hawk registry

Registry is based on RabbitMQ for messaging protocol

## Hawk specifics

We have **durable exchange** `errors` from where each individual queues gets messages. e.g. nodejs errors goes to `errors/nodejs` queue via the same-named routing key

## Getting started

## Docker way

`docker-compose up` or `bin/docker_start.sh` if you don't have docker-compose

## Without docker

- Install RabbitMQ
- Enable management plugin (`rabbitmq-plugins enable rabbitmq_management`)
- Edit your configuration file (default in Linux `/etc/rabbitmq/rabbitmq.conf`)

  ```bash
  rabbitmq-plugins enable rabbitmq_management
  ```

  OR

  Import once using `rabbitmqadmin`

  ```bash
  rabbitmqadmin -q import config/rabbit.definitions.json
  ```
