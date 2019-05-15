#! /bin/sh

echo ">>> Checking JAVA8"

if [ -d "/usr/local" ]; then

    echo ">>> Installing JAVA8"

    cd /usr/local

    if [ ! -f "jdk-8u141-linux-x64.tar.gz" ]; then
        wget --no-cookies \
            --no-check-certificate \
            --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; \
            oraclelicense=accept-securebackup-cookie" \
            "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
    fi

    if [ ! -d "jdk1.8.0_141" ]; then
        tar xzf jdk-8u141-linux-x64.tar.gz
    fi

    mv jdk1.8.0_141 /usr/local/java8

    echo ">>>> start configure"

	echo "JAVA_HOME=/usr/local/java8" >> /etc/profile
	echo "JRE_HOME=\$JAVA_HOME/jre" >> /etc/profile
	echo "PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile
	echo "CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
	echo "export JAVA_HOME" >> /etc/profile
	echo "export JRE_HOME" >> /etc/profile
	echo "export PATH" >> /etc/profile
	echo "export CLASSPATH" >> /etc/profile

    source /etc/profile

    echo ">>>java8 installed"

    java -version
fi
