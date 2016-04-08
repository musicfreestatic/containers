from ruby
maintainer Randall Smith <randall.smith@musicfreestatic.com>

RUN apt-get update && apt-get install -y git ssh-client nodejs rsync ruby-dev zlib1g-dev liblzma-dev && apt-get clean
RUN gem install jekyll octopress org-ruby ruby-oembed stringex jekyll-paginate octopress-linkblog octopress-feeds json nokogiri

ENV SOURCE /source
ENV DEST   /public
ENV SERVE  0

EXPOSE 4000

RUN bash -c 'mkdir -p $SOURCE $DEST'

ADD deploy-site.sh /usr/local/bin/

WORKDIR $SOURCE
ENTRYPOINT deploy-site.sh
