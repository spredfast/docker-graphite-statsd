#!/bin/bash

for instance in {a..h}
do
  mkdir -p /etc/service/carbon-cache-$instance
cat >/etc/service/carbon-cache-$instance/run <<EOF
#!/bin/bash

rm -f /opt/graphite/storage/carbon-cache-$instance.pid
exec /usr/bin/python /opt/graphite/bin/carbon-cache.py start --debug --instance=$instance 2>&1 >> /var/log/carbon-cache-$instance.log

EOF
  chmod +x /etc/service/carbon-cache-$instance/run
done
