# Rex Logwatch module

This module setup logwatch.

## Tasks

### setup

Call this task to install logwatch on your system.

#### Parameters

* ensure - Default: latest
* cron_file - Default: /etc/cron.daily/00logwatch
* cron_template - Default: templates/logwatch/cron.tpl

#### Example

```perl
use Logwatch;

task "setup", sub {
  Logwatch::setup;
};
```

```perl
use Logwatch;

task "setup", sub {
  Logwatch::setup {
    cron_file => "/etc/cron.daily/logwatch",
  };
};
```


