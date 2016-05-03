# create an nxlog output config
#
# more info found at http://nxlog-ce.sourceforge.net/nxlog-docs/en/nxlog-reference-manual.html#modules_output

define nxlog::output (
  $output_name   = undef,
  $output_module = undef,
  $output_host   = undef,
  $output_port   = undef,
  $output_exec   = undef,
  $output_type   = undef,
  $root          = $::nxlog::root
  )
  {
    if ! defined(Class['nxlog']) {
      fail('You must include the nxlog base class before using any nxlog defined resources')
      }

    validate_string($output_name)
    validate_re($output_module, ['^om_blocker$','^pm_dbi$', '^om_exec$', '^om_file$', '^om_http$', '^om_null$', '^om_ssl$', '^om_tcp$', '^om_udp$', '^om_uds$'])
    validate_integer($output_port)
    validate_string($output_exec)

    file {"${root}/conf.d/${output_name}.conf":
      ensure  => present,
      content => template('nxlog/output.erb')
    }

}
