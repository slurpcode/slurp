# 🗄️ How to Use the .sql file

## Introduction

This document provides detailed instructions for using a database dump file
(also known as a .sql file) to restore a database or load a database elsewhere.

The system currently has an "Email Database" tool that lets authorized
administrators send a database backup file to themselves via email. This same
process is automatically run on a weekly basis by a cron job running on the
server.

The "back up file" is of a very specific format, known as a database dump file.
This is a plain-text, human-readable file. It is the most common type of file
used for transferring database data from one database to another and for storing
a backup of a database. This file format can be used by many different tools and
different database types (RDBMS).

The automated system automatically names the .sql file using the database name
as the base of the file name, followed by the "sql" extension. For example:
"sitename_db.sql". With regards to its functionality , the exact name of this
file does not actually matter.

The .sql file is essentially just a list of SQL commands. The file can be
uploaded using a tool. Alternatively, the file can be opened using a text editor
and the individual command can be run manually on the database server from the
command line or within a tool that lets users manually run SQL commands and
queries.

This is also known as a database "script." This is a "script" for recreating the
database.

This particular .sql file contains all of the database structure and all of the
data. But it does not contain views. Views are maintained in a separate file
known as "views.sql" (or "views.txt").

## Installing the Database

There are various ways to install a .sql file on another database. These
instructions provide one specific way for doing so, a method that can be done
using only a web browser.

WARNING: These are instructions for installing the database in a clean, empty
database. Do not try to upload the .sql file into an existing live database,
which already has the complete database installed. That would cause errors
and/or data duplication.

1. Log into cPanel

"cPanel" is short for "control panel." It is a web-based administrative
front-end for working on a website.

For example, go to:

<https://id.cpanel.net>

Enter credentials: username: YourWebHostingAccountUsername password: [*******]

2. Within cPanel, click on "phpMyAdmin"

3. Go to an empty database.

You may see a database named "sitename_db_backup". Click on its name in the
left-hand panel.

(If you do not see a database to use, you will need to create one using the
"MySQL Databases" from within cPanel.)

You should see that the "sitename_db_backup" is empty. You should see a note at
the top of the screen that says "No tables found in database."

It is a database in the barest sense of the word. But it has no contents, no
tables, no data.

This is just an example.

The point of installing the .sql file is to put it into an empty database. You
an create your own empty database anywhere you want. You can name it anything
you want.

4. Click the "Import" button in the top menu.

You should see a headline that looks like this:

Importing into the database "sitename_db_backup"

Below it you will see a button:

File to import: Browse your computer:

5. Click the "Browse" button. Select the sitename_db.sql file from your
   computer.

(Leave all the settings at the default.)

6. At the bottom of the page, click the "Go" button.

7. Wait a minute or two. The .sql file will be imported into the database
   server.

8. When the process is over, you will see all of the database tables are now
   listed in the left-hand panel of phpMyAdmin.

There are many tables. They may not be listed all in one panel. There will
probably be a drop-down menu which lets you select which "panel" of table names
you want to view.

## Additional Notes

At the end of the upload process, you may see a red or pink area with errors or
warnings in it. You might see a line that looks like this:

/_!50001 CREATE ALGORITHM=UNDEFINED_/

This is a line from the .sql file which failed to run.

You might see a warning or error like this:

1227 - Access denied; you need (at least one of) the SUPER privilege(s) for this
operation

This is all normal. You can copy at the lines shown (e.g.: /_!50001 CREATE
ALGORITHM=UNDEFINED_/ ...and search for them in the .sql file. Or just look at
the VERY end of the .sql file. You will see that all of the database
structure-creating and data-loading commands ran successfully. But there may be
a few lines of other setting-oriented directives that did not run.

An automatically-generated .sql file may often include a few final directives
that can not be run successfully through this standard "Import" button. These
final lines have no actual impact on your database data. They are related to
temporary server settings.

NOTE ABOUT .sql FILE SIZE: Different servers will have different server-level
settings for the maximum file size allowed when importing a .sql file. I have
this setting currently set to: Max: 100MiB on my dedicated server. This means
that a .sql file up to 100 MB can be uploaded.

If your web hosting account resides on my server, that is the setting that you
should see. You may see this value set to lower or higher numbers. A default
value for this setting, found on many servers, is 10MiB.

The good-sized website may have a lot of data, yet still have a database file
size that is only a few MB in size. So the setting is high enough (by far) to
import these .sql files at their current size given the current database
contents.

If you were to import the file onto another server, you would probably find that
that server's setting are high enough as well. But some servers have a smaller
setting, such as 10 MB. And the .sql file may grow as new data is added to it.

If you encountered a server that won't accept the .sql file, there are other
ways to load the same .sql file. You can upload using the Linux line command.
(This is much faster.) Also, it is possible to divide a single .sql file into
multiple files and load them one at a time. This will work fine, as long as you
are careful not to split up an SQL command.

## Purge the Database to Reload It

If you want to purge the "test" database or "backup" database, you can do so.
You may want to practice the loading technique multiple times.

Or you may want to load a later, newer data set onto a server.

You should not import the .sql file into an already-populated database. This may
cause errors and/or data duplication. It is better to purge the entire database
and load the data from scratch into a blank database.

The easiest way to purge the database is to drop it and re-create it. Here is
how to do that:

1. Log into cPanel

2. Go to "MySQL Databases"

3. Under the heading "Current Databases", click on the "delete" button next to
   the database ("sitename_db_backup"). There is a trash can icon next to the
   "Delete" link/button.

4. You will asked to confirm the decision. Click the "Delete Database" button.

5. Click the "Go Back" link to return to the "MySQL Databases" page.

6. Underneath the heading "Create New Database" and the label "New Database:",
   enter a database name in the text field. Such as "sitename_db_backup."

(Or, if you wanted to create a back-up server or development/test server, you
could use the same name for the database as is used on the live server:
"sitename_db".)

7. Click the "Create Database" button.

8. Click on the cPanel button in the top left corner to return to the main
   cPanel page.

9. Click on phpMyAdmin

10. Click on the name of the database: "sitename_db_backup"

11. You will see that it is empty. You may safely click on the "Import" button
    and load a .sql file here.

## Users

Keep in mind that these directions only tell you how to load a database onto a
MySQL server using phpMyAdmin and cPanel.

We have not created any user accounts for the database. If you actually want
source code to be able to interact or use the database you will need to create
database-level user accounts. This is different than user accounts found in the
database itself in the "users" table.

## About the Author

Preston is a world-class database designer and programmer. In addition to being
the lead developer for Fundraise Genius, Preston is the Data Chief at the
Virginia G. Piper Center for Personalized Diagnostics within the Biodesign
Institute at Arizona State University. Additionally, he's co-authored several
scientific papers on programming and biology. Preston lives in sunny Arizona.
