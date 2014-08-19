node default {
  file { '/etc/puppet/manifests/run.pp':
    ensure => present,
    source => '/tmp/build/etc/puppet/manifests/run.pp',
  }

  file { '/etc/supervisor/conf.d/supervisord.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/supervisord.conf',
  }

  class { 'apt':
    always_apt_update => true
  }

  package { 'supervisor':
    ensure  => 'installed'
  }
}