# place the nxlog.conf config file
#
# this private class is not intended to be called directly

class nxlog::config (
  $root = $nxlog::params::root,
  )inherits nxlog::params
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
