echo -ne "\033]0;"STOP ALL"\007"
echo Stopping all
docker stop mysqlterm watcher connect mysql kafka zookeeper
echo .
echo All stoped
docker ps -a
