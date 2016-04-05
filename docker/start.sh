#! /bin/bash
# Not in use for now. Only needed if we need local customiztion. 
chown -R jenkins:jenkins /var/jenkins_home
exec /usr/local/bin/jenkins.sh "$@"
