ARG JDK_VERSION=17.0.12_7
ARG DEBIAN_NAME=bookworm

FROM eclipse-temurin:${JDK_VERSION}-jdk AS builder

COPY modules.txt /tmp/modules.txt

RUN jlink \
    --strip-debug \
    --no-header-files \
    --no-man-pages \
    --add-modules $(tr '\n' ',' < /tmp/modules.txt | sed 's/,$//') \
    --output /opt/jre

FROM debian:${DEBIAN_NAME}-slim
# Redefines the ARG to make it available in the final image
ARG JDK_VERSION=${JDK_VERSION}

LABEL description="Base Image for MetricsHub"
LABEL org.opencontainers.image.title="MetricsHub JRE Base Image"
LABEL org.opencontainers.image.description="Base Image for MetricsHub"
LABEL org.opencontainers.image.url="https://metricshub.com"
LABEL org.opencontainers.image.documentation="https://metricshub.com/docs/latest/"
LABEL org.opencontainers.image.source="https://github.com/sentrysoftware/metricshub-jre-builder"
LABEL org.opencontainers.image.vendor="Sentry Software"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.version="${JDK_VERSION}"

COPY --from=builder /opt/jre /opt/metricshub/lib/runtime

ENV JRE_VERSION=${JDK_VERSION}
ENV PATH="/opt/metricshub/lib/runtime/bin:${PATH}"

CMD ["java", "-version"]
