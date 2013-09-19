class dhcp::service (
  $ensure = running,
  $enable = true
) {
  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/dhcpd.conf',
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcpd',
  }

  service { $service:
    ensure    => $ensure,
    enable    => $enable,
    subscribe => File[$config],
  }

}
