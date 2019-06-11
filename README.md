# poc-change-data-capture-debezium
PoC using Debezium (change data capture) to get technical events from updates on a mysql db

# Setup

```sh
git clone https://github.com/jantoniucci/poc-change-data-capture-debezium.git
cd poc-change-data-capture-debezium
```

# Run

On a new terminal window run:
```sh
./1.start-zookeeper.sh
```

On a new terminal window run:
```sh
./2.start-kafka.sh
```

On a new terminal window run:
```sh
./3.start-mysql.sh
```

On a new terminal window run:
```sh
./4.start-mysql-repl.sh
```

On a new terminal window run:
```sh
./5.start-kafka-connect.sh
```

On a new terminal window run:
```sh
./6.start-kafka-connect-cdc.sh
```

On a new terminal window run:
```sh
./7.start-kafka-watcher.sh
```

# Let's use it!

On the terminal running "4.start-mysql-repl.sh" type:
```sql
use inventory
```
and press enter, then:
```sql
UPDATE customers SET first_name='Anne Marie' WHERE id=1004;
```
and enter again.

You will see in the terminal running "7.start-kafka-watcher.sh" something like:
```terminal
{"schema":{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"}],"optional":false,"name":"dbserver1.inventory.customers.Key"},"payload":{"id":1004}}	{"schema":{"type":"struct","fields":[{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":true,"name":"dbserver1.inventory.customers.Value","field":"before"},{"type":"struct","fields":[{"type":"int32","optional":false,"field":"id"},{"type":"string","optional":false,"field":"first_name"},{"type":"string","optional":false,"field":"last_name"},{"type":"string","optional":false,"field":"email"}],"optional":true,"name":"dbserver1.inventory.customers.Value","field":"after"},{"type":"struct","fields":[{"type":"string","optional":true,"field":"version"},{"type":"string","optional":true,"field":"connector"},{"type":"string","optional":false,"field":"name"},{"type":"int64","optional":false,"field":"server_id"},{"type":"int64","optional":false,"field":"ts_sec"},{"type":"string","optional":true,"field":"gtid"},{"type":"string","optional":false,"field":"file"},{"type":"int64","optional":false,"field":"pos"},{"type":"int32","optional":false,"field":"row"},{"type":"boolean","optional":true,"default":false,"field":"snapshot"},{"type":"int64","optional":true,"field":"thread"},{"type":"string","optional":true,"field":"db"},{"type":"string","optional":true,"field":"table"},{"type":"string","optional":true,"field":"query"}],"optional":false,"name":"io.debezium.connector.mysql.Source","field":"source"},{"type":"string","optional":false,"field":"op"},{"type":"int64","optional":true,"field":"ts_ms"}],"optional":false,"name":"dbserver1.inventory.customers.Envelope"},"payload":{"before":{"id":1004,"first_name":"Anne Marie","last_name":"Kretchmar","email":"annek@noanswer.org"},"after":{"id":1004,"first_name":"Anne","last_name":"Kretchmar","email":"annek@noanswer.org"},"source":{"version":"0.9.5.Final","connector":"mysql","name":"dbserver1","server_id":223344,"ts_sec":1558017361,"gtid":null,"file":"mysql-bin.000003","pos":725,"row":0,"snapshot":false,"thread":2,"db":"inventory","table":"customers","query":null},"op":"u","ts_ms":1558017362001}}
```
Copy it to a json prityfier (like [jsoneditoronline.org](https://jsoneditoronline.org/)) to see a clear data structure showing the before and after change record. 

# Stop all

On a new terminal window run:
```sh
./0.stop-all.sh
```

