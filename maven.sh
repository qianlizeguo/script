#! /bin/bash

echo ">>> Checking maven"

if [ ! -d "/usr/local" ]; then

    echo ">>> Installing maven"

    cd /usr/local

    if [ ! -f "apache-maven-3.1.1-bin.tar.gz" ]; then
        wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
    fi

    if [ ! -d "apache-maven-3.1.1" ]; then
        tar xzf apache-maven-3.1.1-bin.tar.gz
    fi

    mv apache-maven-3.1.1 /usr/local/maven3

    echo ">>>> start configure"

    echo "export M2_HOME=/usr/local/maven3" >> /etc/profile
    echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$M2_HOME/bin" >> /etc/profile

    source /etc/profile

    echo ">>>maven installed"

    mvn -v
fi
