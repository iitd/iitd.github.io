# Install Virtualbox
```
sudo apt install virtualbox
```

# Download and untar the VM image
```
$ wget www.cse.iitd.ac.in/~sbansal/tmp/ubuntu20.tbz2
$ tar xf ubuntu20.tbz2
```

# Register the VM
```
$ VBoxManage registervm ubuntu20/ubuntu20.vbox
```

# See the VM in the list of registered VMs
```
$ VBoxManage list vms
```

# Start the VM
You could use the GUI by typing
```
$ virtualbox
```
Or you could start the VM using the command-line as follows
```
$ VBoxManage startvm "ubuntu20"
```
If you want to start the VM in headless mode:
```
$ VBoxManage startvm "ubuntu20" --type headless
```

# Other useful commands
Pause the VM:
```
VBoxManage controlvm "ubuntu20" pause --type headless
```
Restart the paused VM:
```
VBoxManage controlvm "ubuntu20" resume --type headless
```
Power-off the VM:
```
VBoxManage controlvm "ubuntu20" poweroff --type headless
```
