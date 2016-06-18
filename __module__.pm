#
# (c) 2016 Jan Gehring
#

package Logwatch;

use strict;
use warnings;

use Rex -minimal;
use Rex::Commands::Pkg;
use Rex::Commands::File;

use Rex::Helper::Rexfile::ParamLookup;

task "setup", sub {
  my $ensure = param_lookup "ensure", "latest";
  my $cron_template = param_lookup "cron_template",
    "templates/logwatch/cron.tpl";
  my $cron_file = param_lookup "cron_file", "/etc/cron.daily/00logwatch";

  pkg "logwatch", ensure => $ensure;

  if ( $cron_file && $cron_template ) {
    file $cron_file,
      content => template($cron_template),
      mode    => '0755',
      owner   => 'root',
      group   => 'root';
  }
};

1;
