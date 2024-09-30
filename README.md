# s3-proxmox-backup
This script helps you upload a copy of your Proxmox backups (or any other directory on your server for that matter) to a S3 provider.
I've configured my Proxmox backups to only keep one copy of them and manually prune old backups from my S3 provider management page or with an S3 client such as WinSCP.

It requires s3cmd (https://github.com/s3tools/s3cmd). It works with Amazon S3 or compatible providers. I'm currently using it with Backblaze B2.
