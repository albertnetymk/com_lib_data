# Statistics for Epiphany

## Shared memory latency
`identity.txt` contains the data for reading and writing to shared memory. The actor doesn't nothing but read 64000 integers and write them directly
to shared memory.

## 2DIDCT
`snake` branch contains the data for snake layout. `auto` means we load all the input data into shared memory once, and run the application 10 times
in a row, which takes about 30 mins. `manual` means we reload all the data on each run, which takes about 180 mins for 10 iterations.

## Table
`test.sh` is the driver for iterating all the different folders, and create tables. `table_2.pl`, `table_3.pl` and `test.pl` are called by the driver
to finish the task.
