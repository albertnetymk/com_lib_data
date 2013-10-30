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

* x = *x_remote_ptr;             // local_read + remote_read (core0 -- core1) + local_write ~ 36

* x = *x_remote_ptr;             // local_read + remote_read (core0 -- core2) + local_write ~ 39

* x = *x_remote_ptr;             // local_read + remote_read (core0 -- core3) + local_write ~ 42

* x = *x_remote_ptr;             // local_read + remote_read (core0 -- core4) + local_write ~ 36

* x = *x_remote_ptr;             // local_read + remote_read (core0 -- core15) + local_write ~ 51

* *x_remote_ptr = 1;             // local_read + remote_write ~ 17

* *x_remote_ptr = i;             // local_read + local_read + remote_write ~ 18

* *x_remote_ptr = *x_local_ptr;  // local_read + local_read + local_read + remote_write ~ 20

* *x_remote_ptr = *x_remote_ptr; // local_read + local_read + remote_read (core0 -- core1) + remote_write ~ 36

* start_timer();                 // 91

* stop_timer();                  // 60

* start_timer(); stop_timer();   // 139

### Conclusion

* local_read = local_write = 4

* remote_write = 4 (for all other cores)

* remote_read = 20 + 3 * hops

* start_timer = 79

* stop_timer = 48
