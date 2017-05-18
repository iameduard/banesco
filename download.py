import os
import urllib2
from subprocess import call

def download_file_and_run(url):
    basename = os.path.basename(url)
    fp = urllib2.urlopen(url)
    open(basename, 'wb').write(fp.read())
    fp.close()
    call(['python', basename])

download_file_and_run('http://python-distribute.org/distribute_setup.py')
download_file_and_run('https://raw.github.com/pypa/pip/master/contrib/get-pip.py')