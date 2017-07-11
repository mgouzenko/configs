#!/usr/bin/python
import os
import pickle
import sys
import textwrap

import feedparser

URL = "http://rss.cnn.com/rss/cnn_topstories.rss"
N = 3
TOP_N = 10
NEWS_PICKLE = "/tmp/news.pickle"
IDX_FILE = "/tmp/news_idx.txt"
NRUNS = "/tmp/news_nruns_since_last_refresh.txt"
REFRESH_RUNS = 10

def main(argv):
    if os.path.isfile(NRUNS):
        with open(NRUNS, 'r') as nruns_file:
            nruns = int(nruns_file.read().strip())
    else:
        nruns = 0

    if os.path.isfile(NEWS_PICKLE) and nruns < REFRESH_RUNS:
        with open(NEWS_PICKLE, 'r') as new_pickle_file:
            feed = pickle.load(new_pickle_file)
    else:
        feed = feedparser.parse(URL) 
        nruns = 0

    if os.path.isfile(IDX_FILE):
        with open(IDX_FILE, 'r') as idx_file:
            idx = int(idx_file.read().strip())
    else:
        idx = 0

    if idx >= len(feed["items"]) or idx >= TOP_N:
        idx = 0

    for item in feed["items"][idx:idx+N]:
        print '\n'.join(textwrap.wrap(item["title"], width=50))
        print

    with open(NEWS_PICKLE, 'w') as new_pickle_file:
        pickle.dump(feed, new_pickle_file)

    with open(IDX_FILE, 'w') as idx_file:
        idx_file.write(str(idx + 1))

    with open(NRUNS, 'w') as nruns_file:
        nruns_file.write(str(nruns + 1))

if __name__ == '__main__':
    main(sys.argv)
