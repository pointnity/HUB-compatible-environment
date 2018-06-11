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
