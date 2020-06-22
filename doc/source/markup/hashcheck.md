# 🛂 Hashcheck

## Ruby script to check file checksums with the Windows CertUtil Command

**`hashcheck.rb`** is a Ruby based command line program that checks file
checksums with the Windows CertUtil Command.

The secure hash algorithm choices are: md2 md4 md5 sha1 sha256 sha384 sha512

```
$ ruby hashcheck.rb -h
 Usage: hashcheck.rb [options]

 Specific options:
     -f, --file file                  Path to file
     -a, --algorithm algorithm        Algorithm
         --delay N                    Delay N seconds before executing
     -t, --time [TIME]                Begin execution at given time

 Common options:
     -h, --help                       Show this message
         --version                    Show version
```

## Watch This Space

[&#8593;](#hashcheck)
