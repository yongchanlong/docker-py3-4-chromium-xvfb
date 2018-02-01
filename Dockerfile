FROM phusion/baseimage
RUN locale-gen zh_TW.UTF-8 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_TW.UTF-8  
ENV LANG zh_TW.UTF-8  
ENV LANGUAGE zh_TW:zh  
ENV LC_ALL zh_TW.UTF-8  
RUN apt-get update
RUN apt-get install -y curl xvfb
RUN apt-get install -y python3 python3-pip
