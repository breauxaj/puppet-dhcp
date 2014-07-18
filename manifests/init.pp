# Class: dhcp
#
# This class installs the dhcp server
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the dhcp package
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'dhcp':
#      ensure => 'latest'
#    }
#
#  To remove the installation, use:
#
#    class { 'dhcp':
#      ensure => 'absent'
#    }
#
class dhcp (
  $ensure = 'latest'
){
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcp',
  }

  package { $required: ensure => $ensure }

}
