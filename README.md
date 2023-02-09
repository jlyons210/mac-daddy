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

$ my_macs2=$(cat << EOF
> 7C-2E-BD-00-00-00
> 40-8D-5C-00-00-00
> A4-30-7A-00-00-00
> EOF
> )

$ echo $my_macs
7C-2E-BD-00-00-00 40-8D-5C-00-00-00 A4-30-7A-00-00-00

$ ./mac-daddy.sh $my_macs
7C-2E-BD-00-00-00       Google, Inc.
40-8D-5C-00-00-00       GIGA-BYTE TECHNOLOGY CO.,LTD.
A4-30-7A-00-00-00       Samsung Electronics Co.,Ltd
```

## TODO:
