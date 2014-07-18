# Define: dhcp::config
#
# This define configures the dhcp server
#
# Parameters:
#
#  subnet:
#    Define the subnet for the DHCP server
#
#  netmask:
#    Netmask that corresponds to the subnet
#
#  router:
#    Router for the subnet
#
#  domain:
#    Domain for the subnet
#
#  name_servers: (array)
#    One or more name servers for the subnet
#
#  range_start:
#    Subnet range start
#
#  range_end:
#    Subnet range end
#
#  lease_default:
#    Default lease time
#
#  lease_max:
#    Max lease time
#
# Actions:
#   - Configures the dhcp server
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    dhcp::config { 'default':
#      subnet        => '192.168.1.0',
#      netmask       => '255.255.255.0',
#      router        => '192.168.1.1',
#      domain        => 'example.com',
#      name_servers  => [ '208.67.222.222', '208.67.220.220' ],
#      range_start   => '192.168.1.32',
#      range_end     => '192.168.1.47',
#      lease_default => 21600,
#      lease_max     => 43200,
#    }
#
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

  $depends = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcp',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dhcp/dhcpd.erb'),
    require => Package[$depends],
  }

}
