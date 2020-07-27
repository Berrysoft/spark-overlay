#!/usr/bin/python
# -*- coding:utf-8 -*-

import re
from sys import argv

with open(argv[1]) as f:
    lines = f.readlines()

for line in lines:
    if line.startswith("# java-ebuilder"):
        cmd = line[2:]
    elif line.startswith("SLOT"):
        slot = line.split('"')[1]

args = cmd.split()[1:]

new_args = {}

i = 0
while i < len(args):
    if args[i].startswith("-"):
        new_args[args[i]] = ""
        i += 1
        if not args[i].startswith("-"):
            new_args[args[i-1]] = args[i]
            i += 1

new_args["--slot"] = slot
new_args["--from-maven-central"] = ""
new_args["--binjar-uri"] = new_args["--download-uri"].replace("-sources", "")
new_args["--workdir"] = "/var/lib/java-ebuilder/poms"
new_args["--cache-file"] = "/tmp/pre-stage3-cache"
new_args["--ebuild"] = new_args["--ebuild"][:-7] + "-r1.ebuild"
new_args["--keywords"] = "~amd64"

cmd = "java-ebuilder"
for i in new_args:
    cmd += " " + i + " " + new_args[i]
print(cmd)