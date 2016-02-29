# test the output defined type
include nxlog
nxlog::output {'out':
  output_name   => 'out',
  output_module => 'om_tcp',
  output_host    => '192.168.1.1',
  output_port   => '514',
  output_exec   => 'to_syslog_snare();',
  }