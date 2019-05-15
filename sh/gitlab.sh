#! /bin/sh

echo ">>> Checking gitlab"

if [ ! -d "/usr/local" ]; then

    echo ">>> Installing gitlab"

    cd /usr/local

    if [ ! -f "gitlab-ce-11.9.9-ce.0.el7.x86_64.rpm" ]; then
        #查看下最新版，下载最新的
        wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/gitlab-ce-11.9.9-ce.0.el7.x86_64.rpm
    fi

    rpm -i gitlab-ce-11.9.9-ce.0.el7.x86_64.rpm

    echo ">>>> start configure"

	sudo sed -i "s/http://localhost/http://localhost:8201/" /etc/gitlab/gitlab.rb

    echo ">>> restart gitlab"

    gitlab-ctl reconfigure
    gitlab-ctl restart
fi
