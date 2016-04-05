FROM jenkins:latest
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

# We need to be root and running docker inside of jenkins also need root
USER root
# Install Docker
RUN apt-get update --fix-missing && apt-get install -qqy docker.io && \
        ln -sf /usr/bin/docker /usr/local/bin/docker

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -qqy python3 python3-dev python-distribute python3-pip
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -qqy libssl-dev libffi-dev python3-dev vim-tiny sudo
RUN pip3 install awscli pyopenssl
RUN ln -sf /var/jenkins_home/.dockercfg /root/.dockercfg


# If we need local changes, change start.sh
#COPY ./start.sh /usr/local/bin/start.sh
#RUN chmod 755 /usr/local/bin/start.sh
#ENTRYPOINT ["/usr/local/bin/start.sh"]
#WORKDIR /
#USER jenkins
