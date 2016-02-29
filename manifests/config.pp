# place the nxlog.conf config file
class nxlog::config (
  $root = $nxlog::params::root,
  )inherits nxlog::params
    {
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
