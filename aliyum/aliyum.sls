/etc/yum.repos.d/CentOS-Base.repo:
  file.managed:
    - source:
      - salt://files/CentOS-Base.repo
      - user: root
      - group: root
      - mode: 644
yum_running:
  cmd.run:
    - name: yum clean all&&yum makecache&&yum update
    - require:
      - file: /etc/yum.repos.d/CentOS-Base.repo
