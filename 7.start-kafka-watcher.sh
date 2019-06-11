echo -ne "\033]0;"Kafka Watcher"\007"
echo Watch kafka topic dbserver1.inventory.customers
docker run -it --name watcher --rm --link zookeeper:zookeeper --link kafka:kafka debezium/kafka:0.9 watch-topic -a -k dbserver1.inventory.customers