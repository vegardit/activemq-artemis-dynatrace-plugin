# ActiveMQ Artemis plug-ins for Dynatrace

[![License](https://img.shields.io/github/license/vegardit/activemq-artemis-dynatrace-plugin.svg?label=license)](#license)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

1. [About](#about)
1. [Installation](#install)
1. [Update](#update))
1. [Resources](#resources)
1. [License](#license)


## <a name="about"></a>About

Custom [Dynatrace](https://www.dynatrace.de/) [JMX](https://en.wikipedia.org/wiki/Java_Management_Extensions) plug-ins for [ActiveMQ Artemis](https://github.com/apache/activemq-artemis) broker processes.


## <a name="install"></a>Installation

1. The plugin.json file must be added to a zip file containing a single folder named `custom` which contains the plugin.json. E.g.

```
artemis-overview-plugin.zip
  |- custom/
     |- plugin.json

artemis-queues-plugin.zip
  |- custom/
     |- plugin.json
```

2. The plug-in zip file can then be installed via **Manage > Settings > Monitoring > Monitored Technologies > Add new technology monitoring > Add JMX/PMI plugin > Upload plugin**


## <a name="update"></a>Update

The plug-ins can be updated via:

- **Manage > Settings > Monitoring > Monitored Technologies > Custom plugins > ActiveMQ Artemis Overview > Upload plugin**
- **Manage > Settings > Monitoring > Monitored Technologies > Custom plugins > ActiveMQ Artemis Queues > Upload plugin**


## <a name="resources"></a>Resources

- [How to monitor JMX metrics in Java applications](https://www.dynatrace.com/support/help/extend-dynatrace/jmx-plugins/how-to-monitor-jmx-metrics-in-java-applications/)
- [Official Plugin.json reference](https://dynatrace.github.io/plugin-sdk/api/plugin_json_apidoc.html)
- [Better Plugin.json reference](https://github.com/Dynatrace/JMX-Extensions)
- [Artemis MBean: ActiveMQServerControl](https://github.com/apache/activemq-artemis/blob/master/artemis-core-client/src/main/java/org/apache/activemq/artemis/api/core/management/ActiveMQServerControl.java)
- [Artemis MBean: QueueControl](https://github.com/apache/activemq-artemis/blob/master/artemis-core-client/src/main/java/org/apache/activemq/artemis/api/core/management/QueueControl.java)


## <a name="license"></a>License

All files are released under the [Apache License 2.0](LICENSE.txt).

Individual files contain the following tag instead of the full license text:
```
SPDX-License-Identifier: Apache-2.0
```

This enables machine processing of license information based on the SPDX License Identifiers that are available here: https://spdx.org/licenses/.
