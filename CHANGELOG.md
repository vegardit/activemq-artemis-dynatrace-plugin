# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [Unreleased]

### Fixed
- [github Issues #1](https://github.com/vegardit/activemq-artemis-dynatrace-plugin/issues/1) add missing queue dimension to ConsumerCountByQueue timeseries

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
