tomcat-install:
  file.managed:
    - name: /usr/local/src/apache-tomcat-8.0.36.tar.gz
    - source: salt://tomcat/files/apache-tomcat-8.0.36.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src/ && tar xf apache-tomcat-8.0.36.tar.gz && mv apache-tomcat-8.0.36 /usr/local/tomcat8
    - unless: test -d /usr/local/tomcat8

tomcat-config:
  file.append:
    - name: /etc/profile
    - text:
      - export TOMCAT_HOME=/usr/local/tomcat8
      - export CATALINA_HOME=/usr/local/tomcat8
  cmd.run:
    - name: source /etc/profile
    - require:
      - file: tomcat-install


