include nxlog
nxlog::input {'eventlogs':
  input_name   => 'eventlogs',
  input_module => 'im_msvistalog',
  query        => '<QueryList><Query Id="0"><Select Path="Security">*</Select></Query>y</QueryList>',
  }
nxlog::output {'out':
  output_name   => 'out',
  output_module => 'om_tcp',
  output_host    => '192.168.1.1',
  output_port   => '514',
  output_exec   => 'to_syslog_snare();',
  }
# must route to existing output defined above
nxlog::route {'route1':
  route_name => 'route1',
  route_path => 'eventlogs => out',
}
