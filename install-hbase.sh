#! /bin/sh

wget --quiet http://apache.fayea.com/hbase/1.1.5/hbase-1.1.5-bin.tar.gz
tar xzf hbase-1.1.5-bin.tar.gz -C /opt/
ln -s /opt/hbase-1.1.5 /opt/hbase

rm -rf hbase-1.1.5-bin.tar.gz 
