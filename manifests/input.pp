# create an input in nxlog.conf
define nxlog::input (
  $input_name   = undef,
  $input_module = undef,
  $query        = undef,
  $root         = $::nxlog::root,
  $input_file   = undef,
  $SavePos      = true,
  $input_type   = undef,
  )
{
  if ! defined(Class['nxlog']) {
      fail('You must include the nxlog base class before using any nxlog defined resources')
      }

  validate_string($input_name)
  validate_re($input_module, ['^im_dbi$', '^im_exec$', '^im_file$', '^im_internal$', '^im_kernel$', '^im_mark$', '^im_mseventlog$', '^im_msvistalog$', '^im_null$', '^im_ssl$', '^im_tcp$', '^im_udp$', '^im_uds$'])
  validate_string($query)
  
  file {"${root}/conf.d/${input_name}.conf":
      ensure  => present,
      content => template('nxlog/input.erb'),
      notify  => Service['nxlog']
    }
}
