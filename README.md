# honggfuzz-twitter-alerter
coredump watcher for honggfuzz for twitter (for the lolz) - Tom Van de Wiele 2011

# Preparation
  * sudo gem install twitter
  * get twitter api keys from http://dev.twitter.com/apps/new

# Instructions
  * Script to be run from your honggfuzz/ dir
  * Assumes you will generate core dumps in fuzz_appname/ subdirs in hongfuzz/ dir for every app you're fuzzing e.g. fuzz_itunes/, fuzz_preview/, etc
  * check interval is every 10 mins, change below - observe twitter fair use rates for ++ tweeting
  * change twitter api settings below
  * scans through your subdirs, will be slow when you have a gazillion files but meh
  * does not check for twitter fair use error msgs so don't put the interval too low, see http://support.twitter.com/articles/15364

# Example
```
$ ls
$ hongfuzz/
$ hongfuzz/fuzz_itunes/
$ hongfuzz/fuzz_itunes/SIGSEGV.44578.2010-10-14.16.39.09.fuzz
$ hongfuzz/fuzz_preview/
$ hongfuzz/fuzz_preview/SIGSEGV.97632.2010-10-15.20.43.22.fuzz
```
