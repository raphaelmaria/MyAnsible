Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
  * [Operating systems](#operating-systems)
  * [Local system access](#local-system-access)
  * [Zabbix Versions](#zabbix-versions)
    + [Zabbix 4.4](#zabbix-44)
    + [Zabbix 4.2](#zabbix-42)
    + [Zabbix 4.0](#zabbix-40)
    + [Zabbix 3.4](#zabbix-34)
    + [Zabbix 3.2](#zabbix-32)
    + [Zabbix 3.0](#zabbix-30)
    + [Zabbix 2.4](#zabbix-24)
    + [Zabbix 2.2](#zabbix-22)
- [Getting started](#getting-started)
  * [Installation](#installation)
  * [Minimal Configuration](#minimal-configuration)
  * [Issues](#issues)
- [Role Variables](#role-variables)
  * [Main variables](#main-variables)
  * [TLS Specific configuration](#tls-specific-configuration)
  * [Zabbix API variables](#zabbix-api-variables)
  * [Windows Variables](#windows-variables)
  * [Docker Variables](#docker-variables)
  * [Other variables](#other-variables)
  * [proxy](#proxy)
- [Dependencies](#dependencies)
- [Example Playbook](#example-playbook)
  * [agent_interfaces](#agent-interfaces)
  * [Other interfaces](#other-interfaces)
  * [Vars in role configuration](#vars-in-role-configuration)
  * [Combination of group_vars and playbook](#combination-of-group-vars-and-playbook)
  * [Example for TLS PSK encrypted agent communication](#example-for-tls-psk-encrypted-agent-communication)
- [Molecule](#molecule)
  * [default](#default)
  * [with-server](#with-server)
  * [before-last-version](#before-last-version)
- [Deploying Userparameters](#deploying-userparameters)
- [License](#license)
- [Author Information](#author-information)

# Introduction

This role is migrated to: https://github.com/ansible-collections/community.zabbix/
In this repository, a read only version is/will be available for those who can not make use of collections (yet). Changes/updates will only be applied to the collection and not in this repository.

# Requirements
## Operating systems
This role will work on the following operating systems:

 * Red Hat
 * Fedora
 * Debian
 * Ubuntu
 * opensuse
 * Windows (Best effort)
 * macOS

So, you'll need one of those operating systems.. :-)
Please sent Pull Requests or suggestions when you want to use this role for other Operating systems.

## Local system access

To successfully complete the install the role requires `python-netaddr` on the controller to be able to manage IP addresses. This requires that the library is available on your local machine (or that `pip` is installed to be able to run). This will likely mean that running the role will require `sudo` access to your local machine and therefore you may need the `-K` flag to be able to enter your local machine password if you are not running under root.

## Zabbix Versions

See the following list of supported Operating systems with the Zabbix releases:

### Zabbix 4.4

  * CentOS 7.x, 8.x
  * Amazon 7.x
  * RedHat 7.x, 8.x
  * Fedora 27, 29
  * OracleLinux 7.x, 8.x
  * Scientific Linux 7.x, 8.x
  * Ubuntu 14.04, 16.04, 18.04
  * Debian 8, 9, 10
  * macOS 10.14, 10.15

### Zabbix 4.2

  * CentOS 7.x
  * Amazon 7.x
  * RedHat 7.x
  * Fedora 27, 29
  * OracleLinux 7.x
  * Scientific Linux 7.x
  * Ubuntu 14.04, 16.04, 18.04
  * Debian 8, 9, 10
  * macOS 10.14, 10.15

### Zabbix 4.0

  * CentOS 7.x
  * Amazon 7.x
  * RedHat 7.x
  * Fedora 27, 29
  * OracleLinux 7.x
  * Scientific Linux 7.x
  * Ubuntu 14.04, 16.04, 18.04
  * Debian 8, 9, 10
  * macOS 10.14, 10.15

### Zabbix 3.4

  * CentOS 7.x
  * Amazon 7.x
  * RedHat 7.x
  * Fedora 27, 29
  * OracleLinux 7.x
  * Scientific Linux 7.x
  * Ubuntu 14.04, 16.04, 18.04
  * Debian 7, 8, 9

### Zabbix 3.2

  * CentOS 7.x
  * Amazon 7.x
  * RedHat 7.x
  * Fedora 27, 29
  * OracleLinux 7.x
  * Scientific Linux 7.x
  * Ubuntu 14.04, 16.04
  * Debian 7, 8

### Zabbix 3.0

  * CentOS 5.x, 6.x, 7.x
  * Amazon 5.x, 6.x, 7.x
  * RedHat 5.x, 6.x, 7.x
  * OracleLinux 5.x, 6.x, 7.x
  * Scientific Linux 5.x, 6.x, 7.x
  * Ubuntu 14.04
  * Debian 7, 8

### Zabbix 2.4

  * CentOS 6.x, 7.x
  * Amazon 6.x, 7.x
  * RedHat 6.x, 7.x
  * OracleLinux 6.x, 7.x
  * Scientific Linux 6.x, 7.x
  * Ubuntu 12.04 14.04
  * Debian 7

### Zabbix 2.2

  * CentOS 5.x, 6.x
  * RedHat 5.x, 6.x
  * OracleLinux 5.x, 6.x
  * Scientific Linux 5.x, 6.x
  * Ubuntu 12.04
  * Debian 7
  * xenserver 6

# Getting started

## Installation

Installing this role is very simple: `ansible-galaxy install dj-wasabi.zabbix-agent`

This will install the zabbix-agent role into your `roles` directory.

## Minimal Configuration

In order to get the Zabbix Agent running, you'll have to define the following properties before executing the role:

* zabbix_agent_version
* zabbix_agent_server
* zabbix_agent_serveractive (When using active checks)

The `zabbix_agent_version` is optional. The latest available major.minor version of Zabbix will be installed on the host(s). If you want to use an older version, please specify this in the major.minor format. Example: `zabbix_agent_version: 4.0`, `zabbix_agent_version: 3.4` or `zabbix_agent_version: 2.2`.

The `zabbix_agent_server` (and `zabbix_agent_serveractive`) should contain the ip or fqdn of the host running the Zabbix Server.

## Issues

Due to issue discussed on [#291](https://github.com/dj-wasabi/ansible-zabbix-agent/issues/291), the Ansible Version 2.9.{0,1,2} isn't working correctly on Windows related targets.

# Role Variables

## Main variables

There are some variables in default/main.yml which can (or need to) be overridden:

* `zabbix_agent_server`: The ip address for the zabbix-server or zabbix-proxy.

* `zabbix_agent_serveractive`: The ip address for the zabbix-server or zabbix-proxy for active checks.

* `zabbix_agent_version`: This is the version of zabbix. Default it is 4.4, but can be overridden to one of the versions mentioned in [Zabbix Versions](#zabbix-versions). Previously the variable `zabbix_version` was used directly but it could cause [some inconvenience](https://github.com/dj-wasabi/ansible-zabbix-agent/pull/303). That variable is maintained by retrocompativility.

* `zabbix_repo`: Default: _zabbix_
  * _epel_ install agent from EPEL repo
  * _zabbix_ (default) install agent from Zabbix repo
  * _other_ install agent from pre-existing or other repo

* `zabbix_agent_listeninterface`: Interface zabbix-agent listens on. Leave blank for all.

* `zabbix_agent_package`: The name of the zabbix-agent package. Default: `zabbix-agent`. In case for EPEL, it is automatically renamed.

* `zabbix_sender_package`: The name of the zabbix-sender package. Default: `zabbix-sender`. In case for EPEL, it is automatically renamed.

* `zabbix_get_package`: The name of the zabbix-get package. Default: `zabbix-get`. In case for EPEL, it is automatically renamed.

* `zabbix_agent_package_state`: If Zabbix-agent needs to be present or latest.

* `zabbix_agent_interfaces`: A list that configured the interfaces you can use when configuring via API.

* `zabbix_selinux`: Enables an SELinux policy so that the agent will run. Default: False.

* `zabbix_agent_userparameters`: List of userparameter names and scripts (if any). Detailed description is given in the [Deploying Userparameters](#deploying-userparameters) section. Default: `[]` (Empty list).
    * `name`: Userparameter name (should be the same with userparameter template file name)
    * `scripts_dir`: Directory name of the custom scripts needed for userparameters

* `zabbix_agent_userparameters_templates_src`: indicates the relative path (from `templates/`) where userparameter templates are searched

* `zabbix_agent_userparameters_scripts_src`: indicates the relative path (from `files/`) where userparameter scripts are searched

* `zabbix_agent_allowroot`: Allow the agent to run as 'root'. 0 - do not allow, 1 - allow

* `zabbix_agent_runas_user`: Drop privileges to a specific, existing user on the system. Only has effect if run as 'root' and AllowRoot is disabled.

* `zabbix_agent_become_on_localhost`: Set to `False` if you don't need to elevate privileges on localhost to install packages locally with pip. Default: True

* `zabbix_install_pip_packages`: Set to `False` if you don't want to install the required pip packages. Useful when you control your environment completely. Default: True

* `zabbix_agent_apt_priority`: Add a weight (`Pin-Priority`) for the APT repository.

## TLS Specific configuration

These variables are specific for Zabbix 3.0 and higher:

* `zabbix_agent_tlsconnect`: How the agent should connect to server or proxy. Used for active checks.

    Possible values:

    * unencrypted
    * psk
    * cert

* `zabbix_agent_tlsaccept`: What incoming connections to accept.

    Possible values:

    * unencrypted
    * psk
    * cert

* `zabbix_agent_tlscafile`: Full pathname of a file containing the top-level CA(s) certificates for peer certificate verification.

* `zabbix_agent_tlscrlfile`: Full pathname of a file containing revoked certificates.

* `zabbix_agent_tlsservercertissuer`: Allowed server certificate issuer.

* `zabbix_agent_tlsservercertsubject`: Allowed server certificate subject.

* `zabbix_agent_tlscertfile`: Full pathname of a file containing the agent certificate or certificate chain.

* `zabbix_agent_tlskeyfile`: Full pathname of a file containing the agent private key.

* `zabbix_agent_tlspskidentity`: Unique, case sensitive string used to identify the pre-shared key.

* `zabbix_agent_tlspskidentity_file`: Full pathname of a file containing the pre-shared key identity.

* `zabbix_agent_tlspskfile`: Full pathname of a file containing the pre-shared key.

* `zabbix_agent_tlspsk_secret`: The pre-shared secret key that should be placed in the file configured with `agent_tlspskfile`.

* `zabbix_agent_tlspsk_auto`: Enables auto generation and storing of individual pre-shared keys and identities on clients.

## Zabbix API variables

These variables need to be overridden when you want to make use of the zabbix-api for automatically creating and or updating hosts.

Host encryption configuration will be set to match agent configuration.

When `zabbix_api_create_hostgroup` or `zabbix_api_create_hosts` is set to `True`, it will install on the host executing the Ansible playbook the `zabbix-api` python module.

* `zabbix_url`: The url on which the Zabbix webpage is available. Example: http://zabbix.example.com

* `zabbix_api_http_user`: The http user to access zabbix url with Basic Auth
* `zabbix_api_http_password`: The http password to access zabbix url with Basic Auth

* `zabbix_api_create_hosts`: When you want to enable the Zabbix API to create/delete the host. This has to be set to `True` if you want to make use of `zabbix_create_host`. Default: `False`

* `zabbix_api_create_hostgroup`: When you want to enable the Zabbix API to create/delete the hostgroups. This has to be set to `True` if you want to make use of `zabbix_create_hostgroup`.Default: `False`

* `zabbix_api_user`: Username of user which has API access.

* `zabbix_api_pass`: Password for the user which has API access.

* `zabbix_create_hostgroup`: present (Default) if the hostgroup needs to be created or absent if you want to delete it. This only works when `zabbix_api_create_hostgroup` is set to `True`.

* `zabbix_host_status`: enabled (Default) when host in monitored, disabled when host is disabled for monitoring.

* `zabbix_create_host`: present (Default) if the host needs to be created or absent is you want to delete it. This only works when `zabbix_api_create_hosts` is set to `True`.

* `zabbix_update_host`: yes (Default) if the host should be updated if already present. This only works when `zabbix_api_create_hosts` is set to `True`.

* `zabbix_useuip`: 1 if connection to zabbix-agent is made via ip, 0 for fqdn.

* `zabbix_host_groups`: A list of hostgroups which this host belongs to.

* `zabbix_link_templates`: A list of templates which needs to be link to this host. The templates should exist.

* `zabbix_macros`: A list with macro_key and macro_value for creating hostmacro's.

* `zabbix_inventory_mode`: Configure Zabbix inventory mode. Needed for building inventory data, manually when configuring a host or automatically by using some automatic population options. This has to be set to `automatic` if you want to make automatically building inventory data.

* `zabbix_visible_hostname` : Configure Zabbix visible name inside Zabbix web UI for the node.

* `zabbix_validate_certs` : yes (Default) if we need to validate tls certificates of the API. Use `no` in case self-signed certificates are used

## Windows Variables

**NOTE**

_Supporting Windows is a best effort (I don't have the possibility to either test/verify changes on the various amount of available Windows instances). PRs specific to Windows will almost immediately be merged, unless someone is able to provide a Windows test mechanism via Travis for Pull Requests._

* `zabbix_version_long`: The long (major.minor.patch) version of the Zabbix Agent. This will be used to generate the `zabbix_win_download_link` link and for Zabbix Agent update if `zabbix_agent_package_state: latest`.

* `zabbix_win_download_link`: The download url to the `win.zip` file.

* `zabbix_win_install_dir`: The directory where Zabbix needs to be installed.

* `zabbix_agent_win_logfile`: The full path to the logfile for the Zabbix Agent.

* `zabbix_agent_win_include`: The directory in which the Zabbix specific configuration files are stored.

* `zabbix_agent_win_svc_recovery`: Enable Zabbix Agent service auto-recovery settings.

## macOS Variables

* `zabbix_version_long`: The long (major.minor.patch) version of the Zabbix Agent. This will be used to generate the `zabbix_mac_download_link` link.

* `zabbix_mac_download_link`: The download url to the `pkg` file.

## Docker Variables

When you don't want to install the Zabbix Agent on the host, but would like to run it in a container then these properties are useful. When `zabbix_agent_docker` is set to `True`, then a
Docker image will be downloaded and a Container will be started. No other installations will be done on the host, with the exception of the PSK file and the "Zabbix Include Directory".

The following directories are mounted in the Container:

```
  - /etc/zabbix/zabbix_agentd.d:/etc/zabbix/zabbix_agentd.d
  - /:/hostfs:ro
  - /etc:/hostfs/etc:ro
  - /proc:/hostfs/proc:ro
  - /sys:/hostfs/sys:ro
  - /var/run:/var/run
```

Keep in mind that using the Zabbix Agent in a Container requires changes to the Zabbix Template for Linux as `/proc`, `/sys` and `/etc` are mounted in a directory `/hostfs`.

* `zabbix_agent_docker`: When set to `True`, it will install a Docker container on the target host instead of installation on the target. Default: `False`

* `zabbix_agent_docker_state`: Default: `started`

* `zabbix_agent_docker_name`: The name of the Container. Default: `zabbix-agent`

* `zabbix_agent_docker_image`: The name of the Docker image. Default: `zabbix/zabbix-agent`

* `zabbix_agent_docker_image_tag`: The tag of the Docker image.

* `zabbix_agent_docker_user_gid`: The group id of the zabbix user in the Container.

* `zabbix_agent_docker_user_uid`: The user id of the zabbix user in the Container.

* `zabbix_agent_docker_network_mode`: The name of the (Docker) network that should be used for the Container. Default `host`.

* `zabbix_agent_docker_restart_policy`: The restart policy of the Container. Default: `unless-stopped`

* `zabbix_agent_docker_privileged`: When set to `True`, the container is running in privileged mode.

* `zabbix_agent_docker_ports`: A list with `<PORT>:<PORT>` values to open ports to the container.

* `zabbix_agent_docker_security_opts`: A list with available security options.

* `zabbix_agent_docker_volumes`: A list with all directories that needs to be available in the Container.

* `zabbix_agent_docker_env`: A dict with all environment variables that needs to be set for the Container.

## Other variables

* `zabbix_agent_firewall_enable`: If IPtables needs to be updated by opening an TCP port for port configured in `zabbix_agent_listenport`.

* `zabbix_agent_firewall_source`: When provided, IPtables will be configuring to only allow traffic from this IP address/range.

* `zabbix_agent_firewalld_enable`: If firewalld needs to be updated by opening an TCP port for port configured in `zabbix_agent_listenport` and `zabbix_agent_jmx_listenport` if defined.

* `zabbix_agent_firewalld_source`: When provided, firewalld will be configuring to only allow traffic for IP configured in `zabbix_agent_server`.

* `zabbix_agent_firewalld_zone`: When provided, the firewalld rule will be attached to this zone (only if zabbix_agent_firewalld_enable is set to true). The default behavior is to use the default zone define by the remote host firewalld configuration.

* `zabbix_agent_firewall_action`: When to `insert` the rule or to `append` to IPTables. Default: `insert`.

* `zabbix_agent_firewall_chain`: Which `chain` to add the rule to IPTables. Default `INPUT`

* `zabbix_agent_description`: Description of the host in Zabbix.

* `zabbix_agent_inventory_zabbix`: Adds Facts for a zabbix inventory

## IPMI variables

* `zabbix_agent_ipmi_authtype`: IPMI authentication algorithm. Possible values are 1 (callback), 2 (user), 3 (operator), 4 (admin), 5 (OEM), with 2 being the API default.

* `zabbix_agent_ipmi_password`: IPMI password.

* `zabbix_agent_ipmi_privilege`: IPMI privilege level. Possible values are 1 (callback), 2 (user), 3 (operator), 4 (admin), 5 (OEM), with 2 being the API default.

* `zabbix_agent_ipmi_username`: IPMI username.

## proxy

When the target host does not have access to the internet, but you do have a proxy available then the following properties needs to be set to download the packages via the proxy:

* `zabbix_http_proxy`
* `zabbix_https_proxy`

# Dependencies

There are no dependencies on other roles.

# Example Playbook

## agent_interfaces

This will configure the Zabbix Agent interface on the host.
```
zabbix_agent_interfaces:
  - type: 1
    main: 1
    useip: "{{ zabbix_useuip }}"
    ip: "{{ zabbix_agent_ip }}"
    dns: "{{ ansible_fqdn }}"
    port: "{{ zabbix_agent_listenport }}"
```

## Other interfaces

You can also configure the `zabbix_agent_interfaces` to add/configure snmp, jmx and ipmi interfaces.

You'll have to use one of the following type numbers when configuring it:

| Type Interface  |  Nr   |
|-----------------|-------|
| Zabbix Agent  | 1  |
| snmp | 2  |
| ipmi | 3  |
| jmx | 4  |

Configuring a snmp interface will look like this:

```
zabbix_agent_interfaces:
  - type: 2
    main: 1
    useip: "{{ zabbix_useuip }}"
    ip: "{{ agent_ip }}"
    dns: "{{ ansible_fqdn }}"
    port: "{{ agent_listenport }}"
```

## Vars in role configuration
Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      roles:
         - role: dj-wasabi.zabbix-agent
           zabbix_agent_server: 192.168.33.30
           zabbix_agent_serveractive: 192.168.33.30
           zabbix_url: http://zabbix.example.com
           zabbix_api_use: true # use zabbix_api_create_hosts and/or zabbix_api_create_hostgroup from 0.8.0
           zabbix_api_user: Admin
           zabbix_api_pass: zabbix
           zabbix_create_host: present
           zabbix_host_groups:
             - Linux Servers
           zabbix_link_templates:
             - Template OS Linux
             - Apache APP Template
           zabbix_macros:
             - macro_key: apache_type
               macro_value: reverse_proxy

## Combination of group_vars and playbook
You can also use the group_vars or the host_vars files for setting the variables needed for this role. File you should change: `group_vars/all` or `host_vars/<zabbix_server>` (Where <zabbix_server> is the hostname of the machine running Zabbix Server)

		zabbix_agent_server: 192.168.33.30
        zabbix_agent_serveractive: 192.168.33.30
        zabbix_url: http://zabbix.example.com
        zabbix_api_use: true # use zabbix_api_create_hosts and/or zabbix_api_create_hostgroup from 0.8.0
        zabbix_api_user: Admin
        zabbix_api_pass: zabbix
        zabbix_create_host: present
        zabbix_host_groups:
          - Linux Servers
        zabbix_link_templates:
          - Template OS Linux
          - Apache APP Template
        zabbix_macros:
          - macro_key: apache_type
            macro_value: reverse_proxy

and in the playbook only specifying:

    - hosts: all
      roles:
         - role: dj-wasabi.zabbix-agent

## Example for TLS PSK encrypted agent communication

Variables e.g. in the playbook or in `host_vars/myhost`:

    zabbix_agent_tlsaccept: psk
    zabbix_agent_tlsconnect: psk
    zabbix_agent_tlspskidentity: "myhost PSK"
    zabbix_agent_tlspsk_secret: b7e3d380b9d400676d47198ecf3592ccd4795a59668aa2ade29f0003abbbd40d
    zabbix_agent_tlspskfile: /etc/zabbix/zabbix_agent_pskfile.psk

# Molecule

This role is configured to be tested with Molecule. You can find on this page some more information regarding Molecule: https://werner-dijkerman.nl/2016/07/10/testing-ansible-roles-with-molecule-testinfra-and-docker/

With each Pull Request, Molecule will be executed via travis.ci. Pull Requests will only be merged once these tests run successfully.

There are 2 scenarios that are executed with Travis.

## default

With the first scenario, Molecule will boot 5 Docker containers with the following OS'es:

* Debian 8
* CentOS 7
* Ubuntu 16.04
* Ubuntu 18.04
* Mint

This scenario will be doing a basic installation/configuration, without registering the host via the Zabbix API to the server.

## with-server

The 2nd scenario will boot 4 Docker containers with the following OS'es:

* CentOS 7 (Zabbix Server)
* Debian 8
* CentOS 7
* Ubuntu 18.04

First, a Zabbix Server will be installed on a container. This installation make uses of other dj-wasabi roles to install/configure a Zabbix Server. Once this instance is running, the 3 other agents are installed.

Each host will register itself on the Zabbix Server and the status should be 0 (This means the Zabbix Server and Zabbix Agent are connected).

The Ubuntu agent will register itself via a PSK, so that communication between the Zabbix Server and Zabbix Agent is encrypted with e Pre-Shared Key.

## before-last-version

The 3rd and last scenario is the `before-last-version`. This is the same scenario like the `default`, but uses the previous Zabbix version.

# Deploying Userparameters

The following steps are required to install custom userparameters and/or scripts:

* Put the desired userparameter file in the `templates/userparameters` directory and name it as `<userparameter_name>.j2`. For example: `templates/userparameters/mysql.j2`. You can change the default directory to a custom one modifying `zabbix_agent_userparameters_templates_src` variable.
* Put the scripts directory (if any) in the `files/scripts` directory. For example: `files/scripts/mysql`. You can change the default directory to a custom one modifying `zabbix_agent_userparameters_scripts_src` variable.
* Add `zabbix_agent_userparameters` variable to the playbook as a list of dictionaries and define userparameter name and scripts directory name (if there are no scripts just no not specify the `scripts_dir` variable).

Example:

```
- hosts: mysql_servers
  tasks:
    - include_role:
        name: dj-wasabi.zabbix-agent
      vars:
        zabbix_agent_server: zabbix.mydomain.com
        zabbix_agent_userparameters:
          - name: mysql
            scripts_dir: mysql
          - name: galera

```

Example of the "templates/userparameters/mysql.j2" file:

```
UserParameter=mysql.ping_to,mysqladmin -uroot ping | grep -c alive
```

# License

MIT

# Author Information

Please send suggestion or pull requests to make this role better. Also let me know if you encounter any issues installing or using this role.

Github: https://github.com/dj-wasabi/ansible-zabbix-agent

mail: ikben [ at ] werner-dijkerman . nl
