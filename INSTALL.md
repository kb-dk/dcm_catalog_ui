
## Building and Installing
#  The DCM catalogue user interface

## Getting started with dcm_catalog_ui

You will need an eXist DB installation. There are now special needs
for that; it is [just to follow the manual](https://exist-db.org/exist/apps/doc/basic-installation).

To get a rudimentary installation follow the following procedure:

1. Clone this repository
   
```
 git clone git@github.com:Det-Kongelige-Bibliotek/dcm_catalog_ui.git

```

or

```
https://github.com/Det-Kongelige-Bibliotek/dcm_catalog_ui.git

```

2. Installation requires perl scripting language and ant build tool.

```
 cd dcm_catalog_ui

```

a. Installation on your local machine. 

```
 ant service
 ant add_data
 ant upload

```

The last step (ant upload) requires the admin password of an eXist DB
server on localhost, running on port 8080.

Having done these three steps you will have a everything installed on
the server. It remains to make all scripts executable, and you can do
that for all of them in one go sending a GET request to the following URI

```
 http://localhost:8080/exist/rest/db/cat-site/xchmod.xq

```

Nothing will happen other than that your browser will prompt you for
admin user ID and password. The script will return an empty document,
and you can then easily verify that all scripts ending with *.xq now
are ready to use.

b. Installation on a remote machine

The prerequisites are the same. The only difference being that ant
upload now requires an extra option:

```
 ant upload -Dhostport=your.example.server:8080

```

c. Preparing your Apache HTTPD

You will not be able to run dcm_catalog_ui without an Apache that
keeps track of the URI space of the service. It might cause you head
ache, but for us it means that one server makes it all. We have at
four catalogues on the same site, working independently of each
other.

The file cat-site.conf should be copied to the configuration directory
of your HTTPD's virtual servers.

```
 <Location "/dcm/">

 RewriteEngine on

 RewriteCond %{REQUEST_URI}     .xq$
 RewriteRule (cnw|hartw|gw)/(.+).xq	http://localhost:8080/exist/rest/db/cat-site/$2.xq?c=$1 [P,QSA]

 RewriteCond  %{REQUEST_URI}     (cnw|hartw|gw)/(jquery|js|style|images|library|rism_sigla)/
 RewriteRule (cnw|hartw|gw)/(jquery|js|style|images|library|rism_sigla)/(.*)$ http://localhost:8080/exist/rest/db/cat-site/$2/$3 [P]

 RewriteCond  %{REQUEST_URI}     (editor|data.*)/(.*)$
 RewriteRule (editor|data.*)/(.*)$	http://localhost:8080/exist/rest/db/$1/$2 [P]

</Location>

```

After you've done that, and restarted HTTPD this means that if your
eXist DB is on localhost:8080 and your HTTPD is on standard
localhost:80, you will have one service at

http://localhost/dcm/cnw/navigation.xq

and 

http://localhost/dcm/hartw/navigation.xq


However, only the former contains data.

