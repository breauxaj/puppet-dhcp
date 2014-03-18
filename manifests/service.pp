class dhcp::service (
  $ensure = running,
  $enable = true
) {
  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/dhcpd.conf',
  }

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcp',
  }

  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcpd',
  }

  service { $service:
    ensure    => $ensure,
    enable    => $enable,
    subscribe => File[$config],
    require   => Package[$depends]
  }

}
