# this tests the route defined type
include nxlog
nxlog::route {'route1':
  route_name => 'route1',
  route_path => 'eventlogs => syslog',
}