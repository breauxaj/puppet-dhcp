class dhcp {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcp',
  }

  package { $required: ensure => latest }

}

class dhcp::service ( $ensure = running,
                      $enable = true ) {
  $config = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/dhcpd.conf',
  }
    
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcpd',
  }
    
  service { $service:
    ensure    => $ensure,
    enable    => $emable,
    subscribe => File[$config],
  }

}

define dhcp::config ( $subnet,
                      $netmask,
                      $router,
                      $domain,
                      $name_server,
                      $range_start,
                      $range_end,
                      $lease_default,
                      $lease_max ) {
  $config = $operatingsystem ? {
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
