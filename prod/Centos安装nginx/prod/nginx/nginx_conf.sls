nginx_conf:
  file.managed:
    - name: /usr/local/nginx/conf/nginx.conf
    - source: salt://nginx/nginx.conf
    - template: jinja
  cmd.run:
    - name: killall nginx&&/usr/local/nginx/sbin/nginx 
