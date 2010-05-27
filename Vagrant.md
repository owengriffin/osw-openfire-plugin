

The Vagrantfile will allow you to quickly provision a virtual machine with an Openfire server. This is intended to make testing easier.

You will need to create a Ubuntu Lucid image with sun-java6-jdk pre-installed. There is a [guide for creating a base box](http://vagrantup.com/docs/base_boxes.html) on the Vagrant web site. 

## Troubleshooting

### I am unable to connect to the virtual machine 

If you repeatedly see the message:

    Vagrant: Trying to connect (attempt #N of N)...

then you need to log into the virtual machine and run the following commands

    sudo rm /etc/udev/rules.d/70-persistent-net.rules
    sudo shutdown -r now
