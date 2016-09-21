# saltstack
saltstack

把centos和ubuntu系统更换阿里云yum源：

pillar_roots:
  base:
    - /etc/salt/pillar
    
    
Centos的yum位置： /etc/yum.repos.d/CentOS-Base.repo


Ubuntu的yum位置： /etc/apt/sources.list


本地yum文件位置：/etc/salt/states/files