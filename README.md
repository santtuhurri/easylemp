# easylemp
Course project

- Tekijä: Santtu Hurri
- Käyttöjärjestelmä: Debian 11 "bullseye"  
- Versio: alpha
- Lisenssi: GNU General Public License v2.0

Tässä projektissa on tarkoitus rakentaa oma moduli, joka asentaa Linux-koneelle LEMP-stackin, tekee asennettuihin ohjelmiin tarvittavat konfiguroinnit sekä ottaa käyttöön kaksi Nginx server blockia eli virtual hostia. Pyrin myös siihen, että moduli asentaisi virtual hosteille käyttöön jonkun palvelun. Tarkoitus on, että käyttäjä saisi pienillä muutoksilla käyttöönsä valmiin paketin web-palvelimella työskentelyä varten.

![examplepicture](images/0.examplepicture.jpg)

Alustava init.sls tiedosto Nginxia varten:

```
nginx:
  pkg.installed

/var/www/html/index.html:
  file.managed:
    - source: salt://nginx-moduli/index.html

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx-moduli/santtu.lan.conf

/var/www/santtu.com/html/index.html:
  file.managed:
    - source: salt://nginx-moduli/santtu.com/html/index.html
    - makedirs: True

/etc/nginx/sites-available/santtu.com:
  file.managed:
    - source: salt://nginx-moduli/santtu.com.conf

/etc/nginx/sites-enabled/santtu.com:
  file.symlink:
    - target: /etc/nginx/sites-available/santtu.com

/var/www/hurri.com/html/index.html:
  file.managed:
    - source: salt://nginx-moduli/hurri.com/html/index.html
    - makedirs: True

/etc/nginx/sites-available/hurri.com:
  file.managed:
    - source: salt://nginx-moduli/hurri.com.conf

/etc/nginx/sites-enabled/hurri.com:
  file.symlink:
    - target: /etc/nginx/sites-available/hurri.com

/etc/hosts:
  file.managed:
    - source: salt://nginx-moduli/hosts

nginx.service:
  service.running:
    - watch:
      - file: /etc/nginx/sites-available/santtu.com
      - file: /etc/nginx/sites-available/hurri.com
```
