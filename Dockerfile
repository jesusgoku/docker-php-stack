FROM tutum/lamp:latest
MAINTAINER Jesús Urrutia <jesus.urrutia@gmail.com>
# Install Git
RUN apt-get update && apt-get install -y curl
# Install composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
# Install Node and Npm
RUN apt-get update && apt-get install -y nodejs npm
RUN npm -g install bower
RUN npm -g install pm2
# For Web application
EXPOSE 80
EXPOSE 3306
# For terminal
EXPOSE 8080
COPY tty/package.json /terminal/
COPY tty/server.key /terminal/
COPY tty/server.crt /terminal/
# COPY terminal/index.html /terminal/
RUN ln -s /usr/bin/nodejs /usr/bin/node
COPY tty/index.js /terminal/
RUN cd /terminal && npm install
ADD start-terminal.sh /start-terminal.sh
RUN chmod 755 /start-terminal.sh
ADD supervisord-terminal.conf /etc/supervisor/conf.d/supervisord-terminal.conf
# COPY config/php.ini /usr/local/etc/php/
COPY entrypoint.sh /
WORKDIR /
CMD ["bash", "/entrypoint.sh"]