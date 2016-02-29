class nxlog::params {
  if $::osfamily == 'windows' {
    $package_name   = "nxlog-ce-2.9.1504.msi"
    $root           = "C:\\Program Files (x86)\\nxlog"
    $module_dir     = '%ROOT%\modules'
    $cache_dir      = '%ROOT\data'
    $pid_file       = '%ROOT%\data\nxlog.pid'
    $spool_dir      = '%ROOT%\data'
    $log_file       = '%ROOT%\data\nxlog.log'
  }
  else {
    notify {"module is not supported on ${::operatingsystem}":}
  }
}
