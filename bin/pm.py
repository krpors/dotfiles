#!/usr/bin/env python

"""
Reads a Parkmobile CSV file to summarize costs for a location code.
"""

import csv
import sys
import os
from datetime import datetime

months = dict()
for i in range (1, 13):
    months[i] = 0

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Expecting one argument (CSV file)'
        sys.exit(1)
    f = sys.argv[1]
    with open(f, 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter = ',', quotechar = '"')
        reader.next() # skip first line
        total = 0
        for row in reader:
            startTime = row[6]
            locationCode = row[7]
            amount = float(row[8].replace(',', '.'))
            locationDescription = row[20]
            #print startTime, locationCode, amount, locationDescription
            date = datetime.strptime(startTime, '%d-%m-%Y %H:%M:%S')
            if locationCode == '17010':
                months[date.month] += amount
                total += amount

        for k in months:
            print '%-2s : %s' % (k, months[k])
        print 80 * '-'
        print 'Total:', total
