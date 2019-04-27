import os
import sys

#cwd = os.getcwd() + '/'
PATH='./'
#If there is a directory given use it
if(len(sys.argv) != 1):
    PATH = sys.argv[1]
#Otherwise assume it is the current directory
result = [os.path.join(dp, f) for dp, dn, filenames in os.walk(PATH) for f in filenames if (os.path.splitext(f)[1] == '.png' or os.path.splitext(f)[1] == '.jpg')]
#Since sys.exit expects a int or none, the string will be written to stder
sys.exit(result)
