# 🚀 Seek

## When you need those jobs hypersonic -> seek 🚀

**_seek_** is a command line script that builds 🔧 🔩 🔨 `CSV` results of job
searches. Check out the `jobs` folder for some recent **_seek_**_s_.

**_seek_** is built with:

- [Ruby](https://www.ruby-lang.org)
- [Mechanize](https://github.com/sparklemotion/mechanize)
- [OptionParser](https://ruby-doc.org/stdlib-2.6.3/libdoc/optparse/rdoc/OptionParser.html)
- [FileUtils](https://apidock.com/ruby/v2_6_3/FileUtils)
- [Paint](https://github.com/janlelis/paint)
- [CSV class](https://ruby-doc.org/stdlib-2.5.0/libdoc/csv/rdoc/CSV.html)
- [XPath](https://en.wikipedia.org/wiki/XPath)
- [CSV](https://en.wikipedia.org/wiki/Comma-separated_values)

Hey Wow :) looks like there are still `jobs`
[COBOL](https://en.wikipedia.org/wiki/COBOL)

## Seek

Large Australian employment marketplace:

[https://www.seek.com.au/](https://www.seek.com.au/)

```
$ ruby seek.rb -h
Usage: seek.rb [options]

Specific options:
    -k, --keyword keyword            Keywords to search
                                               separators include:
                                               and, or, not
    -l, --location location          Suburb, city or region
    -r, --range range                Listed time in days
                                                       999 (default) or
                                                       1, 3, 7, 14, 31 or
                                                       any positive number
    -w, --worktype worktype          Work type
                                                 all (default)
                                                 full or 242 (full time)
                                                 part or 243 (part time)
                                                 contract or 244 (contract/temp)
                                                 casual or 245 (casual/vacation)
        --delay N                    Delay N seconds before executing
    -t, --time [TIME]                Begin execution at given time

Common options:
    -h, --help                       Show this message
        --version                    Show version
```

Or to enter interactive mode

```
$ ruby seek.rb
Enter keywords: git and python
Enter suburb, city or region: sydney
Listed time in days: 30
Work type: full
41 jobs found
```

![scrape](images/scrape-jobs.png)
