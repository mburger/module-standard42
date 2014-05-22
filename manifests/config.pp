# Class: standard42::config
#
# This class manages standard42 configuration
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
class standard42::config {

  file { 'standard42.conf':
    ensure  => $standard42::manage_file,
    path    => $standard42::config_file,
    mode    => $standard42::config_file_mode,
    owner   => $standard42::config_file_owner,
    group   => $standard42::config_file_group,
    notify  => $standard42::manage_service_autorestart,
    source  => $standard42::manage_file_source,
    content => $standard42::manage_file_content,
    replace => $standard42::manage_file_replace,
    audit   => $standard42::manage_audit,
    noop    => $standard42::noops,
  }

  if ($standard42::config_file_init_source or $standard42::config_file_init_template) {
    file { 'standard42.init.conf':
      ensure  => $standard42::manage_file,
      path    => $standard42::config_file_init,
      mode    => $standard42::config_file_mode,
      owner   => $standard42::config_file_owner,
      group   => $standard42::config_file_group,
      source  => $standard42::manage_config_file_init_source,
      content => $standard42::manage_config_file_init_template,
      replace => $standard42::manage_file_replace,
      audit   => $standard42::manage_audit,
      noop    => $standard42::noops,
    }
  }

  # The whole standard42 configuration directory can be recursively overriden
  if $standard42::source_dir {
    file { 'standard42.dir':
      ensure  => directory,
      path    => $standard42::config_dir,
      notify  => $standard42::manage_service_autorestart,
      source  => $standard42::source_dir,
      recurse => true,
      purge   => $standard42::bool_source_dir_purge,
      force   => $standard42::bool_source_dir_purge,
      replace => $standard42::manage_file_replace,
      audit   => $standard42::manage_audit,
      noop    => $standard42::noops,
    }
  }
}
