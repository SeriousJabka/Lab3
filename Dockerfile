FROM debian
ADD Labapodockeru.list /etc/apt/sources.list.d/
RUN apt-get update && apt-get -y upgrade && apt -y install nginx && \ 
apt-get clean && cd /var/www/ && rm -rf ./* && mkdir -p Ilyaskrutoy.com/img && \
chmod -R 754 /var/www/Ilyaskrutoy.com/ && useradd Ilyas && groupadd Latypov && \
usermod -aG Latypov Ilyas && chown -R Ilyas:Latypov /var/www/Ilyaskrutoy.com/ && \
sed -i 's?/var/www/html?/var/www/Ilyaskrutoy.com?g' /etc/nginx/sites-enabled/default && \
sed -i 's?user www-data?user Ilyas?g' /etc/nginx/nginx.conf 
ADD index.html /var/www/Ilyaskrutoy.com/ 
ADD img.jpg /var/www/Ilyaskrutoy.com/img/
CMD ["nginx", "-g", "daemon off;"]
