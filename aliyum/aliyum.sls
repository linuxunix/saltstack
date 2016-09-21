yum_config:
  file.managed:
    - template: jinja 
    - name: {{ pillar['filename'] }}  
    - source:
      - {{ pillar['source'] }}
      - user: root
      - group: root
      - mode: 644
yum_running:
  cmd.run:
    - template: jinja 
    - name: {{ pillar['cmd'] }}  
    - require:
      - file: yum_config
