# myservice - myservice job file

#description "delaying boot process..."
#author "Me <myself@i.com>"

# Stanzas
#
# Stanzas control when and how a process is started and stopped
# See a list of stanzas here: http://upstart.ubuntu.com/wiki/Stanzas#respawn

# When to start the service
start on runlevel [2345]

# When to stop the service
#stop on runlevel [016]

# Automatically restart process if crashed
#respawn

# Essentially lets upstart know the process will detach itself to the background
#expect fork

# Run before process
#pre-start script
#    [ -d /var/run/myservice ] || mkdir -p /var/run/myservice
#    echo "Put bash code here"
#end script

ping -W 30 -c 1 www.google.com

# Start the process
#exec myprocess
