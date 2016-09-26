nginx:
  group.present:
    - name: nginx
    - gid: 1000
  user.present:
    - name: nginx
    - fullname: nginx
    - shell: /sbin/nginx
    - uid: 1000
    - gid: 1000

