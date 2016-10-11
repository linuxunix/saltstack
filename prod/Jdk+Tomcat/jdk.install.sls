jdk-install:
  file.managed:
    - name: /usr/local/src/jdk-7u80-linux-x64.tar.gz
    - source: salt://jdk/files/jdk-7u80-linux-x64.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xf jdk-7u80-linux-x64.tar.gz && mv jdk1.7.0_80 /usr/local/jdk1.7 && chown root:root -R /usr/local/jdk1.7
    - unless: test -d /usr/local/jdk1.7
    - require:
      - file: jdk-install

jdk-config:
  file.append:
    - name: /etc/profile
    - text:
      - export JAVA_HOME=/usr/local/jdk1.7
      - export JAVA_BIN=$JAVA_HOME/bin
      - export PATH=$PATH:$JAVA_HOME/bin
      - export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
      - export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
  cmd.run:
    - name: source /etc/profile
    - require:
      - file: jdk-install

