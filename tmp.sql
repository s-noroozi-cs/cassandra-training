To improve read performance as well as to utilize disk space, Cassandra periodically does compaction to create & use new consolidated SSTable files instead of multiple old SSTables.

You can configure two types of compaction to run periodically: SizeTieredCompactionStrategy and LeveledCompactionStrategy.

SizeTieredCompactionStrategy is designed for write-intensive workloads
LeveledCompactionStrategy for read-intensive workloads

https://azureserv.com/cassandra-internals-architecture-9824897ff11e?__cpo=aHR0cHM6Ly9kYXRheHNjaG9vbC5tZWRpdW0uY29t#bypass

To improve read performance as well as to utilize disk space, Cassandra periodically does compaction to create & use new consolidated SSTable files instead of multiple old SSTables.

You can configure two types of compaction to run periodically: SizeTieredCompactionStrategy and LeveledCompactionStrategy.

SizeTieredCompactionStrategy is designed for write-intensive workloads
LeveledCompactionStrategy for read-intensive workloads

