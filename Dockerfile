FROM phusion/baseimage
RUN locale-gen zh_TW.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_TW.UTF-8  
ENV LANG zh_TW.UTF-8  
ENV LANGUAGE zh_TW:zh  
ENV LC_ALL zh_TW.UTF-8  
RUN apt-get update
RUN apt-get install -y curl xvfb python3 python3-pip unzip wget
RUN pip3 install --upgrade pip
RUN pip3 install selenium
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update 
RUN apt-get install -y google-chrome-stable
