# mac-daddy
Polls api.macvendors.com to look up the vendor for any number of provided MAC addresses.

## Usage:
```
./mac-daddy.sh mac_address [mac_address] [mac_address] ...

Acceptable mac_address formats:
  00-11-22-33-44-55
  00:11:22:33:44:55
  00.11.22.33.44.55
  001122334455
  0011.2233.4455
```

## Example commands and outputs:
```
$ ./mac-daddy.sh 00-11-22-33-44-55
00-11-22-33-44-55       CIMSYS Inc

$ ./mac-daddy.sh 00-11-22-33-44-55 44-55-66-77-88-99
00-11-22-33-44-55       CIMSYS Inc
44-55-66-77-88-99       (Unknown Vendor)
```

## TODO:
