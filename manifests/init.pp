class dhcp {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'dhcp',
  }

  package { $required: ensure => latest }

}
