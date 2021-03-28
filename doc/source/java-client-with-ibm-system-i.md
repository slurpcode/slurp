# ☕ Connect using Java from a Client to IBM System i - AS400 using JTOpen

- Date: "March 2021"

In this opportunity I want to share with you a personal experience that I hope can be useful if you come to experience it.

In mid-2020 I was contacted by a client with a specific request. He asked me to help him write a Script to be able to connect to an IBM db2 database residing on an IBM System i - AS/400 Server.

Said script, had to be developed in Java and had to use a connection through JDBC. Actually, I had never written a Script in Java, I had no experience in this programming language, in fact, it is not my favorite programming language, however, I could not refuse my client's request.

Next, I did extensive research on the best way to connect with Java to an IBM System i - AS/400 Server, using best practices.

I had to ensure that this connection was fast, secure and dynamic. There are many Java connection methods to this type of Server, however, this will depend on what we want to do.

If what we want is to make a connection via FTP (File Transfer Protocol) there is a connection method, if we want to send and receive data frames, there is another method to do it. If we want to connect to a database there are other mechanisms and so on.

I thought, wow, it won't be easy but I sure will. I had a double challenge, learn a little Java and at the same time guarantee a secure and fast connection.

Consulting a wide range of sources, which became a very tedious task, I finally came to an article that caught my attention, said article talked about JTOpen Toolboox for Java, with which I decided to try.

JTOpen is an open source version of the IBM Toolbox for Java that is updated more frequently than the IBM System i - AS/400 version of the licensed program.

The IBM Toolbox for Java JDBC driver is included with both versions of IBM Toolbox for Java. This JDBC driver supports JDBC 3.0

The IBM Toolbox for Java is a set of Java classes that allow you to access IBM i, i5/OS, or OS/400 data through a Java program.

With these classes, you can write client/server applications, applets, and servlets that work with data on your IBM i, i5/OS, or OS/400 system. You can also run Java applications that use the IBM Toolbox for Java on the IBM i, i5/OS, or OS/400 Java Virtual Machine.

Here is just a sampling of the many IBM i resources you can access using JTOpen:

- Database -- JDBC (SQL) and record-level access (DDM)
- Integrated File System
- Program calls (RPG, COBOL, service programs, etc)
- Commands
- Data queues
- Data areas
- Print/spool resources
- Product and PTF information
- Jobs and job logs
- Messages, message queues, message files
- Users and groups
- User spaces
- System values
- System status

To download and install JTOpen please visit the following link:

https://sourceforge.net/projects/jt400/

JTOpen is comprised of the following files:

Jar file          Contents
--------          --------
jtopen_x_x_source.zip  This is a zip file of all the source files in the repository. Note:  It is not a Java jar file.

jt400.jar(*)   This is the main JTOpen jar file. It contains almost all open source code (except for the few Toolbox classes that could not be open-sourced), including the utilities package, and the JDBC driver (JDBC 3.0).

Once your .zip file is unzipped, go to the lib folder,  run the jt400.jar file, which will create the com, ibm and as400 folders. Ready! you have everything you need to connect your Java Script to your IBM System i - AS/400 Server.

Don't forget to compile your Java Script on top of the previously installed folders.

Note: If the database host server is not started. You can start this by running
the following command on the AS/400 command line: STRHOSTSVR

*DATABASE

Then, you can verify if the database host server is running by running the
NETSTAT *CNN command.

When the work with TCP/IP Connection Status
screen is displayed, look for entry as-database under the Local Port heading
and ensure it is in Listen status.

The first instruction in your Java Script should look something like this:

import com.ibm.as400.access.AS400JDBCDriver;

Please visit the following link to download my Java connection prototype - IBM System i -AS/400:

https://github.com/ClayLanzino/IBM-System-i_AS400/tree/master/Java_Scripts

Hoping it will be of some help to the community.

## About The Author

Clay Lanzino is a passionate former surfer, father of three children, husband
and a 33-year-old IT professional who loves programming. In his spare time, he
loves being in nature, hugging the trees, walking barefoot to take in the energy
of the earth and doing meditations in the open air. If time permits, he does
some Yoga, in his exclusive meditation room.
