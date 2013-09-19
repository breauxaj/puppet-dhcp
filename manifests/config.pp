define dhcp::config (
  $subnet,
  $netmask,
  $router,
  $domain,
  $name_servers,
  $range_start,
  $range_end,
  $lease_default,
  $lease_max
) {
  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/dhcpd.conf',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dhcp/dhcpd.erb'),
  }

}
