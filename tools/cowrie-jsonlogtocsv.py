#!/bin/env python
import sys
import json
import csv

from unidecode import unidecode

def get_log_field(obj, field):
    return obj[field].strip() if field in obj else ''

def parse_log_line(line, csvwriter):

    obj = json.loads(line)
    csvwriter.writerow({
        'eventid': obj['eventid'],
        'src_ip': get_log_field(obj, 'src_ip'),
        'message': get_log_field(obj, 'message'),
        'username': get_log_field(obj, 'username'),
        'password': get_log_field(obj, 'password')
    })

def read_log_rows(cowrielog):
    
    with open(cowrielog) as f:
        for line in f:
            yield line.strip()

def parse_log(cowrielog, csvfilename):

    csvheader = [ 'eventid', 'src_ip', 'message', 'username', 'password' ]

    with open(csvfilename, 'wb') as csvfile:
        csvwriter = csv.DictWriter(csvfile, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL, fieldnames=csvheader)
        csvwriter.writeheader()

        for line in read_log_rows(cowrielog):
            parse_log_line(line, csvwriter)

def main():

    if len(sys.argv) != 3:
        print "%s <cowrielog.json> <output.csv>" %(sys.argv[0])                    
        sys.exit(-1)

    parse_log(sys.argv[1], sys.argv[2])

if __name__ == "__main__":
    main()
