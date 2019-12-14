---
title: Hashcheck
permalink: /docs/hashcheck/
---

# Ruby script to check file checksums with the Windows CertUtil Command

**``hashcheck.rb``** is a Ruby based command line program that
checks file checksums with the Windows CertUtil Command.

The secure hash algorithm choices are: md2 md4 md5 sha1 sha256 sha384 sha512

```
$ ruby hashcheck.rb -h
Usage: hashcheck.rb [options]
    -f, --file file                  Path to file
    -a, --algorithm algorithm        Algorithm
    -h, --help                       Displays help
        --version                    Show program version
```

## Watch This Space

[&#8593;](#hashcheck)
