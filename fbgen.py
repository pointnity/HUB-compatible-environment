#!/usr/bin/env python
# encoding: utf-8
"""
import os, re, sys, time, uuid
from fbgen.gen_templates import *
from optparse import OptionParser
from ConfigParser import SafeConfigParser

def getTemplateFiles(basePath, origPath=None):
    """
    Obtains the location to the template files. Discovers any newly added files automatically.
    @param basePath location from which to start searching for files.
    @param origPath used to strip path information from the returned values. Defaults to None.
    @returns array of strings each entry representing a single file.
    """
  if origPath is None:
        origPath = basePath
    plen = len(origPath) + len(os.path.sep)
    files = []
    for filename in os.listdir(basePath):
        tmpName = os.path.join(basePath, filename)
        if filename[0:1] == '.' or tmpName is None:
            continue
        if os.path.isdir(tmpName):
            files.extend(getTemplateFiles(tmpName, origPath) )
        else:
            files.append(tmpName[plen:])
    return files
