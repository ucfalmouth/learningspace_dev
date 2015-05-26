Moodle DEV
==========

This [vagrantfile][5] is intended to provide a stable, repeatable and transferable development environment. Using this anyone on the team should be able to quickly* (~1 minute) get a test version of moodle working on their machine, optionally with a fresh snapshot of the live environment applied.

No technical expertise should be required to get moodle working in this way     (full instructions given below). Though  mainly intended for use by devs on the team to experiment with plugins or trial upgrades etc, others could equally use this to try out a new course layout (which they could then easily export and share).

A key advantage of this way of working is that everyone can have access to an identical installation and do what they want with it, even if they are working on a different platform (eg windows). The other advantage is that this development is easily modified and disseminated for testing, so the underlying stack can be completely changed (eg to a windows server or linux with nginx).

\* *on initial setup installation will be slower, as linux image will be downloaded* 

###Credits
This whole development setup is forked (stolen) from [box.scotch.io][16], described in an article at [scotch.io][17]. It is only slightly modified to add some moodle specific stuff and the auto provisioning of  moodle snapshots.

##Requirements

There are a couple of easily installed requirements before you can use moodle_dev. They are simple to install, couple of minutes tops.

* [Vagrant][1]
* [VirtualBox][4] 
* [Vagrant Manager][2] (optional GUI for vagrant)

##Usage
### blank moodle

* Clone or [download][6] (and extract) this repository to your chosen directory
* Open terminal `cd chosendirectory` and type `vagrant up`
* Access the working moodle install at  [http://192.168.33.10/][3]

### using snapshot (of a live moodle site)

* Clone or [download][6] (and extract) this repository to your chosen directory
* Drop the [snapshot file](#createsnapshot) into the snapshot directory 
* Open terminal `cd chosendirectory` and type `vagrant up`
* Access the working moodle install at  [http://192.168.33.10/][3]

Consider that as this is a copy of the live site, it might affect analytics data. You could consider using a [browser extension][8] to prevent this.

### running multiple instances

There is nothing to stop you running multiple moodle installs simultaneously, but you will need to change the IP address of additional VMs.

* Change `config.vm.network` in the Vagrantfile to your desired IP, eg `192.168.33.*`
* Follow either method above to install moodle
* change the IP address in public/config.php so moodle knows where to go

### using Moodle Development Kit

If you would like to use [mdk][7] to do moodley things from the commandline within your instance, `vagrant ssh`, `install_mdk` and `mdk init`.

## Details

For full list of feature see [box.scotch.io][16]

### Overview
- LAMP
- PHP 5.5
- PHP errors turned on
- Operating System agnostic
- Bootstrap and jQuery included
- Chef and Puppet ready
- Super easy database access
- Git
- Composer
- NPM
- Grunt / Bower / Yeoman / Gulp


|   | |
| ------------- | ------------- |
| Database Name  | scotchbox  |
| Database User  | root  |
| Database Password  | root  |
| Database Host  | localhost / 127.0.0.1  |
| SSH Host  | 192.168.33.10  |
| SSH User  | vagrant  |
| SSH Password  | vagrant  |


<a name="createsnapshot"></a>

## Creating a snapshot

If you would like to make a copy of another site for use with moodle dev, tarball the following (so named) components as snapshot_<dateorblank>

- files (the moodle system files inc plugins/themes directory)
- data (private moodle_data folder)
- db.sql (export should include drop tables)

eg
`tar -pcvzf snapshot_$(date +"%Y-%m-%d_%H-%M").tar data db.sql files`



[1]: http://www.vagrantup.com/downloads
[2]: http://vagrantmanager.com/
[3]: http://192.168.33.10/
[4]: https://www.virtualbox.org/wiki/Downloads
[5]: https://www.vagrantup.com/
[6]: https://github.com/ucfalmouth/moodle_dev/archive/master.zip
[7]: https://github.com/FMCorz/mdk
[8]: https://chrome.google.com/webstore/detail/block-yourself-from-analy/fadgflmigmogfionelcpalhohefbnehm/related
[16]: http://box.scotch.io
[17]: http://scotch.io/bar-talk/introducing-scotch-box-a-vagrant-lamp-stack-that-just-works