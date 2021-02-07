elasticsearch:
  version: 7.10.1
  use_repo: True
  config:
    cluster.name: rp1
    node.name: ${HOSTNAME}
    path.data: /var/lib/elasticsearch
    path.logs: /var/log/elasticsearch
    bootstrap.memory_lock: true
    network.host: 127.0.0.1
    http.port: 9200
    discovery.zen.minimum_master_nodes: 1
    gateway.recover_after_nodes: 1
    node.max_local_storage_nodes: 1
    action.destructive_requires_name: true
  sysconfig:
    ES_STARTUP_SLEEP_TIME: 5
    ES_HEAP_SIZE: 8g
    MAX_OPEN_FILES: 65535
    ES_JAVA_OPTS: -Dlog4j2.disable.jmx=true
    ES_PATH_CONF: /etc/elasticsearch
  plugins:
    analysis-icu: analysis-icu
