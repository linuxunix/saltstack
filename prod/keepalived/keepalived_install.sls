keepalived_install:
  file.managed:
    - name: /data/tools/keepalived-1.2.23.tar.gz
    - source: salt://keepalived/file/keepalived-1.2.23.tar.gz
  cmd.run:
    - name: cd /data/tools&&tar xvzf keepalived-1.2.23.tar.gz&&cd keepalived-1.2.23&&./configure  --prefix=/usr/local/keepalived&&make &&make install&&cp /usr/local/keepalived/etc/sysconfig/keepalived  /etc/sysconfig/keepalived&&mkdir /etc/keepalived &&ln -s /usr/local/keepalived/etc/keepalived/keepalived.conf  /etc/keepalived/&&cp /usr/local/keepalived/sbin/keepalived /usr/sbin/&&cp /usr/local/keepalived/etc/rc.d/init.d/keepalived  /etc/rc.d/init.d/&&chmod +x /etc/rc.d/init.d/keepalived&&chkconfig keepalived on
