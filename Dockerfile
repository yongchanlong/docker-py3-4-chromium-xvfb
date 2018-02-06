FROM oraclelinux:latest
RUN yum -y update
RUN yum -y install wget yum-utils groupinstall development openssl-devel
WORKDIR /usr/src/plugins/
RUN wget https://www.python.org/ftp/python/3.4.4/Python-3.4.4.tgz
RUN tar xzf Python-3.4.4.tgz
WORKDIR /usr/src/plugins/Python-3.4.4
RUN yum -y install gcc
RUN ./configure
RUN yum -y install make
RUN make altinstall
WORKDIR /usr/src/plugins/
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN yum -y install bzip2
RUN tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin
RUN yum -y install fontconfig freetype libfreetype.so.6 libfontconfig.so.1 libstdc++.so.6
RUN wget https://pypi.python.org/packages/a5/af/923433edac3027518f2c956781d9c579a8662828eaad8f127473219aacf1/selenium-3.4.3.tar.gz#md5=da50afa759fc6fe661db33a2e7d76872
RUN tar -xvf selenium-3.4.3.tar.gz
WORKDIR /usr/src/plugins/selenium-3.4.3
RUN python3.4 setup.py install
WORKDIR /usr/src/plugins/
RUN yum -y install xorg-x11-xauth xorg-x11-utils xorg-x11-fonts-*
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python3.4 get-pip.py
RUN pip install pyvirtualdisplay
RUN wget http://vault.centos.org/6.2/os/x86_64/Packages/xorg-x11-server-Xvfb-1.10.4-6.el6.x86_64.rpm
RUN yum -y localinstall xorg-x11-server-Xvfb-1.10.4-6.el6.x86_64.rpm
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.15.0/geckodriver-v0.15.0-linux64.tar.gz
RUN tar -xvf geckodriver-v0.15.0-linux64.tar.gz
RUN cp geckodriver /usr/bin
RUN yum -y install firefox
RUN pip install PyMySQL
WORKDIR /usr/src/app
RUN unset LC_ALL LANG LC_CTYPE LC_COLLATE LC_NUMERIC LC_TIME LC_MONETARY LC_MESSAGES
RUN yum -y reinstall glibc-common
ENV LC_ALL=en_US.utf8
ENV LANG=en_US.utf8
