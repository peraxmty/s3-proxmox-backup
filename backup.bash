#!/bin/bash

#Location of Proxmox backup files:
DUMPLOCATION=/var/lib/vz/dump
#Location of s3cmd binary
S3CMD=s3cmd
#S3 bucket name
S3BUCKET=s3://bucketname
#S3 upload chunk size in MB
CHUNKSIZE=500

echo "$(date):INFO:Starting S3 file uploads"
for f in `find $DUMPLOCATION -type f`
do
    echo "$(date):INFO:Uploading $f"
    if $S3CMD --multipart-chunk-size-mb=$CHUNKSIZE --verbose put $f $S3BUCKET
    then
      echo "$(date):INFO:Upload completed"
    else
      echo "$(date):ERROR:Upload failed"
    fi
done
echo "$(date):INFO:Process ended"