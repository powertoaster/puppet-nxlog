class nxlog::service {
  service {'nxlog':
    ensure => running,
    enable => true,
  }
}
