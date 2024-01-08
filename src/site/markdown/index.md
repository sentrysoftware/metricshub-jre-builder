# MetricsHub JRE Builder

This multi-module Maven project uses the [Maven JLink Plugin](https://maven.apache.org/plugins/maven-jlink-plugin/) to create:

* A custom Windows JRE for MetricsHub, that needs to be integrated into the MetricsHub Windows distribution.
* A custom Linux JRE for MetricsHub, that needs to be integrated into both MetricsHub RHEL and Debian distributions.

## Usage

To incorporate the MetricsHub Windows JRE into the MetricsHub Windows package, add the following dependency in the `metricshub-windows` module:

```xml
	<dependency>
		<groupId>${project.groupId}</groupId>
		<artifactId>metricshub-jre-windows</artifactId>
		<version>${project.version}</version>
		<type>zip</type>
	</dependency>
```

To incorporate the MetricsHub Linux JRE into the MetricsHub Linux package (Debian and RHEL), add the following dependency in the `metricshub-debian` and `metricshub-rhel` modules:

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
jpackage --runtime-image jre_directory $other_args
```
