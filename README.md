# MetricsHub JRE Builder

## Structure

This is a multi-module project:

* **/**: the root (parent of all submodules)
* **metricshub-jre-windows**: Builds a Windows JRE specifically tailored for MetricsHub, which is then integrated into the MetricsHub Windows distribution.
* **metricshub-jre-linux**: Builds a Linux JRE specifically tailored for MetricsHub, which is then integrated into MetricsHub RHEL and Debian distributions.

## How to build the Project

### Requirements

* Have Maven 3.x properly installed and configured, with access to Sentry's repository.
* Set `JAVA_HOME` to the JDK path from which you want to derive your JRE.


### Windows Build Rules

- Windows machine

### Linux Build Rules

- Linux Machine

### Build

To create the MetricsHub JREs, run the command below from `./metricshub-jre-builder`:

```sh
$ mvn clean package
```

Depending on the host type you are running, the JRE will be generated as a zip artifact under `metricshub-jre-windows\target` or `metricshub-jre-linux\target` (E.g. `metricshub-jre-windows-<version>.zip` or `metricshub-jre-linux-<version>.zip`)

### Install

To locally deploy MetricsHub JREs, run the command below from `./metricshub-jre-builder`:

```sh
$ mvn clean install
```

### Deploy

To deploy MetricsHub JREs to your remote or local repository, run the command below from `./metricshub-jre-builder`:

```sh
$ mvn clean deploy
```
