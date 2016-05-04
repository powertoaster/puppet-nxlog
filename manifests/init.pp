# == Class: nxlog
#
# === Parameters:
#
# $root::                     root folder for nxlog
#                             type: string
# 
# $module_dir::               module directory
#                             type: string
# 
# $cache_dir::                cache directory
#                             type: string
# 
# $pid_file::                 pif file location
#                             type: string
# 
# $spool_dir::                spool directory
#                             type: string
# 
# $log_file::                 log file location
#                             type: string
# 
# $extensions::                 extensions to be installed. Allowed extensions are:
#                             - csv
#                             - json
#                             - xml
#                             - kvp
#                             - gelf
#                             - charconv
#                             - fileop
#                             - multiline
#                             - syslog
#                             - exec
#                             - perl
#                             - wtmp
#                             type: array
# $
class nxlog (
  $root       = $nxlog::params::root,
  $module_dir = $nxlog::params::module_dir,
  $cache_dir  = $nxlog::params::cache_dir,
  $pid_file   = $nxlog::params::pid_file,
  $spool_dir  = $nxlog::params::spool_dir,
  $log_file   = $nxlog::params::log_file,
  $extensions = $nxlog::params::extensions,
  )inherits nxlog::params
  {
  class {'nxlog::install':}
  ->
  class {'::nxlog::config':}
  ~>
  class {'nxlog::service':}
}
