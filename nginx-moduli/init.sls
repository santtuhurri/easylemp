nginx:
  pkg.installed

/var/www/html/index.html:
  file.managed:
    - source: salt://nginx-moduli/index.html    

/var/www/santtu.com/html/index.html:
  file.managed:
    - source: salt://nginx-moduli/santtu.com/html/index.html
    - makedirs: True
    
/etc/nginx/sites-available/santtu.com.conf:
  file.managed:
    - source: salt://nginx-moduli/santtu.com.conf

/etc/nginx/sites-enabled/santtu.com.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/santtu.com.conf

/var/www/hurri.com/html/index.html:
  file.managed:
    - source: salt://nginx-moduli/hurri.com/html/index.html
    - makedirs: True

/etc/nginx/sites-available/hurri.com.conf:
  file.managed:
    - source: salt://nginx-moduli/hurri.com.conf

/etc/nginx/sites-enabled/hurri.com.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/hurri.com.conf 

/etc/hosts:
  file.managed:
    - source: salt://nginx-moduli/hosts

nginx.service:
  service.running:
    - watch:
      - file: /etc/nginx/sites-available/santtu.com.conf
      - file: /etc/nginx/sites-available/hurri.com.conf


