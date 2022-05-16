php:
  pkg.installed:
    - pkgs:
      - php-fpm
      - php-mysql

/var/www/santtu.com/shoplist.php:
  file.managed:
    - source: salt://php/shoplist.php

php7.4-fpm:
  service.running:
    - watch:
      - file: /var/www/santtu.com/shoplist.php
