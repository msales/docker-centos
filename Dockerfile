FROM centos:7

LABEL maintainer="lukasz.gogolin@msales.com"

LABEL io.k8s.description="CentOS 7" \
      io.k8s.display-name="CentOS 7" \
      io.openshift.tags="centos,centos7"

ENV USER_NAME=centos \
    USER_HOME=/opt/app-root

ADD files/entrypoint.sh /opt/sys/
ADD files/env.sh /etc/profile.d/

RUN yum install -y epel-release \
 && yum update -y \
 && yum install -y nss_wrapper wget \
 && yum clean all -y

RUN mkdir -p /opt/app-root /opt/sys \
    && adduser -d /opt/app-root -u 1001 builder \
    && chown -R builder:root /opt/app-root /opt/sys \
    && chmod -R g+w /opt/app-root /opt/sys

ENTRYPOINT [ "/opt/sys/entrypoint.sh" ]