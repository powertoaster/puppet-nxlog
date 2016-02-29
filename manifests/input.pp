# create an input in nxlog.conf
define nxlog::input (
  $input_name   = undef,
  $input_module = undef,
  $query        = undef,
  $root         = $::nxlog::root
  )
{
  if ! defined(Class['nxlog']) {
      fail('You must include the nxlog base class before using any nxlog defined resources')
      }

  file {"${root}/conf.d/${input_name}.conf":
      ensure  => present,
      content => template('nxlog/input.erb'),
      notify  => Service['nxlog']
    }
}
