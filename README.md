# Ansible Role: RoundCube

[![Build Status](https://travis-ci.org/tschifftner/ansible-role-roundcube.svg)](https://travis-ci.org/tschifftner/ansible-role-roundcube)

Installs RoundCube on Debian/Ubuntu linux servers.

## Requirements

The following programs need to be installed prior running this role:

 - [nginx](https://github.com/tschifftner/ansible-role-nginx)
 - [php5-fpm](https://github.com/tschifftner/ansible-role-php5-fpm)
 - [mariadb](https://github.com/tschifftner/ansible-role-mariadb)
 - [composer](https://github.com/tschifftner/ansible-role-composer)

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

### Security

This RoundCube installation is chrooted. Therefore please use ip address (i.e. 127.0.0.1) instead of hostnames!

```
mariadb_admin_home: '/root'
mariadb_admin_user: 'admin'
mariadb_admin_password: 'Set strong password here!'
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