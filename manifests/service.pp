# manages the nxlog service
#
# this class should not be called directly
class nxlog::service {
  service {'nxlog':
    ensure => running,
    enable => true,
  }
}
