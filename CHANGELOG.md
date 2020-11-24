# Change Log

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/) and
[Keep a CHANGELOG](http://keepachangelog.com/).

## [Unreleased]


### Added
- overview plugin: "Message Count" as key metric
- overview plugin: keycharts section

### Changed
- change aggregation type from `AVG` to `MAX` for all metrics
- overview plugin: group "Address Memory Usage" and "Address Memory Usage (%)"
- group "Messages Added Rate" and "Messages Acknowledged Rate" as "Message Flow"
- set color for "Messages Acknowledged Rate" values to green


## [2.1.0] - 2020-11-18

### Added
- overview plugin: "Disk Store Usage (%)" metric
- overview plugin: "Address/Queue count" metrics
- queues plugin: "Messages Killed" metric


## [2.0.0] - 2020-05-10

### Changed
- replace deprecated "processTypes" selector with "technologies"
- changed plug-in name to "custom.jmx.vegardit.ActiveMQ_Artemis_Overview"/custom.jmx.vegardit.ActiveMQ_Artemis_Queues"
- renamed metricGroups to "activemq.artemis.overview"/"activemq.artemis.queues"
- match all broker instances (not only the ones bound to `localhost`)


## [1.0.0] - 2019-03-07

### Added
- Initial release
