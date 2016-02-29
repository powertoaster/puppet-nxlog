# create an nxlog.conf route
define nxlog::route (
  $route_name     = undef,
  $route_path     = undef,
  $route_priority = undef,
  $root           = $::nxlog::root
  )
{
  if ! defined(Class['nxlog']) {
      fail('You must include the nxlog base class before using any nxlog defined resources')
      }

  file {"${root}/conf.d/${route_name}.conf":
      ensure  => present,
      content => template('nxlog/route.erb')
    } 

}