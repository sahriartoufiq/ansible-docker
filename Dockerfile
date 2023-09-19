# FROM centos:latest

# # RUN yum update 
# # RUN yum -y install openssh-server
# # RUN systemctl start sshd

# RUN cd /etc/yum.repos.d/
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*


# RUN  yum update -y && yum install -y openssh-server

# EXPOSE 22

# CMD ["/usr/sbin/sshd", "-D"]

FROM centos:centos7


RUN yum install -y openssh-server
RUN ssh-keygen -A
RUN mkdir -p /root/.ssh

COPY ansible_keys.pub /root/.ssh/authorized_keys

EXPOSE 22


ENTRYPOINT ["/usr/sbin/sshd", "-D"]
