# create an nxlog output config
define nxlog::output (
  $output_name   = undef,
  $output_module = undef,
  $output_host   = undef,
  $output_port   = undef,
  $output_exec   = undef,
  $root          = $::nxlog::root
  )
  {
    if ! defined(Class['nxlog']) {
      fail('You must include the nxlog base class before using any nxlog defined resources')
      }
    file {"${root}/conf.d/${output_name}.conf":
      ensure  => present,
      content => template('nxlog/output.erb')
    }

}
