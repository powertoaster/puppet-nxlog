# nxlog

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with nxlog](#setup)
    * [What nxlog affects](#what-nxlog-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with nxlog](#beginning-with-nxlog)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the installation and configuration of nxlog community
edition on windows hosts.

## Module Description

This module manages the installation and configuration of nxlog community
edition on Windows hosts. A common use case is to use this to ship off logs
to something like splunk, or logstash.

Manages the following
- nxlog config files
- nxlog inputs
- nxlog outputs
- nxlog routes

## Setup

### What nxlog affects

* nxlog-ce package installation
* nxlog.conf
* nxlog inputs
* nxlog outputs
* nxlog routes

### Setup Requirements

Including the base class will handle the installation of nxlog but doesn't do
much else on its own.

`include nxlog`

### Beginning with nxlog

Include the base class and any inputs, outputs, and routes.

```
include nxlog
nxlog::input {'eventlogs':
  input_name   => 'eventlogs',
  input_module => 'im_msvistalog',
  query        => '<QueryList><Query Id="0"><Select Path="Security">*</Select></Query>y</QueryList>',
  }
nxlog::output {'out':
  output_name   => 'out',
  output_module => 'om_tcp',
  output_host    => '192.168.1.1',
  output_port   => '514',
  output_exec   => 'to_syslog_snare();',
  }
# must route to existing output defined above
nxlog::route {'route1':
  route_name => 'route1',
  route_path => 'eventlogs => out',
}
```

## Usage

For more details on the use of nxlog and its parameters please view
[the documentation](https://nxlog.org/documentation/nxlog-community-edition-reference-manual-v20928)

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Development

I welcome all contributions and appreciate pull requests.
