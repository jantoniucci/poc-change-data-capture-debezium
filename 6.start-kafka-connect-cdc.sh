echo -ne "\033]0;"Kafka Connect CDC"\007"
echo Kafka connect - version:
curl -H "Accept:application/json" localhost:8083/
echo .
echo Kafka connect - current connectors:
curl -H "Accept:application/json" localhost:8083/connectors/
echo .
echo Kafka connect - configuring CDC:
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ --data "@kafka-connect-config.json"
echo .
echo Kafka connect - current connectors:
curl -H "Accept:application/json" localhost:8083/connectors/
echo .
echo Kafka connect - current CDC connector:
curl -i -X GET -H "Accept:application/json" localhost:8083/connectors/inventory-connector
