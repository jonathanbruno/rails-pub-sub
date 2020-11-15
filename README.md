# Rails PubSub

This is a test project, a case study of rails pub/sub approach, it runs on the top of Docker, using RabbitMQ, Bunny and Hutch gem

### Installation

Rails PubSub requires Docker and docker compose.

Build and Run the containers with:

```sh
$ docker-compose up --build
$ docker-compose run app rails db:migrate
```

Run the hutch consumers:

```sh
$ hutch --config config/hutch.yml
```

I'm not running the consumers inside docker, just to make it easier to test one or more consumers.

### Business

It is an order management system, the user can paid/cancel orders, each of these actions will triggers different actions that will be handled by RabbitMQ.
