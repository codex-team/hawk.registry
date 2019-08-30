FROM rabbitmq:3.7-management-alpine


ARG DOWNLOAD_URL=https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download
ARG PLUGIN_VERSION=3.7.9.1

RUN apk add --no-cache wget ca-certificates

RUN wget ${DOWNLOAD_URL}/v${PLUGIN_VERSION}/accept-0.3.5.ez  \
  ${DOWNLOAD_URL}/v${PLUGIN_VERSION}/prometheus-4.3.0.ez \
  ${DOWNLOAD_URL}/v${PLUGIN_VERSION}/prometheus_cowboy-0.1.7.ez \
  ${DOWNLOAD_URL}/v${PLUGIN_VERSION}/prometheus_httpd-2.1.10.ez \
  ${DOWNLOAD_URL}/v${PLUGIN_VERSION}/prometheus_process_collector-1.4.3.ez \
  ${DOWNLOAD_URL}/v${PLUGIN_VERSION}/prometheus_rabbitmq_exporter-${PLUGIN_VERSION}.ez -P /plugins/


RUN  rabbitmq-plugins enable prometheus_rabbitmq_exporter
