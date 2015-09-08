# Docker Apache and PHP
Docker build for PHP and Apache

Reason I'm creating this is because I want to expose the php.ini file for editing external to this server

Sample run config:

docker run -i --name phptest -p 80:80 -v /docker/configs/web/php5:/etc/php5 -v /docker/configs/web/apache2:/etc/apache2 -v /docker/configs/web/logs/php:/var/log/php5 -v /docker/configs/web/logs/apache:/var/log/apache2 -v /docker/configs/web/content:/var/www/html -v /etc/localtime:/etc/localtime:ro docker-lamp
