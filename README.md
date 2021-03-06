# Hawk registry

Registry is based on RabbitMQ for messaging protocol

## Hawk specifics

We have **durable exchange** `errors` from where each individual queues gets messages. e.g. nodejs errors goes to `errors/nodejs` queue via the same-named routing key

For handling invalid messages we have dead-letter exchange `stash`. `stash` policy is defined which is applicable to all queues matching `errors/*`. It sets dead-letter exchange to `stash`.

> Remember to create `stash/<language_name>` queues similarly to `errors/<language_name>` and make binds in `stash` exchange:
>
> ```
> Destination: `stash/<language_name>`
> Routing key: `errors/<language_name>`
> ```

| Queue                   | Description                                        |
| ----------------------- | -------------------------------------------------- |
| `errors/<languae_name>` | Queues for errors                                  |
| `stash/<language_name>` | Queues for invalid errors                          |
| `log`                   | Queue for logging worker (notify to telegram, etc) |

| Exchange | Description                                                                             |
| -------- | --------------------------------------------------------------------------------------- |
| `errors` | Main exchange for errors, routes to `errors/<language_name>` via same-named routing key |
| `stash`  | Dead-letter exchange for invalid errors of `errors/*` queues                            |

## Getting started

## Docker way

`docker-compose up` or `bin/docker_start.sh` if you don't have docker-compose

## Without docker

- Install RabbitMQ
- Enable management plugin (`rabbitmq-plugins enable rabbitmq_management`)
- Edit your configuration file (default in Linux `/etc/rabbitmq/rabbitmq.conf`)

  ```
  management.load_definitions = /path/to/definitions/rabbit.definitions.json
  ```

  OR

  Import once using `rabbitmqadmin`

  ```bash
  rabbitmqadmin -q import config/rabbit.definitions.json
  ```
