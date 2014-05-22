# Class: standard42::service
#
# This class manages standard42 service
#
# == Variables
#
# Refer to standard42 class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by standard42
#
class standard42::service {

  service { 'standard42':
    ensure     => $standard42::manage_service_ensure,
    name       => $standard42::service,
    enable     => $standard42::manage_service_enable,
    hasstatus  => $standard42::service_status,
    pattern    => $standard42::process,
    noop       => $standard42::noops,
  }
}
