# jenkins-slave-image

Creates an AMI suitable for use on the Jenkins slave machines.

## Generating libnetcdf 4.5.0 binaries for Travis

* In `Vagrantfile`, change the value of `config.vm.box` to `"bento/ubuntu-14.04"`, or whatever is appropriate for
Travis's infrastructure.
* On the host machine, do:
    * `vagrant up`
    * `vagrant ssh`
    * You should now be logged into the Vagrant guest VM.
* Create the directory to which we'll copy the shared libraries and symlinks. Note that `/vagrant` is a shared
directory created automatically by Vagrant. Any file created in that directory on the guest will end up in the
`jenkins-slave-image` project directory on the host.
    * `mkdir /vagrant/ubuntu-14.04.5-amd64`
* Change to the directory where we installed netcdf and its dependencies.
    * `cd /usr/local/lib`
* Copy shared libraries, symlinks, and `*.settings` files.
    * `cp -P libz.s* libhdf5.s* libhdf5_hl.s* libnetcdf.s* /vagrant/ubuntu-14.04.5-amd64/`
* Exit back to the host machine and copy the binaries from the `jenkins-slave-image` project to the `thredds` project.
    * `exit`
    * `mv ubuntu-14.04.5-amd64/ $THREDDS_PROJECT_DIR/travis/lib/`
