# Microserver Ansible Playbooks

This repository contains the ansible scripts required to setup Microserver


# Basic Instructions

## First Run

As the ssh key hasn't been deployed, you need to use the password for the first run. Use ```-k``` to pass the password, ```-K``` so the sudo password can be entered, and ```-e 'ansible_user=<user>'``` to override the ansible user to be whomever was setup on the server.

```
ansible-playbook microserver.yml -i hosts -e 'ansible_user=<user>' -k -K
```

## Run Docker script

```
ansible-playbook docker.yml -i hosts
```

## Do a dry run ```--check```

```
ansible-playbook docker.yml -i hosts --check
```

## Run the changes for a single tag ```--tags <tag>```

```
ansible-playbook -i hosts docker.yml --tags docker
```

## Encrypt a secret

```
ansible-vault encrypt_string '<string_to_encrypt>' --name '<string_name_of_variable>'
```

I.e.
```
ansible-vault encrypt_string 'secret' --name 'key'

Encryption successful
key: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          <encrypted value>
```

# Fresh setup

For a fresh Promox install, the following steps need to be under taken:

## Initial Configuration
Not all steps are convient to do via Ansible. The following should be done manually via the Proxmox interface prior to running the Ansible scripts:

*Create devops user*
```
ansible-playbook proxmox-firstrun.yml -i hosts --ask-pass
```

TODO:
* Create interface only user (we shouldn't use root)
* Setup disks
* add steps from https://pve.proxmox.com/wiki/Cloud-Init_Support for creation of Ubuntu cloud-init server template

*Setup Promox*
```
ansible-playbook proxmox.yml -i hosts
```

*Create Ubuntu Server Template*
* Log into Proxmox
* 
