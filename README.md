# Quick reference

Maintained by: [Michael Oberdorf IT-Consulting](https://www.oberdorf-itc.de/)

Source code: [GitHub](https://github.com/cybcon/docker.githubrepostats2mqtt)

Container image: [DockerHub](https://hub.docker.com/r/oitc/githubrepostats2mqtt)

<!-- SHIELD GROUP -->
[![][github-action-test-shield]][github-action-test-link]
[![][github-action-release-shield]][github-action-release-link]
[![][github-release-shield]][github-release-link]
[![][github-releasedate-shield]][github-releasedate-link]
[![][github-stars-shield]][github-stars-link]
[![][github-forks-shield]][github-forks-link]
[![][github-issues-shield]][github-issues-link]
[![][github-license-shield]][github-license-link]

[![][docker-release-shield]][docker-release-link]
[![][docker-pulls-shield]][docker-pulls-link]
[![][docker-stars-shield]][docker-stars-link]
[![][docker-size-shield]][docker-size-link]


## Supported tags and respective `Dockerfile` links

* [`latest`, `1.1.0`](https://github.com/cybcon/docker.githubrepostats2mqtt/blob/v1.1.0/Dockerfile)
* [`1.0.0`](https://github.com/cybcon/docker.githubrepostats2mqtt/blob/v1.0.0/Dockerfile)

## Summary

The container image is based on Alpine Linux and sends a curl request result with the [mosquitto-client](https://mosquitto.org/)
to a MQTT server topic.

## Prerequisites to run the docker container
You need an MQTT server to send the data to it.

## Configuration

### Container configuration

The container grab the configuration via environment variables.

| Environment variable name | Description | Required | Default value |
|--|--|--|--|
| `MQTT_SERVER` | The MQTT server hostname or IP address | **OPTIONAL** | `localhost` |
| `MQTT_PORT` | The TCP port of the MQTT server | **OPTIONAL** | `1883` |
| `MQTT_TLS_enabled` | Should SSL communication be enabled (`true`) or not (`false`) | **OPTIONAL** | `false` |
| `MQTT_CACERT_FILE` | If TLS is enabled, the path to the CA certificate file to validate the MQTT server certificate | **OPTIONAL** | |
| `MQTT_TLS_no_hostname_validation` | If TLS is enabled, skip the hostname validation of the TLS certificate | **OPTIONAL** | `false` |
| `MQTT_USER` | The MQTT username for MQTT authentication | **OPTIONAL** | |
| `MQTT_PASSWORD` | The MQTT password for MQTT authentication | **OPTIONAL** | |
| `MQTT_PASSWORD_FILE` | The filepath where the MQTT password is stored for MQTT authentication | **OPTIONAL** | |
| `MQTT_TOPIC` | The MQTT topic to send the Github statistics to | **MANDATORY** | |
| `MQTT_RETAIN`| Set the retain flag when publishing the Github statistics to MQTT topic | **OPTIONAL** | `false` |
| `REPOSITORIES` | A whitespace separated list of Github repositories where to collect the statistics | **MANDATORY** | |
| `MQTT_TOPIC_REPO_EXTENSION` | Use the Github repository name as MQTT topic appendix | **OPTIONAL** | `false` |

## Docker compose configuration

```yaml
services:
  githubrepostats2mqtt:
    restart: "no"
    user: 5242:5242
    image: oitc/githubrepostats2mqtt
    environment:
      MQTT_SERVER: test.mosquitto.org
      MQTT_PORT: 1883
      MQTT_TOPIC: com/github/repositories/metrics
      REPOSITORIES: cybcon/docker.githubrepostats2mqtt cybcon/modbus-server
```

A bigger example can be found here: [`docker-compose.yaml`](https://github.com/cybcon/docker.githubrepostats2mqtt/blob/main/docker-compose.yaml)

## Relationship to docker.mqtt2elasticsearch

If you want to use [docker.mqtt2elasticsearch](https://github.com/cybcon/docker.mqtt2elasticsearch) to store the data in an Elasticsearch or Opensearch database, ou can use this mappings example file:

[mqtt2elasticsearch-mappings.json](https://github.com/cybcon/docker.githubrepostats2mqtt/blob/main/examples/mqtt2elasticsearch-mappings.json)

## Donate

I would appreciate a small donation to support the further development of my open source projects.

[![Donate with PayPal][donate-paypal-button]][donate-paypal-link]

## License

Copyright (c) 2026 Michael Oberdorf IT-Consulting

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!-- LINK GROUP -->
[docker-pulls-link]: https://hub.docker.com/r/oitc/githubrepostats2mqtt
[docker-pulls-shield]: https://img.shields.io/docker/pulls/oitc/githubrepostats2mqtt?color=45cc11&labelColor=black&style=flat-square
[docker-release-link]: https://hub.docker.com/r/oitc/githubrepostats2mqtt
[docker-release-shield]: https://img.shields.io/docker/v/oitc/githubrepostats2mqtt?color=369eff&label=docker&labelColor=black&logo=docker&logoColor=white&style=flat-square
[docker-size-link]: https://hub.docker.com/r/oitc/githubrepostats2mqtt
[docker-size-shield]: https://img.shields.io/docker/image-size/oitc/githubrepostats2mqtt?color=369eff&labelColor=black&style=flat-square
[docker-stars-link]: https://hub.docker.com/r/oitc/githubrepostats2mqtt
[docker-stars-shield]: https://img.shields.io/docker/stars/oitc/githubrepostats2mqtt?color=45cc11&labelColor=black&style=flat-square
[donate-paypal-button]: https://raw.githubusercontent.com/cybcon/paypal-donate-button/refs/heads/master/paypal-donate-button_200x77.png
[donate-paypal-link]: https://www.paypal.com/donate/?hosted_button_id=BHGJGGUS6RH44
[github-action-release-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/actions/workflows/release-from-label.yaml
[github-action-release-shield]: https://img.shields.io/github/actions/workflow/status/cybcon/docker.githubrepostats2mqtt/release-from-label.yaml?label=release&labelColor=black&logo=githubactions&logoColor=white&style=flat-square
[github-action-test-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/actions/workflows/container-image-build-validation.yaml
[github-action-test-shield-original]: https://github.com/cybcon/docker.githubrepostats2mqtt/actions/workflows/container-image-build-validation.yaml/badge.svg
[github-action-test-shield]: https://img.shields.io/github/actions/workflow/status/cybcon/docker.githubrepostats2mqtt/container-image-build-validation.yaml?label=tests&labelColor=black&logo=githubactions&logoColor=white&style=flat-square
[github-forks-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/network/members
[github-forks-shield]: https://img.shields.io/github/forks/cybcon/docker.githubrepostats2mqtt?color=8ae8ff&labelColor=black&style=flat-square
[github-issues-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/issues
[github-issues-shield]: https://img.shields.io/github/issues/cybcon/docker.githubrepostats2mqtt?color=ff80eb&labelColor=black&style=flat-square
[github-license-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/blob/main/LICENSE
[github-license-shield]: https://img.shields.io/badge/license-MIT-blue?labelColor=black&style=flat-square
[github-release-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/releases
[github-release-shield]: https://img.shields.io/github/v/release/cybcon/docker.githubrepostats2mqtt?color=369eff&labelColor=black&logo=github&style=flat-square
[github-releasedate-link]: https://github.com/cybcon/docker.githubrepostats2mqtt/releases
[github-releasedate-shield]: https://img.shields.io/github/release-date/cybcon/docker.githubrepostats2mqtt?labelColor=black&style=flat-square
[github-stars-link]: https://github.com/cybcon/docker.githubrepostats2mqtt
[github-stars-shield]: https://img.shields.io/github/stars/cybcon/docker.githubrepostats2mqtt?color=ffcb47&labelColor=black&style=flat-square
