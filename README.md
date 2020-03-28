# brickstuff
A few utilities for my Lego stuff

## Convert Bricklink Inventory XML to CSV

BrickStock can export a Bricklink Inventory XML file. You can then convert it to CSV using this command on Mac OX:

```
curl -fsSL https://raw.githubusercontent.com/frahugo/brickstuff/master/bricklink-inv.xsl | xsltproc - file.xml > file.csv
```
