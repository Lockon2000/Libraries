from sys import path as moduleSearchPath
from os import chdir
from os.path import realpath
from pathlib import Path


# This ensures that python will be able to find the main module to import
# app from it.
applicationPath = str(Path(realpath(__file__)).parent.parent)
moduleSearchPath.insert(0, applicationPath)

# This is necessary to be able to provide relative paths when accessing
# a file or other resources and not always hardcode the full path from root.
chdir(applicationPath)

from main import app as application

