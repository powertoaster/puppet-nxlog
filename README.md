# nxlog

[![Build Status](https://travis-ci.org/dschaaff/puppet-nxlog.svg?branch=master)](https://travis-ci.org/dschaaff/puppet-nxlog)

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

### Classes

#### Public Classes
* `nxlog`

#### Private Classes
* `nxlog::config`
* `nxlog::params`
* `nxlog::service`
* `nxlog::install`

### Defined Types
* `nxlog::input`
* `nxlog::output`
* `nxlog::route`

### Class: `nxlog`
This is the main class. It will install nxlog and manage the service.

#### Parameters
* `root`: Sets the root install path in nxlog.conf
  - Default: ` "C:\\Program Files (x86)\\nxlog" `
* `module_dir`: By default the nxlog binaries have a compiled-in value for the directory to search for loadable modules. This can be overrridden with this directive. The module directory contains subdirectories for each module type (extension, input, output, processor) and the module binaries are located in those.
  - Default: `%ROOT%\modules`
* `cache_dir`: Specifies where the cache file is written to
  - Default: `%ROOT\data`
* `pid_file`: Directive has no effect on Windows
  - Default: `%ROOT%\data\nxlog.pid`
* `spool_dir`: nxlog will change its working directory to the value specified with this directive. This is useful with files created through relative filenames, e.g. with om_file and in case of core dumps. This directive has no effect with the nxlog-processor.
  - Default: `%ROOT%\data`
* `log_file`: Specifies where nxlog will write its internal log file
  - Default: `%ROOT%\data\nxlog.log`

### Defined Type: `nxlog::input`

#### Paramters
* `input_name`: *Required* What the input is called. This is how it will be referenced in route directives
  - Default: undef
* `input_module`: *Required* What nxlog module the input will use.
  - Default: undef
* `query`: *Optional*
  - Default: undef

### Defined Type: `nxlog::output`

#### Paramters
* `output_name`: *Required* What the output will be called.
  - Default: undef
* `output_module`: *Required* What nxlog module the output will use.
  - Default: undef
* `output_host`: *Required* Hostname or IP of the output destination host.
  - Default: undef
* `output_port`: *Required* Destination port
  - Default: undef
* `output_exec`: *Required*
  - Default: undef

### Defined Type: `nxlog::route`

#### Paramters
* `route_name`: *Required* What the route will be called.
  - Default: undef
* `route_path`: *Required* How the data will be route. Should take the form of `input_name => output_name`. Input_names should be comma separated when there is more than one.
  - Default: undef
* `route_priority`: *optional*
  - Default: undef

## Development

I welcome all contributions and appreciate pull requests.
