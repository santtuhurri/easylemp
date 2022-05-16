mariadb-server:
  pkg.installed

mariadb.service: 
  service.running:
    - enable: True

secure_mysql.sh:
  cmd.script:
    - source: salt://mariadb/secure_mysql.sh
    - unless: 'echo show databases|sudo mariadb -u root|grep shoplist'
