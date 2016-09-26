sysctl:
  file.managed:
    - name: /etc/sysctl.conf
    - source: salt://file/sysctl.conf
  cmd.wait:
    - name: sysctl -p
    - watch: 
      - file: sysctl
