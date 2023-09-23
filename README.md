# unraid-coral-tpu-config

Persistent parameter setting for unraid Coral TPU driver.  
Depends on this plugin https://github.com/ich777/unraid-coral-driver

## Usage

### Install

Install by copying the URL to the raw [coral-tpu-config.plg](coral-tpu-config.plg) file (https://raw.githubusercontent.com/BenWu/unraid-coral-tpu-config/main/coral-tpu-config.plg)
into the unraid install remote plugin field.

### Configuration

Coral parameters are persisted in `/boot/config/plugins/coral-tpu-config/parameters.cfg` in the unraid
server.  Each line of the file should be formatted as `parameter=value`, e.g.:

```
trip_point0_temp=60000
trip_point1_temp=70000
trip_point2_temp=80000
```

Valid parameters are in the coral documentation: https://coral.ai/docs/pcie-parameters/

## Building

Build the package by running [source/makepkg.sh](source%2Fmakepkg.sh).  This will create a txz archive and an
associated md5 checksum in [archive](archive).

Version and md5sum in [coral-tpu-config.plg](coral-tpu-config.plg) then needs to be updated.
