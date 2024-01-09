# MetricsHub JRE Builder

This multi-module Maven project uses the [Maven JLink Plugin](https://maven.apache.org/plugins/maven-jlink-plugin/) to produce two separate JREs: one specifically designed for Windows and another for Linux. The Windows JRE will be integrated into the MetricsHub Windows distribution, while the Linux JRE is to be integrated into both MetricsHub RHEL and Debian distributions.

## Structure

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

## Usage

To integrate the MetricsHub Windows JRE into the MetricsHub Windows distribution, add the following dependency in the `metricshub-windows` module:

```xml
	<dependency>
		<groupId>${project.groupId}</groupId>
		<artifactId>metricshub-jre-windows</artifactId>
		<version>${project.version}</version>
		<type>zip</type>
	</dependency>
```

To integrate the MetricsHub Linux JRE into the MetricsHub Linux distributions (Debian and RHEL), add the following dependency in the `metricshub-debian` and `metricshub-rhel` modules:

```xml
	<dependency>
		<groupId>${project.groupId}</groupId>
		<artifactId>metricshub-jre-linux</artifactId>
		<version>${project.version}</version>
		<type>zip</type>
	</dependency>
```

Make sure to unzip the content of the artifact in a dedicated build directory and provide this directory content to JPackage as a runtime image:

```shell
jpackage --runtime-image jre_directory $other_jpackage_args
```
