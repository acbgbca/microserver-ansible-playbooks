# Microserver Ansible Playbooks

This repository contains the ansible scripts required to setup the Proxmox install on the Microserver.

[![Open in Remote - Containers](https://img.shields.io/static/v1?label=Remote%20-%20Containers&message=Open&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=git@github.com:acbgbca/microserver-ansible-playbooks.git)

## Fresh setup

For a fresh Promox install, the following steps need to be under taken:

### Initial Configuration
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
