cp -v /config.sshd /etc/ssh/ssh_config.d/lic.conf
chmod -v 640 /etc/ssh/ssh_config.d/lic.conf
ports=("${PORTS//,/ }")
IFS=',' read -r -a ports <<< "$PORTS"
FRD=""
for port in "${ports[@]}"; do
  FRD+=" -L $port:0.0.0.0:$port"
done
ssh -v -4 -t -o StrictHostKeyChecking=no $FRD -i /key.pem "$USER@$HOST" 'while true; do sleep 2; done'&
while true;
do
  sleep 2
  netstat -ltup
done
