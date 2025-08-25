
[README](../README.md) | [How to install](../INSTALL.md) | [About the software package](cat-site/README.md)

# The software and how it is structured

This is the software. The resulting web site is not structured as in
here, see [configuration file cat-site.conf](../cat-site.conf)

## Individual web sites

You'll find four example services, only one of which contains
data. Obviously, the URI mappings below are only valid while you are
running the thing on your own your localhost.

| directory  | URI mapping |
|:-----------|:------------|
| cnw        | http://localhost/dcm/cnw/index.xq |
| hartw      | http://localhost/dcm/hartw/index.xq (empty) |
| nwgw       | http://localhost/dcm/nwgw/index.xq (empty) |
| schw       | http://localhost/dcm/schw/index.xq (empty) |

These directories contain editorial texts and specific HTML files for
each edition. Each page has a script and some of them a content
file. E.g., the cnw/about.xq takes the content from about.html and publishes that on 

http://localhost/dcm/cnw/about.xq which is actually a remapping of
http://localhost:8080/exist/rest/db/cat-site/about.xq?c=cnw See
[configuration file cat-site.conf](../cat-site.conf). Not only are the
remapped URIs more tractable, the who package assumes that it it
possible to write relative links between those more compact forms.

In addition to the HTML files the xquery module layout.xqm gives you
the tools needed to style and customize the look and feel. The most
important functions are in index.xq, and it uses the following
modules.

1. dates.xqm
2. filter_utils.xqm
3. form_utils.xqm
4. layout.xqm
5. list_utils.xqm
6. main_loop.xqm

## Misc css, xsl, javascript and tools

| directory  | URI mapping |
|:-----------|:------------|
| style | http://localhost/dcm/cnw/style/ |
| js |  http://localhost/dcm/cnw/js/ |
| jquery | http://localhost/dcm/cnw/jquery/ |
| tools |  http://localhost/dcm/cnw/tools/ |

The content is delivered from these for all of cnw, hartw and
schw. This explains the linking to javascripts and style sheets etc
you find in [layout.xqm](layout.xqm).

## Data for controlled names of collections and libraries

These are not used in the user interfaces directly, but is data for
looking the meaning of abbreviations etc. Your project might need to
change that, but then you should start to think about that before
actually implementing the end user interface.

| directory  | URI mapping |
|:-----------|:------------|
| rism_sigla | http://localhost/dcm/rism_sigla/ |
| library | http://localhost/dcm/library/ |
