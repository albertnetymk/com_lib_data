# Statistics for Epiphany

## Shared memory latency
`identity.txt` contains the data for reading and writing to shared memory. The actor doesn't nothing but read 64000 integers and write them directly
to shared memory.

## 2DIDCT
`snake` branch contains the data for snake layout. `auto` means we load all the input data into shared memory once, and run the application 10 times
in a row, which takes about 30 mins. `manual` means we reload all the data on each run, which takes about 180 mins for 10 iterations.

In each branch, there are four folder which are of interest:

* `fair` : same memory footprint is used in all versions.
* `fair_constrain` : similar to `fair`, but busy polling is conducted on local mirror variables.
* `plain` : same buffer size is used, but memory footprint is different across various versions, for number of buffers is different.
* `plain_constrain` : similar to `plain`, but busy polling is conducted on local mirror variables.

## Table
`test.sh` is the driver for iterating all the different folders, and during the process, `table_2.pl`, `table_3.pl` and `test.pl` are called by the
driver to create execution cycles and its deviation. In every folder, there's one file called `table.md`, which contains the mean and standard
deviation of all the data in that folder.
