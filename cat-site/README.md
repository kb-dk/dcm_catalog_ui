
# The software and how it is structured

This is the software. The resulting web site is not structured as in here, see [configuration file cat-site.conf](../cat-site.conf)

## Individual web sites

You'll find four example services, only one of which contains data.

| directory  | URI mapping |
|:-----------|:------------|
| cnw        | http://localhost/dcm/cnw/navigation.xq |
| hartw      | http://localhost/dcm/hartw/navigation.xq (empty) |
| nwgw       | http://localhost/dcm/nwgw/navigation.xq (empty) |
| schw       | http://localhost/dcm/schw/navigation.xq (empty) |

These directories contain editorial texts and specific HTML for each edition.

## Misc css, xsl, javascript and tools

| directory  | URI mapping |
|:-----------|:------------|
| style | http://localhost/dcm/style/ |
| js |  http://localhost/dcm/js/ |
| jquery | http://localhost/dcm/jquery/ |
| tools |  http://localhost/dcm/tools/ |

## Data for controlled names of collections and libraries

| directory  | URI mapping |
|:-----------|:------------|
| rism_sigla | http://localhost/dcm/rism_sigla/ |
| library | http://localhost/dcm/library/ |
