# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/) and
[Keep a CHANGELOG](http://keepachangelog.com/).

## [Unreleased]


### Added
- add "Disk Store Usage (%)" metric to overview plugin
- add "Messages Killed" metric to queues plugin


## [2.0.0] - 2020-05-10

### Changed
- replace deprecated "processTypes" selector with "technologies"
- changed plug-in name to "custom.jmx.vegardit.ActiveMQ_Artemis_Overview"/custom.jmx.vegardit.ActiveMQ_Artemis_Queues"
- renamed metricGroups to "activemq.artemis.overview"/"activemq.artemis.queues"
- match all broker instances (not only the ones bound to `localhost`)


## [1.0.0] - 2019-03-07

### Added
- Initial release
