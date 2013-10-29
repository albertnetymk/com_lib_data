# Statistics for Epiphany

## Shared memory latency
`identity.txt` contains the data for reading and writing to shared memory. The actor doesn't nothing but read 64000 integers and write them directly
to shared memory.

## Cost

### Raw data

* ;                              // empty loop ~ 12

* x = 1;                         // local_write ~ 16

* x = i;                         // local_read + local_write ~ 17

* x = *x_local_ptr;              // local_read + local_read + local_write ~ 20

* x = *x_remote_ptr;             // local_read + remote_read + local_write ~ 36

* *x_remote_ptr = 1;             // local_read + remote_write ~ 17

* *x_remote_ptr = i;             // local_read + local_read + remote_write ~ 18

* *x_remote_ptr = *x_local_ptr;  // local_read + local_read + local_read + remote_write ~ 20

* *x_remote_ptr = *x_remote_ptr; // local_read + local_read + remote_read + remote_write ~ 36

* start_timer();                 // 27

* stop_timer();                  // 27

* start_timer(); stop_timer();   // 42

### Conclusion

* local_read = local_write = remote_write = 4

* remote_read = 20

* start_timer = 15

* stop_timer = 15
