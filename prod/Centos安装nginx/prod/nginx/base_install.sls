file_recurse:
  file.recurse:
    - name: /data/tools
    - source: salt://nginx/file
libgd_install:
  cmd.run:
    - name: cd /data/tools&&tar xf libgd-2.2.1.tar.gz&&cd libgd-2.2.1&&export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}"&&./configure --with-zlib --with-fontconfig --with-png --with-freetype --with-jpeg&&make && make install&&cp /usr/local/lib/libgd.so.3.0.20201 /lib64/libgd.so.3
    - require:
      - file: file_recurse
libiconv_install:
  cmd.run:
    - name: cd /data/tools&&tar xf libiconv-1.14.tar.gz&&cd libiconv-1.14&&./configure&&make && make install
    - require:
      - file: file_recurse
pcre_install:
  cmd.run:
    - name: cd /data/tools&&tar xf pcre-8.38.tar.gz&&cd pcre-8.38&&./configure --prefix=/usr/local/pcre --enable-jit --enable-utf --enable-unicode-properties --enable-pcregrep-libz --enable-pcregrep-libbz2 --enable-pcre16 --enable-pcre32&&make && make install
    - unless: /usr/local/pcre
    - require:
      - file: file_recurse
qrencode_install:
  cmd.run:
    - name: cd /data/tools&&tar xf qrencode-3.4.4.tar.gz&&cd qrencode-3.4.4&&./configure --enable-thread-safety&&make && make install&&cp /usr/local/lib/libqrencode.so.3.4.4 /lib64/libqrencode.so.3
    - require:
      - file: file_recurse

