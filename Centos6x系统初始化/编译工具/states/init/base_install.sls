base_install:
  cmd.run:
    - name: yum -y install ntp* wget zip unzip lrzsz lsof lzo vim* sysstat make gcc gcc-c++ g++ ncurses-devel pcre-devel pcre perl zlib zlib-devel openssl openssl-devel gd gd-devel libevent libjpeg libjpeg-devel libpng libpng-devel libvpx libvpx-devel libXpm libXpm-devel libxml2 libxml2-devel fontconfig fontconfig-devel freetype freetype-devel bzip2 bzip2-devel curl curl-devel

file_recurse:
  file.recurse:
    - name: /data/tools
    - source: salt://init/files/make_tool

autoconf_install:
  cmd.run:
    - name: cd /data/tools&&tar xf autoconf-2.69.tar.gz&&cd autoconf-2.69&&./configure&&make&&make install
    - require:
      - file: file_recurse
      - cmd: base_install

automake_install:
  cmd.run:
    - name: cd /data/tools&&tar xf automake-1.15.tar.gz&&cd automake-1.15&&./configure&&make&&make install
    - require:
      - file: file_recurse
      - cmd: base_install
      - cmd: autoconf_install

libtool_install:
  cmd.run:
    - name: cd /data/tools&&tar xf libtool-2.4.6.tar.gz&&cd libtool-2.4.6&&./configure&&make&&make install
    - require:
      - file: file_recurse
      - cmd: base_install
