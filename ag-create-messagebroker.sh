pwd=$(pwd)
DOWNLOADS=downloads
KAFKA_URL=http://www.eu.apache.org/dist/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz
KAFKA_DIR=kafka_2.10-0.8.2.2
KAFKA=$pwd/$KAFKA_DIR

JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz
JAVA_DIR=jdk1.8.0_65

mkdir $DOWNLOADS

#KAFKA
wget -O $DOWNLOADS/kafka.tgz $KAFKA_URL
tar xfz $DOWNLOADS/kafka.tgz

#JDK
wget -c -O $DOWNLOADS/java.tgz --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $JAVA_URL
tar xfz $DOWNLOADS/java.tgz

rm -rf $DOWNLOADS

#SETTING PATH
echo "\nexport JAVA_HOME=$pwd/$JAVA_DIR\nexport PATH=$PATH:$pwd/$JAVA_DIR/bin\n" >> ~/.bash_profile
. ~/.bash_profile

#CONFIGURE

#START-SERVICE
sh $KAFKA/bin/zookeeper-server-start.sh $KAFKA/config/zookeeper.properties &
sh $KAFKA/bin/kafka-server-start.sh $KAFKA/config/server.properties &
