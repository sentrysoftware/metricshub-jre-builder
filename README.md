# MetricsHub JRE Builder

This project uses the [JLink tool](https://docs.oracle.com/en/java/javase/17/docs/specs/man/jlink.html) to produce two separate JREs: one specifically designed for Windows and another for Linux. The Windows JRE will be integrated into the [MetricsHub](https://metricshub.com) Windows distribution, while the Linux JRE is to be integrated into MetricsHub RHEL, Debian, and Docker distributions.

## Structure

* **.java-version**: Specifies the JDK version to be used to create the JRE with JLink. The JRE will have the same version.
* **Dockerfile**: Builds the MetricsHub JRE Docker Image, which is used as based image for MetricsHub.
* **modules.txt**: Lists all JRE modules required to run MetricsHub.

## Usage with Maven

To integrate the MetricsHub Windows JRE into the MetricsHub Windows distribution, add the following dependency in the `metricshub-windows` module:

```xml
	<dependency>
		<groupId>org.sentrysoftware</groupId>
		<artifactId>metricshub-jre-windows</artifactId>
		<version>17.0.14_7</version>
		<type>zip</type>
	</dependency>
```

To integrate the MetricsHub Linux JRE into the MetricsHub Linux distributions (Debian and RHEL), add the following dependency in the `metricshub-debian` and `metricshub-rhel` modules:

```xml
	<dependency>
		<groupId>org.sentrysoftware</groupId>
		<artifactId>metricshub-jre-linux</artifactId>
		<version>17.0.14_7</version>
		<type>zip</type>
	</dependency>
```

Make sure to unzip the content of the artifact in a dedicated build directory and provide this directory content to JPackage as a runtime image:

```shell
jpackage --runtime-image jre_directory $other_jpackage_args
```

## Usage with Docker

To use the MetricsHub Linux JRE as base image in Docker, add the following `FROM` instruction to the _Dockerfile_:

```Dockerfile
FROM ghcr.io/sentrysoftware/metricshub-jre-builder:17.0.14_7
```
