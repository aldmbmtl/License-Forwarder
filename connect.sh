cp -v /config.sshd /etc/ssh/ssh_config.d/lic.conf
chmod -v 640 /etc/ssh/ssh_config.d/lic.conf

ssh -v -4 -t \
  -o StrictHostKeyChecking=no\
  -o ForwardAgent=yes\
  -o TCPKeepAlive=yes\
  -L 4101:0.0.0.0:4101 \
  -L 4102:0.0.0.0:4102 \
  -L 37172:0.0.0.0:37172 \
  -i /key.pem centos@54.242.3.91 \
  'while true; do sleep 2; done'&

while true;
do
  sleep 2
  netstat -ltup
done
