# place the nxlog.conf config file
#
# this private class is not intended to be called directly

class nxlog::config (
  $root       = $::nxlog::root,
  $module_dir = $::nxlog::module_dir,
  $cache_dir  = $::nxlog::cache_dir,
  $pid_file   = $::nxlog::pid_file,
  $spool_dir  = $::nxlog::spool_dir,
  $log_file   = $::nxlog::log_file,
  $extensions = $::nxlog::extensions
  )
  {
  assert_private()

  file {"${root}/conf.d":
    ensure  => directory,
    require => Class['nxlog::install']
    }
  file {"${root}/conf/nxlog.conf":
    ensure  => present,
    content => template('nxlog/nxlog.conf.erb'),
    require => Class['nxlog::install']
  }
}
