{% if grains['os'] == 'CentOS' %}
filename: /etc/yum.repos.d/CentOS-Base.repo
source: salt://files/CentOS-Base.repo
cmd: yum clean all&&yum makecache&&yum update -y 

{% elif grains['os'] == 'Ubuntu' %}
filename: /etc/apt/sources.list
source: salt://files/sources.list
cmd: apt-get clean&& apt-get update update -y 
{% endif %}
