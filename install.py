#!/usr/bin/python2
import json
import logging
import os
import shutil
import sys
import time

SYMLINKS = './symlinks.json'
OLD_CONFIGS = '~/.old_configs/{}'


def main(argv):
    logging.basicConfig(level=logging.INFO)

    # Create directory to store old configs.
    old_config_dir = os.path.expanduser(OLD_CONFIGS.format(time.time()))
    if not os.path.exists(old_config_dir):
        os.makedirs(old_config_dir)

    with open(SYMLINKS, 'r') as symlinks_file:
        links = json.loads(symlinks_file.read())
        for src, dest in links.iteritems():
            src_abs_path = os.path.abspath(src)
            dest_abs_path = os.path.expanduser(dest)

            if os.path.exists(dest_abs_path):
                dest_name = os.path.basename(dest_abs_path)
                new_location = os.path.join(old_config_dir, dest_name)
                logging.info("Creating backup:\t%s --> %s", dest_abs_path, new_location)
                shutil.move(dest_abs_path, new_location)

            logging.info(
                "Creating link:\t%s --> %s", dest_abs_path, src_abs_path)
            os.link(src_abs_path, dest_abs_path)

if __name__ == '__main__':
    main(sys.argv)
