#!/bin/bash
DRYRUN='--dryrun'
if [ $1 = '--dryrun=false' ]; then
    DRYRUN=''
else
    echo "Dryrun only. Use --dryrun=false for real run."
fi

AWS_CONFIG_ENV=/root/.aws/envvars
[[ -f $AWS_CONFIG_ENV ]] || /opt/bin/setup-aws-env
IMAGE=suet/awscli:latest
BUCKET=s3://anchorage-jenkins/jenkins-test
DST=/var/lib/apps-data/jenkins-test
mkdir -p $DST
CMD="aws s3 sync $DRYRUN $BUCKET $DST"

# pull the IMAGE if not loaded
docker history $IMAGE > /dev/null 2>&1 || docker pull $IMAGE
# sync s3 apps to
docker run --rm -v ${DST}:${DST} --env-file=$AWS_CONFIG_ENV $IMAGE /bin/bash -c "$CMD"

exit 0 
