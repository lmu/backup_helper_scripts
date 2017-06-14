#!/usr/bin/env bash

sudo chown -R fachadmin:ansible /backup/*

echo "Copy Piwik Backups"
scp -p ansible@piwiktest1.verwaltung.uni-muenchen.de:/data/backup/* /backup/piwik

echo "Copy Redmine Backups"
scp -p ansible@redmine1.verwaltung.uni-muenchen.de:/data/redmine.buildout/backup/* /backup/redmine

echo "Copy Plone Backups"
sudo rsync --rsync-path="sudo rsync" -rlpt --delete -e ssh ansible@cms-live-appdb1.verwaltung.uni-muenchen.de:/data/backups/ /backup/plone

echo "Cleanup Backups (Delete old unnecessary Backups)"
/home/fachadmin/backup_helper_scripts/cleanup-backups.py

sudo chown -R ansible:ansible /backup/* 
