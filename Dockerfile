FROM ubuntu:16.04

MAINTAINER Wilf

# Install required packages and remove the apt packages cache when done.

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
	git \
	python3 \
	python3-dev \
	python3-setuptools \
	python3-pip \
	nginx \
	sqlite3 && \
	pip3 install -U pip setuptools && \
   rm -rf /var/lib/apt/lists/*

# install uwsgi now because it takes a little while
RUN pip3 install uwsgi

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default

COPY . /home/docker/code/
RUN pip install -r /home/docker/code/app/requirements.txt

EXPOSE 80

CMD ["sh","/home/docker/code/start.sh"]
