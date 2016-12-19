#!/usr/bin/env bash

scp ansible@piwiktest1.verwaltung.uni-muenchen.de:/data/backup/* ansible@ansiblem1.zuv.uni-muenchen.de:/backup/piwik/
scp ansible@redmine1.verwaltung.uni-muenchen.de:/data/redmine.buildout/backup/* ansible@ansiblem1.zuv.uni-muenchen.de:/backup/redmine/
scp ansible@cms-live-appdb1.verwaltung.uni-muenchen.de:/data/backup/* ansible@ansiblem1.zuv.uni-muenchen.de:/backup/plone/
