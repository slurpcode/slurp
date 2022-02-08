# ⚙️ Getting stared with Python on IBM System i

## October 2020

For a little more than 30 years, I have been developing and maintaining
information systems for companies in different commercial and government
sectors, specifically in IBM environments; S/3x, AS/400 and Systems i, using as
a programming language the robust RPG in its different versions (II, III and
ILE), this has been my comfort zone for many years where I have felt very safe.

For a couple of years now, I have been hearing about an object-oriented
programming language, with which, according to what could be done infinities of
technological projects with a minimum of lines of code; to tell the truth, at
first I hesitated a bit, however, curiosity led me to research on the internet,
about this popular programming language known as Python.

At the beginning of 2019, I decided to download my first Python basic
programming course from YouTube, just before I had completed half of the course
I was already convinced that this programming language had conquered my heart.

For years I had tried to learn other programming languages, with the idea of
leaving my comfort zone and entering other technological platforms; however, I
found many of them boring or tedious in their coding style, not to mention the
number of lines of code that must be used to execute a business rule or
function.

Without a doubt, the Python programming language is not going to replace my
favorite programming language, which is IBM's RPGILE, however, I am already
using it as my alternative programming language.

Python not only synthesizes in one or a few lines of program code, which in
other programming languages would take many lines, but it is a multiplatform
language, its syntax is very fun and simple because it is closer to the natural
language of the human beings and as an added value, it is much more
understandable for learners due to its simplicity, versatility and popularity.

Going back a bit, Guido van Rossum devised the Python language in the late 1980s
and began implementing it in December 1989. In February 1991 he published the
first public version, version 0.9.0. Version 1.0 was released in January 1994,
version 2.0 was released in October 2000, and version 3.0 was released in
December 2008.

Until July 2018, Python development was personally led by Guido van Rossum and
under the umbrella of the Python Software Foundation. As of 2019, Python
development is chaired by a five-member board of directors elected from among
Python developers, which is renewed annually.

To download the latest version of Python, please visit its official download
site: <https://www.python.org/downloads/>

Now, how do you enter the world of IBM System i (AS / 400) using the powerful
Python programming language, resorting to best practices and not die trying?

There is very little documentation on the internet about this and what you find
says almost nothing. Obviously, connecting to an IBM System i Server using
Python as the programming language will depend on what you want to do.

The following is how to connect to an IBM System i server, using the ftp.connect
and ftp.login methods using a Python script. In the following link you can see a
simple example of how to use these methods:

<https://github.com/ClayLanzino/IBM-System-i_AS400/blob/master/Python_Scripts/Ftp_IBM_System_i.py>

Another way could be, writing a Script that runs on the client and connects to
an IBM db2 database that resides on an IBM System i server, and execute certain
SQL statements.

There are two ways to do this, it could be using an iSeries Access ODBC Driver
connection and importing the pyodbc library (import pyodbc). Personally, I very
seldom use the ODBC Driver to connect to IBM System i Databases, due to the
vulnerability it represents and the nature of the connection, which I will not
delve into at this time.

The other way would be to use the ibm_db.connect and ibm_db.pconnect functions
respectively. For information on how to connect to an IBM DB2 database using a
Python Script please visit the following link:

<https://www.ibm.com/support/knowledgecenter/es/SSEPGG_10.5.0/com.ibm.swg.im.dbclient.python.doc/doc/t0054368.html>

Finally, the other way to connect could be, writing the Python code or Script
within the IBM System i server itself; considering that IBM incorporated the
Python programming language into its range of programming languages starting
with version 7R1 or higher of the iSeries Operating System.

The prerequisites for installing Python on an IBM System i are:

Python requires Portable Application Solutions Environment (PASE) to be
installed on the IBM i computer, which is available through product numbers
5770SS1 option 33 and 5733SC1.

It is recommended by IBM that you get the latest Program Temporary Fixes (PTFs)
for product number 5733SC1. For more information, go to the IBM i OpenSSH &
OpenSSL Community web page and search for 5733-SC1 PTFs.

Verify that the latest cumulative PTFs are installed on the IBM i computer.

Install Python 3.6 on the IBM i computer by using the new RPM method provided by
IBM because the open source product 5733OPS is no longer available for download.
For more information about the RPM method, go to the IBM i Open Source web page.

Following are some of the installation commands:

All software provided by the RPMs are installed in the /QOpenSys/pkgs prefixed
directory. To use the software, you can fully qualify the path to the program,
or you can add /QOpenSys/pkgs/bin to your PATH by using the following command:

```
PATH=/QOpenSys/pkgs/bin:$PATH
```

```
export PATH
```

Install Python 3 and other useful Python packages.

```
yum install python3-pip python3-ibm_db python3-itoolkit
```

Install the Python 3 Machine Learning packages.

```
yum install python3-numpy python3-pandas python3-scikit-learn python3-scipy
```

Install Node.js.

```
yum install nodejs10
```

Install the GCC and development tools.

```
yum group install "Development tools"
```

Run the following command to test Python installation.

```
python3 –-version
```

Install the dependent package pycryptodomex by using the following command:

```
python3 -m pip install pycryptodomex
```

It will then result in the Python software being installed on the IBM i computer
along with dependent packages.

To get Python examples on IBM i, visit the following link:
<http://ibm.biz/pythonexamplesonibmi>

## About The Author

Clay Lanzino is a passionate former surfer, father of three children, husband
and a 33-year-old IT professional who loves programming. In his spare time, he
loves being in nature, hugging the trees, walking barefoot to take in the energy
of the earth and doing meditations in the open air. If time permits, he does
some Yoga, in his exclusive meditation room.
