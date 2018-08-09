#!/usr/bin/env python

import random
import sys

if __name__ == "__main__":
    len = int(sys.argv[1])
    min = 33
    max = 126
    passwd = ""
    for i in range(len):
        r = int((random.random() * (max-min)) + min)
        passwd += chr(r)

    print passwd
