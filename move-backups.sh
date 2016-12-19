#!/usr/bin/env bash

scp ansible@piwiktest1.verwaltung.uni-muenchen.de:/data/backup/* /backup/piwik/
scp ansible@redmine1.verwaltung.uni-muenchen.de:/data/redmine.buildout/backup/* /backup/redmine/
scp ansible@cms-live-appdb1.verwaltung.uni-muenchen.de:/data/backup/* /backup/plone/
