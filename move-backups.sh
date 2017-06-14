#!/usr/bin/env bash

sudo chown -R root:ansible /backup/*

echo "Copy Piwik Backups"
scp -i /home/fachadmin/.ssh/id_rsa -p ansible@piwiktest1.verwaltung.uni-muenchen.de:/data/backup/* /backup/piwik

echo "Copy Redmine Backups"
scp -i /home/fachadmin/.ssh/id_rsa -p ansible@redmine1.verwaltung.uni-muenchen.de:/data/redmine.buildout/backup/* /backup/redmine

echo "Copy Plone Backups"
rsync --rsync-path="sudo rsync" -rlpt --delete -e "ssh -i /home/fachadmin/.ssh/id_rsa" ansible@cms-live-appdb1.verwaltung.uni-muenchen.de:/data/backups/ /backup/plone

echo "Cleanup Backups (Delete old unnecessary Backups)"
/home/fachadmin/backup_helper_scripts/cleanup-backups.py

sudo chown -R ansible:ansible /backup/* 
