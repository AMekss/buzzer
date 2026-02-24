# GraphQL in the Real World (code examples)

Simple Rails application implementing a GraphQL API containing the code examples used in the "GraphQL in the Real World" presentation.

Buzzer is a fictional messaging app where participants can join conversations and exchange messages — a minimal domain to demonstrate real-world GraphQL patterns.

### Dependencies
- [Docker](https://docs.docker.com/desktop/)
- [Docker Compose](https://docs.docker.com/compose/)

### Install
Use the following commands to install:
```shell
docker compose build
docker compose run --rm -it buzzer bash
rails db:reset
exit
```

### Start
To run the application, use the following command:
```shell
docker compose up buzzer
```

This will start the Rails application inside a Docker container and set up port forwarding for port 3000 on your host (make sure that port is free).

### Explore
- GraphiQL playground: [http://localhost:3000/graphiql](http://localhost:3000/graphiql)
- A Postman collection is also included at `postman/Buzzer API.postman_collection.json`
