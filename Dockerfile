FROM centos:6.6
MAINTAINER Grady Wong<wgqimut@gmail.com>

RUN yum install -y java-1.7.0-openjdk.x86_64
ENV JAVA_HOME=/usr/

RUN yum install -y wget
RUN yum install -y nc
RUN yum install -y tar

RUN mkdir /hbase-setup
WORKDIR /hbase-setup

ADD ./install-hbase.sh /hbase-setup/
RUN chmod +x install-hbase.sh
RUN ./install-hbase.sh

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml

ADD ./install-zookeeper.sh /hbase-setup/
RUN chmod +x install-zookeeper.sh
RUN ./install-zookeeper.sh

ADD zoo.cfg /op/zookeeper/conf/zoo.cfg

# zookeeper
EXPOSE 2181 2888 3888
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

WORKDIR /opt/

VOLUME ["/opt/data/zookeeper", "/opt/data/hbase"]
ADD start.sh /opt/
RUN chmod +x start.sh

CMD /opt/start.sh
