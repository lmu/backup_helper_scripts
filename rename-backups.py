#!/usr/bin/env python
# Assumes python 2.6 or 2.7
from __future__ import print_function

from datetime import date
from datetime import timedelta
from os import listdir

import glob
import logging
import os
import os.path
import time

def rename_backups():
    for backupfile in glob.glob('/backup/*/*'):
        if os.path.isfile(backupfile):
            basename = os.path.basename(backupfile)
            dirname = os.path.dirname(backupfile)

            if basename[0:3] != '201':
                new_name = basename[basename.find('201'):basename.find('201') + 10] + '_' + basename[0:basename.find('201') - 1] + basename[basename.find('201') + 10:]

                print('rename ' + str(basename) + ' to ' + new_name)
                os.rename(backupfile , os.path.join(dirname, new_name))


if __name__ == "__main__":
    rename_backups()

