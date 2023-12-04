# MZ31-AR0 BIOS Files
This is a repository of BIOS files that I hacked to support being flashed over the `MEGARAC` IPMI on the Gigabyte `MZ31-AR0` motherboard with the 128Mbit/16MByte MXIC `MX25L12873F` flash chip.  

Please note that this is currently untested to the point of system functionality, and all that has been tested at this time is whether or not the MEGARAC IPMI accepts and flashes the ROM/bin file you specify.  

There is also a shell script for people developing BIOS files for this machine that will append the data to the file automatically.  

All you have to do, is grab your bin/rom file, and append the following to the end of the file:
```
23 47 42 54 23 52 4F 4D <SUM16 MSB> <SUM16 LSB> 00 00 00 00 00 00
```
`SUM16 MSB` is the 16-bit SUM of the contents of the file **not including the stuff we're appending** most significant byte  
`SUM16 LSB` is the 16-bit SUM of the contents of the file **not including the stuff we're appending** least significant byte
