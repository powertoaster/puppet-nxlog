include nxlog
nxlog::input {'eventlogs':
  input_name   => 'eventlogs',
  input_module => 'im_msvistalog',
  query        => '<*>',
  }