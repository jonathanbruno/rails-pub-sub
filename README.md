# Rails PubSub

This is a test project, a case study of rails pub/sub approach, it runs on the top of Docker.

### Installation

Rails PubSub requires Docker and docker compose.

Build and Run the containers with:

```sh
$ docker-compose up --build
$ docker-compose run app rails db:migrate
```

### Gem

The pub/sub approach is built using the gem Wisper

### Business

It is an order management system, the user can paid/cancel orders, each of these actions will triggers different actions that will be handled using the pub/sub approach.
