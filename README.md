# Kafka Consul Docker

```sh
docker build --tag=lxcid/kafka-consul .
docker push lxcid/kafka-consul
```

```sh
consul-template -template "server.properties.ctmpl:server.properties" -once
```
