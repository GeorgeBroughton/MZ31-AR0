# MZ31-AR0 BIOS Files
This is a repository of BIOS files that I hacked to support being flashed over the `MEGARAC` IPMI on the Gigabyte `MZ31-AR0` motherboard with the 128Mbit/16MByte MXIC `MX25L12873F` flash chip.  

Please note that this is currently untested to the point of system functionality, and all that has been tested at this time is whether or not the MEGARAC IPMI accepts and flashes the ROM/bin file you specify.  

There is also a shell script for people developing BIOS files for this machine that will append the data to the file automatically.  

All you have to do, is grab the 16-bit sum of every bit in your bin/rom file, and append the following to the end of the file with a hex editor:
```
23 47 42 54 23 52 4F 4D <SUM-16> 00 00 00 00 00 00
```
