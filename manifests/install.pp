# Class: standard42::install
#
# This class installs standard42
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
class standard42::install {

  package { $standard42::package:
    ensure  => $standard42::manage_package,
    noop    => $standard42::noops,
  }
}
