# Manage NTP
class pbg_ntp {
  ensure_packages(['ntp'])

  file { '/etc/ntp.conf':
    source  => 'puppet:///modules/pbg_ntp/ntp.conf',
    notify  => Service['ntpd'],
    require => Package['ntp'],
  }

  service { 'ntpd':
    ensure => running,
    enable => true,
  }
}
