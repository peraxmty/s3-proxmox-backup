#!/bin/bash
DUMPLOCATION=/var/lib/vz/dump
S3CMD=s3cmd
S3BUCKET=s3://bucketname

echo "$(date):INFO:Starting S3 file uploads"
for f in `find $DUMPLOCATION -type f`
do
    echo "$(date):INFO:Uploading $f"
    if $S3CMD --multipart-chunk-size-mb=500 --verbose put $f $S3BUCKET
    then
      echo "$(date):INFO:Upload completed"
    else
      echo "$(date):ERROR:Upload failed"
    fi
done
echo "$(date):INFO:Process ended"