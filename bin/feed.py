#!/usr/bin/env python3

import requests
import xml.etree.ElementTree as ET
from datetime import datetime

# Mon, 16 Mar 2020 14:33:47 +0100
def parsedt(dt):
    return datetime.strptime(dt, '%a, %d %b %Y %H:%M:%S %z')

if __name__ == '__main__':
    parsedt('Mon, 16 Mar 2020 14:33:47 +0100')

    rssItems = []

    try:
        r = requests.get('https://www.nu.nl/rss', timeout=5)
        root = ET.fromstring(r.text)
        items = root[0].findall('item')
        for item in items:
            title = item.findall('title')[0].text
            pubdate = parsedt(item.findall('pubDate')[0].text)
            categories = item.findall('category')

            nuShop = False
            for cat in categories:
                if cat.text == "NUshop":
                    nuShop = True
                    break

            if not nuShop:
                rssItems.append((pubdate, title))

    except Exception as e:
        print(e)
        pass

    sorted_rss_items = sorted(rssItems, key = lambda tuple: tuple[0], reverse=True)

    for (pubdate, title) in sorted_rss_items:
        print("\033[33m%s\033[0m : \033[35m%s\033[0m" % (pubdate, title))
