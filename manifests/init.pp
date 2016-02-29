# == Class: nxlog

class nxlog (
  $root       = $nxlog::params::root,
  $module_dir = $nxlog::params::module_dir,
  $cache_dir  = $nxlog::params::cache_dir,
  $pid_file   = $nxlog::params::pid_file,
  $spool_dir  = $nxlog::params::spool_dir,
  $log_file   = $nxlog::params::log_file,
  )inherits nxlog::params
  {
  class {'nxlog::install':}
  ->
  class {'::nxlog::config':}
  ~>
  class {'nxlog::service':}
}
