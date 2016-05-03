# set the default values
class nxlog::params {
  if $::osfamily == 'windows' {
    $root           = "C:\\Program Files (x86)\\nxlog"
    $module_dir     = '%ROOT%\modules'
    $cache_dir      = '%ROOT\data'
    $pid_file       = '%ROOT%\data\nxlog.pid'
    $spool_dir      = '%ROOT%\data'
    $log_file       = '%ROOT%\data\nxlog.log'
    $extensions     = undef
  }
  else {
    notify {"module is not supported on ${::operatingsystem}":}
  }
}
