FROM ubuntu:14.04

MAINTAINER Krutarth Shukla  <krutarth.ce@gmail.com>

RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
#RUN apt-get install -qy git
#RUN git clone https://github.com/upgoingstar/datasploit.git

RUN apt-get -qy update \
  && apt-get install -qy python-pip git rabbitmq-server mongodb-org libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev libxml2 libssl-dev \
  && git clone https://github.com/upgoingstar/datasploit.git \
  && pip install --upgrade pip \
  && pip install -r /datasploit/requirements.txt \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN mv /datasploit/config_sample.py /datasploit/config.py
RUN mkdir -p /datasploit/datasploitDb

ADD strt.sh /strt.sh
ADD cl.sh /cl.sh
RUN chmod +x /strt.sh
RUN chmod +x /cl.sh

EXPOSE 8000

CMD bash -C '/strt.sh';'bash'
