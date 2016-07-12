#! /bin/bash

wget --quiet http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz
tar xzf zookeeper-3.4.8.tar.gz -C /opt/
ln -s /opt/zookeeper-3.4.8 /opt/zookeeper

rm -rf zookeeper-3.4.8.tar.gz