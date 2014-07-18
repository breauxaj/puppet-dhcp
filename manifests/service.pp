# Define: dhcp::service
#
# This define manages the DHCP service
#
# Parameters:
#
#  ensure:
#    Controls the state of the service
#
#  enable:
#    Controls the service start on boot
#
# Actions:
#   - Stops/starts the DHCP service
#
# Requires:
#
# Sample Usage:
#
#  To enable the service, use:
#
#    dhcp::service { 'default':
#      ensure => running,
#      enable => true
#    }
#
define dhcp::service (
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
