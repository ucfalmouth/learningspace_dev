Learningspace DEV
==========

The idea is that anyone on the team can (relatively) quickly and easily get a test version of the learningspace working on their machine, no technical expertise required. This same environment can also be used by devs on the team to experiment with plugins or trial upgrades etc.

This whole development setup is forked (stolen) from [box.scotch.io][16], described in an article at [scotch.io][17]. It is only slightly modified to simplify some falmouth specific stuff.


## Usage

* Download and Install [Vagrant][1]
* Download and Install [VirtualBox][4]
* Clone the Scotch Box GitHub Repository
* Run Vagrant Up
* (optionally) install [Vagrant Manager][2]
* Access Your Project at  [http://192.168.33.10/][3]
 

## Features

For full list of feature see [box.scotch.io][16]

### Overview
- LAMP
- PHP 5.5
- PHP errors turned on
- Operating System agnostic
- Bootstrap and jQuery included
- Chef and Puppet ready*
- Super easy database access
- Git
- Composer
- NPM
- Grunt / Bower / Yeoman / Gulp

\* *in case you want to add extra features on Vagrant Up*

## Database Details

| Key  | Value |
| ------------- | ------------- |
| Database Name  | scotchbox  |
| Database User  | root  |
| Database Password  | root  |
| Database Host  | localhost / 127.0.0.1  |
| SSH Host  | 192.168.33.10  |
| SSH User  | vagrant  |
| SSH Password  | vagrant  |

[1]: http://www.vagrantup.com/downloads
[2]: http://vagrantmanager.com/
[3]: http://192.168.33.10/
[4]: https://www.virtualbox.org/wiki/Downloads
[16]: http://box.scotch.io
[17]: http://scotch.io/bar-talk/introducing-scotch-box-a-vagrant-lamp-stack-that-just-works