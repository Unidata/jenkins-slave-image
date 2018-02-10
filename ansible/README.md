# Ansible

We use [Ansible](ansible.com) to provision our machines.

## Content organization

For the most part, the project follows the alternative directory layout described in
[Ansible Best Practices](http://docs.ansible.com/ansible/playbooks_best_practices.html#alternative-directory-layout).

## Execute ad-hoc commands on Vagrant VM

Once you've [launched the Vagrant VM](../README.md#launching-nexus-server-in-a-vagrant-vm), you can do:

```
ansible jenkins-slave -i inventories/dev/hosts -v -a date
ansible jenkins-slave -i inventories/dev/hosts -v -m setup -a 'gather_subset=!all'
ansible jenkins-slave -i inventories/dev/hosts -v -m service -a 'name=nexus state=restarted'
```
[Reference](http://docs.ansible.com/ansible/intro_adhoc.html)

## Execute playbooks on Vagrant VM

`ansible-playbook` should be run from the `ansible/` directory, so that it can find `ansible.cfg`.

[Reference](http://docs.ansible.com/ansible/intro_configuration.html#configuration-file)

```
ansible-playbook -i inventories/dev/hosts -v site.yml
ansible-playbook -i inventories/dev/hosts -v site.yml --tags "security"
ansible-playbook -i inventories/dev/hosts -v site.yml --start-at-task="Create 'wheel' group."
```

When using the `--start-at-task` and `--tags` options, the included tasks may rely on variables
that were set in tasks that aren't set to run. These are often `set_fact` tasks. To include them in the run,
add the [`always` tag](http://docs.ansible.com/ansible/playbooks_tags.html#special-tags).
