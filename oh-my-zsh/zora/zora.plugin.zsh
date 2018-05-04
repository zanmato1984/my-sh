function start-pd ()
{
  ./bin/pd-server --data-dir="/data/pd0" \
    --client-urls="http://0.0.0.0:2379" \
    --advertise-client-urls="http://127.0.0.1:2379" \
    --peer-urls="http://0.0.0.0:2380" \
    --advertise-peer-urls="http://127.0.0.1:2380"
}

function start-tikv ()
{
  ./bin/tikv-server --addr=0.0.0.0:20160 \
    --advertise-addr=127.0.0.1:20160 \
    --data-dir=/data/tikv0 \
    --pd=127.0.0.1:2379
}

function start-tidb ()
{
  ./bin/tidb-server --store=tikv \
    --path=127.0.0.1:2379 \
    --binlog-socket=/tmp/pump.sock
}

function start-pump ()
{
  ./bin/pump -config ./cmd/pump/pump.toml
}

function start-drainer ()
{
  ./bin/drainer -config ./cmd/drainer/drainer.toml
}

function start-mysql ()
{
  mysql -h 127.0.0.1 -P 4000 -u root -D test
}
