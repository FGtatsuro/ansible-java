ansible-java
====================================

[![Build Status](https://travis-ci.org/FGtatsuro/ansible-java.svg?branch=master)](https://travis-ci.org/FGtatsuro/ansible-java)

Ansible role for OpenJDK.

Requirements
------------

The dependencies on other softwares/librarys for this role.

- Debian
- Alpine Linux
- OSX
  - Homebrew (>= 0.9.5)

Role Variables
--------------

The variables we can use in this role.

|name|description|type|default|
|---|---|---|---|
|java_apt_repositories|Some repositories this role adds for OpenJDK installation.|list|- "deb http://ftp.jp.debian.org/debian stable-backports main contrib non-free"<br>- "deb-src http://ftp.jp.debian.org/debian stable-backports main contrib non-free"|

This variable is used only on Debian, isn't used on Alpine Linux/OSX.

Role Dependencies
-----------------

The dependencies on other roles for this role.

- FGtatsuro.python-requirements

Example Playbook
----------------

    - hosts: all
      roles:
         - { role: FGtatsuro.java }

Test on local Docker host
-------------------------

This project run tests on Travis CI, but we can also run them on local Docker host.
Please check `install`, `before_script`, and `script` sections of `.travis.yml`.
We can use same steps of them for local Docker host.

Local requirements are as follows.

- Ansible (>= 2.0.0)
- Docker (>= 1.10.1)

Notes
-----

This role installs OpenJDK 1.8. Thus, you can't install old version on this role.

License
-------

MIT
