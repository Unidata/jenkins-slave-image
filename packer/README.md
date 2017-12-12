# Packer

To build a Jenkins Slave image, execute:

```
packer build amazon-jenkins-slave.json
```

The image is simply the result of running the main playbook against the temporary Packer VM.

## Notes

* In `amazon-jenkins-slave.json`, `builders[0].source_ami` refers to an Ubuntu 16.04 base image created by the
`amazon-base.json` template in the nexus-IaC project. See the project's [Packer README](
https://github.com/cwardgar/nexus-IaC/blob/master/packer/README.md#unbuntu-base-template-1).
