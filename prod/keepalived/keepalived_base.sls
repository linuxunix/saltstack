/etc/keepalived:
  file.directory:
    - mode: 755
    - makedirs: True

/etc/keepalived/check_nginx.sh:
  file.managed:
    - source: salt://keepalived/file/check_nginx.sh
    - user: root
    - group: root
    - mode: 755

/etc/keepalived/keepalived.conf: 
  file.managed:
    - template: jinja
    - source: salt://keepalived/file/keepalived.conf
