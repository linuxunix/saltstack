include:
  - nginx.base_install
  - user.nginx
nginx_install:
  cmd.run:
    - name: cd /data/tools&&tar xf nginx-1.10.1.tar.gz&&cd nginx-1.10.1&&CFLAGS="$CFLAGS -O3" CXXFLAGS="$CXXFLAGS -O3" ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --error-log-path=/data/nginx_logs/logs/error.log --lock-path=/usr/local/nginx/var/nginx.lock --with-http_ssl_module --with-http_flv_module --with-http_addition_module --with-http_stub_status_module --with-http_gzip_static_module --with-http_degradation_module --without-http_memcached_module --with-file-aio --with-http_image_filter_module --with-http_realip_module --with-pcre=/data/tools/pcre-8.38 --with-pcre-jit --with-ld-opt="-Wl,-rpath,$LUAJIT_LIB"&&make&&make install
    - unless: test -d /usr/local/nginx
    - require:
      - user: nginx
      - file: file_recurse
      - cmd: libgd_install
      - cmd: libiconv_install
      - cmd: pcre_install
      - cmd: qrencode_install
