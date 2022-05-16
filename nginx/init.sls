nginx:
  pkg.installed

/var/www/html/index.html:
  file.managed:
    - source: salt://nginx/html/index.html    
    - makedirs: True
    
/var/www/santtu.com/html/index.html:
  file.managed:
    - source: salt://nginx/santtu.com/html/index.html
    - makedirs: True
    
/etc/nginx/sites-available/santtu.com.conf:
  file.managed:
    - source: salt://nginx/santtu.com.conf

/etc/nginx/sites-enabled/santtu.com.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/santtu.com.conf

/var/www/hurri.com/html/index.html:
  file.managed:
    - source: salt://nginx/hurri.com/html/index.html
    - makedirs: True

/etc/nginx/sites-available/hurri.com.conf:
  file.managed:
    - source: salt://nginx/hurri.com.conf

/etc/nginx/sites-enabled/hurri.com.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/hurri.com.conf 

/etc/hosts:
  file.managed:
    - source: salt://nginx/hosts

nginx.service:
  service.running:
    - watch:
      - file: /etc/nginx/sites-available/santtu.com.conf
      - file: /etc/nginx/sites-available/hurri.com.conf


