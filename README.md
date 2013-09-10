DHCP
====

Basic management of dhcp server, and I do mean basic.

Samples
=======

dhcp::config { 'default':
  subnet        => '192.168.1.0',
  netmask       => '255.255.255.0',
  router        => '192.168.1.1',
  domain        => 'example.com',
  name_servers  => [ '208.67.222.222', '208.67.220.220' ],
  range_start   => '192.168.1.32',
  range_end     => '192.168.1.47',
  lease_default => 21600,
  lease_max     => 43200,
}

dhcp::service { 'default': ensure => running, enable => true }
