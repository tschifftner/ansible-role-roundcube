# Ansible Role: RoundCube

[![Build Status](https://travis-ci.org/tschifftner/ansible-role-roundcube.svg)](https://travis-ci.org/tschifftner/ansible-role-roundcube)

Installs RoundCube on Debian/Ubuntu linux servers.

## Requirements

The following programs need to be installed prior running this role:

 - [nginx](https://github.com/tschifftner/ansible-role-nginx)
 - [php5-fpm](https://github.com/tschifftner/ansible-role-php5-fpm)
 - [mariadb](https://github.com/tschifftner/ansible-role-mariadb)
 - [composer](https://github.com/tschifftner/ansible-role-composer)

_Manual Installation:_
```
  sudo apt-get update -qq
  sudo apt-get install -y curl nginx php5 php5-cli php5-fpm php5-curl php5-imap php5-xmlrpc php5-mysqlnd mariadb-server-10.1 mariadb-client-10.1 python-mysqldb software-properties-common
  curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

### Database

```
roundcube_sql_host: "127.0.0.1"
roundcube_sql_database: "roundcube"
roundcube_sql_user: "roundcube"
roundcube_sql_password: "secure-password"
```

### Define Email Server

```
roundcube_default_host: "ssl://{{ mailserver_fqdn_hostname | default('localhost') }}"
roundcube_default_port: '993'
roundcube_smtp_server: "tls://{{ mailserver_fqdn_hostname | default('localhost') }}"
roundcube_smtp_port: '587'
roundcube_smtp_user: ''
roundcube_smtp_pass: ''
```

### Roundcube config

```
roundcube_support_url: ''
roundcube_ip_check: 'true'
roundcube_des_key: 'OTWEG5Jw8&69uW0$O9#H2quw'
roundcube_product_name: 'ambimax® RoundCube'
roundcube_plugins: ['archive', 'zipdownload', 'managesieve', 'password']
roundcube_language: 'de'
roundcube_enable_spellcheck: 'false'
roundcube_mail_pagesize: 50
roundcube_draft_autosave: 300
roundcube_mime_param_folding: 0
roundcube_mdn_requests: 2
roundcube_skin: 'larry'
roundcube_log_driver: 'syslog'
```

### Nginx config

```
roundcube_nginx_listen: '443'
roundcube_nginx_server_name: "_default_"

roundcube_nginx_ssl_redirect: 'https://{{ roundcube_nginx_server_name }}$request_uri'
roundcube_nginx_ssl_save_path: '{{ roundcube_working_dir }}/.ssl'

roundcube_nginx_ssl_certificate: '{{ mailserver_ssl_certificate | default(omit) }}'
roundcube_nginx_ssl_certificate_key: '{{ mailserver_ssl_certificate_key | default(omit) }}'
roundcube_nginx_ssl_intermediate_certificate: '{{ mailserver_ssl_intermediate_certificate | default(omit) }}'
roundcube_nginx_ssl_root_certificate: '{{ mailserver_ssl_intermediate_certificate | default(omit) }}'

roundcube_nginx_ssl_certificate_path: '{{ roundcube_nginx_ssl_save_path }}/certificate.crt'
roundcube_nginx_ssl_certificate_key_path: '{{ roundcube_nginx_ssl_save_path }}/certificate.key'
roundcube_nginx_ssl_trusted_certificate_path: '{{ roundcube_nginx_ssl_save_path }}/trustchain.crt'
```

## Dependencies

None.

## Example Playbook

    - hosts: server
      roles:
        - { role: tschifftner.nginx }
        - { role: tschifftner.php5-fpm }
        - { role: tschifftner.composer }
        - { role: tschifftner.mariadb }
        - { role: tschifftner.roundcube }

## Supported OS
Ansible          | Debian Jessie    | Ubuntu 14.04    | Ubuntu 12.04
:--------------: | :--------------: | :-------------: | :-------------: 
2.1              | Yes              | Yes             | Yes

## License

[MIT License](http://choosealicense.com/licenses/mit/)

## Author Information

 - [Tobias Schifftner](https://twitter.com/tschifftner), [ambimax® GmbH](https://www.ambimax.de)