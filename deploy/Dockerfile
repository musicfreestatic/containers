from ubuntu
maintainer Randall Smith <perlstalker@gmail.com>

RUN apt-get update
RUN apt-get install -y ruby ruby-dev rbenv gems nodejs python build-essential git ssh-client rsync wget
RUN gem install org-ruby ruby-oembed stringex

ENV BASEDIR /octopress

#ADD install_octopress.sh /usr/local/sbin/

WORKDIR /
RUN git clone https://github.com/musicfreestatic/website.git octopress

WORKDIR /octopress
RUN gem install bundler && rbenv rehash && bundle install

EXPOSE 4000

RUN mkdir /public
ENTRYPOINT git pull && rake generate && rsync -av --delete /octopress/public/ /public/

#docker run -it --name mfs -v html:/public -p 4000:4000 mfs