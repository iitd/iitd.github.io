% Virtualization
% Deepak Ravi
% 


Overview 
-------

- Virtualization
    - Why do we need virtualization?
    - Different kinds of Virtualization.
    - Use lxc : Application virtualization
    - Use virtualbox: Hardware virtualization


Why virtualization?
-------------------

- Run different OS:
     - Run android 6.0 on top of Linux desktop
     - Run Windows on top of Linux
     - Run Linux on top of Linux
     - Run Linux for arm on top of Linux x86
- Isolation guarantee
- Easy Migration from one computer to another computer
- Enables cloud


Different kinds of virtualization
---------------------------------

- App Virtualization
- H/w Virtualization



App Virtualization
---------------------------------

![](os_secure_multiplex.eps)

- Map infinte resources to finite resources 
- Isolation/Controlled sharing
- But network/filesystem are shared among apps.
- But pids are shared among apps.


H/w Virtualization
---------------------------------

![](os_secure_multiplex.eps)

- Cons of App VM: Kernels are shared
- Pros of App VM: Can't run different OS
- Why? 

H/w Virtualization
---------------------------------

![](os_secure_multiplex.eps)

- Cons of App VM: Kernels are shared
- Pros of App VM: Can't run different OS
- Why? Coz OS expects H/w interface not OS interface
- Sol: Hypervisor/ Hw VM: Make OS interface = H/w interface





Lab: LXC
--------

- Goal: Execute ubuntu image on top of debian
- Download/Create Ubuntu Image: 
      - sudo lxc-create --name vmname -t download
      - Location: /var/lib/lxc/vmname
- List VMs:
      - sudo lxc-ls -f
- Start VM:
      - sudo lxc-start -n vmname
- Attach VM:
      - sudo lxc-attach -n vmname
- Get console:
      - sudo lxc-console -n vmname -t ttyno
- Info VM:
      - sudo lxc-info -n vmname
- LAB:
      - Notice different pid mapping
      

Lab: LXC: 
---------

- Enable networking in lxc
      - USE_LXC_BRIDGE="true" (/etc/default/lxc-net)
- Restart lxc-net
      - sudo service lxc-net restart
- Enable network:
      
            lxc.network.type = veth
            lxc.network.link = lxcbr0
            lxc.network.flags = up
            lxc.network.hwaddr = 00:16:3e:xx:xx:xx

- LAB: 
     - Notice new ip for your App VM
- Info: https://wiki.debian.org/LXC/SimpleBridge



Lab: Virtualbox
---------------

- Run Android on top of Linux
- Install Windows on top of Linux



