docker-jenkins

Official jenkins build with awscli as additional package to schedule jenkins home to an S3 bucket.

Sample usage: 

Create a free style project with the following shell: 

        aws s3 sync --delete --no-follow-symlinks /var/jenkins_home/ s3://<bucket>/jenkins-home --exclude='war/*' --exclude='*/workspace/*'

Build periodically

        H/60 * * * * 
